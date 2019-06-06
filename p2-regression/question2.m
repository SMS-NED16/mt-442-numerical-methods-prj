%%  question2Test.m - Saad Siddiqui, EE-16163, Section D, TE-EE Fall '18
%   Implements linear, exponential, and power regression models for a 
%   linearly spaced data, plots them, calculates RMS error for each model
%   to find best fit for the data.

%% creating domain of evenly spaced values between 1 and 100
t = linspace( 0, 1, 100 );

%% function to be modelled
f_t = t.^2 - 2 * t + exp( t );

%% storing coefficients and model data for linear, exp, and power fits
[lin_a, lin_b, f_t_linear] = linearFit( t, f_t );
[exp_m, exp_n, f_t_exp] = expFit( t, f_t );
[pwr_m, pwr_c, f_t_pwr] = powerFit( t, f_t );

%% plotting all models on a graph
plot( t, f_t, t, f_t_linear, t, f_t_exp, t, f_t_pwr );
xlabel( 't' ); ylabel( 'f(t)' ); grid; 
title( { 'Graphs of f(t) and Regression Models', ...
    '(Linear, Exponential, and Power)'} );

%% calculating RMS errors for each model 
rmse_linear = rms( abs ( f_t - f_t_linear ) );
rmse_exp = rms( abs ( f_t - f_t_exp ) );
rmse_pwr = rms( abs( f_t - f_t_pwr ) );

%% plotting RMS errors on a bar graph to determine min error and best model
figure; bar( [ rmse_linear, rmse_exp, rmse_pwr ] );
xlabel( 'Regression Model' ); ylabel( 'RMS Error (\it{\epsilon/arbitrary units})');
title( 'Regression Models RMS Errors' ); grid;