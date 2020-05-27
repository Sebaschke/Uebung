function [x] = solveInv(L, R, P, e)
% solveInv    - Lösung der Gleichung LR*x_i = P*e_i
%   Syntax:   [x] = solveInv(L, R, P, d, b)
%   Input:    L - lower-left matrix
%             R - upper right matrix
%             P - permutationmatrix
%             d - vector for scaling the matrix A
%             e - unit vector
%   Output:   x - column of inverse matrix

[n, n] = size(L);

% scale right side D*b
e = P*e;

% start with forward pass: L*y = b
y = e;  % allocate vector with right dimensions
for i=1:n
    y(i) = (1/L(i,i))*(e(i)-L(i,1:i-1)*y(1:i-1));
end

% next step is the backward pass: R*x = y
x = y;  % allocate vector with right dimensions
for j=n:-1:1
    x(j) = (1/R(j,j))*(y(j)- R(j,j+1:n)*x(j+1:n));  % siehe Skript S.72 
end
end