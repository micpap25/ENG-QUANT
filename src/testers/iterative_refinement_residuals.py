from pathlib import Path

import matplotlib.pyplot as plt
import numpy as np
import scipy.sparse

from ipm_new.ipm_solve import solve_system


DROP_TOL = 0.05
REFINEMENT_ITERATIONS = range(6)


def main():
    rng = np.random.default_rng(7)
    matrix_size = 80
    random_matrix = rng.normal(size=(matrix_size, matrix_size))
    matrix_dense = random_matrix.T @ random_matrix + 1e-3 * np.eye(matrix_size)
    matrix = scipy.sparse.csc_matrix(matrix_dense)
    true_solution = rng.normal(size=matrix_size)
    right_hand_side = matrix @ true_solution

    residuals = []
    for iterations in REFINEMENT_ITERATIONS:
        solution = solve_system(
            matrix,
            right_hand_side,
            sparse=True,
            ruiz=False,
            ilu=True,
            saund_tom=0.0,
            verbose=False,
            ilu_refinement=iterations,
            ilu_drop_tol=DROP_TOL,
        )
        residuals.append(np.linalg.norm(right_hand_side - matrix @ solution))

    residuals = np.asarray(residuals)
    if not np.all(np.diff(residuals) <= 1e-12 * np.maximum(1.0, residuals[:-1])):
        raise AssertionError("Residuals are not nonincreasing")

    output_path = (
        Path(__file__).resolve().parents[2]
        / "experiments"
        / "iterative_refinement_residuals.png"
    )
    output_path.parent.mkdir(parents=True, exist_ok=True)

    fig, axis = plt.subplots(figsize=(7, 4.5))
    axis.semilogy(list(REFINEMENT_ITERATIONS), residuals, marker="o")
    axis.set_xlabel("ILU iterative refinement iterations")
    axis.set_ylabel(r"Linear residual $\|r - Mx\|_2$")
    axis.set_title(f"Residual vs. refinement iterations (drop tolerance = {DROP_TOL})")
    axis.set_xticks(list(REFINEMENT_ITERATIONS))
    axis.grid(True, which="both", alpha=0.3)
    fig.tight_layout()
    fig.savefig(output_path, dpi=160)
    plt.close(fig)

    for iterations, residual in zip(REFINEMENT_ITERATIONS, residuals):
        print(f"{iterations}: {residual:.16e}")
    print(f"Saved chart to {output_path}")


if __name__ == "__main__":
    main()
