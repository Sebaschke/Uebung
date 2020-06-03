function [d, v, t] = flp(b, m, n, x)
% FLP           - Transforms value x into a floating point number with
%               given basis, length of mantissa, length of exponent and
%               sign
%   Syntax:   [d, v, t] = flp(b, m, n, x)
%   Input:    b - base
%             m - lenth of mantissa
%             n - length of exponent
%             x - value to get flp representation
%   Output:   d - coefficients of mantissa stored in row vector
%             v - coefficients of exponent stored as row vector
%             t - sign of exponent {-1, 1}

% preallocate coefficient vectors with ones
d = zeros(1, m);
v = zeros(1, n);

% calculate sign
if(x >= 1)
    t = 1;
else
    t = -1;                 % decideds direction in which comma is shifted
end

% following calcs with abs
x = abs(x);    

% use euclidian algorithm for calculating the coefficients of mantissa
j = floor(log(x)/log(b));   % get smallest b^j which "fits" in x
index = 1;                  % make sure coefficients are put in d vector
for i=j:-1:j-m+1            % iterate m steps, zero included 
    if b^i <= x             % check if i-th exp is smaller than remaining x
        d(index) = floor(x/(b^i));
        x = rem(x, b^i);     
        index = index + 1;
    else                   % if it is not smaller than skip one exp, put 0 in d
        d(index) = 0;      % not absolutely necessary because d is initialized with zeros
        index = index + 1;
    end
end

% normalize (0.d1d2 so forth) and calculate exponent: move comma j+1 positions to left
% ergo multiply by b^(j+1)
exp = j+1;  


% calculate the exzess (=bias) for the exponent, see IEEE 754
% ex = (b^(n-1))-1; 

i = 1;                      % index for coefficient vector
exp = t*exp;                % make exponent natural 

% with modified horner scheme because exp is natural number
if (exp >= 1)
    while(exp ~= 0)
        if(rem(exp, b))      % check whether rest exists
            v(i) = rem(exp, b);
            i = i + 1;
        else
            v(i) = 0;
            i = i + 1;
        end
        exp = floor(exp/b); % new value for next turn
    end
    v = flip(v);            % LSB in MSB
end
