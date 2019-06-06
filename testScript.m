%%  testScript.m - Saad Siddiqui, EE-16163, Section D, TE-EE Fall '18
%   


%% Defining Equation to be used in Question 1
equation = @(x) exp( x )- x^3 + 10;

%% Testing Bisection Method
[x_approx_bisection, iters_bisection ] = ...
    bisectionSearch( 3.8, 3.9, equation , 0.01 );


%% Testing Newton-Raphson Method