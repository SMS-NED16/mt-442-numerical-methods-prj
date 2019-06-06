%%  expFit.m - Saad Siddiqui, EE-16163, Section D, TE-EE Fall '18
%   implements univariate exponential-based regression model for a dataset [x,y]
%   x - independent variable values, y - dependent variable 
%   m, c, and powerModel are values of coefficients and model evaluated
%   at each instance of independent variable. Model is y = (m)e^(nx)

function [m, n, expModel ] = expFit( x, y )
N = length( x );                    % number of data points

% Using linear law to find linear regression equivalent of exp model
% y = me^(nx) => ln(y) = ln(me^(nx)) => ln(y) = ln(e^(nx)) + ln(m)
% y = nx + ln(m) <=> Y = Ax + B
Y = log( y );                       % linearized dependent variable values
sum_x = sum( x );                   % sum of independent values - sigma x
sum_x2 = sum( x.^2 );               % sum of squares of ind values - sigma (x2)
sum_Y = sum( Y );                   % sum of linearized dependent vals - sigma Y  
sum_xY = sum( x .* Y );             % sum of products of x and Y

% Finding slope in linearized model - no reverse transform needed
n = ( N * sum_xY - sum_x * sum_Y ) / ( N * sum_x2 - sum_x^2 );

% Finding Y intercept in linearized model - ln(m) = B => m = exp(B)
B = ( sum_Y - n * sum_x ) / N;
m = exp( B );

% Initializing exponential model m.e^(nx)
expModel = m * exp( n * x );