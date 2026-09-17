from __future__ import annotations

import json
from typing import Any

import gurobipy as gp
from gurobipy import GRB
import numpy as np

# Take in an LP from a JSON, return A, b, G, h, u, c
# All variables should have a lower bound of exactly 0 (use remap_lower_bounds.py)
# Use Gurobi to make it easy
def problem_to_eq_ineq_matrices(f_name: str = "linear_approx.json", sparse: bool = True,
                                verbose: bool = False) -> tuple[Any, Any, Any, Any, Any, Any]:
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
        if variable["lower"] is not None and variable["lower"] != 0.0:
            print(f"Error, the lower bound for {var_name} should be 0")
            return None, None, None, None, None, None
        if variable["upper"] is not None:
            if variable["upper"] <= 0.0:
                print(f"Error, the upper bound for {var_name} should be more than 0")
                return None, None, None, None, None, None
            x = m.addVar(vtype=GRB.CONTINUOUS, name=var_name, ub = variable["upper"])
        else:
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

        a = gp.LinExpr()

        linear_data = constraint_data["body"]["linear"]
        for lin_variable in linear_data:
            x = var_name_to_gurobi_var[lin_variable["var"]]
            a += lin_variable["coef"] * x
        a += constraint_data["body"]["constant"]

        # Equality constraint
        if constraint_data["equality"]:
            m.addConstr(a == constraint_data["lower"], constraint_name)
        # Upper-bounded constraint
        elif constraint_data["lower"] is None:
            m.addConstr(a <= constraint_data["upper"], constraint_name)
        # Lower-bounded constraint (reformulate as upper-bounded constraint)
        else:
            m.addConstr(-a <= -constraint_data["lower"], constraint_name)

    m.update()

    senses = np.array(m.getAttr('Sense', m.getConstrs()))
    ineq_idx = senses != '='
    eq_idx = senses == '='

    A_full = m.getA()
    A = A_full[ineq_idx, :]
    G = A_full[eq_idx, :]
    b_full = np.array(m.getAttr("RHS", m.getConstrs()))
    b = b_full[ineq_idx]
    h = b_full[eq_idx]
    u = np.array(m.getAttr("UB", m.getVars()))
    c = np.array(m.getAttr("Obj", m.getVars()))

    if verbose:
        print(f"A: \n{A.toarray()}")
        print(f"b: \n{b}")
        print(f"G: \n{G.toarray()}")
        print(f"h: \n{h}")
        print(f"u: \n{u}")
        print(f"c: \n{c}")

    if sparse:
        return A, b, G, h, u, c
    else:
        return A.toarray(), b, G.toarray(), h, u, c


if __name__ == "__main__":
    A, b, G, h, u, c = problem_to_eq_ineq_matrices(verbose=True)
