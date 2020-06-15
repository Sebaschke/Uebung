function s = mySign(y)
% MY_SIGN    - sign function for householder transformation where 
%               mySign(0) = 1
%
%   Syntax:   s = mySign(y)
%   Input:    y - element
%   Output:   s - either 1 or -1 if first element in vector is >= or < 0

if(y >= 0)
    s = 1;
else
    s = -1;
end

end
