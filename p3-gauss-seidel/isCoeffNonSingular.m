%%  isCoeffSingular.m - Saad Siddiqui, EE-16163, Section D, TE-EE Fall '18
%   determines whether a given matrix is singular

function coeffNonSingular = isCoeffNonSingular( coeff_matrix )
if ( det( coeff_matrix ) == 0 )
    coeffNonSingular = false;
    fprintf( 'Matrix is singular\n' );
else
    coeffNonSingular = true;
end