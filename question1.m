% bisection, rf, secant, nr
iters_5 = [ 13, 5, 3, 3 ];
iters_10 = [ 30, 12, 5, 4 ];
iters_15 = [ 44, 17, 6, 5 ]; 

iters_data = [ iters_5; iters_10; iters_15 ];
bar( iters_data ); grid;
% xticklabels( { '10^{-5}', '10^{-10}', '10^{-15}' });
xlabel( 'Stopping Criteria - (\it{\epsilon/arbitrary units)}' );
ylabel( 'Iterations - \it{(n/arbitary units)}' );
title( { 'Assignment Question 1 - Root Approximation', ...
    'Number of Iterations against Stopping Criteria'});
legend;