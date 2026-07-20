from __future__ import annotations

import json
from typing import Any

import gurobipy as gp
from gurobipy import GRB
import numpy as np

# Take in an LP from a JSON
# Return A, b, G, h, c
# Use Gurobi to make it easy
def problem_to_eq_ineq_matrices(f_name: str = "linear_approx.json",
                                verbose: bool = False) -> tuple[Any, Any, Any, Any, Any]:
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
    cost = gp.LinExpr()
    for term in objective["expr"]["linear"]:
        variable = var_name_to_gurobi_var[term["var"]]
        cost += term["coef"] * variable
    m.setObjective(cost)

    # each constraint in the problem
    for constraint_name, constraint_data in constraints.items():
        assert len(constraint_data["body"]["quadratic"]) == 0
        # Eq or upper-bounded ineq
        assert constraint_data["equality"] or constraint_data["lower"] is None
        a = gp.LinExpr()

        linear_data = constraint_data["body"]["linear"]
        for lin_variable in linear_data:
            x = var_name_to_gurobi_var[lin_variable["var"]]
            a += lin_variable["coef"] * x
        a += constraint_data["body"]["constant"]

        if constraint_data["equality"]:
            m.addConstr(a == constraint_data["lower"], constraint_name)
        else:
            m.addConstr(a <= constraint_data["upper"], constraint_name)

    m.update()

    senses = np.array(m.getAttr('Sense', m.getConstrs()))
    eq_idx = senses == '='
    ineq_idx = senses != '='

    A_full = m.getA()
    A = A_full[eq_idx, :]
    G = A_full[ineq_idx, :]
    b_full = np.array(m.getAttr("RHS", m.getConstrs()))
    b = b_full[eq_idx]
    h = b_full[ineq_idx]
    c = m.getAttr("Obj", m.getVars())

    if verbose:
        print(f"A: \n{A}")
        print(f"b: \n{b}")
        print(f"G: \n{G}")
        print(f"h: \n{h}")
        print(f"c: \n{c}")
    return A.toarray(), b, G.toarray(), h, c


if __name__ == "__main__":
    A, b, G, h, c = problem_to_eq_ineq_matrices(verbose=True)
