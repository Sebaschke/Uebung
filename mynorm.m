function [norm] = mynorm(A,flag)
% MYNORM - Norm Function
%   Syntax:   [norm] = mynorm(A,flag)
%   Input:    A - Array (m x n Matrix)
%             flag - type of matrixnorm
%   Output:   norm - value of the specified norm

switch flag
    case 'one'
        % calculate one vector norm respectively columnsum of matrix
        norm = max((A.')*ones(size(A,1),1));
    case 'infinity'
        % calculate infinity vector norm respectively rowsum of matrix
        norm = max(A*ones(size(A,1),1));
        
    case 'frobenius'
        % calculate two vector norm respectively frobenius norm of matrix
        norm = sqrt(sum((A.^2), 'all'));
end

