from __future__ import annotations

from ipm.problem_to_matrices import problem_to_matrices
from ipm.Model import Model

def ipm_solve(f_name: str = "linear_approx.json",
                verbose: bool = False) -> None:
    A, b, c = problem_to_matrices(f_name=f_name, verbose=verbose)

    print(len(A))
    print(len(A[0]))
    
    model = Model(A, b, c)


    model.Params.Method 		= "II-IPM"

    model.Params.Omega 			= 1e4
    model.Params.Stop_Precision = 1e-16
    model.Params.Stop_Cond_Num 	= 1e10
    model.Beta_2                = 0.1

    # model.Params.Method 		= "II-QIPM"
    # model.Params.HHL_Method 	= 2

    # model.Params.LO_Precision	= 1e-1
    # model.Params.Omega 			= 1e2
    # model.Params.Stop_Precision = 1e-3
    # model.Params.Stop_Cond_Num 	= 5e3
    # model.Params.qlsa_precision = 1e0

    model.Params.LO_Verbosity 	= 2

    model.solve()


if __name__ == "__main__":
    ipm_solve(verbose=False)
