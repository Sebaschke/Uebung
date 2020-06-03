function [L, R] = gaussLR(A)
% GAUSS_LR    - LR disassembly of a quadratic matrix A without pivoting
%             - Übungsblatt 4/Aufgabe 13
%   Syntax:   [L, R] = gaussLR(A)
%   Input:    A - square Matrix
%   Output:   L - lower triangular matrix 
%             R - upper triangular matrix

n = size(A, 1);    % Matrix has to be square

% iterate over rows
for j = 1:(n-1)
    if abs(A(j,j)) == 0   
        disp('Matrix has no LR decomposition\n')
        R = A;
        L = 0;
        return
    else
        for i = j+1:n
            A(i,j) = A(i,j)/A(j,j);    % store l_ij at A_ij  
            A(i,j+1:n) = A(i,j+1:n)-A(i,j).*A(j,j+1:n);
        end
    end
end
L = eye(size(A)) + tril(A,-1);      % extract lower triangular matrix
R = triu(A);                        % extract upper triangular matrix
end
