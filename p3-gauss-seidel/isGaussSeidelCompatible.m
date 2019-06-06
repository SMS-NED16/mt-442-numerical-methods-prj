%%  isGaussSeidelCompatible.m - Saad Siddiqui, EE-16163, Section D, TE-EE Fall '18
%   computes row-wise sum to determine diagonal dominance

function gs_compatible = isGaussSeidelCompatible( coeff_mat )
% Is the matrix square? If not square, can't be solved using GS
is_square = isSquareMatrix( coeff_mat );

% Is the matrix singular? If singular, A^-1 doesn't exist. No solution
sol_exists = isCoeffNonSingular( coeff_mat );

% Is the matrix diagonally dominant?
is_diag_dom = isDiagDominant( coeff_mat );

% If all three conditions fulfilled, can solve with Gauss-Seidel
if ( is_square && sol_exists && is_diag_dom )
    gs_compatible = true;
else
    gs_compatible = false;
end