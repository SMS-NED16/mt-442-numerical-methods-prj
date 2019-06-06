%%  question1Test.m - Saad Siddiqui, EE-16163, Section D, TE-EE Fall '18
%   Finds roots of an equation using different numerical methods and 
%   for levels of accuracy, and compares errors for each case.

%% Defining Equation to be used in Question 1
f_x = @(x) exp( x )- x^3 + 10;
error = 1e-1;                

%% Testing Bisection Method
[x_approx_bisection, iters_bisection ] = bisectionSearch( f_x, 3.8, 3.9, error );

%% Testing Newton-Raphson Method
[x_approx_nr, iters_nr ] = newtonRaphson( f_x, error, 3.8 );

%% Testing Regula-Falsi Method
[x_approx_rf, iters_rf ] = regulaFalsi( f_x, 3.8, 3.9, error );

%% Testing Secant Method
[x_approx_sec, iters_sec ] = secantMethod( f_x, 3.8, 3.9, 1000, error );
