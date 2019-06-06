%%  regulaFalsi.m - Saad Siddiqui, EE-16163, Section D, TE-EE Fall '18
%   uses Regula-Falsi method to approximate root of a given equation for
%   a given interval and stopping criteria. 

function [x_approx, iters] = regulaFalsi( equation, lower_bound, upper_bound,...
    stop_criteria )
% storing bounds in new variables to prevent argument mutation
lower = lower_bound;
upper = upper_bound;

% initialising iterations to 0
iters = 0;

% check that provided interval contains root
validInterval = isRootInInterval( lower, upper, equation );
continueIters = true;                           % loop continuation condition

% if the user has provided a valid interval, start iterating
if ( validInterval )
    while ( continueIters )
        iters = iters + 1;                      % incrementing iterations
        f_lower = equation( lower );            % value at lower bound
        f_upper = equation( upper );            % value at upper bound
        
        % new root = [ a * f(b) - b * f(a)] / [ f(b) - f(a) ]
        x_approx = ( lower * f_upper - upper * f_lower ) / ...
            ( f_upper - f_lower );
        f_approx = equation( x_approx );        % value at approximation
        
        % if the stopping criteria has been met
        if ( abs( f_approx ) < stop_criteria )  
            continueIters = false;
            
        % stopping criteria not met? Adjust interval bounds
        else
            if ( f_approx * f_upper > 0 )   % root in [lower, x_approx]
                upper = x_approx;             
            else
                lower = x_approx;           % root in [x_approx, upper]
            end     % end if-else block to handle bound adjustment
        end     % end if block to check for convergence
    end     % end while loop to find approximate root

% if invalid interval, return NaN, NaN and prompt user to repeat
else
    fprintf( '%s\n%s\n', 'Regula-Falsi method failed. Root not in interval',...
        'Please repeat with a different interval.' );
    x_approx = NaN; iters = NaN;
end     % end if block to check for valid user-specified interval
