import json
import numpy as np

from collections.abc import Sequence
from numpy.typing import NDArray
type FloatArray = Sequence[float] | NDArray[np.float64]

# Linear relaxation of a convex QCP
# Removes all the quadratic terms to just leave an LP.
def quadratic_model_remove_quad(f_name: str = "toy.json", verbose: bool = False) -> None:

    with open(f_name, 'r', encoding='utf-8') as file:
        data = json.load(file)

    # For each constraint, if it has a quadratic constraint, remove it

    num_quadratic_constraints = 0
    constraints = data["constraints"]
    initial_len = len(constraints)

    # Sweep through and remove all quadratic constraints
    for constraint_name in list(constraints.keys()):
        if len(constraints[constraint_name]["body"]["quadratic"]) > 0:
            num_quadratic_constraints += 1
            del constraints[constraint_name]

    with open('linear_approx.json', 'w', encoding='utf-8') as f:
        json.dump(data, f, indent=4)

    if verbose:
        print(f'Of the {initial_len} (non-bound) constraints, {num_quadratic_constraints} are quadratic')
        print(f'Made a linear approximation with {len(constraints)} (non-bound) constraints.')

if __name__ == "__main__":
    # File to import the quadratic model from
    F_NAME = "toy.json"

    quadratic_model_remove_quad(f_name=F_NAME, verbose=True)
