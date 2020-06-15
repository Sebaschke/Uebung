function [invA] = inversMat( A )
% Angewandte Numerik 1, SoSe 2020
% Uebungsblatt 04, Aufgabe 15
%
% Die Funktion [invA] = inversMat( A )berechnet die Inverse einer Matrix
% durch LR-Zerlegung mit Skalierung und Spalten-Pivotisierung.
%
% Input:    A       Matrix, deren Inverse berechnet werden soll
% Output:   invA    Inverse der Matrix A
%
% Letzte Aenderung: 21.05.2020

  % Spezifikation der Variante der lrPivot Function
  lrPivot = @lrPivot_S1;
  
  % LR-Zerlegung der Matrix mit Skalierung und Spalten-Pivotisierung
  [L, R, P, d] = lrPivot( A );

  if any( isnan(L), 'all' )
    % LR-Zerlegung fehlgeschlagen
    fprintf(2, 'Invertierung der Matrix fehlgeschlagen !\n\n');
    invA = NaN;
    return;
  else
    % Dimension der Matrix
    n    = size( A, 1 );
    
    % Initialisierung
    invA = eye(n);
    
    % Loesung des Gleichungssystems
    for k = 1:n
      invA(:,k)= solveLR( L, R, P*(d(:).* invA(:,k)));
    end
  end
end