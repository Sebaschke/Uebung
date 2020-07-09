function xk = newtonSys(f, df, x0, toly, maxIt)
% NEWTONSYS    - Calculates the solution of a zero problem for system of non-linear problems 
%               with the newton procedure with start value x0, maxmial accuracy
%               toly and maximal steps maxIt
%   Syntax:     xk = newtonSys(f, df, x0, toly, maxIt)
%   Input:      f - function handle of multidimensional function 
%               df - derivative of f (multidimensional)
%               x0 - start value (vector)
%               toly - accuracy limit for f(xk)
%   Output:     xk - matrix with columns vectors of executed iterations
syms x1; syms x2;
k = 1;                              % counter for iteration
xk = [x0 [1:maxIt; 1:maxIt]];       % allocate right size of for xk
fprintf('Newton with x0 = [ ');
fprintf('%g ', x0);
fprintf('] f(x_k) = [ ');
fprintf('%g ', f(xk(1, k), xk(2, k)));
fprintf(']\n');
while norm(f(xk(1, k),xk(2, k))) > toly && k < maxIt
    y = f(xk(1, k),xk(2, k));                       % evaluate f
    ydiff = subs(df, [x1, x2], [xk(1,k), xk(2,k)]); % evaluate f', df is symbolic matrix, so use subs
%     [L, R, P, d] = lrPivot(ydiff);                  
%     s = solveLrPivot(L, R, P, d, -y);
    s = ydiff\-y;
    k = k + 1;
    xk(:,k) = xk(:, k-1) + s;
    
    % for printing on console
    fprintf('%d.Iteration: x_k = [ ', k-1);
    fprintf('%g ', xk(:, k));
    fprintf('] f(x_k) = [ ');
    fprintf('%g ', f(xk(1, k), xk(2, k)));
    fprintf(']\n');
end
fprintf('Resolution reached or maximum of iterations reached\n');
xk = xk(:, 1:k);
end