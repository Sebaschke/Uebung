function [D] = normalizeMat(A, norm, type)
% NORMALIZE_MAT - Äquilibrierung einer regulären Matrix
%   Syntax:   [D] = normalizeMat(A, norm, type)
%   Input:    A - Array (m x n Matrix)
%             norm - String der festlegt, bezüglich welcher Norm
%             äquilibriert werden soll. Möglich ist 'infty' oder 'one'
%             type - String, der die Art der Äquilibrierung festlegt
%   Output:   D - Diagonalmatrix, welche die Matrix A äquilibriert


%% 
% matrix norm = infty -> sum of rows 
if strcmp(norm, 'infty')
    % ||DA||=1 
    if strcmp(type, 'rows')
        D = diag(((A*ones(size(A,2),1)).^-1));
        
    % ||AD||=1    
    elseif strcmp(type, 'cols')
        % bislang fehlerhaft
        % A*D führt auf ein LGS in dem die Zeilensumme von d1 und d2 z.B.
        % a11*d1 + a12*d2 = 1 abhängt und somit nicht einfach lösbar ist
        D = diag((ones(1, size(A.', 1))*A.').^-1);
    end   
    
% matrix norm = one -> sum of columns        
elseif strcmp(norm, 'one')
    % ||DA||=1
    if strcmp(type, 'rows')
        % gleiches Problem wie bei Zeilenskalierung. Multiplikation ergibt
        % z.B. d1*a11 + d2*a21 = 1 und ist nicht einfach lösbar 
    % ||AD||=1
    elseif strcmp(type, 'cols')
        D = diag(((ones(1, size(A,1))*A).^-1));
    end
    
else
    fprintf('No valid argument for norm given\n')
end

