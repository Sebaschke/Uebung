function xk = sekanten(f, a, b, toly, maxIt)
% BISEKTION    - Calculates the solution of a zero problem with the
%               secant method in the intervall [a, b]
%   Syntax:   [a, b] = sekanten(f, a, b, toly, maxIt)
%   Input:    f - function handle 
%             x0 - iteration at k = 0
%             x1 - iteration at k = 1
%             toly - accuracy limit
%             maxIt - maximum number of iterations before algorithm stops
%   Output:   xk - vector of approximated function zeros

k = 2;                        % counter for iteration
xk = [a b];                   % x0 and x1

fprintf('Secanten [x_k-1, x_k] = [%d, %d]\n', a, b);
while abs(f(xk(k))) > toly && k < maxIt
    xk = [xk, (xk(k) - f(xk(k))*((xk(k)-xk(k-1))/(f(xk(k)) - f(xk(k-1)))))];
    fprintf('%d.Iteration: x_k = %d,  f(x_k) = %d, x_k+1 - xk = %d\n', k-1, xk(k+1), f(xk(k+1)), xk(k+1) - xk(k)); 
    k = k + 1;
end
fprintf('Resolution reached\n');
end
