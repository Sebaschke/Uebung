function xk = newton1D(f, df, x0, toly, maxIt)
% BISEKTION    - Calculates the solution of a zero problem with the
%               newton procedure with start value x0, maxmial accuracy
%               toly and maximal steps maxIt
%   Syntax:   xk = newton1D(f, df, x0, toly, maxIt)
%   Input:    f - function handle 
%             df - derivative of f
%             x0 - start value
%             toly - accuracy limit for f(xk)
%   Output:   xk - vector of approximated function zeros

k = 1;                        % counter for iteration
xk = [x0];                    % define empty vector
fprintf('Newton\n');
while abs(f(xk(k))) > toly && k < maxIt
    xk = [xk, (xk(k) - f(xk(k))/df(xk(k)))];
    fprintf('%d.Iteration: x_k = %d,  f(x_k) = %d\n', k, xk(k+1), f(xk(k+1))); 
    k = k + 1;
end
fprintf('Resolution reached\n');
xk = double(xk);
end