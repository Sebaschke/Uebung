function pt = hornerSchema(a, t)
% HORNER_SCHEMA    - Efficiently evaluates a polynomial of form 
%                    p(x) = sigma(ak * x^k) at different positions t
%   Syntax:     pt = hornerSchema(a, t)
%   Input:      a  - coefficients of polynom
%               t  - positions where polynom should be evaluated
%   Output:     pt - solution vector

anz = length(t);        % number of solutions 
pt = (1:anz).';         % allocate solution vector as column vector
k = length(a);          % number of coefficients of polynom
a = flipud(a);          % change to ascending order
b = a;                  % store temporary results in b

% iterate over number of solutions
for i=1:anz
    b(k) = a(k);        % from inside to outside
    for j=k-1:-1:1      % beginning from a_n-1 to 1
       b(j) = a(j) + t(i) * b(j+1); 
    end
    pt(i) = b(j);       % result is stored in b(1)
    b = a;              % clear b for next solution
end
end
