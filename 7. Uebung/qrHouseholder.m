function [V, R] = qrHouseholder(A)
% QR_HOUSEHOLDER    - QR-disassembly of a mxn matrix A using the householder
%                   transformation
%
%   Syntax:   [V, R] = qrHouseholder(A)
%   Input:    A - mxn matrix
%   Output:   V - matrix which holds the householder vectors [v1, v2, ..., vn] 
%                 therefore lower triangular matrix
%             R - upper triangular matrix

[m, n] = size(A);       % n is the number of householder matrizes to transfer into upper triangular

% allocate matrix V 
V = zeros(m, n);

for i=1:n
    alpha = mySign(A(i,i)) * norm(A(i:m,i));        % alpha = sign(y1) * ||y||
    V(i:m,i) = A(i:m,i) + alpha * eye(m-i+1,1);   % normal vectors of hyperplane
    A(i:m, i:n) = A(i:m, i:n) - 2.*(V(i:m,i) * (V(i:m,i)'*A(i:m, i:n)))/(V(i:m,i)'*V(i:m,i));           %   
    % A(:,i+1) = A(:,2) * (eye(m-i+1) - 2.*((V(:,i)*V(:,i)')/(V(:,i)'*V(:,i))));
    
end
R = A;


end
