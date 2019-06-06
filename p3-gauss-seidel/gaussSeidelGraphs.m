clear all; close all;
errors = [1.00E+00 1.00E-05 1.00E-10 1.00E-15];
iterations = [3 11 19 28 ];
rmse = [0.016014 2.31E-07 6.29E-12 1.24E-16 ];

figure; bar( abs(log10( errors) ), iterations );
title( 'Graph of Gauss-Seidel Iterations against Tolerance' );
ylabel( 'Iterations (\it{n/arbitrary units})' );
xlabel( 'Tolerance (\it{1e^{k}/arbitrary units})');
grid;

relative_rmse = rmse' ./ min(rmse);

figure; bar( abs(log10(errors)), log10(relative_rmse));
title( { 'Graph of RMS Errors', 'Expressed as logarithmic ratio to minimum error'});
xlabel( 'Tolerance (\it{1e^{-k}/arbitrary units})');
ylabel( {'Logarithmic Ratio to Minimum Error', ...
    '(\it{log_{10}(^{RMSE}/_{RMSE_{min}})/arbitrary units})'});
grid;
