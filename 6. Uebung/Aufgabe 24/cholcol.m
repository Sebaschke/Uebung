% CHOLCOL  Column-wise Cholesky-Crout algorithm.
%   A = CHOLCOL(A) calculates Cholesky factorization in place, overwriting
%   the content of the input matrix. The lower triangular part of the 
%   returned matrix contains Cholesky decomposition while the upper 
%   triangular part contains intermediate results.
%   Contributed by Jan Motl (jan@motl.us)
%   $Revision: 1.0 $  $Date: 2019/04/22 15:26:01 $
function A = cholcol(A)
    n = length(A);
    for c=1:n % columns
        A(c:n, c) = A(c:n, c) - A(c:n, 1:c-1) * A(c, 1:c-1)'; % cmod
        A(c, c) = sqrt(A(c, c));
        A(c+1:n, c) = A(c+1:n, c) / A(c, c); % cdiv
    end
end