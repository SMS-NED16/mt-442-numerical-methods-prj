%%  isRootInInterval.m - Saad Siddiqui, EE-16163, Section D, TE-EE Fall '18
%   a function that determines whether the root of an equation lies in the
%   interval spanned by [lower, upper] using intermediate value theorem
%   corollary called Bonzano's theorem - f(lower) * f(upper) < 0

function rootFlag = isRootInInterval( lower, upper, equation )
if ( equation( lower ) * equation( upper ) < 0 )
    rootFlag = true;
else
    rootFlag = false;
end
