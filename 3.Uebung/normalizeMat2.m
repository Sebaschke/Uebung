function [D] = normalizeMat2(A, norm, type)
% NORMALIZE_MAT - Äquilibrierung einer regulären Matrix
%   Syntax:   [D] = normalizeMat(A, norm, type)
%   Input:    A - Array (m x n Matrix)
%             norm - String der festlegt, bezüglich welcher Norm
%             äquilibriert werden soll. Möglich ist 'infty' oder 'one'
%             type - String, der die Art der Äquilibrierung festlegt
%   Output:   D - Diagonalmatrix, welche die Matrix A äquilibriert

if strcmp(norm, 'infty') && strcmp(type, 'rows')
    A_max_rows = max(A');   % max of rows
    D = diag(1./A_max_rows);
    
elseif strcmp(norm, 'infty') && strcmp(type, 'cols')
    A_max_cols = max(A);    % max of cols
    D = diag(1./A_max_cols);
    
elseif strcmp(norm, 'one') && strcmp(type, 'rows')
    A_sum_rows = sum(abs(A), 2);    % sum of each row
    D = diag(1./A_sum_rows);
    
elseif strcmp(norm, 'one') && strcmp(type, 'cols')
    A_sum_cols = sum(abs(A));   % sum of each col
    D = diag(1./A_sum_cols);
    
else
    D = 0;
end

