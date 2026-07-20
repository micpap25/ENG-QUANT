from __future__ import annotations

from ipm.problem_to_matrices import problem_to_matrices
from ipm_new.problem_to_eq_ineq_matrices import problem_to_eq_ineq_matrices
import numpy as np
import time

# Solve a GasNet problem in a relaxed LP form.
# Can have a mix of equalities and upper-bounded inequalities

# TODO: Possible sources of error introduced by the reworking
# - Bad initial values
# - Mistake computing complementarity
# - Forgot a negative sign with z
# - Mistake on the alpha_hat computation

def ratio(x_vec, delta_x_vec):
    rat = 1
    for (x, delta_x) in zip(x_vec, delta_x_vec):
        if delta_x < 0:
            rat = min(- x / delta_x , rat)
    return rat

def ipm_solve(f_name: str = "linear_approx.json", beta: float = 0.1,
                beta2: float = 1 - 5e-4, omega: float = 1e8,
                gamma: float = 0.5, precision: float = 1e-8,
                alpha_hat_dec: float = 1 - 1e-3, step_precision: float = 1e-16,
                verbose: bool = False) -> None:
    # Gurobi output pops up here because of license file
    A, b, G, h, c = problem_to_eq_ineq_matrices(f_name=f_name, verbose=False)
    e = len(b)
    i = len(h)
    n = len(c)

    # Run II-IPM
    # TODO: Confirm these are good initial values for the II-IPM
    x = np.ones(n) * omega
    s = np.ones(i) * omega
    y = np.zeros(e)
    z = np.ones(i) * omega
    r = np.ones(n) * omega

    iteration = 0
    start_time = time.time()

    while True:
        compl = np.dot(x, r) + np.dot(s, z)

        mu = compl * beta / (n + i)

        X = np.diag(x)
        S = np.diag(s)
        R = np.diag(r)
        Z = np.diag(z)

        x_1 = np.reciprocal(x)
        s_1 = np.reciprocal(s)
        X_1 = np.diag(x_1)
        S_1 = np.diag(s_1)

        red_p = b - np.dot(A, x)
        red_g = h - np.dot(G, x) - s
        red_d = c - np.dot(A.T, y) - np.dot(G.T, z) - r
        red_cx = mu * np.ones(n) - np.dot(X, r)
        red_cs = mu * np.ones(i) - np.dot(S, z)

        Dx = np.dot(X_1, R)
        W = np.dot(S_1, Z)

        GTW = np.dot(G.T, W)
        S_1red_cs = np.dot(S_1, red_cs)

        M = Dx + np.dot(GTW, G)
        M_1 = np.linalg.inv(M)
        AM_1 = np.dot(A, M_1)

        eta = red_d - np.dot(X_1, red_cx) - np.dot(GTW, red_g) + np.dot(G.T, S_1red_cs)
        nes_matrix = np.dot(AM_1, A.T)
        red_cost = red_p + np.dot(AM_1, eta)

        # Linear System Solve
        delta_y = np.linalg.solve(nes_matrix, red_cost)

        delta_x = np.dot(M_1, np.dot(A.T, delta_y) - eta)
        delta_s = red_g - np.dot(G, delta_x)
        delta_z = np.dot(W, delta_s) - S_1red_cs
        delta_r = np.dot(X_1, red_cx - np.dot(R, delta_x))

        alpha_star_x = ratio(x, delta_x)
        alpha_star_s = ratio(s, delta_s)
        alpha_star_z = ratio(z, delta_z)
        alpha_star_r = ratio(r, delta_r)
        alpha_hat = min(alpha_star_x, alpha_star_s, alpha_star_z, alpha_star_r, 1.0)

        # Calculate alpha_hat
        is_neighbor = False

        while not is_neighbor:
            x_temp = x + alpha_hat * delta_x
            s_temp = s + alpha_hat * delta_s
            y_temp = y + alpha_hat * delta_y
            z_temp = z + alpha_hat * delta_z
            r_temp = r + alpha_hat * delta_r

            compl_temp = np.dot(x_temp, r_temp) + np.dot(s_temp, z_temp)
            is_neighbor = True

            for (xi, ri) in zip(x_temp, r_temp):
                if xi*ri < gamma * compl_temp / (n + i):
                    alpha_hat *= alpha_hat_dec
                    is_neighbor = False
                    break

            if is_neighbor:
                for (si, zi) in zip(s_temp, z_temp):
                    if si*zi < gamma * compl_temp / (n + i):
                        alpha_hat *= alpha_hat_dec
                        is_neighbor = False
                        break

            if not is_neighbor:
                continue

            # The residual should be the norm of all the constraint errors
            epsilon_primal = np.linalg.norm(np.concatenate((np.dot(A, x_temp) - b, np.dot(G, x_temp) + s_temp - h)))

            if epsilon_primal > max(compl_temp/gamma, precision):
                alpha_hat *= alpha_hat_dec
                is_neighbor = False
                continue

            epsilon_dual = np.linalg.norm(np.dot(A.T, y_temp) + np.dot(G.T, z_temp) + r_temp - c)

            if epsilon_dual > max(compl_temp/gamma, precision):
                alpha_hat *= alpha_hat_dec
                is_neighbor = False
                continue

            if compl_temp > (1 - alpha_hat * (1 - beta2)) * compl:
                alpha_hat *= alpha_hat_dec
                is_neighbor = False
                continue

        x = x_temp
        s = s_temp
        y = y_temp
        z = z_temp
        r = r_temp

        if max(abs(entry) for entry in np.concatenate((x, s, z, r))) > 2 * (n + i) * omega:
            print("The problem is infeasible.")
            break

        iteration += 1

        if compl <= precision:
            print("Solution is below target precision.")
            break

        if verbose:
            print(f"{'Primal objective:':20}{np.dot(c, x):<15.8e}")
            print(f"{'Dual objective:':20}{np.dot(b, y) + np.dot(h, z):<15.8e}")
            print()
            print(f"{'Primal residual:':20}{np.linalg.norm(np.concatenate((np.dot(A, x) - b, np.dot(G, x) + s - h))):<8.2e}")
            print(f"{'Dual residual:':20}{np.linalg.norm(np.dot(A.T, y) + np.dot(G.T, z) + r - c):<8.2e}")
            print(f"{'Complementarity:':20}{np.dot(x, r) + np.dot(s, z):<8.2e}")
            print()

        if alpha_hat < step_precision:
            print("The solution quality is limited by the precision of the linear system solver.")
            break
    
    run_time = time.time() - start_time
    print(f"The algorithm stopped after {iteration:d} iterations in {run_time:.2f} seconds.")
    print()
    print(f"{'Primal objective:':20}{np.dot(c, x):<15.8e}")
    print(f"{'Dual objective:':20}{np.dot(b, y) + np.dot(h, z):<15.8e}")
    print()
    print(f"{'Primal residual:':20}{np.linalg.norm(np.concatenate((np.dot(A, x) - b, np.dot(G, x) + s - h))):<8.2e}")
    print(f"{'Dual residual:':20}{np.linalg.norm(np.dot(A.T, y) + np.dot(G.T, z) + r - c):<8.2e}")
    print(f"{'Complementarity:':20}{np.dot(x, r) + np.dot(s, z):<8.2e}")

if __name__ == "__main__":
    ipm_solve(omega=1e2, verbose=True)
