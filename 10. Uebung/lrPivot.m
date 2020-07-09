function [L, R, P, d] = lrPivot(A)
% LR_PIVOT    - LR-Zerlegung mit Zeilenskalierung und Spaltenpivotisierung 
%               einer Matrix A
%   Syntax:   [L, R, P, d] = lrPivot(A)
%   Input:    A - square Matrix
%   Output:   L - lower-left matrix 
%             R - upper right matrix
%             P - Permutationmatrix
%             d - Vector with Diagonalelements of D
[n,m] = size(A);

d = rand(n,1);     % preallocate vector
for i=1:n
    d(i) = 1/sum(abs(A(i,:)));      % Skript S. 69
    for j=1:n
        A(i,j) = d(i)*A(i,j);
    end
end

r = 1:n-1;      % preallocate vector
for j = 1:(n-1)
    [M, p] = max(abs(A(j:n,j)));     % M stores biggest element value, p its index
    r(j) = p + j - 1;    % p is relative to j -> get absolute row index 
    A([j,p+j-1],:) = A([p + j - 1,j],:);
    for i=j+1:n
        A(i,j) = A(i,j)/A(j,j);  % results in lower trigonal matrix L
        for k=j+1:n
            A(i,k) = A(i,k) - A(i,j)*A(j,k);     % results in upper triagonal matrix R
        end
    end
end
L = eye(size(A)) + tril(A,-1);
R = triu(A);

% derive Permutation Matrix from changed rows stored in r
% Start with first Pivoting
P = eye(n);
for i=1:n-1 
    P([i, r(i)],:) = P([r(i), i],:);
end
   
end
