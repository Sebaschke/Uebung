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
V = zeros(m,n);
flag = 'no';            % calcualtes the dyadian product (alternatively 'no')

for i=1:n
    alpha = mySign(A(i,i)) * norm(A(i:m,i));        % alpha = sign(y1) * ||y||
    V(i:m,i) = A(i:m,i) + alpha * eye(m-i+1,1);     % normal vectors of hyperplane
    
    if strcmp(flag,'yes')
        % version 1: The following line calculates iteratively Q_n*A with the number of colums 
        A(i:m, i:n) = A(i:m, i:n) - 2.*(V(i:m,i) * (V(i:m,i)'*A(i:m, i:n)))/(V(i:m,i)'*V(i:m,i)); % calculates dyadian product
    elseif strcmp(flag, 'no')
        A(i:m, i:n) = A(i:m, i:n) - 2.*V(i:m,i).*((V(i:m,i)'*A(i:m,i:n))/(V(i:m,i)'*V(i:m,i)));   % prevents calcualting dyadian product, instead only vectors
    else 
        sprintf('No flag set correctly\n');
    end
end
R = A;
end

function s = mySign(y)
% MY_SIGN    - sign function for householder transformation where 
%               mySign(0) = 1
%
%   Syntax:   s = mySign(y)
%   Input:    y - element
%   Output:   s - either 1 or -1 if first element in vector is >= or < 0

if(y >= 0)
    s = 1;
else
    s = -1;
end

end

