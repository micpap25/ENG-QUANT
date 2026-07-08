from __future__ import annotations

import json
from typing import Any

import gurobipy as gp
from gurobipy import GRB

# Take in a standard form LP from a JSON
# Return A, b, c
# Use Gurobi to make it easy
def problem_to_matrices(f_name: str = "linear_approx.json",
                        verbose: bool = False) -> tuple[Any, Any, Any]:
    with open(f_name, 'r', encoding='utf-8') as file:
        data = json.load(file)

    variables = data["variables"]
    constraints = data["constraints"]
    objective = data["objectives"]["obj"]

    # Create a new model
    m = gp.Model("lp_from_json")
    m.Params.OutputFlag = 0
    
    # Assign the variable names to Gurobi variables
    var_name_to_gurobi_var = {}
    for var_name, variable in variables.items():
        x = m.addVar(vtype=GRB.CONTINUOUS, name=var_name)
        var_name_to_gurobi_var[var_name] = x

    # cost vector
    c = gp.LinExpr()
    for term in objective["expr"]["linear"]:
        variable = var_name_to_gurobi_var[term["var"]]
        c += term["coef"] * variable
    m.setObjective(c)

    # each constraint in the problem
    for constraint_name, constraint_data in constraints.items():
        assert len(constraint_data["body"]["quadratic"]) == 0
        assert constraint_data["equality"]
        a = gp.LinExpr()

        linear_data = constraint_data["body"]["linear"]
        for lin_variable in linear_data:
            x = var_name_to_gurobi_var[lin_variable["var"]]
            a += lin_variable["coef"] * x
        a += constraint_data["body"]["constant"]

        m.addConstr(a == constraint_data["lower"], constraint_name)

    A = m.getA()
    b = m.getAttr("RHS", m.getConstrs())
    c = m.getAttr("Obj", m.getVars())

    if verbose:
        print(f"A: \n{A}")
        print(f"b: \n{b}")
        print(f"c: \n{c}")
    return A.toarray(), b, c


if __name__ == "__main__":
    A, b, c = problem_to_matrices(verbose=True)
