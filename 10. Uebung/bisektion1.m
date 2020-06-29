function xk = bisektion1(f, a, b, tolx)
% BISEKTION    - Calculates the solution of a zero problem with the
%               bisection procedure in the intervall [a, b]
%   Syntax:   [a, b] = bisektion(f, a, b)
%   Input:    f - function handle 
%             a - left limit
%             b - right limit
%             tolx - accuracy limit
%   Output:   xk - vector of approximated function zeros

k = 0;                      % counter for iteration
xk = [];                    % define empty vector

fprintf('Bisection\n');
fprintf('Intervall after %d.Iteration: [a, b] = [%d, %d]\n', k, a, b); 
if a < b && f(a)*f(b) < 0
   while abs(a - b) > tolx
        x = (1/2) * (a + b);
        fx = f(x);
        if fx*f(a) <= 0
            b = x;
        else
            a = x;
        end
        xk = [xk; abs(a+b)/2];
        k = k + 1;
        fprintf('Intervall after %d.Iteration: [a, b] = [%d, %d]\n', k, a, b); 
   end
   fprintf('Resolution reached\n');
else 
    fprintf('Error: Either a is not smaller than b or there is no sign changen in the intervall [a; b]\n'); 
end
xk = double(xk);
end
