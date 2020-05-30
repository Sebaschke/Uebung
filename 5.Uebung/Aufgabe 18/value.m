function x = value(b, d, v, t)
% VALUE       - Calculates value of a floating point representation
%   Syntax:   x = value(b, d, v, t)
%   Input:    b - base
%             d - coefficients of mantissa stored in row vector
%             v - coefficients of exponent stored as row vector
%             t - sign of exponent {-1, 1}
%   Output:   x - value of floating point representation

% start with exponent
exp = 0;            % assign exponent start value to be well-defined
v = flip(v);
for j=1:size(v, 2)
    exp = exp + v(j)*b^(j-1);
end

% mantissa
m = 0;              % assign mantissa start value to be well-defined
for j=1:size(d, 2)
    m = m + d(j)*b^-j;
end

% output expression
x = b^(t * exp) * m;
end
