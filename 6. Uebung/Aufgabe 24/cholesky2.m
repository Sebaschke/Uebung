function [L, D] = cholesky2(A)
% GAUSS_LR    - Cholesky disassembly of a s.p.d matrix A
%
%   Syntax:   [L, D] = cholesky(A)
%   Input:    A - square Matrix
%   Output:   L - lower triangular matrix 
%             D - diagonal matrix (d_ii !> 0)

n = size(A,1);

% iterate over columns
for k=1:n
    diagE = A(k,k) - sum(A(k,1:k-1).^2*A(1:k-1,1:k-1));
    
    if diagE < 10e-5*A(k,k)
        fprintf('No Cholesky disassembly\n');
    end
    A(k, k) = diagE;
    % iterate over rows, j column index
    for i = k+1:n
       sumA = 0;       % j<k requires extra loop
        for j=1:k-1
             sumA = sumA + A(i,j)*A(j,j)*A(k, j);
        end
        A(i,k) = (A(i,k) - sumA)/A(k,k);
    end
end

D = diag(diag(A));
L = eye(n) + tril(A, -1);

end