# Introduction

This folder contains IPM implementations and testing designed to solve convex relaxations of the Gas Network Flow problem.

The code is not currently complete. JSON files for toy problems can be generated with this code.
Alternatively, simple problems can be constructed in the same way as `src/ipm_toy`.

# Workflow

A standard workflow might first involve creating a problem:

```
cd src
python -m generators.toy_problem_to_json
```

Then relaxing the problem with a certain number of linear approximators:

```
python -m relaxers.quadratic_lin_approx_no_surrogate
```

Then finally solving the problem with the IPM:

```
python -m ipm_new.ipm_solve
```

You can adjust the parameters in any of these files to change the size of the problem, the methods of relaxation, or the approach the IPM uses.
