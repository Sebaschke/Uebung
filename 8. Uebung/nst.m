function [x1, x2] = nst(p, q)
% NST    - calculates zeros of quadratic equation
%
%   Syntax:   [x1, x2] = nst(p, q)
%   Input:    p - p from x^2 + p*x + q
%             q - q from 
%   Output:   x1 - x1 < x2
%             x2 - x2 > x1

% use pq-formula to solve quadratic equation
x1 = -p/2 - sqrt((p/2).^2 - q);
x2 = -p/2 + sqrt((p/2).^2 - q);
end