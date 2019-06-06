# MT-442 Project: Numerical Methods in MATLAB
### An end-of-semester project for the MT-442 Numerical Methods course as part of the BE-Electrical Engineering program at NEDUET.

### Part 1 - Root Approximation
- Implemented a suite of root approximation methods in MATLAB, including
  - Bisection Method
  - Regula-Falsi Method
  - Secant Method
  - Newton-Raphson Method
- Tested each method's time complexity by recording, comparing, and contrasting number of iterations taken for convergence on the same stopping criteria. 
- Modularized program to allow for addition of new methods.

### Part 2 - Regression
- Implemented linear, polynomial, and exponential regression models for a $f(t) = t^2 - 2t + exp(t)$
- Automated calculation of coefficients for each model.
- Plotted predicted regression model against actual data.
- Compared and contrasted all regression models based on RMS errors.

### Part 3 - Gauss-Seidel Method for Solving Systems of Linear Equations
- Implemented Gauss-Seidel Method for solving an arbitrary set of `n` linear equations in `n` unknowns.
- Helper functions check if a given system of equations forms a **diagonally dominant** system before attempting Gauss-Seidel solution.
- Compared accuracy of the numerical solution with that derived from `MATLAB`'s built-in linear algebra functionality.
- Explored and visualized effect of tolerance on number of iterations taken for convergence.
