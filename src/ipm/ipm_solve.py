from ipm.problem_to_matrices import problem_to_matrices


def ipm_solve(f_name: str = "linear_approx.json",
                verbose: bool = False) -> None:
    A, b, c = problem_to_matrices(f_name=f_name, verbose=verbose)


if __name__ == "__main__":
    ipm_solve(verbose=True)
