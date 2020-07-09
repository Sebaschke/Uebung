function v = evalNewtonpolynom(x, c, t)
% EVAL_NEWTONPOLYNOM  - Evaluates Newton polynom at supporting points x with coefficients c at positions t 
%                       Use modified Horner Schema to solve.
%   Syntax:           v - evalNewtonpolynom(x, c, t)
%   Input:            x - vector of suporting points
%                     c - constant coefficients of newton polynomial
%                     t - points where to evaluate
%   Output:           v = solution vector

k = length(c);
anz = length(t);        % number of solutions 
v = zeros(anz,1);       % allocate solution vector as column vector
b = c;                  % store coefficients in temporary variable

for i=1:anz
    b(k) = c(k);
    for j=k-1:-1:1
        b(j) = c(j) + (t(i) - x(j))*b(j+1);    % mod. horner schema
        % v(i) = v(i) + c(j)*prod(t(i)-c(1:j)) % not horner schema
    end
    v(i) = b(j);
end
end