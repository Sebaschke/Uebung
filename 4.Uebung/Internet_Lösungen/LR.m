function [L,R] = LR(A)
%------------------------------------------------------------------
% Berechnet eine LR-Zerlegung (Gauss-Elimination).
% Eingabe: A nxn-regulaere Matrix.
% Ausgabe: L nxn-untere Dreiecksmatrix, R nxn-obere Dreiecksmatrix.
%------------------------------------------------------------------
[n,n] = size(A);
for k=1:n-1
    A(k+1:n,k) = A(k+1:n,k)/A(k,k);
    A(k+1:n,k+1:n) = A(k+1:n,k+1:n)-A(k+1:n,k)*A(k,k+1:n);
end
R = triu(A); 
L = eye(n,n) + tril(A,-1);
end