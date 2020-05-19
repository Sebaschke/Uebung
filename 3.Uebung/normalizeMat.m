function [D] = normalizeMat(A, norm, type)
% NORMALIZE_MAT - �quilibrierung einer regul�ren Matrix
%   Syntax:   [D] = normalizeMat(A, norm, type)
%   Input:    A - Array (m x n Matrix)
%             norm - String der festlegt, bez�glich welcher Norm
%             �quilibriert werden soll. M�glich ist 'infty' oder 'one'
%             type - String, der die Art der �quilibrierung festlegt
%   Output:   D - Diagonalmatrix, welche die Matrix A �quilibriert


%% 
% matrix norm = infty -> sum of rows 
if strcmp(norm, 'infty')
    % ||DA||=1 
    if strcmp(type, 'rows')
        D = diag(((A*ones(size(A,2),1)).^-1));
        
    % ||AD||=1    
    elseif strcmp(type, 'cols')
        % bislang fehlerhaft
        % A*D f�hrt auf ein LGS in dem die Zeilensumme von d1 und d2 z.B.
        % a11*d1 + a12*d2 = 1 abh�ngt und somit nicht einfach l�sbar ist
        D = diag((ones(1, size(A.', 1))*A.').^-1);
    end   
    
% matrix norm = one -> sum of columns        
elseif strcmp(norm, 'one')
    % ||DA||=1
    if strcmp(type, 'rows')
        % gleiches Problem wie bei Zeilenskalierung. Multiplikation ergibt
        % z.B. d1*a11 + d2*a21 = 1 und ist nicht einfach l�sbar 
    % ||AD||=1
    elseif strcmp(type, 'cols')
        D = diag(((ones(1, size(A,1))*A).^-1));
    end
    
else
    fprintf('No valid argument for norm given\n')
end

