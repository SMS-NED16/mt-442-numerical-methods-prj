

%%  newtonRaphson.m - Saad Siddiqui, EE-16163, Section D, TE-EE Fall '18
%   uses Newton-Raphson iterative method to find root of an equation
%   given the equation's derivative, a stopping criteria, and initial root
%   returns approximation and number of iterations if root found, else 
%   returns [NaN, NaN]

function [x_approx, iters] = newtonRaphson( equation, stop_criteria, x_0 )
% defining the derivative of the equation
df_x = matlabFunction(diff( sym( equation )));

% Define parameters - initial guess, value of f, value of derivative, iters
iters = 0; x_current = x_0;
continueIters = true;

% continueIters becomes false if stopping criteria met, or divergence
while ( continueIters )
    fx_current = equation( x_current );     % f(x_0)
    df_x_current = df_x( x_current );       % f'(x_0)
    
    x_approx = x_current - fx_current / df_x_current;
    
    fx_approx = equation( x_approx );       % value at current approx
    iters = iters + 1;                      % increment iterations
    
    % fprintf( '%s: %f\n%s: %f\n%s: %f\n%s: %f\n%s: %f\n%s: %d\n', ...
    %    'x_current', x_current, 'x_approx', x_approx, ...
    %    'fx_current', fx_current, 'fx_approx', fx_approx, ...
    %    'slope', df_x_current, 'iters', iters );
    
    % if the function is beginning to diverge, stop iterations
    if ( abs( fx_approx ) > abs( fx_current ) )
        fprintf( 'NR Method diverging. Stopping iterations. Try new initial point.\n' );
        x_approx = NaN; iters = NaN;
        return;
  
    % if not diverging, then could have converged i.e. met criteria
    else
        % if the stopping criteria has been met, stop iterating
        if ( abs( fx_approx ) < stop_criteria )
            continueIters = false;
        else
            % otherwise update x_current for next iteration
            x_current = x_approx;
        end     % end if-else to handle possible convergence
    end     % end if-else to handle to handle divergence-convergence
end     % end while loop