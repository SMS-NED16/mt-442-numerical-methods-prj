%%  gaussSeidelMethod.m - EE-16163, Section D, TE-EE Fall 2018
%   This program uses the Gauss-Seidel iterative metho to solve a set of 
%   simultaneous equations [ A ][ X ] = [ B ] and compares the result to
%   the MATLAB backslash operator \. This method will converge if the matrix
%   A is diagonally dominant (i.e. the absolute value of the diagonal term
%   is greater than the sum of the absolute values of the other terms in
%   each row.
clear;

% Define matrixes A and B
A = [ 10 -7 0; -3 6 1; 2 -1 5 ];
B = [ 7; 4; 6 ];

% Actual solution calculated using MATLAB \ operator
x = A \ B;

% Begin Gauss-Seidel iterative method
N = size( A, 1 );
X = zeros( N, 1 );
K = 0;                  % iteration count
TOL = 1e-3;             % tolerance for zero
converged = 0;          % while loop condition
Xnew = zeros( N, 1 );   

while converged == 0
    for ii = 1 : N
        Xnew = 1/A(ii,ii) * (B(ii)-A(ii,1:(ii-1))*Xnew(1:(ii-1))...
            -A(ii,(ii+1):N)*X(ii+1):N);
    end
    %Convergent condition
    d = sum(abs(Xnew-X))/sum(abs(Xnew));
    
    % Replace old value with newly computed value
    X = Xnew;
    
    K = K + 1;              % increment iterations
    disp([num2str(K), '       ', num2str(X(:)'), '        ', num2str(d)]);
end

thedifference = x - X(:);