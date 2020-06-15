function [L, R, P] = myLURows (A)

n = size (A ,1);
p=1: n;

for k=1:n-1
    %*** bestimme maximalen Wert in k-ter Zeile
    [~, mptr ] = max (abs(A(k,p(k: end))));
    tmp = p(k);
    %*** tausche Spalten
    p(k) = p(k -1+ mptr );
    p(k -1+ mptr ) = tmp ;
    %*** f h r e LR - Schritt aus
    for j = k+1 : n
        A(j,p(k)) = A(j,p(k))/A(k,p(k));
        for i = k+1 : n
            A(j,p(i)) = A(j,p(i)) - A(j,p(k))*A(k,p(i));
        end
    end
end
% *** extrahiere L und R
L = tril (A(:,p) ,-1) +eye(n);
R = triu (A(:,p));
% *** berechne P
P= eye(n);
P(p ,:) = P;