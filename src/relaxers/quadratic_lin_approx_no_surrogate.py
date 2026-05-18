import json
import numpy as np
import copy

from typing import Callable
from collections.abc import Sequence
from numpy.typing import NDArray
type FloatArray = Sequence[float] | NDArray[np.float64]

# Linear approximation of a convex QCP, but with no surrogate variable
# The quadratic term for each inequality is a single variable squared (plus linear terms and constants)
# Can use either tangent lines (outer approx) or secant lines (inner approx)
def quadratic_lin_approx_no_surrogate(eps: int, outer_approximation: bool,
                                        remove_division: bool = True,
                                        points_function: Callable[[float, float, int], FloatArray] = np.linspace,
                                        f_name: str = "toy.json",
                                        verbose: bool = False) -> None:

    with open(f_name, 'r', encoding='utf-8') as file:
        data = json.load(file)

    # For each constraint, if it has a quadratic constraint, find the corresponding variable
    # Remove the quadratic constraint and add appropriate linear inequalties

    variables = data["variables"]
    constraints = data["constraints"]

    linear_approx_constraints = []

    for constraint_name, constraint_data in constraints.items():
        quadratic_terms = constraint_data["body"]["quadratic"]
        if len(quadratic_terms) > 1:
            print("Cannot work with multiple quadratic terms.")
            break

        if len(quadratic_terms) == 1:
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

            # Add linear approximation constraints
            if outer_approximation:
                # Tangent line at each point
                points = np.linspace(lower, upper, eps)
                for i in range(eps):
                    point = points[i]
                    fun_point = quadratic_coef * point**2

                    constraint = copy.deepcopy(constraint_data)
                    constraint["body"]["quadratic"] = []
                    constraint["body"]["constant"] -= fun_point
                    if not np.isclose(2*quadratic_coef*point, 0):
                        constraint["body"]["linear"].append({"var": quadratic_variable, "coef": 2*quadratic_coef*point})
                    constraint_name = quadratic_variable + "_outer_lin_approx_" + str(i)
                    linear_approx_constraints.append(tuple((constraint_name, constraint)))

            else:
                # Secant line between each two points
                points = points_function(lower, upper, eps + 1)
                for i in range(eps):
                    point_1 = points[i]
                    point_2 = points[i+1]
                    lambd = point_2 - point_1

                    fun_point_1 = quadratic_coef * point_1**2
                    fun_point_2 = quadratic_coef * point_2**2

                    constraint = copy.deepcopy(constraint_data)
                    constraint["body"]["quadratic"] = []
                    if remove_division:
                        m = fun_point_2 - fun_point_1
                        constraint["body"]["constant"] += lambd*fun_point_1 - m*point_1
                    else:
                        m = float((fun_point_2 - fun_point_1) / lambd)
                        constraint["body"]["constant"] += fun_point_1 - m*point_1
                    
                    constraint["body"]["linear"].append({"var": quadratic_variable, "coef": m})
                    constraint_name = quadratic_variable + "_inner_lin_approx_" + str(i)
                    linear_approx_constraints.append(tuple((constraint_name, constraint)))

    for constraint_name, constraint in linear_approx_constraints:
        constraints[constraint_name] = constraint

    # Sweep through and remove all quadratic constraints
    for constraint_name in list(constraints.keys()):
        if len(constraints[constraint_name]["body"]["quadratic"]) > 0:
            del constraints[constraint_name]

    with open('linear_approx.json', 'w', encoding='utf-8') as f:
        json.dump(data, f, indent=4)

    if verbose:
        print(f'Made a linear approximation with {len(constraints)} (non-bound) constraints.')

if __name__ == "__main__":
    # The number of linear constraints to use per quadratic constraint
    EPS = 5

    # Whether to do an inner or outer approximation
    OUTER_APPROXIMATION = True

    # File to import the quadratic model from
    F_NAME = "toy.json"

    quadratic_lin_approx_no_surrogate(EPS, OUTER_APPROXIMATION,
                                        f_name=F_NAME, verbose=True)
