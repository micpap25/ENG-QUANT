import json
import numpy as np

# Take in an LP and compute the condition number of a matrix
# That should represent the system being solved in the QIPM
# According to discussions on 4/30/2026
# If the problem is min c^Tx  s.t. Ax = b, A'x >= d,  -x >= -u, x >= l
# Then the matrix is A^TA + A'^TA' + 2I
# This assumes the variables are bounded on both sides
def condition_number_nes_basic(f_name: str = "linear_approx.json",
                                verbose: bool = False) -> float:
    with open(f_name, 'r', encoding='utf-8') as file:
        data = json.load(file)

    variables = data["variables"]
    constraints = data["constraints"]
    n_variables = len(variables)
    n_constraints = len(constraints)

    # Assign the variables to rows
    var_name_to_row_index = {}
    for i, var_name in enumerate(variables.keys(), start=0):
        var_name_to_row_index[var_name] = i

    # Get the number of equality constraints
    n_equality_constraints = 0
    for constraint in constraints.values():
        if constraint["equality"]:
            n_equality_constraints += 1
    
    n_inequality_constraints = n_constraints - n_equality_constraints

    # Create the matrices of constraints
    A = np.zeros((n_equality_constraints, n_variables))
    A_bar = np.zeros((n_inequality_constraints, n_variables))

    equality_pointer = 0
    inequality_pointer = 0

    for i, constraint_data in enumerate(constraints.values(), start=0):
        assert len(constraint_data["body"]["quadratic"]) == 0
        linear_data = constraint_data["body"]["linear"]
        if constraint_data["equality"]:
            for lin_variable in linear_data:
                name = var_name_to_row_index[lin_variable["var"]]
                A[equality_pointer, name] = lin_variable["coef"]
            equality_pointer += 1
        else:
            if constraint_data["lower"] is None:
                # it is a <= constraint, so flip it
                for lin_variable in linear_data:
                    name = var_name_to_row_index[lin_variable["var"]]
                    A_bar[inequality_pointer, name] = -lin_variable["coef"]
            else:
                for lin_variable in linear_data:
                    name = var_name_to_row_index[lin_variable["var"]]
                    A_bar[inequality_pointer, name] = lin_variable["coef"]
            inequality_pointer += 1


    final_matrix = np.matmul(np.transpose(A), A) \
                    + np.matmul(np.transpose(A_bar), A_bar) \
                    + np.multiply(2, np.identity(n_variables))

    if verbose:
        print(final_matrix)

    return np.linalg.cond(final_matrix)

# Take in an LP and compute the condition number of A
# Ignoring the bound constraints
def condition_number_no_bounds(f_name: str = "linear_approx.json", 
                                verbose: bool = False) -> float:
    with open(f_name, 'r', encoding='utf-8') as file:
        data = json.load(file)

    variables = data["variables"]
    constraints = data["constraints"]
    n_variables = len(variables)
    n_constraints = len(constraints)

    # Assign the variables to rows

    var_name_to_row_index = {}
    for i, var_name in enumerate(variables.keys(), start=0):
        var_name_to_row_index[var_name] = i

    # Create the matrix of non-bound constraints
    constraint_matrix = np.zeros((n_constraints, n_variables))

    for i, constraint_data in enumerate(constraints.values(), start=0):
        assert len(constraint_data["body"]["quadratic"]) == 0
        linear_data = constraint_data["body"]["linear"]
        for lin_variable in linear_data:
            j = var_name_to_row_index[lin_variable["var"]]
            constraint_matrix[i, j] = lin_variable["coef"]

    if verbose:
        print(constraint_matrix)

    return np.linalg.cond(constraint_matrix)

# Take in an LP and compute the condition number of A
def condition_number(f_name: str = "linear_approx.json",
                        verbose: bool = False) -> float:
    with open(f_name, 'r', encoding='utf-8') as file:
        data = json.load(file)

    variables = data["variables"]
    constraints = data["constraints"]
    n_variables = len(variables)
    n_constraints = len(constraints)

    # Create the matrix of the bound constraints
    # Also assign the variables to rows

    var_name_to_row_index = {}
    bound_constraint_matrix = None
    for i, (var_name, var_data) in enumerate(variables.items(), start=0):
        var_name_to_row_index[var_name] = i

        # Lower bound
        if var_data["lower"] is not None:
            row = np.zeros(n_variables)
            row[i] = 1.0
            if bound_constraint_matrix is None:
                bound_constraint_matrix = row
            else:
                bound_constraint_matrix = np.vstack((bound_constraint_matrix, row))

        # Upper bound
        if var_data["upper"] is not None:
            row = np.zeros(n_variables)
            row[i] = -1.0
            if bound_constraint_matrix is None:
                bound_constraint_matrix = row
            else:
                bound_constraint_matrix = np.vstack((bound_constraint_matrix, row))

    # Create the matrix of non-bound constraints
    constraint_matrix = np.zeros((n_constraints, n_variables))

    for i, constraint_data in enumerate(constraints.values(), start=0):
        assert len(constraint_data["body"]["quadratic"]) == 0
        linear_data = constraint_data["body"]["linear"]
        for lin_variable in linear_data:
            j = var_name_to_row_index[lin_variable["var"]]
            constraint_matrix[i, j] = lin_variable["coef"]

    A = np.vstack((bound_constraint_matrix, constraint_matrix))

    if verbose:
        print(A)

    return np.linalg.cond(A)

if __name__ == "__main__":
    # print(condition_number(verbose=True))
    print(condition_number_nes_basic(verbose=True))