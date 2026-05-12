import json
import numpy as np

from src.variable_definitions import (
    setup_universal_var,
    setup_universal_linineq
)

# Linear approximation of a convex QCP
# The quadratic term for each inequality is a single variable squared (plus linear terms and constants)
# Can use either tangent lines (outer approx) or secant lines (inner approx)
def quadratic_model_lin_approx(eps: int, outer_approximation: bool,
                                coefficient_surrogate: bool, surrogate_bound_below: bool,
                                surrogate_bound_above: bool, f_name: str = "toy.json",
                                verbose: str = False) -> None:

    with open(f_name, 'r', encoding='utf-8') as file:
        data = json.load(file)

    # For each constraint, if it has a quadratic constraint, find the corresponding variable
    # Define a new variable, z_i, as a surrogate
    # Remove the quadratic constraint and add a linear constraint with z_i
    # Compute and add appropriate linear inequalties to z_i

    num_quadratic_constraints = 0
    variables = data["variables"]
    constraints = data["constraints"]
    initial_len = len(constraints)

    linear_approx_constraints = []

    for constraint_name, constraint_data in constraints.items():
        quadratic_terms = constraint_data["body"]["quadratic"]
        if len(quadratic_terms) > 1:
            print("Cannot work with multiple quadratic terms.")
            break

        if len(quadratic_terms) == 1:
            num_quadratic_constraints += 1

            quadratic_constraint = quadratic_terms[0]
            if quadratic_constraint["var1"] != quadratic_constraint["var2"]:
                print("Cannot work with products of two different variables.")
                break

            # Get the information for the quadratic variable
            quadratic_variable = quadratic_constraint["var1"]
            quadratic_coef = quadratic_constraint["coef"]

            quadratic_var_data = variables[quadratic_variable]
            lower = quadratic_var_data["lower"]
            upper = quadratic_var_data["upper"]

            if lower is None or upper is None:
                print("Bounds on quadratic varible must be defined.")
                break

            # Add a linear variable
            surrogate_var = setup_universal_var()
            if surrogate_bound_below:
                surrogate_var["lower"] = lower
            else:
                surrogate_var["lower"] = None

            if surrogate_bound_above:
                surrogate_var["upper"] = upper**2
                if coefficient_surrogate:
                    surrogate_var["upper"] *= quadratic_coef
            else:
                surrogate_var["upper"] = None

            surrogate_var_name = "z_" + quadratic_variable
            variables[surrogate_var_name] = surrogate_var

            # Turn the quadratic constraint into a linear constraint
            constraint_data["body"]["quadratic"] = []
            if coefficient_surrogate:
                constraint_data["body"]["linear"].append({"var": surrogate_var_name, "coef": 1.0})
            else:
                constraint_data["body"]["linear"].append({"var": surrogate_var_name, "coef": quadratic_coef})

            # Add linear approximation constraints
            if outer_approximation:
                # Tangent line at each point
                points = np.linspace(lower, upper, eps)
                for i in range(eps):
                    point = points[i]
                    fun_point = point**2
                    if coefficient_surrogate:
                        fun_point *= quadratic_coef

                    constraint = setup_universal_linineq()
                    constraint["body"]["constant"] = -fun_point
                    if coefficient_surrogate:
                        constraint["body"]["linear"] = [{"var": quadratic_variable, "coef": 2*quadratic_coef*point}, \
                                                        {"var": surrogate_var_name, "coef": -1.0}]
                    else:
                        constraint["body"]["linear"] = [{"var": quadratic_variable, "coef": 2*point}, \
                                                        {"var": surrogate_var_name, "coef": -1.0}]
                    constraint_name = surrogate_var_name + "_outer_lin_approx_" + str(i)
                    linear_approx_constraints.append(tuple((constraint_name, constraint)))

            else:
                # Secant line between each two points
                points = np.linspace(lower, upper, eps + 1)
                lambd = points[1] - points[0]
                for i in range(eps):
                    point_1 = points[i]
                    point_2 = points[i+1]
                    fun_point_1 = point_1**2
                    fun_point_2 = point_2**2
                    if coefficient_surrogate:
                        fun_point_1 *= quadratic_coef
                        fun_point_2 *= quadratic_coef

                    constraint = setup_universal_linineq()
                    m = float((fun_point_2 - fun_point_1) / lambd)
                    constraint["body"]["constant"] = fun_point_1 - m*point_1
                    constraint["body"]["linear"] = [{"var": quadratic_variable, "coef": m}, \
                                                    {"var": surrogate_var_name, "coef": -1.0}]
                    constraint_name = surrogate_var_name + "_inner_lin_approx_" + str(i)
                    linear_approx_constraints.append(tuple((constraint_name, constraint)))

    for constraint_name, constraint in linear_approx_constraints:
        constraints[constraint_name] = constraint

    with open('linear_approx.json', 'w', encoding='utf-8') as f:
        json.dump(data, f, indent=4)

    if verbose:
        print(f'Of the {initial_len} (non-bound) constraints, {num_quadratic_constraints} are quadratic')
        print(f'Made a linear approximation with {len(constraints)} (non-bound) constraints.')

if __name__ == "__main__":
    # The number of linear constraints to use per quadratic constraint
    EPS = 5

    # Whether to do an inner or outer approximation
    OUTER_APPROXIMATION = False

    # Whether the coefficient is part of the surrogate
    COEFFICIENT_SURROGATE = True

    # Whether to bound the surrogates with bound constraints.
    SURROGATE_BOUND_BELOW = True
    SURROGATE_BOUND_ABOVE = True

    # File to import the quadratic model from
    F_NAME = "toy.json"

    quadratic_model_lin_approx(EPS, OUTER_APPROXIMATION, COEFFICIENT_SURROGATE, 
                                SURROGATE_BOUND_BELOW, SURROGATE_BOUND_ABOVE, F_NAME, verbose=True)
