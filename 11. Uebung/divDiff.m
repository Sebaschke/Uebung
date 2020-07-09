function c = divDiff(x, f)
% DIV_DIFF    -       Calculates the coefficients c_k with k=0...n of the Newton Polynomial 
%   Syntax:           c = divDiff(x, f)
%   Input:            x - vector of suporting points
%                     f - vector of function values at supporting points
%   Output:           c - constant coefficients of newton polynomial

k = length(x);
c = f;
p = f;              % store elements of schema

for i=1:k-1         % loop over k  
   for j=k:-1:i+1   % loop over i
      p(j) = (p(j) - p(j-1))/(x(j) - x(j-i));   % implement dividing differences
   end  
   c(i+1) = p(i+1); % store coefficients according to schema
end
end
