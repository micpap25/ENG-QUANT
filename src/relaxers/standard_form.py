import json

from variable_definitions import (
    setup_universal_var
)

# Change a program to standard form by introducing positive slack variables.
def standard_form(slack_ub: float | None = None,
                    f_name: str = "linear_approx.json", verbose: bool = False) -> None:

    with open(f_name, 'r', encoding='utf-8') as file:
        data = json.load(file)

    # For each constraint, if it is an inequality, create a new variable.
    # Lower-bound the variable to 0.0 and upper bound it by slack_ub

    inequalities = 0
    variables = data["variables"]
    constraints = data["constraints"]

    for constraint_name, constraint_data in constraints.items():
        if not constraint_data["equality"]:
            inequalities += 1
            slack_var = setup_universal_var()
            slack_var["lower"] = 0.0
            slack_var["upper"] = slack_ub
            slack_var_name = constraint_name + "_slack"
            variables[slack_var_name] = slack_var
            if constraint_data["lower"] is None:
                # Less-than-or-equal constraint
                constraint_data["lower"] = constraint_data["upper"]
                constraint_data["body"]["linear"].append({"var": slack_var_name, "coef": 1.0})
            else:
                # Greater-than-or-equal constraint
                constraint_data["upper"] = constraint_data["lower"]
                constraint_data["body"]["linear"].append({"var": slack_var_name, "coef": -1.0})
            constraint_data["equality"] = True

    with open('linear_approx.json', 'w', encoding='utf-8') as f:
        json.dump(data, f, indent=4)

    if verbose:
        print(f'Turned {inequalities} inequalities to standard form equalities, creating {inequalities} variables.')

if __name__ == "__main__":
    # The upper bound on the slack variables, if any.
    # If this is too small, the model will be infeasible!
    SLACK_UB = None

    # File to import the quadratic model from
    F_NAME = "linear_approx.json"

    standard_form(SLACK_UB, F_NAME, True)
