import json
import numpy as np
import copy

from typing import Callable
from collections.abc import Sequence
from numpy.typing import NDArray
type FloatArray = Sequence[float] | NDArray[np.float64]

# Linear approximation of a convex QCP, but with no surrogate variable
# Number of quadratic variables and a points distribution function for each are passed in.
def quadratic_lin_approx_no_surrogate_refine(eps: int, outer_approximation: bool,
                                                points_function: list[Callable[[float, float, int], FloatArray]],
                                                remove_division: bool = False,
                                                endpoints: bool = True,
                                                f_name: str = "toy.json",
                                                verbose: bool = False) -> None:

    if not outer_approximation and remove_division:
        print("You are setting remove_division to True for a no-surrogate approximation.\n" \
        "This tends to cause infeasibility or worsen results.")

    with open(f_name, 'r', encoding='utf-8') as file:
        data = json.load(file)

    # For each constraint, if it has a quadratic constraint, find the corresponding variable
    # Remove the quadratic constraint and add appropriate linear inequalties

    variables = data["variables"]
    constraints = data["constraints"]

    quad_var_count = 0

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
                if endpoints:
                    points = points_function[quad_var_count](lower, upper, eps)
                else:
                    points = points_function[quad_var_count](lower, upper, eps + 2)[1:-1]
                if verbose:
                    print(points)
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
                if endpoints:
                    points = points_function[quad_var_count](lower, upper, eps + 1)
                else:
                    points = points_function[quad_var_count](lower, upper, eps + 3)[1:-1]
                if verbose:
                    print(points)
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
                        constraint["body"]["constant"] *= lambd
                        constraint["body"]["constant"] += lambd*fun_point_1 - m*point_1
                    else:
                        m = float((fun_point_2 - fun_point_1) / lambd)
                        constraint["body"]["constant"] += fun_point_1 - m*point_1
                    
                    constraint["body"]["linear"].append({"var": quadratic_variable, "coef": m})
                    constraint_name = quadratic_variable + "_inner_lin_approx_" + str(i)
                    linear_approx_constraints.append(tuple((constraint_name, constraint)))

            quad_var_count += 1

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