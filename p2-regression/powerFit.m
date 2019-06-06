%%  powerFit.m - Saad Siddiqui, EE-16163, Section D, TE-EE Fall '18
%   implements univariate exponential-based regression model for a dataset [x,y]
%   x - independent variable values, y - dependent variable 
%   m, c are constants in power model y = m.c^(x) and powerModel is the 
%   value of the regression model evaluated at each indpendent variable

function [ m, c, powerModel ]= powerFit( x, y )
N = length( x );                % number of data points

% Using linear law to find linear regression equivalent of exp model
% y = m.c^(x) => ln(y) = ln(m.c^(x)) => ln(y) = ln(c^(x)) + ln(m)
% => ln(y) = ln(c)(x) + ln(m) <=> Y = Ax + B
Y = log( y );                   % linearized dependent variable values
sum_x = sum( x );               % sum of independent values - sigma x
sum_Y = sum( Y );               % sum of linearized dependent vals - sigma Y
sum_x2 = sum( x.^2 );           % sum of squares of ind values - sigma (x2)
sum_xY = sum( x .* Y );         % sum of products of x and Y

% Finding slope in linearized model - since A = ln(c), c = exp( A );
A = ( N * sum_xY - sum_x * sum_Y ) / ( N * sum_x2 - sum_x ^ 2 );
c = exp( A );                   % n = 

% Finding y interept in linearized model - since B = ln(m), m = exp( B );
B = ( sum_Y - A * sum_x ) / N;
m = exp( B );

% Power model is implemented as 
powerModel = m * c .^ x;