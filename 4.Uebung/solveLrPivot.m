function [x] = solveLrPivot(L, R, P, d, b)
% GAUSS_LR    - Lösung des lineare Gl.systems L*R*x = b
%   Syntax:   [x] = solveLR(L, R, b)
%   Input:    L - lower-left matrix
%             R - upper right matrix
%             b - right side
%             d - vector for scaling the matrix A
%   Output:   x - solution vector

[n, n] = size(L);
% scale right side D*b
b = P*diag(d)*b;

% start with forward pass: L*y = b
y = b;  % allocate vector with right dimensions
for i=1:n
    y(i) = (1/L(i,i))*(b(i)-L(i,1:i-1)*y(1:i-1));
end

% next step is the backward pass: R*x = y
x = y;  % allocate vector with right dimensions
for j=n:-1:1
    x(j) = (1/R(j,j))*(y(j)- R(j,j+1:n)*x(j+1:n));  % siehe Skript S.72 
end
end