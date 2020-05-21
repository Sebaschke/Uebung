function [x] = solveLR(L, R, b)
% GAUSS_LR    - Forward and backward deployment of L*R*x = b
%   Syntax:   [x] = solveLR(L, R, b)
%   Input:    L - lower triangular matrix
%             R - upper triangular matrix
%             b - right side
%   Output:   x - solution vector

[n, n] = size(L);

% start with forward pass: L*y = b
y = b;                              % allocate vector with right dimensions
for i=1:n
    y(i) = (1/L(i,i))*(b(i)-L(i,1:i-1)*y(1:i-1));
end

% next step is the backward pass: R*x = y
x = y;                              % allocate vector with right dimensions
for j=n:-1:1
    x(j) = (1/R(j,j))*(y(j)- R(j,j+1:n)*x(j+1:n));  % siehe Skript S.72 
end
end

