# Dictionary setup functions used throughout the code

def setup_universal_var() -> dict:
    var = {}
    var["domain"] = "NonNegativeReals"
    var["is_binary"] = False
    var["is_integer"] = False
    var["is_continuous"] = True
    var["fixed"] = False
    var["value"] = None
    return var

def setup_universal_lineq() -> dict:
    var = {}
    var["lower"] = 0.0
    var["upper"] = 0.0
    var["equality"] = True
    var["body"] = {}
    var["body"]["quadratic"] = []
    var["body"]["nonlinear"] = None
    return var

def setup_universal_linineq() -> dict:
    var = {}
    var["lower"] = None
    var["upper"] = 0.0
    var["equality"] = False
    var["body"] = {}
    var["body"]["quadratic"] = []
    var["body"]["nonlinear"] = None
    return var

def setup_universal_quadeq() -> dict:
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