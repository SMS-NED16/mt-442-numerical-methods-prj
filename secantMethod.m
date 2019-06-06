%%  secantMethod.m - Saad Siddiqui, EE-16163, Section D, TE-EE Fall '18
%   approximates the root of a given equation to an accuracy defined by 
%   the stopping criteria. Assumes user will provide two approximatations
%   for the root which need not form an interval containing the root.
%   if root not found until max_iters, returns [NaN, NaN]

function [x_approx, iters] = secantMethod( equation, root_1, root_2,...
    max_iters, stop_criteria )
% creating new variables to store root arguments to prevent mutation
x0 = root_1;
x1 = root_2;
iters = 0;                          % initialising iterations to 0
continueIters = true;               % loop continuation condition

while( continueIters )
    f_x0 = equation( x0 );          % value at previous approximation
    f_x1 = equation( x1 );          % value at current approximation
    
    % next root approximation
    x_approx = x1 - f_x1 * ( x1 - x0 ) / ( f_x1 - f_x0 );
    f_x_approx = equation( x_approx ); 
    iters = iters + 1;              % incrementing iterations
    
    % if function has not converged after maximum iterations
    if ( iters > max_iters ) 
        continueIters = false;      % change loop continuation condition
        fprintf( '%s\n%s\n%s\n', 'Secant method exceeded max iterations.', ...
            'Please try again with different initial approximations',...
            'or increase max iterations.' );
        x_approx = NaN; iters = NaN;
        
    % if the function has converged i.e. has met stopping criteria
    elseif ( abs( f_x_approx ) < stop_criteria )
        continueIters = false;
        
    % if function yet to exceed max_iters and hasn't converged
    else
        % adjusting root values for next iteration
        x0 = x1;                         
        x1 = x_approx;
    end     % end if-elseif-else block for post-approximation step
end     % end while loop to find root approximation