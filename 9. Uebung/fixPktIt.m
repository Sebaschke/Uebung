function xks = fixPktIt(phi, anzIt, x0)
% FIX_PKTIT    - Calculates the first anzIt iterations of the iteration
%               function phi beginning from start point x0
%   Syntax:   xks = fixPktIt(phi, anzIt, x0)
%   Input:    phi - iteration function
%             anzIt - number of iteration
%             x0 - start point
%   Output:   xks - fixpoint after specified number of iterations

xks = [x0 zeros(1, anzIt)];
for i=1:anzIt
    xks(i+1) = phi(xks(i));
end

end