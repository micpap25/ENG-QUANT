import json
import gurobipy as gp
from gurobipy import GRB

# Take in a QCP from a JSON and solve it
def solve_qcp_return_x(f_name: str,
                        verbose: bool = False) -> tuple[float | None, float | None, float | None]:
    with open(f_name, 'r', encoding='utf-8') as file:
        data = json.load(file)

    variables = data["variables"]
    constraints = data["constraints"]
    objective = data["objectives"]["obj"]

    # Create a new model
    m = gp.Model("qcp_from_json")
    m.Params.OutputFlag = 0
    
    # Assign the variable names to Gurobi variables
    var_name_to_gurobi_var = {}
    for var_name, variable in variables.items():
        if variable["lower"] is not None:
            if variable["upper"] is not None:
                x = m.addVar(lb=variable["lower"], ub=variable["upper"], vtype=GRB.CONTINUOUS, name=var_name)
            else:
                x = m.addVar(lb=variable["lower"], vtype=GRB.CONTINUOUS, name=var_name)
        else:
            if variable["upper"] is not None:
                x = m.addVar(ub=variable["upper"], vtype=GRB.CONTINUOUS, name=var_name)
            else:
                x = m.addVar(vtype=GRB.CONTINUOUS, name=var_name)

        var_name_to_gurobi_var[var_name] = x

    # cost vector
    c = gp.LinExpr()
    for term in objective["expr"]["linear"]:
        variable = var_name_to_gurobi_var[term["var"]]
        c += term["coef"] * variable
    c += objective["expr"]["constant"]
    if objective["sense"] == "minimize":
        m.setObjective(c, sense=GRB.MINIMIZE)
    else:
        m.setObjective(c, sense=GRB.MAXIMIZE)

    # each constraint in the problem
    for constraint_name, constraint_data in constraints.items():
        a = gp.QuadExpr()

        quadratic_data = constraint_data["body"]["quadratic"]
        for quadratic_term in quadratic_data:
            x = var_name_to_gurobi_var[quadratic_term["var1"]]
            y = var_name_to_gurobi_var[quadratic_term["var2"]]
            a += quadratic_term["coef"] * x * y

        linear_data = constraint_data["body"]["linear"]
        for lin_variable in linear_data:
            x = var_name_to_gurobi_var[lin_variable["var"]]
            a += lin_variable["coef"] * x

        a += constraint_data["body"]["constant"]

        # I am assuming here that there won't ever be a "double" constraint
        if constraint_data["equality"]:
            m.addConstr(a == constraint_data["lower"], constraint_name)
        elif constraint_data["lower"] is None:
            m.addConstr(a <= constraint_data["upper"], constraint_name)
        else:
            m.addConstr(a >= constraint_data["lower"], constraint_name)

    # solve the problem
    m.optimize()

    if m.Status == GRB.INFEASIBLE:
        print("Model is not feasible")
        return (None, None, None)
    else:
        if verbose:
            for variable, gurobi_variable in var_name_to_gurobi_var.items():
                print(variable + ": " + str(gurobi_variable.X))

        return m.ObjVal, m.Runtime, m.X

def solve_qcp(f_name: str = "linear_approx.json",
                        verbose: bool = False) -> tuple[float | None, float | None]:
    val, time, _ = solve_qcp_return_x(f_name=f_name, verbose=verbose)
    return val, time


if __name__ == "__main__":
    val, time = solve_qcp(f_name="model11_quad_reform_2.json", verbose=True)
    # val, time = solve_qcp(f_name="linear_approx.json", verbose=True)
    print("Obj val: " + str(val))
    print("Time: " + str(time))