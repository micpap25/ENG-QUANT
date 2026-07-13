from __future__ import annotations

from typing import Any
from ipm.problem_to_matrices import problem_to_matrices
import numpy as np
import time

# Isolate an II-IPM using the previous code
# Use relaxers.standard_form before running

def ratio(x_vec, delta_x_vec):
    rat = 1
    for (x, delta_x) in zip(x_vec, delta_x_vec):
        if delta_x < 0:
            rat = min(- x / delta_x , rat)
    return rat

def linear_system_solve(mat, rhs) -> tuple[float, Any]:
    solution = np.linalg.solve(mat, rhs)
    # norm_of_residual = float(np.linalg.norm(rhs - mat.dot(solution)))
    return solution, None

def ipm_solve(f_name: str = "linear_approx.json", beta: float = 0.1,
                beta2: float = 1 - 5e-4, omega: float = 1e8,
                gamma: float = 0.5, precision: float = 1e-8,
                alpha_hat_dec: float = 1 - 1e-3, step_precision: float = 1e-16,
                verbose: bool = False) -> None:
    A, b, c = problem_to_matrices(f_name=f_name, verbose=False)
    m = len(b)
    n = len(c)

    # Run II-IPM
    x = np.ones(n) * omega
    y = np.zeros(m)
    s = np.ones(n) * omega
    iteration = 0
    start_time = time.time()

    while True:
        mu = np.dot(x, s) * beta / n

        X = np.diag(x)
        S = np.diag(s)

        c_ATy = c - np.dot(A.T, y)
        XS_1 = np.dot(X, np.linalg.inv(S))
        # SX_1 = np.dot(S, np.linalg.inv(X))
        s_1 = np.reciprocal(s)
        # x_1 = np.reciprocal(x)

        M = A.dot(XS_1).dot(A.T)

        r = b - np.dot(A, x) - mu * np.dot(A, s_1) + A.dot(XS_1).dot(c_ATy)

        delta_y, _ = linear_system_solve(M, r)

        delta_s = c_ATy - s - np.dot(A.T, delta_y)
        delta_x = mu * s_1 - x - np.dot(XS_1, delta_s)

        alpha_star_x = ratio(x, delta_x)
        alpha_star_s = ratio(s, delta_s)
        alpha_star = min(alpha_star_x, alpha_star_s, 1.0)

        # Calculate alpha_hat
        is_neighbor = False
        alpha_hat = alpha_star
        compl = np.dot(x, s)

        while not is_neighbor:
            x_temp = x + alpha_hat * delta_x
            y_temp = y + alpha_hat * delta_y
            s_temp = s + alpha_hat * delta_s

            compl_temp = np.dot(x_temp, s_temp)
            is_neighbor = True

            for (xi, si) in zip(x_temp, s_temp):
                if xi*si < gamma * compl_temp / n:
                    alpha_hat *= alpha_hat_dec
                    is_neighbor = False
                    break

            if not is_neighbor:
                continue

            epsilon_primal 	= np.linalg.norm(np.dot(A, x_temp) - b)
            print(epsilon_primal)

            if epsilon_primal > max(compl_temp/gamma, precision):
                alpha_hat *= alpha_hat_dec
                is_neighbor = False
                continue

            epsilon_dual = np.linalg.norm(np.dot(A.T, y_temp) + s_temp - c)

            if epsilon_dual > max(compl_temp/gamma, precision):
                alpha_hat *= alpha_hat_dec
                is_neighbor = False
                continue

            if compl_temp > (1 - alpha_hat * (1 - beta2)) * compl:
                alpha_hat *= alpha_hat_dec
                is_neighbor = False
                continue

        x = x_temp
        y = y_temp
        s = s_temp

        if max(abs(entry) for entry in np.concatenate((x, s)) ) > 2 * n * omega:
            print("The problem is infeasible.")
            break

        iteration += 1

        if np.dot(x, s) <= precision:
            break

        if verbose:
            print(f"{'Primal objective:':20}{np.dot(c, x):<15.8e}")
            print(f"{'Dual objective:':20}{np.dot(b, y):<15.8e}")
            print()
            print(f"{'Primal residual:':20}{np.linalg.norm(np.dot(A, x) - b):<8.2e}")
            print(f"{'Dual residual:':20}{np.linalg.norm(c - np.dot(A.T, y) - s):<8.2e}")
            print(f"{'Complementarity:':20}{np.dot(x, s):<8.2e}")

        if alpha_hat < step_precision:
            print("The solution quality is limited by the precision of the linear system solver.")
            break

    run_time = time.time() - start_time
    print(f"The algorithm stopped after {iteration:d} iterations in {run_time:.2f} seconds.")
    print()
    print(f"{'Primal objective:':20}{np.dot(c, x):<15.8e}")
    print(f"{'Dual objective:':20}{np.dot(b, y):<15.8e}")
    print()
    print(f"{'Primal residual:':20}{np.linalg.norm(np.dot(A, x) - b):<8.2e}")
    print(f"{'Dual residual:':20}{np.linalg.norm(c - np.dot(A.T, y) - s):<8.2e}")
    print(f"{'Complementarity:':20}{np.dot(x, s):<8.2e}")

if __name__ == "__main__":
    ipm_solve(omega=1e4, verbose=True)
