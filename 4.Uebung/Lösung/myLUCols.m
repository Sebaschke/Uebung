function [L,R,P] = myLUCols (A)

n = size (A ,1);
p=1: n;

for k=1:n-1
    %*** bestimme maximalen Wert in k-ter Spalte
    [~, mptr ] = max (abs(A(p(k:end ),k)));
    tmp = p(k);
    %*** tausche Zeilen
    p(k) = p(k -1+ mptr );
    p(k -1+ mptr ) = tmp ;
    %*** f h r e LR - Schritt aus
    for j = k+1 : n
        A(p(j),k) = A(p(j),k)/A(p(k),k);
        for i = k+1 : n
            A(p(j),i) = A(p(j),i) - A(p(j),k)*A(p(k),i);
        end
    end
end
% *** extrahiere L und R
L = tril (A(p ,:) ,-1) +eye(n);
R = triu (A(p ,:));
% *** berechne P
P= eye(n);
P(:,p) = P;