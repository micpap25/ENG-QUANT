import json

# Turn all the linear inequalities of a program into equalities.
# This may make it infeasible.
# This isn't putting the problem in standard form, this is altering the problem.
def ineq_to_eq(f_name: str = "toy.json", verbose: bool = False) -> None:

    with open(f_name, 'r', encoding='utf-8') as file:
        data = json.load(file)

    # For each constraint, if it has no quadratic terms, make it an equality.

    inequalities = 0
    constraints = data["constraints"]

    # Sweep through and remove all quadratic constraints
    for _, constraint_data in constraints.items():
        if len(constraint_data["body"]["quadratic"]) == 0:
            if not constraint_data["equality"]:
                inequalities += 1
                constraint_data["equality"] = True
                if constraint_data["lower"] is None:
                    constraint_data["lower"] = constraint_data["upper"]
                else:
                    constraint_data["upper"] = constraint_data["lower"]

    with open('ineq_to_eq.json', 'w', encoding='utf-8') as f:
        json.dump(data, f, indent=4)

    if verbose:
        print(f'Turned {inequalities} linear inequalities into equalities')

if __name__ == "__main__":
    # File to import the model from
    F_NAME = "linear_approx.json"

    ineq_to_eq(f_name=F_NAME, verbose=True)
