%%  isSquareMatrix.m - Saad Siddiqui, EE-16163, Section D, TE-EE Fall '18
%   determines whether a given matrix is square matrix

function squareFlag = isSquareMatrix( coeff_mat )
[ n_row, n_col ] = size( coeff_mat );

% if both rows and cols equal and neither is 0 i.e. not null matrix
if ( n_row == n_col && n_row ~= 0 )
    squareFlag = true;
else
    squareFlag = false;
    fprintf( 'Coefficient Matrix is not square.\n' );
end