import json
import math

# Produces a convex QCP toy problem for GasNet

N = 1

X_UPPER_BOUNDS = True
F_UPPER_BOUNDS = True

GAMMA = 1.0
LAMBDA = 1.0
EPS = 0.1
DELTA = 0.1
PHI = 5.0

D = LAMBDA**2 + DELTA
SUM_D = N*D

NODES = 5 * N
EDGES = (5 * N) - 1

LX = 0
LP = 0
LF = 0

# Don't choose upper bounds arbitrarily (except for pressure)
UP = 5

if X_UPPER_BOUNDS:
    UX = SUM_D
else:
    UX = None

if F_UPPER_BOUNDS:
    UF = min(SUM_D, math.sqrt((UP - LP)/GAMMA))
else:
    UF = None

def setup_universal_var():
    var = {}
    var["domain"] = "NonNegativeReals"
    var["is_binary"] = False
    var["is_integer"] = False
    var["is_continuous"] = True
    var["fixed"] = False
    var["value"] = None
    return var

def setup_universal_lineq():
    var = {}
    var["lower"] = 0.0
    var["upper"] = 0.0
    var["equality"] = True
    var["body"] = {}
    var["body"]["quadratic"] = []
    var["body"]["nonlinear"] = None
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

def setup_universal_quadeq():
    var = {}
    var["lower"] = 0.0
    var["upper"] = 0.0
    var["equality"] = True
    var["body"] = {}
    var["body"]["constant"] = 0.0
    var["body"]["nonlinear"] = None
    return var

def setup_universal_quadineq():
    var = {}
    var["lower"] = None
    var["upper"] = 0.0
    var["equality"] = False
    var["body"] = {}
    var["body"]["constant"] = 0.0
    var["body"]["nonlinear"] = None
    return var

# Writing the toy problem in the same format as the JSON in the email
# But, formulate the problem as in our Overleaf.
# So in this form it is a QCP. We prescribe the flow directions.

data = {}
data['name'] = "GasNetwork_ToyProblem_N=" + str(N)

variables = {}
for x in range(1, 3 * N + 1):
    # Each copy has 3 production nodes
    var = setup_universal_var()
    var["lower"] = LX
    var["upper"] = UX
    variables["x[production" + str(x) + "]"] = var

for p in range(1, NODES + 1):
    # Each copy has 3 production nodes, 1 transient node, and 1 customer
    var = setup_universal_var()
    var["lower"] = LP
    var["upper"] = UP
    if p <= 3 * N:
        variables["p[production" + str(p) + "]"] = var
    elif p <= 4 * N:
        variables["p[transient" + str(p - (3 * N)) + "]"] = var
    else:
        variables["p[customer" + str(p - (4 * N)) + "]"] = var

# Specifically designing the edges
for f in range(1, N+1):

    edge_1 = setup_universal_var()
    edge_1["lower"] = LF
    edge_1["upper"] = LAMBDA**2
    variables["f[production" + str(3*f - 2) + "_transient" + str(f) + "]"] = edge_1
    
    edge_2 = setup_universal_var()
    edge_2["lower"] = LF
    edge_2["upper"] = UF
    variables["f[production" + str(3*f - 1) + "_transient" + str(f) + "]"] = edge_2
    
    edge_3 = setup_universal_var()
    edge_3["lower"] = LF
    edge_3["upper"] = UF
    variables["f[production" + str(3*f) + "_customer" + str(f) + "]"] = edge_3
    
    edge_4 = setup_universal_var()
    edge_4["lower"] = LF
    edge_4["upper"] = UF
    variables["f[transient" + str(f) + "_customer" + str(f) + "]"] = edge_4

    if f > 1:
        edge_5 = setup_universal_var()
        edge_5["lower"] = LF
        edge_5["upper"] = UF
        variables["f[transient" + str(f-1) + "_transient" + str(f) + "]"] = edge_5

data["variables"] = variables

print("Variables: " + str(len(variables)))

# Constraints
constraints = {}

# Flow production constraints
for fc in range(1, N+1):
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
    
    
    if fc < N:
        transient["body"]["linear"].append({"var": "f[transient" + str(fc) + "_transient" + str(fc+1) + "]", "coef": -1.0})
        
    constraints["fc[transient" + str(fc)+ "]"] = transient

    
    # Customer node
    customer = setup_universal_linineq()
    customer["body"]["constant"] = D
    customer["body"]["linear"] = [{"var": "f[transient" + str(fc) + "_customer" + str(fc) + "]", "coef": -1.0}, \
                                    {"var": "f[production" + str(3*fc) + "_customer" + str(fc) + "]", "coef": -1.0}]
        
    constraints["fc[customer" + str(fc)+ "]"] = customer

# Gas-Pressure Constraints

for gpc in range(1, N+1):
    edge_1 = setup_universal_quadineq()
    edge_1["body"]["linear"] = [{"var": "p[transient" + str(gpc) + "]", "coef": 1.0}, \
                                {"var": "p[production" + str(3*gpc - 2) + "]", "coef": -1.0}]
    edge_1["body"]["quadratic"] = [{"var1": "f[production" + str(3*gpc - 2) + "_transient" + str(gpc) + "]", \
                                    "var2": "f[production" + str(3*gpc - 2) + "_transient" + str(gpc) + "]", \
                                    "coef": GAMMA}]
    constraints["gpc[production" + str(3*gpc - 2) + "_transient" + str(gpc) + "]"] = edge_1
    
    edge_2 = setup_universal_quadineq()
    edge_2["body"]["linear"] = [{"var": "p[transient" + str(gpc) + "]", "coef": 1.0}, \
                                {"var": "p[production" + str(3*gpc - 1) + "]", "coef": -1.0}]
    edge_2["body"]["quadratic"] = [{"var1": "f[production" + str(3*gpc - 1) + "_transient" + str(gpc) + "]", \
                                    "var2": "f[production" + str(3*gpc - 1) + "_transient" + str(gpc) + "]", \
                                    "coef": GAMMA}]
    constraints["gpc[production" + str(3*gpc - 1) + "_transient" + str(gpc) + "]"] = edge_2
    
    edge_3 = setup_universal_quadineq()
    edge_3["body"]["linear"] = [{"var": "p[customer" + str(gpc) + "]", "coef": 1.0}, \
                                {"var": "p[production" + str(3*gpc) + "]", "coef": -1.0}]
    edge_3["body"]["quadratic"] = [{"var1": "f[production" + str(3*gpc) + "_customer" + str(gpc) + "]", \
                                    "var2": "f[production" + str(3*gpc) + "_customer" + str(gpc) + "]", \
                                    "coef": GAMMA}]
    constraints["gpc[production" + str(3*gpc) + "_customer" + str(gpc) + "]"] = edge_3
    
    edge_4 = setup_universal_quadineq()
    edge_4["body"]["linear"] = [{"var": "p[customer" + str(gpc) + "]", "coef": 1.0}, \
                                {"var": "p[transient" + str(gpc) + "]", "coef": -1.0}]
    edge_4["body"]["quadratic"] = [{"var1": "f[transient" + str(gpc) + "_customer" + str(gpc) + "]", \
                                    "var2": "f[transient" + str(gpc) + "_customer" + str(gpc) + "]", \
                                    "coef": GAMMA}]
    constraints["gpc[transient" + str(gpc) + "_customer" + str(fc) + "]"] = edge_4

    if gpc > 1:
        edge_5 = setup_universal_quadineq()
        edge_5["body"]["linear"] = [{"var": "p[transient" + str(gpc) + "]", "coef": 1.0}, \
                                    {"var": "p[transient" + str(gpc - 1) + "]", "coef": -1.0}]
        edge_5["body"]["quadratic"] = [{"var1": "f[transient" + str(gpc-1) + "_transient" + str(gpc) + "]", \
                                        "var2": "f[transient" + str(gpc-1) + "_transient" + str(gpc) + "]", \
                                        "coef": GAMMA}]
        constraints["gpc[transient" + str(gpc-1) + "_transient" + str(gpc) + "]"] = edge_5


data["constraints"] = constraints

print("Constraints: " + str(len(constraints) + 2*len(variables)))

# Objective

objectives = {}
objectives["sense"] = "minimize"
expr = {}
expr["constant"] = 0.0
expr["quadratic"] = []
expr["nonlinear"] = None
linear = []
for c in range(1, N+1):
    # Cost of each production node
    linear.append({"var": "x[production" + str(3*c - 2) + "]", "coef": LAMBDA - EPS})
    linear.append({"var": "x[production" + str(3*c - 1) + "]", "coef": LAMBDA})
    linear.append({"var": "x[production" + str(3*c) + "]", "coef": LAMBDA + EPS})

expr["linear"] = linear
objectives["expr"] = expr
data["objectives"] = {}
data["objectives"]["obj"] = objectives

with open('toy.json', 'w', encoding='utf-8') as f:
    json.dump(data, f, indent=4)