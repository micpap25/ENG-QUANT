from __future__ import annotations

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


def ruiz_solve(matrix, vector, iterations=8, verbose=False):
    """Solve a linear system after symmetric Ruiz equilibration."""
    scaled_matrix = np.asarray(matrix, dtype=float).copy()
    scaled_vector = np.asarray(vector, dtype=float).copy()
    scaling = np.ones(scaled_matrix.shape[0])

    for _ in range(iterations):
        # M is symmetric; scaling by the row infinity norms is therefore
        # equivalent to using the corresponding column norms as well.
        norms = np.max(np.abs(scaled_matrix), axis=1)
        norms = np.maximum(norms, np.finfo(float).tiny)
        step_scaling = 1.0 / np.sqrt(norms)
        scaled_matrix = step_scaling[:, None] * scaled_matrix * step_scaling[None, :]
        scaled_vector *= step_scaling
        scaling *= step_scaling

    # scaled_matrix y = scaled_vector, with x = D y.
    if verbose:
        print(f"Condition number after pre-conditioning: {np.linalg.cond(scaled_matrix)}")
    return scaling * np.linalg.solve(scaled_matrix, scaled_vector)

def ipm_solve(f_name: str = "linear_approx.json", beta: float = 0.1,
                beta2: float = 1 - 5e-4, omega: float = 1e4,
                gamma: float = 0.5, precision: float = 1e-8,
                alpha_hat_dec: float = 1 - 1e-3, step_precision: float = 1e-16,
                neighborhood: str = "Large", tau: float = 1e-8,
                verbose: bool = False):
    np.set_printoptions(linewidth=200)

    # Dual solution is (0, 4, 0), obj = 8
    A = np.array([[1, 0, 1], \
                  [1, 2, 0]])
    b = np.array([3, 8])
    G = np.array([[1, 1, -1]])
    h = np.array([4])
    c = np.array([1, -2, 1])
    u = np.array([5, 5, 5])

    i = len(b)
    e = len(h)
    n = len(c) # Number of variables
    m = i + 2*e + 2*n  # Number of constraints

    # A naive bound on omega
    max_cost = np.dot(np.clip(c, 0, None), u)
    omega = min(max_cost, omega)
    if verbose:
        print(max_cost)
        if omega == max_cost:
            print("omega was limited by the max cost")

    # problem-to-eq-ineq-matrix sanity check
    assert len(A) == i
    assert len(A[0]) == n
    assert len(G) == e
    assert len(G[0]) == n
    assert len(u) == n

    # Run II-IPM
    x = np.ones(n) * omega
    y = np.ones(i) * omega
    w1 = np.ones(e) * omega
    w2 = np.ones(e) * omega
    gam = np.ones(n) * omega
    lam = np.ones(n) * omega
    z1 = np.ones(i) * omega
    z2 = np.ones(e) * omega
    z3 = np.ones(e) * omega
    z4 = np.ones(n) * omega
    z5 = np.ones(n) * omega

    iteration = 0
    start_time = time.time()

    while True:
        compl = np.dot(y, z1) + np.dot(w1, z2) + np.dot(w2, z3) \
            + np.dot(gam, z4) + np.dot(lam, z5)

        mu = compl * beta / m

        Ax = np.dot(A, x)
        b_Ax = b - Ax
        Gx = np.dot(G, x)
        h_Gx = h - Gx
        u_x = u - x

        yz1_1 = y / z1
        w1z2_1 = w1 / z2
        w2z3_1 = w2 / z3
        gamz4_1 = gam / z4
        lamz5_1 = lam / z5
        ATZ1_1Y = A.T * yz1_1
        GTZ_1W = G.T * (w1z2_1 + w2z3_1)

        ATy = np.dot(A.T, y)
        GTw1_w2 = np.dot(G.T, w1 - w2)

        M = np.dot(ATZ1_1Y, A) + np.dot(GTZ_1W, G) + np.diag(gamz4_1 + lamz5_1)

        z1_1 = np.reciprocal(z1)
        z2_1 = np.reciprocal(z2)
        z3_1 = np.reciprocal(z3)
        z4_1 = np.reciprocal(z4)
        z5_1 = np.reciprocal(z5)

        r = np.dot(ATZ1_1Y, b_Ax) + np.dot(GTZ_1W, h_Gx) + gamz4_1 * u_x - lamz5_1 * x \
            - mu * (np.dot(A.T, z1_1) + np.dot(G.T, z2_1 - z3_1) + z4_1 - z5_1) \
            - c - ATy - GTw1_w2 - gam + lam

        # Linear System Solve
        if verbose:
            print(f"Condition number before pre-conditioning: {np.linalg.cond(M)}")
        # delta_x = np.linalg.solve(M, r)
        delta_x = ruiz_solve(M, r, verbose=verbose)

        # Recover the steps
        Adelta_x = np.dot(A, delta_x)
        Gdelta_x = np.dot(G, delta_x)

        delta_y = (y * (Ax + Adelta_x - b) + mu) / z1
        delta_w1 = (w1 * (Gx + Gdelta_x - h) + mu) / z2
        delta_w2 = (mu - w2 * (Gx + Gdelta_x - h)) / z3
        delta_gam = (gam * (x + delta_x - u) + mu) / z4
        delta_lam = c + ATy + GTw1_w2 + gam - lam \
            + np.dot(A.T, delta_y) + np.dot(G.T, delta_w1 - delta_w2) + delta_gam
        delta_z1 = b - Ax - z1 - Adelta_x
        delta_z2 = h - Gx - z2 - Gdelta_x
        delta_z3 = Gx - h - z3 + Gdelta_x
        delta_z4 = u - x - z4 - delta_x
        delta_z5 = x - z5 + delta_x

        alpha_star_x = ratio(x, delta_x)
        alpha_star_y = ratio(y, delta_y)
        alpha_star_w1 = ratio(w1, delta_w1)
        alpha_star_w2 = ratio(w2, delta_w2)
        alpha_star_gam = ratio(gam, delta_gam)
        alpha_star_lam = ratio(lam, delta_lam)
        alpha_star_z1 = ratio(z1, delta_z1)
        alpha_star_z2 = ratio(z2, delta_z2)
        alpha_star_z3 = ratio(z3, delta_z3)
        alpha_star_z4 = ratio(z4, delta_z4)
        alpha_star_z5 = ratio(z5, delta_z5)

        alpha_hat = min(alpha_star_x, alpha_star_y, alpha_star_w1,
                        alpha_star_w2, alpha_star_gam, alpha_star_lam,
                        alpha_star_z1, alpha_star_z2, alpha_star_z3,
                        alpha_star_z4, alpha_star_z5, 1.0)

        # Calculate alpha_hat
        is_neighbor = False

        while not is_neighbor:
            x_temp = x + alpha_hat * delta_x
            y_temp = y + alpha_hat * delta_y
            w1_temp = w1 + alpha_hat * delta_w1
            w2_temp = w2 + alpha_hat * delta_w2
            gam_temp = gam + alpha_hat * delta_gam
            lam_temp = lam + alpha_hat * delta_lam
            z1_temp = z1 + alpha_hat * delta_z1
            z2_temp = z2 + alpha_hat * delta_z2
            z3_temp = z3 + alpha_hat * delta_z3
            z4_temp = z4 + alpha_hat * delta_z4
            z5_temp = z5 + alpha_hat * delta_z5

            compl_temp = np.dot(y_temp, z1_temp) + np.dot(w1_temp, z2_temp) \
                + np.dot(w2_temp, z3_temp) + np.dot(gam_temp, z4_temp) + np.dot(lam_temp, z5_temp)
            mu_temp = compl_temp / m
            compl_vec = np.concat((y_temp * z1_temp, w1_temp * z2_temp, w2_temp * z3_temp,
                                    gam_temp * z4_temp, lam_temp * z5_temp))

            is_neighbor = True

            if neighborhood == "Large":
                for comp in compl_vec:
                    if comp < gamma * mu_temp:
                        alpha_hat *= alpha_hat_dec
                        is_neighbor = False
                        break

            # Neighborhood is small
            else:
                # print(np.linalg.norm((compl_vec / mu_temp) - np.ones(m)))
                if np.linalg.norm((compl_vec / mu_temp) - np.ones(m)) > gamma:
                    alpha_hat *= alpha_hat_dec
                    is_neighbor = False

            if not is_neighbor:
                continue

            # The residual should be the norm of all the constraint errors
            epsilon_primal = np.linalg.norm(
                np.dot(A.T, y_temp) + np.dot(G.T, w1_temp - w2_temp) + gam_temp - lam_temp + c
            )

            if epsilon_primal > max(compl_temp/gamma, precision):
                alpha_hat *= alpha_hat_dec
                is_neighbor = False
                continue

            if compl_temp > (1 - alpha_hat * (1 - beta2)) * compl:
                alpha_hat *= alpha_hat_dec
                is_neighbor = False
                continue

            Gx_temp = np.dot(G, x_temp)
            epsilon_dual = np.linalg.norm(np.concat((
                np.dot(A, x_temp) + z1_temp - b,
                Gx_temp + z2_temp - h,
                -Gx_temp + z3_temp + h,
                x_temp + z4_temp - u,
                -x_temp + z5_temp
            )))

            if epsilon_dual > max(compl_temp/gamma, precision):
                alpha_hat *= alpha_hat_dec
                is_neighbor = False
                continue

        x = x_temp
        y = y_temp
        w1 = w1_temp
        w2 = w2_temp
        gam = gam_temp
        lam = lam_temp
        z1 = z1_temp
        z2 = z2_temp
        z3 = z3_temp
        z4 = z4_temp
        z5 = z5_temp

        # Adjust the w variables
        d = np.maximum(0, np.minimum(w1, w2) - tau)
        zeta = min(1, np.min((w1 * z2 - (gamma * mu_temp)) / (d * z2)),
                np.min((w2 * z3 - (gamma * mu_temp)) / (d * z3)))

        if zeta < 1:
            zeta *= alpha_hat_dec

        w1 -= zeta * d
        w2 -= zeta * d

        if max(abs(entry) for entry in np.concat(
            (x, y, w1, w2, gam, lam, z1, z2, z3, z4, z5)
        )) > 2 * m * omega:
            print("The problem is infeasible.")
            break

        iteration += 1

        compl = np.dot(y, z1) + np.dot(w1, z2) + np.dot(w2, z3) \
            + np.dot(gam, z4) + np.dot(lam, z5)

        if compl <= precision:
            print("Solution is below target precision.")
            break

        Gx = np.dot(G, x)

        if verbose:
            print(f"Iteration {iteration}:")
            print(f"{'Primal objective:':20}{np.dot(b, y) + np.dot(h, w1 - w2) + np.dot(u, gam):<15.8e}")
            print(f"{'Dual objective:':20}{np.dot(-c, x):<15.8e}")
            print()
            print(f"{'Primal residual:':20}{np.linalg.norm(
                np.dot(A.T, y) + np.dot(G.T, w1 - w2) + gam - lam + c
            ):<8.2e}")
            print(f"{'Dual residual:':20}{np.linalg.norm(np.concat((
                    np.dot(A, x) + z1 - b,
                    Gx + z2 - h,
                    -Gx + z3 + h,
                    x + z4 - u,
                    -x + z5
                ))):<8.2e}")
            print(f"{'Complementarity:':20}{compl:<8.2e}")
            print()

        if alpha_hat < step_precision:
            print("The solution quality is limited by the precision of the linear system solver.")
            break

    run_time = time.time() - start_time
    primal_obj = np.dot(b, y) + np.dot(h, w1 - w2) + np.dot(u, gam)
    dual_obj = np.dot(-c, x)  # pylint: disable=invalid-unary-operand-type
    print(f"The algorithm stopped after {iteration:d} iterations in {run_time:.2f} seconds.")
    print()
    print(f"{'Primal objective:':20}{primal_obj:<15.8e}")
    print(f"{'Dual objective:':20}{dual_obj:<15.8e}")
    print()
    print(f"{'Primal residual:':20}{np.linalg.norm(
        np.dot(A.T, y) + np.dot(G.T, w1 - w2) + gam - lam + c
    ):<8.2e}")
    print(f"{'Dual residual:':20}{np.linalg.norm(np.concat((
            np.dot(A, x) + z1 - b,
            Gx + z2 - h,
            -Gx + z3 + h,
            x + z4 - u,
            -x + z5
        ))):<8.2e}")
    print(f"{'Complementarity:':20}{compl:<8.2e}")
    print()
    if verbose:
        print(x)
    return -dual_obj, run_time, x, compl

if __name__ == "__main__":
    ipm_solve(verbose=True)