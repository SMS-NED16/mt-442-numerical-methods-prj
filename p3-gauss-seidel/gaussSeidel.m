%%  gaussSeidel.m - Saad Siddiqui, EE-16163, Section D, TE-EE Fall '18
%   uses Gauss-Seidel method to find solution of (n x n) system of linear 
%   equations represented by AX = B, given coefficient matrix coeff_mat, 
%   constants matrix const_mat, and a stopping criteria stop_criteria.
%   Assumes coeff_mat is non-singular, diagonally dominant, and solution to 
%   AX = B exists. 

function [ X, iters ] = gaussSeidel( coeff_mat, const_mat, stop_criteria )
% A (n x n) system will have n x 1 solution matrix
% Since nonsingular, trivial solution must exist so init initial guess 
% to a matrix of zeros and same dimensions as coeff_mat
size_coeff = size( coeff_mat );             % [ n, n ]
n = size_coeff( 1, 1 );                     % will determine num of iters  
X = zeros( n, 1 );                          % [ n, 1 ]
continue_iters = true;                      % loop continuation condition
iters = 0;                                  % keeping track of iterations

% until iterative solution not close enough to satisfying Ax = B
while ( continue_iters )
    iters = iters + 1;                      % record additional iteration   
    for i = 1 : n
        sum = 0;                    % initialise to zero at beginning of each iter
        
        % summing all terms before the diagonal element 
        for j = 1 : i - 1
            sum = sum + coeff_mat( i, j ) * X( j );
        end     % end inner for loop 1 (j)

        % summing all tersm after the diagonal element
        for j = i + 1 : n 
            sum = sum + coeff_mat( i, j ) * X( j );
        end     % end inner for loop 2 (j)
        
        % the ith root for the current iteration 
        X( i ) = ( const_mat( i ) - sum ) / coeff_mat( i, i ) ;
    end     % end outer for loop (i)
    
    % checking if the current solution is close enough to actual solution
    % Stop criteria expressed as norm of vector Ax - B because if 
    % x satisfies Ax = B, it must also satisfy Ax - B ~ 0, which is implies
    % the norm of Ax - B should be ~ 0. 
    if ( norm( coeff_mat * X - const_mat ) < stop_criteria )
        continue_iters = false;
    end     % end if block to handle loop continuation s
end     % end while loop