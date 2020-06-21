function [x1, x2] = nstStabil(p, q)
% NST_STABIL    - calculates zeros of quadratic equation numerically stable
%                 uses theorem of vieta (x1 + x2 = -p; x1 * x2 = q) 
%   Syntax:   [x1, x2] = nstStabil(p, q)
%   Input:    p - p from x^2 + p*x + q
%             q - q from x^2 + p*x + q
%   Output:   x1 - x1 < x2
%             x2 - x2 > x1

a1 = p^2/4;
a2 = a1 - q;
if a2 < 0
    fprintf('Complex zeros for x^2 + 2*%d*x - q', p, q);
    x1 = 0;
    x2 = 0;
    return;         % negative radiant would lead to complex zeros
end

a3 = sqrt(a2);
% checks if p and a3 have the same sign to prevent deletion (Auslöschung)
if p < 0
    x1 = -p/2 - a3;      % this operation is problem-free
    x2 = q/x1;          % theorem of vieta x1 * x2 = q
else
    x2 = -p/2 + a3;
    x1 = q/x2;          
end