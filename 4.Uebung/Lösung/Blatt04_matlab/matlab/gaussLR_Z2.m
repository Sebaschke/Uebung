function [ L, R ] = gaussLR_Z2( A )
% Angewandte Numerik 1, SoSe 2020
% Uebungsblatt 04, Aufgabe 13: LR-Zerlegung ohne Pivotisierung
%
% Die Funktion [L, R] = gaussLR(A) berechnet, falls existent, die
% LR-Zerlegung ohne Pivotisierung einer regulaeren quadratischen Matrix A,
% so dass L*R=A. Die LR-Zerlegung erfolgt mit 2 Schleifen.
% Der Matrix-Zugriff erfolgt zeilenweise.
%
% Input:  A     Regulaere quadratische nxn-Matrix
% Output: L     Normierte linke, untere nxn-Dreiecksmatrix
%         R     Rechte, obere nxn-Dreiecksmatrix
%
% Letzte Aenderung: 21.05.2020

  % Vorbesetzung der Ausgabevariablen fuer den Fehlerfall
  L = NaN;
  R = NaN;
  
  % Groesse der Matrix ermitteln
  [m,n] = size( A );
  
  % Sicherstellen, dass die Matrix quadratisch ist
  if( m ~= n )
    fprintf(2, '\nMatrix ist nicht quadratisch: m = %d, n = %d\n\n !!', ...
      m, n);
    return;
  end
    
  % Alle Spalten durchlaufen, bei der letzten Spalte ist nichts zu tun
  for k = 1:n-1
    % Sicherstellen, dass die Zerlegung existiert (keine Division durch 0)
    if( A(k,k) == 0 )
      fprintf(2, ...
        '\nLR-Zerlegung existiert nicht (im Schritt %d) !!\n\n', k);
      return;
    end
    
    % Alle Zeilen unterhalb der Diagonalen bearbeiten
    for j = k+1:n
      % Schreibe Komponenten der L Matrix:
      % Durch das Speichern von -L(j,k) ist kein Invertieren der
      % L-Teilmatrizen noetig: A(j,k) = -L(j,k) = A(j,k)/A(k,k)
      A(j,k) = A(j,k) / A(k,k);
      
      % Multipliziere Element von L mit der k-ten Zeile, fuege das
      % zu den restlichen Spalten der j-ten Zeile
      A(j,k+1:n) = A(j,k+1:n) - A(j,k) * A(k,k+1:n);
    end
  end

  % Erzeuge die rechte, obere Dreiecksmatrix
  R = triu( A );
  % Erzeuge die linke, untere Dreiecksmatrix, setze Hauptdiagonale auf 1
  L = tril( A, -1 ) + eye( n );
end