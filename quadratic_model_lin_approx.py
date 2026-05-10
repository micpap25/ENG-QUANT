import json
import numpy as np

# Linear approximation of a convex QCP
# The quadratic term for each inequality is a single variable squared (plus linear terms and constants)
# Can use either tangent lines (outer approx) or secant lines (inner approx)
# The number of linear constraints to use per quadratic constraint
EPS = 5

# Whether to do an inner or outer approximation
OUTER_APPROXIMATION = False

# Whether the coefficient is part of the surrogate
COEFFICIENT_SURROGATE = True

# Whether to bound the surrogates with bound constraints.
SURROGATE_BOUND_BELOW = True
SURROGATE_BOUND_ABOVE = True

F_NAME = "toy.json"
with open(F_NAME, 'r', encoding='utf-8') as file:
    data = json.load(file)

def setup_universal_var():
    var = {}
    var["domain"] = "NonNegativeReals"
    var["is_binary"] = False
    var["is_integer"] = False
    var["is_continuous"] = True
    var["fixed"] = False
    var["value"] = None
    return var

def setup_universal_linineq():
    var = {}
    var["lower"] = None
    var["upper"] = 0.0
    var["equality"] = False
    var["body"] = {}
    var["body"]["quadratic"] = []
    var["body"]["nonlinear"] = None
    return var

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
        if SURROGATE_BOUND_BELOW:
            surrogate_var["lower"] = lower
        else:
            surrogate_var["lower"] = None

        if SURROGATE_BOUND_ABOVE:
            surrogate_var["upper"] = upper**2
            if COEFFICIENT_SURROGATE:
                surrogate_var["upper"] *= quadratic_coef
        else:
            surrogate_var["upper"] = None

        surrogate_var_name = "z_" + quadratic_variable
        variables[surrogate_var_name] = surrogate_var

        # Turn the quadratic constraint into a linear constraint
        constraint_data["body"]["quadratic"] = []
        if COEFFICIENT_SURROGATE:
            constraint_data["body"]["linear"].append({"var": surrogate_var_name, "coef": 1.0})
        else:
            constraint_data["body"]["linear"].append({"var": surrogate_var_name, "coef": quadratic_coef})

        # Add linear approximation constraints
        if OUTER_APPROXIMATION:
            # Tangent line at each point
            points = np.linspace(lower, upper, EPS)
            for i in range(EPS):
                point = points[i]
                fun_point = point**2
                if COEFFICIENT_SURROGATE:
                    fun_point *= quadratic_coef

                constraint = setup_universal_linineq()
                constraint["body"]["constant"] = -fun_point
                if COEFFICIENT_SURROGATE:
                    constraint["body"]["linear"] = [{"var": quadratic_variable, "coef": 2*quadratic_coef*point}, \
                                                    {"var": surrogate_var_name, "coef": -1.0}]
                else:
                    constraint["body"]["linear"] = [{"var": quadratic_variable, "coef": 2*point}, \
                                                    {"var": surrogate_var_name, "coef": -1.0}]
                constraint_name = surrogate_var_name + "_outer_lin_approx_" + str(i)
                linear_approx_constraints.append(tuple((constraint_name, constraint)))

        else:
            # Secant line between each two points
            points = np.linspace(lower, upper, EPS + 1)
            lambd = points[1] - points[0]
            for i in range(EPS):
                point_1 = points[i]
                point_2 = points[i+1]
                fun_point_1 = point_1**2
                fun_point_2 = point_2**2
                if COEFFICIENT_SURROGATE:
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

print(f'Of the {initial_len} (non-bound) constraints, {num_quadratic_constraints} are quadratic')
print(f'Made a linear approximation with {len(constraints)} (non-bound) constraints.')
