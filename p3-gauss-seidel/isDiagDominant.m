%%  diagDominant.m - Saad Siddiqui, EE-16163, Section D, TE-EE Fall '18
%   determines whether a given matrix is diagonally dominant

function diagDominant = isDiagDominant( coeff_mat )
if ( all((2*abs(diag(coeff_mat))) >= sum(abs(coeff_mat),2)) )
    diagDominant = true;
else
    diagDominant = false;
    fprint( 'Matrix is not diagonally dominant.\n' );
end