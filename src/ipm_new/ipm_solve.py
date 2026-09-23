from __future__ import annotations

from ipm_new.problem_to_eq_ineq_matrices import problem_to_eq_ineq_matrices
import numpy as np
import time

import scipy.linalg
import scipy.sparse
from pymatting.preconditioner.ichol import ichol

# Solve a GasNet problem in a relaxed LP form.

def ratio(x_vec, delta_x_vec):
    rat = 1
    for (x, delta_x) in zip(x_vec, delta_x_vec):
        if delta_x < 0:
            rat = min(- x / delta_x , rat)
    return rat

def ruiz_equilibrate(matrix, vector, iterations, sparse, verbose=False):
    """Return a symmetrically equilibrated system and its diagonal scaling."""
    if sparse:
        scaled_matrix = scipy.sparse.csc_array(matrix, dtype=float, copy=True)
    else:
        scaled_matrix = np.asarray(matrix, dtype=float).copy()
    scaled_vector = np.asarray(vector, dtype=float).copy()
    scaling = np.ones(scaled_matrix.shape[0])

    for iteration in range(iterations):
        # M is symmetric; scaling by the row infinity norms is therefore
        # equivalent to using the corresponding column norms as well.
        if sparse:
            norms = np.abs(scaled_matrix).max(axis=1).toarray().ravel()
        else:
            norms = np.max(np.abs(scaled_matrix), axis=1)
        old_matrix_norm = np.max(norms)
        norms = np.maximum(norms, np.finfo(float).tiny)
        step_scaling = 1.0 / np.sqrt(norms)
        if sparse:
            diagonal_scaling = scipy.sparse.diags_array(step_scaling)
            scaled_matrix = (diagonal_scaling @ scaled_matrix @ diagonal_scaling).tocsc()
        else:
            scaled_matrix *= step_scaling[:, np.newaxis]
            scaled_matrix *= step_scaling[np.newaxis, :]
        scaled_vector *= step_scaling
        scaling *= step_scaling

        # Report the matrix infinity norm before and after this scaling step.
        if verbose:
            if sparse:
                new_norms = np.abs(scaled_matrix).max(axis=1).toarray().ravel()
            else:
                new_norms = np.max(np.abs(scaled_matrix), axis=1)
            print(
                f"Ruiz iteration {iteration + 1}: "
                f"matrix norm {old_matrix_norm:.3e} -> {np.max(new_norms):.3e}"
            )

    return scaled_matrix, scaled_vector, scaling

def ruiz_solve(matrix, vector, iterations, sparse, verbose=False):
    """Solve a linear system after symmetric Ruiz equilibration."""
    scaled_matrix, scaled_vector, scaling = ruiz_equilibrate(
        matrix, vector, iterations, sparse, verbose=verbose
    )

    # scaled_matrix y = scaled_vector, with x = D y.
    if sparse:
        solution = scipy.sparse.linalg.spsolve(scaled_matrix, scaled_vector)
    else:
        if verbose:
            print(f"Condition number after pre-conditioning: {np.linalg.cond(scaled_matrix)}")
        solution = np.linalg.solve(scaled_matrix, scaled_vector)
    return scaling * solution

def solve_system(M, r, sparse, ruiz, ilu, saund_tom, verbose, ilu_refinement,
                 ilu_drop_tol):
    if sparse:
        regularization = scipy.sparse.eye(M.shape[0], format="csc")
    else:
        regularization = np.eye(M.shape[0])
    M_reg = M + saund_tom * regularization

    scaling = None
    if ruiz:
        M_reg, r, scaling = ruiz_equilibrate(
            M_reg, r, iterations=2, sparse=sparse, verbose=verbose
        )

    def refine_solution(solution, apply_preconditioner):
        residual = r - M_reg @ solution
        residual_norm = np.linalg.norm(residual)
        if verbose:
            print(f"Pre-refinement residual norm: {residual_norm}")
        for refine_step in range(ilu_refinement):
            correction = apply_preconditioner(residual)
            candidate = solution + correction
            candidate_residual = r - M_reg @ candidate
            candidate_norm = np.linalg.norm(candidate_residual)
            if verbose:
                print(f"Refinement iteration {refine_step + 1} residual norm: {candidate_norm}")
            if not np.isfinite(candidate_norm) or candidate_norm >= residual_norm:
                break
            solution = candidate
            residual = candidate_residual
            residual_norm = candidate_norm
        return solution

    if sparse:
        if ilu:
            ilu_mat = scipy.sparse.linalg.spilu(
                M_reg, drop_tol=ilu_drop_tol
            )

            M_ilu = scipy.sparse.linalg.LinearOperator(ilu_mat.shape, matvec=ilu_mat.solve, dtype=M_reg.dtype)

            if verbose:
                n = M_reg.shape[0]
                I = np.eye(n)
                new_mat = np.column_stack([M_ilu @ (M_reg @ I[:, j]) for j in range(n)])
                print(f"Condition number after pre-conditioning:  {np.linalg.cond(new_mat)}")

            solution = refine_solution(M_ilu @ r, M_ilu.matvec)
            return scaling * solution if scaling is not None else solution

        #     L = ichol(M_reg, discard_threshold=1e-8).L
        #     L_T = L.T.tocsc()
        #     Lr = scipy.sparse.linalg.spsolve_triangular(L, r, lower=True)
        #     return scipy.sparse.linalg.spsolve_triangular(L_T, Lr, lower=False)

        else:
            solution = scipy.sparse.linalg.spsolve(M_reg, r)
            return scaling * solution if scaling is not None else solution
            # print(M_reg)
            # print(r)
            # step, info = scipy.sparse.linalg.gmres(M_reg, r, rtol=1e-8)
            # return step
    else:
        if ilu:
            M_sparse = scipy.sparse.csc_matrix(M_reg)
            M_ilu = scipy.sparse.linalg.spilu(
                M_sparse, drop_tol=ilu_drop_tol
            )
            # print(M_ilu.L)
            # print()
            # print(M_ilu.U)
            # print()
            solution = refine_solution(M_ilu.solve(r), M_ilu.solve)
            return scaling * solution if scaling is not None else solution
        else:
            solution = np.linalg.solve(M_reg, r)
            return scaling * solution if scaling is not None else solution

def factorize_system(M, sparse, ruiz, ilu, saund_tom, verbose,
                     ilu_refinement, ilu_drop_tol):
    if sparse:
        regularization = scipy.sparse.eye(M.shape[0], format="csc")
    else:
        regularization = np.eye(M.shape[0])
    M_reg = M + saund_tom * regularization

    scaling = None
    if ruiz:
        M_reg, _, scaling = ruiz_equilibrate(
            M_reg, np.zeros(M.shape[0]), iterations=2,
            sparse=sparse, verbose=verbose
        )

    if sparse:
        if ilu:
            factor = scipy.sparse.linalg.spilu(M_reg, drop_tol=ilu_drop_tol)
            apply_factor = factor.solve
        else:
            factor = scipy.sparse.linalg.splu(M_reg)
            apply_factor = factor.solve
    elif ilu:
        factor = scipy.sparse.linalg.spilu(
            scipy.sparse.csc_matrix(M_reg), drop_tol=ilu_drop_tol
        )
        apply_factor = factor.solve
    else:
        factor = scipy.linalg.lu_factor(M_reg)
        apply_factor = lambda vector: scipy.linalg.lu_solve(factor, vector)

    def solve_rhs(vector):
        scaled_vector = scaling * vector if scaling is not None else vector
        solution = apply_factor(scaled_vector)
        residual = scaled_vector - M_reg @ solution
        residual_norm = np.linalg.norm(residual)
        for _ in range(ilu_refinement):
            correction = apply_factor(residual)
            candidate = solution + correction
            candidate_residual = scaled_vector - M_reg @ candidate
            candidate_norm = np.linalg.norm(candidate_residual)
            if not np.isfinite(candidate_norm) or candidate_norm >= residual_norm:
                break
            solution = candidate
            residual = candidate_residual
            residual_norm = candidate_norm
        return scaling * solution if scaling is not None else solution

    return solve_rhs

def ipm_solve(f_name: str = "linear_approx.json", beta: float = 0.1,
                xi: float = 1 - 5e-8, omega: float = 1e4,
                w_update: bool = True, predictor_corrector: bool = True,
                D_bound: float = 1 - 5e-8, D_mult: float = .9,
                epsilon: float = 1e-8, zeta_n: float = 5e-2, zeta_r: float = 1e-4,
                alpha_sched: list[float] = [.9, .7, .5, .3, .1, .01],
                alpha_min: float = 1e-4,
                saund_tom: bool = False, saund_tom_factor: float = 1e-16,
                neighborhood: str = "Large", tau: float = 1e-8,
                sparse: bool = True, ruiz: bool = False, ilu: bool = False,
                ilu_refinement: int = 3, ilu_drop_tol: float = 1e-8,
                verbose: bool = False):
    np.set_printoptions(linewidth=200)

    # Note that ruiz + ilu causes problems because the ruiz scales the matrix further

    init_beta = beta
    if not saund_tom:
        saund_tom_factor = 0

    # Gurobi output pops up here because of license file
    A, b, G, h, u, c = problem_to_eq_ineq_matrices(f_name=f_name, sparse=sparse, verbose=False)
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
    assert A.shape == (i_bar, n)
    assert G.shape == (e_bar, n)
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

    # Initial residuals (Since w1 = w2 we can remove those terms)
    r_p0 = np.linalg.norm(A.T @ y + c)
    Gx_init = G @ x
    r_d0 = np.linalg.norm(np.concat((
        A @ x + z1 - b,
        Gx_init + z2 - h,
        -Gx_init + z3 + h,
        x + z4 - u,
        -x + z5
    )))
    r_c0 = m * omega**2
    mu0 = omega**2

    iteration = 0
    start_time = time.time()

    test = [0, 0, 0, 0, 0, 0]

    while True:
        # if iteration == 34:
        #     beta = .75
        # else:
        #     beta = init_beta
        r_c = np.dot(y, z1) + np.dot(w1, z2) + np.dot(w2, z3) \
            + np.dot(q, z4) + np.dot(lam, z5)

        mu = r_c * beta / m

        Ax = A @ x
        b_Ax = b - Ax
        Gx = G @ x
        h_Gx = h - Gx
        u_x = u - x

        if saund_tom:
            yz1_1 = 1 / ((z1 / y) + saund_tom_factor * np.ones(i_bar))
            w1z2_1 = 1 / ((z2 / w1) + saund_tom_factor * np.ones(e_bar))
            w2z3_1 = 1 / ((z3 / w2) + saund_tom_factor * np.ones(e_bar))
            qz4_1 = 1 / ((z4 / q) + saund_tom_factor * np.ones(n))
            lamz5_1 = 1 / ((z5 / lam) + saund_tom_factor * np.ones(n))
        else:
            yz1_1 = y / z1
            w1z2_1 = w1 / z2
            w2z3_1 = w2 / z3
            qz4_1 = q / z4
            lamz5_1 = lam / z5

        if sparse:
            ATZ1_1Y = A.T.multiply(yz1_1)
            GTZ_1W = G.T.multiply(w1z2_1 + w2z3_1)
        else:
            ATZ1_1Y = A.T * yz1_1
            GTZ_1W = G.T * (w1z2_1 + w2z3_1)

        ATy = A.T @ y
        GTw1_w2 = G.T @ (w1 - w2)

        if sparse:
            M = (ATZ1_1Y @ A + GTZ_1W @ G
                + scipy.sparse.diags_array(qz4_1 + lamz5_1)).tocsc()
        else:
            M = (ATZ1_1Y @ A + GTZ_1W @ G
                + np.diag(qz4_1 + lamz5_1))

        z1_1 = np.reciprocal(z1)
        z2_1 = np.reciprocal(z2)
        z3_1 = np.reciprocal(z3)
        z4_1 = np.reciprocal(z4)
        z5_1 = np.reciprocal(z5)

        r_aff = ATZ1_1Y @ b_Ax + GTZ_1W @ h_Gx + qz4_1 * u_x - lamz5_1 * x \
            - c - ATy - GTw1_w2 - q + lam
        r_cent = A.T @ z1_1 + G.T @ (z2_1 - z3_1) + z4_1 - z5_1

        corrector_y = np.zeros_like(y)
        corrector_w1 = np.zeros_like(w1)
        corrector_w2 = np.zeros_like(w2)
        corrector_q = np.zeros_like(q)
        corrector_lam = np.zeros_like(lam)

        # This code (predictor-corrector) was originally written with AI and should be evaluated further
        if predictor_corrector:
            solve_M = factorize_system(
                M, sparse, ruiz, ilu, saund_tom_factor, verbose,
                ilu_refinement, ilu_drop_tol
            )
            delta_x_aff = solve_M(r_aff)
            Adelta_x_aff = A @ delta_x_aff
            Gdelta_x_aff = G @ delta_x_aff
            delta_y_aff = (y * (Ax + Adelta_x_aff - b)) / z1
            delta_w1_aff = (w1 * (Gx + Gdelta_x_aff - h)) / z2
            delta_w2_aff = (-w2 * (Gx + Gdelta_x_aff - h)) / z3
            delta_q_aff = (q * (x + delta_x_aff - u)) / z4
            delta_lam_aff = c + ATy + GTw1_w2 + q - lam \
                + A.T @ delta_y_aff + G.T @ (delta_w1_aff - delta_w2_aff) + delta_q_aff
            delta_z1_aff = b - Ax - z1 - Adelta_x_aff
            delta_z2_aff = h - Gx - z2 - Gdelta_x_aff
            delta_z3_aff = Gx - h - z3 + Gdelta_x_aff
            delta_z4_aff = u - x - z4 - delta_x_aff
            delta_z5_aff = x - z5 + delta_x_aff

            alpha_aff = min(
                ratio(x, delta_x_aff), ratio(y, delta_y_aff),
                ratio(w1, delta_w1_aff), ratio(w2, delta_w2_aff),
                ratio(q, delta_q_aff), ratio(lam, delta_lam_aff),
                ratio(z1, delta_z1_aff), ratio(z2, delta_z2_aff),
                ratio(z3, delta_z3_aff), ratio(z4, delta_z4_aff),
                ratio(z5, delta_z5_aff), 1.0
            )
            y_aff = y + alpha_aff * delta_y_aff
            w1_aff = w1 + alpha_aff * delta_w1_aff
            w2_aff = w2 + alpha_aff * delta_w2_aff
            q_aff = q + alpha_aff * delta_q_aff
            lam_aff = lam + alpha_aff * delta_lam_aff
            z1_aff = z1 + alpha_aff * delta_z1_aff
            z2_aff = z2 + alpha_aff * delta_z2_aff
            z3_aff = z3 + alpha_aff * delta_z3_aff
            z4_aff = z4 + alpha_aff * delta_z4_aff
            z5_aff = z5 + alpha_aff * delta_z5_aff
            mu_aff = (
                np.dot(y_aff, z1_aff) + np.dot(w1_aff, z2_aff)
                + np.dot(w2_aff, z3_aff) + np.dot(q_aff, z4_aff)
                + np.dot(lam_aff, z5_aff)
            ) / m
            # This is equivalent to Gondzio
            # We can get a better gap if we completely ignore the corrector steps
            # And just keep min(beta, sigma). Why is that? Is that just because small beta is good?
            sigma = np.clip((mu_aff / (r_c / m)) ** 3, 0.0, 1.0)
            mu = sigma * r_c / m
            # mu = min(beta, sigma) * r_c / m

            corrector_y = delta_y_aff * delta_z1_aff / z1
            corrector_w1 = delta_w1_aff * delta_z2_aff / z2
            corrector_w2 = delta_w2_aff * delta_z3_aff / z3
            corrector_q = delta_q_aff * delta_z4_aff / z4
            corrector_lam = delta_lam_aff * delta_z5_aff / z5

        r_corr = (
            -mu * r_cent
            + A.T @ corrector_y
            + G.T @ (corrector_w1 - corrector_w2)
            + corrector_q - corrector_lam
        )

        # # Linear System Solve
        # if verbose and not sparse:
        #     print(f"Condition number before pre-conditioning: {np.linalg.cond(M)}")
        # elif verbose and sparse:
        #     print(f"Condition number before pre-conditioning: {np.linalg.cond(M.toarray())}")
        if predictor_corrector:
            delta_x_corr = solve_M(r_corr)
            delta_x = delta_x_aff + delta_x_corr
        else:
            delta_x = solve_system(
                M, r_aff - mu * r_cent, sparse, ruiz, ilu,
                saund_tom_factor, verbose, ilu_refinement, ilu_drop_tol
            )

        # Recover the steps
        Adelta_x = A @ delta_x
        Gdelta_x = G @ delta_x

        delta_y = (y * (Ax + Adelta_x - b) + mu) / z1 - corrector_y
        delta_w1 = (w1 * (Gx + Gdelta_x - h) + mu) / z2 - corrector_w1
        delta_w2 = (mu - w2 * (Gx + Gdelta_x - h)) / z3 - corrector_w2
        delta_q = (q * (x + delta_x - u) + mu) / z4 - corrector_q
        delta_lam = c + ATy + GTw1_w2 + q - lam \
            + A.T @ delta_y + G.T @ (delta_w1 - delta_w2) + delta_q
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

        alpha_max = min(alpha_star_x, alpha_star_y, alpha_star_w1,
                        alpha_star_w2, alpha_star_q, alpha_star_lam,
                        alpha_star_z1, alpha_star_z2, alpha_star_z3,
                        alpha_star_z4, alpha_star_z5, 1.0)

        is_neighbor = False

        for alpha_factor in alpha_sched:
            alpha = alpha_factor * alpha_max
            if alpha <= alpha_min:
                break
            x_alpha = x + alpha * delta_x
            y_alpha = y + alpha * delta_y
            w1_alpha = w1 + alpha * delta_w1
            w2_alpha = w2 + alpha * delta_w2
            q_alpha = q + alpha * delta_q
            lam_alpha = lam + alpha * delta_lam
            z1_alpha = z1 + alpha * delta_z1
            z2_alpha = z2 + alpha * delta_z2
            z3_alpha = z3 + alpha * delta_z3
            z4_alpha = z4 + alpha * delta_z4
            z5_alpha = z5 + alpha * delta_z5

            r_c_alpha = np.dot(y_alpha, z1_alpha) + np.dot(w1_alpha, z2_alpha) \
                + np.dot(w2_alpha, z3_alpha) + np.dot(q_alpha, z4_alpha) + np.dot(lam_alpha, z5_alpha)
            mu_alpha = r_c_alpha / m
            mu_ratio = mu_alpha / mu0

            r_c_vec = np.concat((y_alpha * z1_alpha, w1_alpha * z2_alpha, w2_alpha * z3_alpha,
                                    q_alpha * z4_alpha, lam_alpha * z5_alpha))

            is_neighbor = True

            if neighborhood == "Large":
                for comp in r_c_vec:
                    if comp < zeta_n * mu_alpha:
                        is_neighbor = False
                        # print("Limited by complementarity")
                        test[0] += 1
                        break

            # Neighborhood is small
            else:
                if np.linalg.norm((r_c_vec / mu_alpha) - np.ones(m)) > zeta_n:
                    is_neighbor = False

            if not is_neighbor:
                continue

            # The primal residual should fall with the complementarity gap
            r_p_alpha = np.linalg.norm(
                A.T @ y_alpha + G.T @ (w1_alpha - w2_alpha) + q_alpha - lam_alpha + c
            )

            # print(r_p_alpha)
            # print(r_p0 * mu_alpha/zeta_r)
            if r_p_alpha > max(r_p0 * mu_ratio/zeta_r, epsilon):
                is_neighbor = False
                # print("Limited by primal residual")
                test[1] += 1
                continue

            # print(f"r_p: {np.linalg.norm(A.T @ y + G.T @ (w1 - w2) + q - lam + c)}")
            # print(f"r_p alpha: {r_p_alpha}")
            # print(f"r_p/rp_0: {np.linalg.norm(A.T @ y + G.T @ (w1 - w2) + q - lam + c)/r_p0}")
            # print(f"r_p alpha / rp_0: {r_p_alpha/r_p0}")
            # print(f"mu_alpha / mu_0: {mu_ratio}")
            # print(f"bound: {r_p0 * mu_ratio * zeta_r}")
            # print(f"alpha: {alpha}")
            if r_p_alpha < r_p0 * mu_ratio * zeta_r:
                is_neighbor = False
                print("Limited by primal residual")
                test[2] += 1
                continue

            # The dual residual should fall with the complementarity gap
            Gx_alpha = G @ x_alpha
            r_d_alpha = np.linalg.norm(np.concat((
                A @ x_alpha + z1_alpha - b,
                Gx_alpha + z2_alpha - h,
                -Gx_alpha + z3_alpha + h,
                x_alpha + z4_alpha - u,
                -x_alpha + z5_alpha
            )))

            if r_d_alpha > max(r_d0 * mu_ratio/zeta_r, epsilon):
                is_neighbor = False
                # print("Limited by dual residual")
                test[3] += 1
                continue

            if r_d_alpha < r_d0 * mu_ratio * zeta_r:
                is_neighbor = False
                # print("Limited by dual residual")
                test[4] += 1
                continue

            # The complementarity gap should be decreasing (ignore for centering steps)
            if np.isclose(beta, init_beta):
                if r_c_alpha > (1 - alpha * (1 - xi)) * r_c:
                    is_neighbor = False
                    # print("Limited by step complementarity")
                    test[5] += 1
                    continue

            if is_neighbor:
                break

        if not is_neighbor:
            print("The solution quality is limited by the precision of the linear system solver.")
            break

        if verbose:
            print(f"The step size was {alpha}")

        x = x_alpha
        y = y_alpha
        w1 = w1_alpha
        w2 = w2_alpha
        q = q_alpha
        lam = lam_alpha
        z1 = z1_alpha
        z2 = z2_alpha
        z3 = z3_alpha
        z4 = z4_alpha
        z5 = z5_alpha

        # Adjust the w variables (Is this better to do in the newton loop or is here OK?
        # No difference in actual convergence, seems identical)
        if w_update:
            D = np.maximum(tau, np.minimum(w1, w2) - tau)
            alpha_D = min(1, np.min((w1 * z2 - (zeta_n * mu_alpha)) / (D * z2)),
                np.min((w2 * z3 - (zeta_n * mu_alpha)) / (D * z3)))

            # Ensure we don't reach a centrality boundary
            # Can change the bound or the multiplier 
            if alpha_D < D_bound:
                alpha_D *= D_mult

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

        Gx = G @ x

        if verbose:
            print(f"Iteration {iteration}:")
            primal_obj = np.dot(b, y) + np.dot(h, w1 - w2) + np.dot(u, q)
            dual_obj = np.dot(-c, x)  # pylint: disable=invalid-unary-operand-type
            print(f"{'Primal objective:':20}{primal_obj:<15.8e}")
            print(f"{'Dual objective:':20}{dual_obj:<15.8e}")
            print()
            print(f"{'Primal residual:':20}{np.linalg.norm(
                A.T @ y + G.T @ (w1 - w2) + q - lam + c
            ):<8.2e}")
            print(f"{'Dual residual:':20}{np.linalg.norm(np.concat((
                    A @ x + z1 - b,
                    Gx + z2 - h,
                    -Gx + z3 + h,
                    x + z4 - u,
                    -x + z5
                ))):<8.2e}")
            print(f"{'Abs. Compl. Gap:':20}{r_c:<8.2e}")
            scale = 1.0 + abs(primal_obj) + abs(dual_obj)
            print(f"{'Rel. Compl. Gap:':20}{r_c / scale:<8.2e}")
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
        A.T @ y + G.T @ (w1 - w2) + q - lam + c
    ):<8.2e}")
    print(f"{'Dual residual:':20}{np.linalg.norm(np.concat((
            A @ x + z1 - b,
            Gx + z2 - h,
            -Gx + z3 + h,
            x + z4 - u,
            -x + z5
        ))):<8.2e}")
    print(f"{'Abs. Compl. Gap:':20}{r_c:<8.2e}")
    scale = 1.0 + abs(primal_obj) + abs(dual_obj)
    print(f"{'Rel. Compl. Gap:':20}{r_c / scale:<8.2e}")
    print()
    if verbose:
        print(x)
        print(test)
    return -dual_obj, run_time, x, r_c

if __name__ == "__main__":
    ipm_solve(verbose=False)