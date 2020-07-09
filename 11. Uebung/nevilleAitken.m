function values = nevilleAitken(xk, fk, t)
% NEVILLE_AITKEN    - Calculates the function values of the interpolation
%                     polynom at positions t. The interpolation polynom is
%                     defined from the suporting points [xk, fk]. Use
%                     schema of Aitken-Neville
%   Syntax:           values = nevilleAitken(xk, fk, t)
%   Input:            xk - vector of suporting points
%                     fk - vector of function values at supporting points
%                     t  - position where interpolation should be done
%   Output:           values - vector of interpolation polynomial at positions t
%                     -> P(f|x0, ..., xn)(tk) for k = 1, ..., m

p = fk;                 % column vectors of schema
k = length(p);          % number of supporting points
anz = length(t);        % number of evaluated points
values = [1:anz];       % allocate result vector

% begin from bottom to store new elements in p again -> faster
% processing
for in=1:anz            % iterate over t
    for i=1:k           % iterate over k
        for j=k:-1:i+1  % iterate over i
            p(j) = ((t(in) - xk(j-i)) * p(j) - (t(in) - xk(j))*p(j-1)) / (xk(j) - xk(j-i));
        end
    end
    values(in) = p(k);     % returns "lower right" element of scheme  
end
end
