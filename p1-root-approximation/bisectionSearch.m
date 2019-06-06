%%  bisectionSearch.m -% Saad Siddiqui, EE-16163, Section D, TE-EE Fall '18
%   iteratively finds root of a given equation for specified stopping
%   criteria and interval bounds. Returns approximate root and num of 
%   iterations taken as result. If root not in interval, returns [NaN, NaN]

function [x_approx, iters ] = bisectionSearch( equation, lower_bound,...
    upper_bound, stop_criteria )
% initialising bounds to prevent arguments changing
lower = lower_bound; 
upper = upper_bound;
iters = 0;                % number of iterations until root found
continueIters = true;     % loop continuation condition

% first, check if root lies in interval 
validInterval = isRootInInterval( lower_bound, upper_bound, equation );

if ( validInterval )
    % while continues as long as the flag not changed by the loop
    while ( continueIters == true )
        x_approx = ( lower + upper ) / 2;       % new root = interval mid
        f_approx = equation( x_approx );        % value at new root
        f_lower = equation( lower );            % value at lower bound
        iters = iters + 1;                      % increment iterations
        
        % if the value of the function at this root is close enough to zero
        if ( abs( f_approx ) < stop_criteria )
            continueIters = false;              % stop iterating
        end     % end else block to handle loop continuation
        
        % adjusting bounds for next iteration
        if ( f_approx * f_lower < 0 )           % root in [lower, x_approx]
            upper = x_approx;     
        else
            lower = x_approx;                   % root in [x_approx, upper]
        end     % end if-else block for adjusting lower and upper bounds
    end     % end while loop    
else
    % tell user they need to enter a different interval
    fprintf( '%s\n%s\n%s\n', 'Bisection search failed', 'Root does not lie in this interval.', ...
        'Please try again' );
    % init results to NaN to mark program unsuccessful
    x_approx = NaN; iters = NaN;
    return; 
end % end else if-else block to check for valid interval
