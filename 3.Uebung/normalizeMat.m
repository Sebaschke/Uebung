function [D] = normalizeMat(A, norm, type)
% NORMALIZE_MAT - Äquilibrierung eienr regulären Matrix
%   Syntax:   [D] = normalizeMat(A, norm, type)
%   Input:    A - Array (m x n Matrix)
%             norm - String der festlegt, bezüglich welcher Norm
%             äquilibriert werden soll. Möglich ist 'infty' oder 'one'
%             type - String der die Art der Äquilibrierung festlegt
%   Output:   D - Diagonalmatrix, welche die Matrix A äquilibriert


%% 
% matrix norm = infty -> sum of rows 
if norm == 'infty'
    % ||DA||=1
    if type == 'rows'
        
    else type == 'cols'
% matrix norm = one -> sum of columns        
elseif norm == 'one'
    % ||
    if type == 'rows'
        
    elseif type == 'cols'
else
    fprintf('No valid argument for norm given\n')

switch type
    case 'rows'
        % D*A, äquilibrieren der Zeilen 
        
        norm = max((A.')*ones(size(A,1),1));
    case 'cols'
        % calculate infinity vector norm respectively rowsum of matrix
        norm = max(A*ones(size(A,2),1));
end

