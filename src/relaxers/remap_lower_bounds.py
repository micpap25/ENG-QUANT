import json
import math

# Transform the problem to remap the lower bounds, introducing constants instead
# If any variable with a lower bound is used in quadratics, throw an error
def remap_lower_bounds(f_name: str = "toy.json", verbose: bool = False,
                        quadratic_check: bool = True, lb: float = 0) -> None:

    with open(f_name, 'r', encoding='utf-8') as file:
        data = json.load(file)

    # For each variable, if it has a lower bound, adjust the bounds.
    # Iterate through the constraints. Confirm it is never used as a quadratic variable.
    # Each time it is used as a linear variable, add a constant.

    lower_bound_vars = 0
    variables = data["variables"]
    constraints = data["constraints"]
    objective = data["objectives"]["obj"]

    # Sweep through each varaible
    for variable_name, variable in variables.items():
        if variable["lower"] is not None and not math.isclose(variable["lower"], lb):
            # Remap
            lower_bound_vars += 1
            difference = variable["lower"] - lb
            variable["lower"] = lb
            if variable["upper"] is not None:
                variable["upper"] -= difference

            # Constraints
            for _, constraint in constraints.items():
                if quadratic_check:
                    # Check to make sure the variable isn't used quadratically
                    for quadratic_term in constraint["body"]["quadratic"]:
                        if quadratic_term["var1"] == variable_name or quadratic_term["var2"] == variable_name:
                            print("ERROR: A variable with a lower bound is used in a quadratic term")
                            return
                for linear_term in constraint["body"]["linear"]:
                    if linear_term["var"] == variable_name:
                        constraint["body"]["constant"] += difference * linear_term["coef"]
                        break

            # Objective
            if quadratic_check:
                for quadratic_term in objective["expr"]["quadratic"]:
                    if quadratic_term["var1"] == variable_name or quadratic_term["var2"] == variable_name:
                        print("ERROR: A variable with a lower bound is used in a quadratic term")
                        return
            for linear_term in objective["expr"]["linear"]:
                if linear_term["var"] == variable_name:
                    objective["expr"]["constant"] += difference * linear_term["coef"]
                    break

    with open('remap_lower.json', 'w', encoding='utf-8') as f:
        json.dump(data, f, indent=4)

    if verbose:
        print(f'Remapped lower bounds for {lower_bound_vars} variables')

if __name__ == "__main__":
    # File to import the model from
    F_NAME = "linear_approx.json"

    remap_lower_bounds(f_name=F_NAME, verbose=True,
                        quadratic_check = True, lb = 0)
