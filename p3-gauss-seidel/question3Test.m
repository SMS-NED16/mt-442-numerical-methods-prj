%%  question3Test.m - Saad Siddiqui, EE-16163, Section D, TE-EE Fall '18
%   finds solution of a n x n system of equations using 
%   Gauss-Seidel iterative method. Tested with a 3 x 3 matrix

%% Defining parameters for test system of equations - Ax = B
A = [ 6, -2, 1, 1;          % coefficient matrix
      1, -7, 2, 2; 
     -1,  2, 8, 4; 
      2,  1, 4, 9 ];
B = [ 10; 11; 12; 13 ];     % constants matrix
err = 1e-10;                % stopping criteria
max_iters = 100;            % in case it doesn't converge
x_actual = A \ B;           % MATLAB-derived solution for comparison

%% Only proceed if the coefficient matrix meets all criteria
if ( isGaussSeidelCompatible( A ) )
    % inform user that system can be solved with Gauss-Seidel method 
    disp( 'System is Gauss-Seidel compatible.' );
    
    % Returns the matrix of solutions and iterations taken
    [ x_gauss_seidel, iterations ] = gaussSeidel( A, B, err );
    
    % echo MATLAB-derived solution
    fprintf( 'The actual solution is \n' );
    disp( x_actual );
    
	% echo iterative solution for verification
    fprintf( '\nThe Gauss-Seidel iterative solution is\n' );
    disp( x_gauss_seidel );
    
    % echo iterations taken and current error/tolerance level
    fprintf( '\nFor error level %s, this solution took %d\n iterations.\n',...
        num2str(err), iterations );
    
    % echo RMS error between MATLAB and Gauss-Seidel solutions
    fprintf( 'RMS Error between the two is %s\n', ...
        num2str(rms(abs(x_gauss_seidel - x_actual))));
        %num2str( rms( ( x_gauss_seidel - x_actual ) ) ) );
else
    % tell user this system can't be solved with GS method
    fprintf( 'System cannot be solved with Gauss-Seidel Method.\n');
end