function [ A, R ] = gaussLR_S1( A )
% Angewandte Numerik 1, SoSe 2020
% Uebungsblatt 04, Aufgabe 13: LR-Zerlegung ohne Pivotisierung
%
% Die Funktion [A, R] = gaussLR2(A) berechnet, falls existent, die
% LR-Zerlegung ohne Pivotisierung einer regulaeren quadratischen Matrix A,
% so dass L*R=A. Durch weitere Vektorisierung ist nur eine Schleife noetig.
% Der Matrix-Zugriff erfolgt spaltenweise.
% Speicheroptimierte Variante: Nur 1 oder 2 Matrizen statt 3 Matrizen sonst
%
% Eingabeparameter:
%       A   Regulaere quadratische nxn-Matrix
%
% Bei Aufruf mit
%   1 Rueckgabeparameter:
%       A   nxn Matrix, enthaelt sowohl die linke untere Dreiecksmatrix L
%           als auch die rechte, obere Dreiecksmatrix R der LR-Zerlegung
%   2 Rueckgabeparametern:
%       A   nxn Matrix, enthaelt die normierte, linke, untere 
%           Dreiecksmatrix L der LR-Zerlegung
%       R   nxn Matrix, enthaelt die rechte, obere Dreiecksmatrix R
%           der LR-Zerlegung
%
% Letzte Aenderung: 21.05.2020

  % Vorbesetzung der Ausgabevariable fuer den Fehlerfall
  R = NaN;
  
  % Groesse der Matrix ermitteln
  [m,n] = size( A );
  
  % Sicherstellen, dass die Matrix quadratisch ist
  if( m ~= n )
    fprintf('\nMatrix ist nicht quadratisch: m = %d, n = %d\n\n', m, n);
    A = NaN;
    return;
  end
    
  % Alle Spalten durchlaufen, bei der letzten Spalte ist nichts zu tun
  for k = 1:n-1
    % Sicherstellen, dass die Zerlegung existiert (keine Division durch 0)
    if( A(k,k) == 0 )
      fprintf(2, ...
        '\nLR-Zerlegung existiert nicht (im Schritt %d) !!\n\n', k);
      A = NaN;
      return;
    end
    
    % Schreibe Komponenten der L Matrix in A Matrix: Durch das Speichern
    % von -L(j,k) ist kein Invertieren der L-Teilmatrizen noetig
    A(k+1:end,k) = A(k+1:end,k)/A(k,k);
      
    % Multipliziere Elemente von L mit der k-ten Zeile
    A(k+1:end,k+1:end) = A(k+1:end,k+1:end) - A(k+1:end,k)*A(k,k+1:end);
  end
  
  % Wenn gewuenscht, gib die Matrizen L(als A) und R zurueck, sonst A
  if( nargout > 1 )
    % Erzeuge die rechte, obere Dreiecksmatrix
    R = triu( A );
    % Erzeuge die linke, untere Dreiecksmatrix, setze Hauptdiagonale auf 1
    A = tril( A, -1 ) + eye( n );
  end
end