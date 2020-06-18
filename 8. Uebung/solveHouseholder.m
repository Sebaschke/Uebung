function x = solveHouseholder(V, R, b)
% SOLVE_HOUSEHOLDER    - Solves a linear regression problem with QR disassembly for different right sides
%                        b
%
%   Syntax:   x = solveHouseholder(V, R, b)
%   Input:    V - mxn matrix with n normal vectors of hyperplanes of
%                 householder transformation
%             R - upper triangular matrix
%             b - right side of equation system
%   Output:   x - solution

[m, n] = size(V);   
Qt = eye(m);     % basically zero householder transformation, does not mirror/transform

% iteratively tranform the rigth side of equation: Rx = Q'*b ( => Q_v2 * Q_v1 * b)

% get Q'
for i=1:n
    Qt = (eye(m)-2*(V(:,i)*V(:,i).')/(V(:,i).'*V(:,i)))*Qt;  % Qt = Q_v2 * Q_v1 
end

b = Qt*b;

n = rank(R);            % get the dimension of relevant entries in R -> R_tilde
                        % this is also the output dimension of the problem
x = ones(n,1);          % allocate size for result

% solve with backward pass
for i=n:-1:1
    if n>=2
        x(i) = (1/R(i,i)) * (b(i) - R(i,i+1:n)*x(i+1:n)); 
    else
        x(i) = (1/R(i,i)) * b(i);
    end
end
end