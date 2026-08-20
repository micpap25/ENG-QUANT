from __future__ import annotations

from ipm.problem_to_matrices import problem_to_matrices
from ipm_new.problem_to_eq_ineq_matrices import problem_to_eq_ineq_matrices
import numpy as np
import time

# Solve a GasNet problem in a relaxed LP form.

def ratio(x_vec, delta_x_vec):
    rat = 1
    for (x, delta_x) in zip(x_vec, delta_x_vec):
        if delta_x < 0:
            rat = min(- x / delta_x , rat)
    return rat

# Times the cost so we have an upper bound on the objective value
def ipm_solve_toy(beta: float = 0.1, beta2: float = 1 - 5e-4, omega: float = 1e2,
                gamma: float = 0.5, precision: float = 1e-8,
                alpha_hat_dec: float = 1 - 1e-3, step_precision: float = 1e-16) -> None:
    np.set_printoptions(linewidth=200)

    # Dual solution is (3, 2), obj = 19
    A = np.array([[2, 1, 0], \
                  [1, 3, 0]])
    b = np.array([8, 9])
    c = np.array([-3, -5, 2])

    i = len(b)
    n = len(c)  # Number of variables
    m = i + n  # Number of constraints

    # problem-to-eq-ineq-matrix sanity check
    assert len(A) == i
    assert len(A[0]) == n

    # Run II-IPM
    x = np.ones(n) * omega
    y = np.ones(i) * omega
    z1 = np.ones(i) * omega
    z2 = np.ones(n) * omega
    lam = np.ones(n) * omega

    iteration = 0
    start_time = time.time()

    while True:
        compl = np.dot(y, z1) + np.dot(lam, z2)

        mu = compl * beta / m

        Y = np.diag(y)
        Z1 = np.diag(z1)
        Z2 = np.diag(z2)
        Lam = np.diag(lam)

        ATZ_1 = np.dot(A.T, np.linalg.inv(Z1))
        ATZ_1Y = np.dot(ATZ_1, Y)
        Ax = np.dot(A, x)
        b_Ax = b - Ax
        ATy = np.dot(A.T, y)
        Z2_1Lam = np.dot(np.linalg.inv(Z2), Lam)

        M = np.dot(ATZ_1Y, A) + Z2_1Lam

        r = np.dot(ATZ_1Y, b_Ax) - np.dot(Z2_1Lam, x) \
            - (mu * np.dot(A.T, np.reciprocal(z1))) + (mu * np.reciprocal(z2)) - ATy - c + lam

        # Linear System Solve
        delta_x = np.linalg.solve(M, r)

        # Recover the steps
        Adelta_x = np.dot(A, delta_x)
        delta_y = np.dot(np.linalg.inv(Z1), np.dot(Y, Ax + Adelta_x - b) + (mu * np.ones(i)))
        delta_lam = np.dot(np.linalg.inv(Z2), (mu * np.ones(n)) - np.dot(Lam, delta_x + x))
        delta_z1 = b - Ax - z1 - Adelta_x
        delta_z2 = x - z2 + delta_x

        alpha_star_x = ratio(x, delta_x)
        alpha_star_y = ratio(y, delta_y)
        alpha_star_z1 = ratio(z1, delta_z1)
        alpha_star_z2 = ratio(z2, delta_z2)
        alpha_star_lam = ratio(lam, delta_lam)

        alpha_hat = min(alpha_star_x, alpha_star_y, alpha_star_z1, alpha_star_z2, alpha_star_lam, 1.0)

        # Calculate alpha_hat
        is_neighbor = False

        while not is_neighbor:
            x_temp = x + alpha_hat * delta_x
            y_temp = y + alpha_hat * delta_y
            z1_temp = z1 + alpha_hat * delta_z1
            z2_temp = z2 + alpha_hat * delta_z2
            lam_temp = lam + alpha_hat * delta_lam

            # New complementarity value for every complementary pair of variables.
            compl_temp = np.dot(y_temp, z1_temp) + np.dot(lam_temp, z2_temp)
            is_neighbor = True

            for (yi, z1i) in zip(y_temp, z1_temp):
                if yi * z1i < gamma * compl_temp / m:
                    alpha_hat *= alpha_hat_dec
                    is_neighbor = False
                    break

            if is_neighbor:
                for (lami, z2i) in zip(lam_temp, z2_temp):
                    if lami * z2i < gamma * compl_temp / m:
                        alpha_hat *= alpha_hat_dec
                        is_neighbor = False
                        break

            if not is_neighbor:
                continue

            # The residual should be the norm of all the constraint errors
            epsilon_primal = np.linalg.norm(np.dot(A.T, y_temp) - lam_temp + c)

            if epsilon_primal > max(compl_temp/gamma, precision):
                alpha_hat *= alpha_hat_dec
                is_neighbor = False
                continue

            if compl_temp > (1 - alpha_hat * (1 - beta2)) * compl:
                alpha_hat *= alpha_hat_dec
                is_neighbor = False
                continue

            epsilon_dual = np.linalg.norm(np.concatenate((np.dot(A, x_temp) + z1_temp - b, -x_temp + z2_temp)))

            if epsilon_dual > max(compl_temp/gamma, precision):
                alpha_hat *= alpha_hat_dec
                is_neighbor = False
                continue

        x = x_temp
        y = y_temp
        z1 = z1_temp
        z2 = z2_temp
        lam = lam_temp

        if max(abs(entry) for entry in np.concatenate((x, y, z1, z2, lam))) > 2 * m * omega:
            print("The problem is infeasible.")
            break

        iteration += 1

        compl = np.dot(y, z1) + np.dot(lam, z2)

        if compl <= precision:
            print("Solution is below target precision.")
            break

        print(f"Iteration {iteration}:")
        print(f"{'Primal objective:':20}{np.dot(b, y):<15.8e}")
        print(f"{'Dual objective:':20}{np.dot(-c, x):<15.8e}")
        print()
        print(f"{'Primal residual:':20}{np.linalg.norm(np.dot(A.T, y) - lam + c):<8.2e}")
        print(f"{'Dual residual:':20}{np.linalg.norm(np.concatenate((np.dot(A, x) + z1 - b, -x + z2))):<8.2e}")
        print(f"{'Complementarity:':20}{compl:<8.2e}")
        print()

        if alpha_hat < step_precision:
            print("The solution quality is limited by the precision of the linear system solver.")
            break
    
    run_time = time.time() - start_time
    print(f"The algorithm stopped after {iteration:d} iterations in {run_time:.2f} seconds.")
    print()
    print(f"{'Primal objective:':20}{np.dot(b, y):<15.8e}")
    print(f"{'Dual objective:':20}{np.dot(-c, x):<15.8e}")
    print()
    print(f"{'Primal residual:':20}{np.linalg.norm(np.dot(A.T, y) - lam + c):<8.2e}")
    print(f"{'Dual residual:':20}{np.linalg.norm(np.concatenate((np.dot(A, x) + z1 - b, -x + z2))):<8.2e}")
    print(f"{'Complementarity:':20}{compl:<8.2e}")
    print()
    print(x)
    
if __name__ == "__main__":
    ipm_solve_toy()
