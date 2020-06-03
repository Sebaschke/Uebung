function [lnd, rd, rnd] = LR_TriDiag(aUnd, ad, aOnd)
% VALUE       - Calculates the LR disassembly of a quadratic tridiagonal
%               matrix 
%   Syntax:   [lnd, rd, rnd] = LR_TriDiag(aUnd, ad, aOnd)
%   Input:    aUnd - lower secondary diagonal of A
%             ad - diagonal of A
%             aOnd - upper secondary diagonal of A
%   Output:   lnd - lower secondary diagonal of L
%             rd - diagonal of R
%             rnd - upper secondary diagonal of R

n = size(ad, 1);           % get dimension nxn

% allocate vectors with zeros
lnd = zeros(n-1, 1);
rd = zeros(n, 1);
rnd = zeros(n-1, 1);

% implement thomas algorithm
rd(1) = ad(1);
for j=2:n
    lnd(j-1) = aUnd(j-1)/rd(j-1);       % calculate lower secondary diagonal 
    rnd(j-1) = aOnd(j-1);
    rd(j) = ad(j) - lnd(j-1)*rnd(j-1);
end

end
