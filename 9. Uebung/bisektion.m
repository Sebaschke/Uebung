function [a, b] = bisektion(f, a, b)
% BISEKTION    - Calculates the solution of a zero problem with the
%               bisection procedure
%   Syntax:   [a, b] = bisektion(f, a, b)
%   Input:    f - function handle
%             a - left limit
%             b - right limit
%   Output:   a - left limit with precision of two decimal places
%             b - right limit 
k = 0;                      % counter for iteration

fprintf('Intervall after %d.Iteration: [a, b] = [%d, %d]\n', k, a, b); 
if a < b && f(a)*f(b) < 0
   while abs(a - b) > 1e-2
        x = (1/2) * (a + b);
        fx = f(x);
        if fx*f(a) <= 0
            b = x;
        else
            a = x;
        end
        k = k +1;
        fprintf('Intervall after %d.Iteration: [a, b] = [%d, %d]\n', k, a, b); 
   end
   fprintf('Resolution reached\n\n');
else 
    fprintf('Error: Either a is not smaller than b or there is no sign changen in the intervall [a; b]\n'); 
end

end
