%%  linearFit.m - Saad Siddiqui, EE-16163, Section D, TE-EE Fall '18
%   uses linear regression to derive a linear model for a given data set
%   x is the array of independent variable, y is array of corresponding
%   function values. Returns coefficients a and b in y = ax + b
%   along with the values of the model at each independent value

function [a, b, linearModel]= linearFit( x, y )
n = length ( x );               % number of data points
sum_x = sum( x );               % sum of all values in array x
sum_y = sum( y );               % sum of all values in array y
sum_x2 = sum( x.^2 );           % sum of squares of values in x
sum_xy = sum( x .* y );         % sum of element-wise products of x,y

% slope of linear model
a = ( n * sum_xy - sum_x * sum_y ) / ( n * sum_x2 - sum_x ^ 2 );

% y-intercept of linear mode
b = ( sum_y - a * sum_x ) / n;

% linear model implemented as y = ax + b
linearModel = a * x + b;