import json
import math

from variable_definitions import (
    setup_universal_var,
    setup_universal_lineq,
    setup_universal_linineq,
    setup_universal_quadineq,
    setup_universal_quadeq
)

# Produces a QCP toy problem for GasNet
def toy_problem_to_json(n: int, x_upper_bounds: bool, f_upper_bounds: bool, demand_inequality: bool,
                        gamma: float, lambd: float, eps: float, delta: float,
                        lx: float, lp: float, lf: float, up: float, convex_relax: bool = True,
                        f_out: str = "toy.json", verbose: bool = False) -> None:

    d = lambd**2 + delta
    sum_d = n*d

    nodes = 5 * n
    edges = (5 * n) - 1


    # Don't choose upper bounds arbitrarily (except for pressure)
    if x_upper_bounds:
        ux = sum_d
    else:
        ux = None

    if f_upper_bounds:
        uf = min(sum_d, math.sqrt((up - lp)/gamma))
    else:
        uf = None

    # Write the toy problem in the repository's JSON schema.
    # The formulation is a QCP with prescribed flow directions.

    data = {}
    data['name'] = "GasNetwork_ToyProblem_N=" + str(n)

    variables = {}
    for x in range(1, 3 * n + 1):
        # Each copy has 3 production nodes
        var = setup_universal_var()
        var["lower"] = lx
        var["upper"] = ux
        variables["x[production" + str(x) + "]"] = var

    for p in range(1, nodes + 1):
        # Each copy has 3 production nodes, 1 transient node, and 1 customer
        var = setup_universal_var()
        var["lower"] = lp
        var["upper"] = up
        if p <= 3 * n:
            variables["p[production" + str(p) + "]"] = var
        elif p <= 4 * n:
            variables["p[transient" + str(p - (3 * n)) + "]"] = var
        else:
            variables["p[customer" + str(p - (4 * n)) + "]"] = var

    # Specifically designing the edges
    for f in range(1, n+1):

        edge_1 = setup_universal_var()
        edge_1["lower"] = lf
        edge_1["upper"] = lambd**2
        variables["f[production" + str(3*f - 2) + "_transient" + str(f) + "]"] = edge_1

        edge_2 = setup_universal_var()
        edge_2["lower"] = lf
        edge_2["upper"] = uf
        variables["f[production" + str(3*f - 1) + "_transient" + str(f) + "]"] = edge_2

        edge_3 = setup_universal_var()
        edge_3["lower"] = lf
        edge_3["upper"] = uf
        variables["f[production" + str(3*f) + "_customer" + str(f) + "]"] = edge_3

        edge_4 = setup_universal_var()
        edge_4["lower"] = lf
        edge_4["upper"] = uf
        variables["f[transient" + str(f) + "_customer" + str(f) + "]"] = edge_4

        if f > 1:
            edge_5 = setup_universal_var()
            edge_5["lower"] = lf
            edge_5["upper"] = uf
            variables["f[transient" + str(f-1) + "_transient" + str(f) + "]"] = edge_5

    data["variables"] = variables

    if verbose:
        print("Variables: " + str(len(variables)))

    # Constraints
    constraints = {}

    # Flow production constraints
    for fc in range(1, n+1):
        # Production nodes
        production_1 = setup_universal_lineq()
        production_1["body"]["constant"] = 0.0
        production_1["body"]["linear"] = [{"var": "x[production" + str(3*fc - 2) + "]", "coef": 1.0}, \
                                        {"var": "f[production" + str(3*fc - 2) + "_transient" + str(fc) + "]", "coef": -1.0}]
        constraints["fc[production" + str(3*fc - 2)+ "]"] = production_1

        production_2 = setup_universal_lineq()
        production_2["body"]["constant"] = 0.0
        production_2["body"]["linear"] = [{"var": "x[production" + str(3*fc - 1) + "]", "coef": 1.0}, \
                                        {"var": "f[production" + str(3*fc - 1) + "_transient" + str(fc) + "]", "coef": -1.0}]
        constraints["fc[production" + str(3*fc - 1)+ "]"] = production_2

        production_3 = setup_universal_lineq()
        production_3["body"]["constant"] = 0.0
        production_3["body"]["linear"] = [{"var": "x[production" + str(3*fc) + "]", "coef": 1.0}, \
                                        {"var": "f[production" + str(3*fc) + "_customer" + str(fc) + "]", "coef": -1.0}]
        constraints["fc[production" + str(3*fc)+ "]"] = production_3

        # Transient node
        transient = setup_universal_lineq()
        transient["body"]["constant"] = 0.0

        transient["body"]["linear"] = [{"var": "f[production" + str(3*fc - 2) + "_transient" + str(fc) + "]", "coef": 1.0}, \
                                        {"var": "f[production" + str(3*fc - 1) + "_transient" + str(fc) + "]", "coef": 1.0}, \
                                        {"var": "f[transient" + str(fc) + "_customer" + str(fc) + "]", "coef": -1.0}]
        if fc > 1:
            transient["body"]["linear"].append({"var": "f[transient" + str(fc-1) + "_transient" + str(fc) + "]", "coef": 1.0})

        if fc < n:
            transient["body"]["linear"].append({"var": "f[transient" + str(fc) + "_transient" + str(fc+1) + "]", "coef": -1.0})
            
        constraints["fc[transient" + str(fc)+ "]"] = transient


        # Customer node
        if demand_inequality:
            customer = setup_universal_linineq()
        else:
            customer = setup_universal_lineq()

        customer["body"]["constant"] = d
        customer["body"]["linear"] = [{"var": "f[transient" + str(fc) + "_customer" + str(fc) + "]", "coef": -1.0}, \
                                        {"var": "f[production" + str(3*fc) + "_customer" + str(fc) + "]", "coef": -1.0}]

        constraints["fc[customer" + str(fc)+ "]"] = customer

    # Gas-Pressure Constraints
    if convex_relax:
        quad_setup_fun = setup_universal_quadineq
    else:
        quad_setup_fun = setup_universal_quadeq

    for gpc in range(1, n+1):
        edge_1 = quad_setup_fun()
        edge_1["body"]["linear"] = [{"var": "p[transient" + str(gpc) + "]", "coef": 1.0}, \
                                    {"var": "p[production" + str(3*gpc - 2) + "]", "coef": -1.0}]
        edge_1["body"]["quadratic"] = [{"var1": "f[production" + str(3*gpc - 2) + "_transient" + str(gpc) + "]", \
                                        "var2": "f[production" + str(3*gpc - 2) + "_transient" + str(gpc) + "]", \
                                        "coef": gamma}]
        constraints["gpc[production" + str(3*gpc - 2) + "_transient" + str(gpc) + "]"] = edge_1
        
        edge_2 = quad_setup_fun()
        edge_2["body"]["linear"] = [{"var": "p[transient" + str(gpc) + "]", "coef": 1.0}, \
                                    {"var": "p[production" + str(3*gpc - 1) + "]", "coef": -1.0}]
        edge_2["body"]["quadratic"] = [{"var1": "f[production" + str(3*gpc - 1) + "_transient" + str(gpc) + "]", \
                                        "var2": "f[production" + str(3*gpc - 1) + "_transient" + str(gpc) + "]", \
                                        "coef": gamma}]
        constraints["gpc[production" + str(3*gpc - 1) + "_transient" + str(gpc) + "]"] = edge_2

        edge_3 = quad_setup_fun()
        edge_3["body"]["linear"] = [{"var": "p[customer" + str(gpc) + "]", "coef": 1.0}, \
                                    {"var": "p[production" + str(3*gpc) + "]", "coef": -1.0}]
        edge_3["body"]["quadratic"] = [{"var1": "f[production" + str(3*gpc) + "_customer" + str(gpc) + "]", \
                                        "var2": "f[production" + str(3*gpc) + "_customer" + str(gpc) + "]", \
                                        "coef": gamma}]
        constraints["gpc[production" + str(3*gpc) + "_customer" + str(gpc) + "]"] = edge_3

        edge_4 = quad_setup_fun()
        edge_4["body"]["linear"] = [{"var": "p[customer" + str(gpc) + "]", "coef": 1.0}, \
                                    {"var": "p[transient" + str(gpc) + "]", "coef": -1.0}]
        edge_4["body"]["quadratic"] = [{"var1": "f[transient" + str(gpc) + "_customer" + str(gpc) + "]", \
                                        "var2": "f[transient" + str(gpc) + "_customer" + str(gpc) + "]", \
                                        "coef": gamma}]
        constraints["gpc[transient" + str(gpc) + "_customer" + str(fc) + "]"] = edge_4

        if gpc > 1:
            edge_5 = quad_setup_fun()
            edge_5["body"]["linear"] = [{"var": "p[transient" + str(gpc) + "]", "coef": 1.0}, \
                                        {"var": "p[transient" + str(gpc - 1) + "]", "coef": -1.0}]
            edge_5["body"]["quadratic"] = [{"var1": "f[transient" + str(gpc-1) + "_transient" + str(gpc) + "]", \
                                            "var2": "f[transient" + str(gpc-1) + "_transient" + str(gpc) + "]", \
                                            "coef": gamma}]
            constraints["gpc[transient" + str(gpc-1) + "_transient" + str(gpc) + "]"] = edge_5


    data["constraints"] = constraints

    if verbose:
        print("Non-bound constraints: " + str(len(constraints)))

    # Objective

    objectives = {}
    objectives["sense"] = "minimize"
    expr = {}
    expr["constant"] = 0.0
    expr["quadratic"] = []
    expr["nonlinear"] = None
    linear = []
    for c in range(1, n+1):
        # Cost of each production node
        linear.append({"var": "x[production" + str(3*c - 2) + "]", "coef": lambd - eps})
        linear.append({"var": "x[production" + str(3*c - 1) + "]", "coef": lambd})
        linear.append({"var": "x[production" + str(3*c) + "]", "coef": lambd + eps})

    expr["linear"] = linear
    objectives["expr"] = expr
    data["objectives"] = {}
    data["objectives"]["obj"] = objectives

    with open(f_out, 'w', encoding='utf-8') as f:
        json.dump(data, f, indent=4)

if __name__ == "__main__":
    # Number of copies of the network in the system
    N=1

    # Whether the production and flow variables have upper bounds
    X_UPPER_BOUNDS=True
    F_UPPER_BOUNDS=True

    # Whether the demand constraint is an equality or inequality
    DEMAND_INEQUALITY=False

    # Capacity / demand parameters
    GAMMA=1.0
    LAMBD=1.0
    EPS=0.1
    DELTA=0.1

    # Lower bounds and upper bound on pressure
    LX=LP=LF=0.0
    UP=5.0

    toy_problem_to_json(N, X_UPPER_BOUNDS, F_UPPER_BOUNDS, DEMAND_INEQUALITY,
                        GAMMA, LAMBD, EPS, DELTA,
                        LX, LP, LF, UP,
                        verbose=True)
