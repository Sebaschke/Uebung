function [L, D] = cholesky(A)
% GAUSS_LR    - Cholesky disassembly of a s.p.d matrix A
%
%   Syntax:   [L, D] = cholesky(A)
%   Input:    A - square Matrix
%   Output:   L - lower triangular matrix 
%             D - diagonal matrix (d_ii !> 0)

n = size(A,1);          % dimension of A

% iterate over columns
for k=1:n
    sumA = 0;
    for j=1:k-1
        sumA = sumA + A(k,j)^2*A(j,j);
    end
    diagE = A(k,k) - sumA;
    
    if diagE < 10e-5*A(k,k)
        fprintf('No Cholesky disassembly\n');
        L = 0;
        D = 0;
        return
    end
    
    A(k, k) = diagE;
    
    % iterate over rows, j column index
    for i = k+1:n
        sumA = 0;
        for j=1:k-1
             sumA = sumA + A(i,j)*A(j,j)*A(k, j);
        end
        A(i,k) = (A(i,k) - sumA)/A(k,k);
    end
end

D = diag(diag(A));
L = eye(n) + tril(A, -1);
end
