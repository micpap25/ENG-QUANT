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


def ruiz_solve(matrix, vector, iterations, verbose=False):
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

# Most accurate is to make a VERY large neighborhood (small zeta)
# And a schedule with a small end. Choose zeta about 5e-4 and alpha_min around .001
# Faster to keep both modestly high, zeta around 0.05 and alpha_min around 0.01
def ipm_solve(f_name: str = "linear_approx.json", beta: float = 1e-2,
                xi: float = 1 - 5e-4, omega: float = 1e4,
                zeta: float = 1e-3, epsilon: float = 1e-8,
                alpha_sched: list[float] = [.9, .7, .5, .3, .2, .15, .1, .01, .001],
                neighborhood: str = "Large", tau: float = 1e-8,
                verbose: bool = False):
    np.set_printoptions(linewidth=200)

    # Gurobi output pops up here because of license file
    A, b, G, h, u, c = problem_to_eq_ineq_matrices(f_name=f_name, verbose=False)
    i_bar = len(b)
    e_bar = len(h)
    n = len(c) # Number of variables
    m = i_bar + 2*e_bar + 2*n  # Number of constraints

    # A naive bound on omega
    max_cost = np.dot(np.clip(c, 0, None), u)
    omega = min(max_cost, omega)
    if verbose:
        print(max_cost)
        if omega == max_cost:
            print("omega was limited by the max cost")

    # problem-to-eq-ineq-matrix sanity check
    assert len(A) == i_bar
    assert len(A[0]) == n
    assert len(G) == e_bar
    assert len(G[0]) == n
    assert len(u) == n

    # Run II-IPM
    x = np.ones(n) * omega
    y = np.ones(i_bar) * omega
    w1 = np.ones(e_bar) * omega
    w2 = np.ones(e_bar) * omega
    q = np.ones(n) * omega
    lam = np.ones(n) * omega
    z1 = np.ones(i_bar) * omega
    z2 = np.ones(e_bar) * omega
    z3 = np.ones(e_bar) * omega
    z4 = np.ones(n) * omega
    z5 = np.ones(n) * omega

    iteration = 0
    start_time = time.time()

    while True:
        r_c = np.dot(y, z1) + np.dot(w1, z2) + np.dot(w2, z3) \
            + np.dot(q, z4) + np.dot(lam, z5)

        mu = r_c * beta / m

        Ax = np.dot(A, x)
        b_Ax = b - Ax
        Gx = np.dot(G, x)
        h_Gx = h - Gx
        u_x = u - x

        yz1_1 = y / z1
        w1z2_1 = w1 / z2
        w2z3_1 = w2 / z3
        qz4_1 = q / z4
        lamz5_1 = lam / z5
        ATZ1_1Y = A.T * yz1_1
        GTZ_1W = G.T * (w1z2_1 + w2z3_1)

        ATy = np.dot(A.T, y)
        GTw1_w2 = np.dot(G.T, w1 - w2)

        M = np.dot(ATZ1_1Y, A) + np.dot(GTZ_1W, G) + np.diag(qz4_1 + lamz5_1)

        z1_1 = np.reciprocal(z1)
        z2_1 = np.reciprocal(z2)
        z3_1 = np.reciprocal(z3)
        z4_1 = np.reciprocal(z4)
        z5_1 = np.reciprocal(z5)

        r = np.dot(ATZ1_1Y, b_Ax) + np.dot(GTZ_1W, h_Gx) + qz4_1 * u_x - lamz5_1 * x \
            - mu * (np.dot(A.T, z1_1) + np.dot(G.T, z2_1 - z3_1) + z4_1 - z5_1) \
            - c - ATy - GTw1_w2 - q + lam

        # Linear System Solve
        if verbose:
            print(f"Condition number before pre-conditioning: {np.linalg.cond(M)}")
        delta_x = np.linalg.solve(M, r)
        # delta_x = ruiz_solve(M, r, iterations=8, verbose=verbose)

        # Recover the steps
        Adelta_x = np.dot(A, delta_x)
        Gdelta_x = np.dot(G, delta_x)

        delta_y = (y * (Ax + Adelta_x - b) + mu) / z1
        delta_w1 = (w1 * (Gx + Gdelta_x - h) + mu) / z2
        delta_w2 = (mu - w2 * (Gx + Gdelta_x - h)) / z3
        delta_q = (q * (x + delta_x - u) + mu) / z4
        delta_lam = c + ATy + GTw1_w2 + q - lam \
            + np.dot(A.T, delta_y) + np.dot(G.T, delta_w1 - delta_w2) + delta_q
        delta_z1 = b - Ax - z1 - Adelta_x
        delta_z2 = h - Gx - z2 - Gdelta_x
        delta_z3 = Gx - h - z3 + Gdelta_x
        delta_z4 = u - x - z4 - delta_x
        delta_z5 = x - z5 + delta_x

        alpha_star_x = ratio(x, delta_x)
        alpha_star_y = ratio(y, delta_y)
        alpha_star_w1 = ratio(w1, delta_w1)
        alpha_star_w2 = ratio(w2, delta_w2)
        alpha_star_q = ratio(q, delta_q)
        alpha_star_lam = ratio(lam, delta_lam)
        alpha_star_z1 = ratio(z1, delta_z1)
        alpha_star_z2 = ratio(z2, delta_z2)
        alpha_star_z3 = ratio(z3, delta_z3)
        alpha_star_z4 = ratio(z4, delta_z4)
        alpha_star_z5 = ratio(z5, delta_z5)

        alpha = min(alpha_star_x, alpha_star_y, alpha_star_w1,
                        alpha_star_w2, alpha_star_q, alpha_star_lam,
                        alpha_star_z1, alpha_star_z2, alpha_star_z3,
                        alpha_star_z4, alpha_star_z5, 1.0)

        # Calculate alpha_hat
        is_neighbor = False
        alpha_init_idx = 0
        for i in range(len(alpha_sched)):
            if alpha < alpha_sched[i]:
                alpha_init_idx += 1
            else:
                break

        for alpha in alpha_sched[alpha_init_idx:]:
            x_temp = x + alpha * delta_x
            y_temp = y + alpha * delta_y
            w1_temp = w1 + alpha * delta_w1
            w2_temp = w2 + alpha * delta_w2
            gam_temp = q + alpha * delta_q
            lam_temp = lam + alpha * delta_lam
            z1_temp = z1 + alpha * delta_z1
            z2_temp = z2 + alpha * delta_z2
            z3_temp = z3 + alpha * delta_z3
            z4_temp = z4 + alpha * delta_z4
            z5_temp = z5 + alpha * delta_z5

            r_c_temp = np.dot(y_temp, z1_temp) + np.dot(w1_temp, z2_temp) \
                + np.dot(w2_temp, z3_temp) + np.dot(gam_temp, z4_temp) + np.dot(lam_temp, z5_temp)
            r_c_vec = np.concat((y_temp * z1_temp, w1_temp * z2_temp, w2_temp * z3_temp,
                                    gam_temp * z4_temp, lam_temp * z5_temp))

            is_neighbor = True

            if neighborhood == "Large":
                for comp in r_c_vec:
                    if comp < zeta * r_c_temp / m:
                        is_neighbor = False
                        print("Limited by complementarity")
                        break

            # Neighborhood is small
            else:
                if np.linalg.norm((m * r_c_vec / r_c_temp) - np.ones(m)) > zeta:
                    is_neighbor = False

            if not is_neighbor:
                continue

            # The residual should be the norm of all the constraint errors
            r_p = np.linalg.norm(
                np.dot(A.T, y_temp) + np.dot(G.T, w1_temp - w2_temp) + gam_temp - lam_temp + c
            )

            if r_p > max(r_c_temp/zeta, epsilon):
                is_neighbor = False
                # print("Limited by primal residual")
                continue

            Gx_temp = np.dot(G, x_temp)
            r_d = np.linalg.norm(np.concat((
                np.dot(A, x_temp) + z1_temp - b,
                Gx_temp + z2_temp - h,
                -Gx_temp + z3_temp + h,
                x_temp + z4_temp - u,
                -x_temp + z5_temp
            )))

            if r_d > max(r_c_temp/zeta, epsilon):
                is_neighbor = False
                # print("Limited by dual residual")
                continue

            if r_c_temp > (1 - alpha * (1 - xi)) * r_c:
                is_neighbor = False
                # print("Limited by step complementarity")
                continue

            if is_neighbor:
                break

        if not is_neighbor:
            print("The solution quality is limited by the precision of the linear system solver.")
            break

        print(f"The step size was {alpha}")
        x = x_temp
        y = y_temp
        w1 = w1_temp
        w2 = w2_temp
        q = gam_temp
        lam = lam_temp
        z1 = z1_temp
        z2 = z2_temp
        z3 = z3_temp
        z4 = z4_temp
        z5 = z5_temp

        # Adjust the w variables
        D = np.maximum(0, np.minimum(w1, w2) - tau)
        alpha_D = min(1, np.min((w1 * z2 - (zeta * r_c_temp / m)) / (D * z2)),
            np.min((w2 * z3 - (zeta * r_c_temp / m)) / (D * z3)))

        # Ensure we don't reach a centrality boundary
        if alpha_D < xi:
            alpha_D *= xi

        w1 -= alpha_D * D
        w2 -= alpha_D * D

        if max(abs(entry) for entry in np.concat(
            (x, y, w1, w2, q, lam, z1, z2, z3, z4, z5)
        )) > 2 * m * omega:
            print("The problem is infeasible.")
            break

        iteration += 1

        r_c = np.dot(y, z1) + np.dot(w1, z2) + np.dot(w2, z3) \
            + np.dot(q, z4) + np.dot(lam, z5)

        if r_c <= epsilon:
            print("Solution is below target precision.")
            break

        Gx = np.dot(G, x)

        if verbose:
            print(f"Iteration {iteration}:")
            print(f"{'Primal objective:':20}{np.dot(b, y) + np.dot(h, w1 - w2) + np.dot(u, q):<15.8e}")
            print(f"{'Dual objective:':20}{np.dot(-c, x):<15.8e}")
            print()
            print(f"{'Primal residual:':20}{np.linalg.norm(
                np.dot(A.T, y) + np.dot(G.T, w1 - w2) + q - lam + c
            ):<8.2e}")
            print(f"{'Dual residual:':20}{np.linalg.norm(np.concat((
                    np.dot(A, x) + z1 - b,
                    Gx + z2 - h,
                    -Gx + z3 + h,
                    x + z4 - u,
                    -x + z5
                ))):<8.2e}")
            print(f"{'Compl. Gap:':20}{r_c:<8.2e}")
            print()

    run_time = time.time() - start_time
    primal_obj = np.dot(b, y) + np.dot(h, w1 - w2) + np.dot(u, q)
    dual_obj = np.dot(-c, x)  # pylint: disable=invalid-unary-operand-type
    print(f"The algorithm stopped after {iteration:d} iterations in {run_time:.2f} seconds.")
    print()
    print(f"{'Primal objective:':20}{primal_obj:<15.8e}")
    print(f"{'Dual objective:':20}{dual_obj:<15.8e}")
    print()
    print(f"{'Primal residual:':20}{np.linalg.norm(
        np.dot(A.T, y) + np.dot(G.T, w1 - w2) + q - lam + c
    ):<8.2e}")
    print(f"{'Dual residual:':20}{np.linalg.norm(np.concat((
            np.dot(A, x) + z1 - b,
            Gx + z2 - h,
            -Gx + z3 + h,
            x + z4 - u,
            -x + z5
        ))):<8.2e}")
    print(f"{'Compl. Gap:':20}{r_c:<8.2e}")
    print()
    if verbose:
        print(x)
    return -dual_obj, run_time, x, r_c

if __name__ == "__main__":
    ipm_solve(verbose=True)