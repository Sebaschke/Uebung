function [L, R, P, d] = lrPivot_S2(A)
% Angewandte Numerik 1, SoSe 2020
% Uebungsblatt 04, Aufgabe 15:
% LR-Zerlegung mit Skalierung und Spalten-Pivotisierung mit 2 Schleifen.
%
% Die Funktion [L, R, P, d] = lrPivot(A) berechnet zu einer Matrix A
% die LR-Zerlegung von A mit Skalierung und Spalten-Pivotisierung,
% also Matrizen L, R, P und D so, dass gilt P*D*A = L*R.
%
% Die aufgrund der Spaltenpivotisierung zu vertauschenden Zeilen werden 
% tatsaechlich getauscht, also umkopiert.
%
% Der Matrix-Zugriff erfolgt spaltenweise.
% Matrizen werden in Matlab spaltenweise abgespeichert. Daher ist ein
% spaltenweiser Matrix-Zugriff performanter.
% 
% Parameter:
%   A   Regulaere nxn-Matrix, deren LR-Zerlegung berechnet werden soll
%
% Rueckgabewerte:
%   L   Normierte, linke, untere nxn-Dreiecksmatrix
%   R   Rechte, obere nxn-Dreiecksmatrix
%   P   Permutationsmatrix, so dass P*A = L*R
%   d   Vektor der Elemente der Skalierungs-Matrix D
%
% Letzte Aenderung: 21.05.2020

  % Vorbesetzung der Ausgabevariablen fuer den Fehlerfall
  L = NaN;
  R = NaN;

  % Groesse der Matrix ermitteln
  [m,n] = size( A );
  
  % Sicherstellen, dass die Matrix quadratisch ist
  if( m ~= n )
    fprintf(2, '\nMatrix ist nicht quadratisch: m = %d, n = %d\n\n', ...
      m, n);
    P = NaN;
    d = NaN;
    return;
  end
  
  % Permutationsmatrix initialisieren, noch sind keine Zeilen vertauscht
  P = eye(n);

  % Skalierung (Zeilen-Aequilibrierung mit 1-Norm)
  [d,A] = scaleMat( A, 'one', 'rows' );

  % LR-Zerlegung berechnen
  % Alle Spalten durchlaufen, bei der letzten Spalte ist nichts zu tun
  for k = 1:n-1
    % Betrachte Restmatrix ab der k-ten Spalte und der k-ten Zeile
    
    % Betragsgroesstes Element aMax der 1. Spalte dieser Restmatrix suchen
    % indMax ist Zeilennummer von aMax
    [aMax, indMax] = max(abs(A(k:n,k)));
    
    % LR-Zerlegung moeglich?
    if( aMax == 0 )
      fprintf(2, ...
        '\nKeine LR-Zerlegung der Matrix möglich (Schritt %d) !\n\n', k);
      P = NaN;
      d = NaN;
      return;
    end
    
    % Nur pivotisieren, wenn betragsgroesstes Element der 1. Spalte der 
    % Restmatrix nicht in 1. Zeile der Restmatrix steht.
    if( indMax > 1 )
      % Oberhalb der Restmatrix sind weitere k-1 Zeilen
      indMax      = indMax + k-1; 

      % Zeile des betragsgroessten Elements mit erster Zeile der
      % Restmatrix tauschen
      % Mit A wird auch L getauscht, das entspricht P_k * L_(k-1) * P_k
      tmp         = A(indMax,:);
      A(indMax,:) = A(k,:);
      A(k,:)      = tmp;

      % Entsprechende Zeilen der Permutationsmatrix tauschen
      tmp         = P(indMax,:);
      P(indMax,:) = P(k,:);
      P(k,:)      = tmp;
    end
    
    % Schreibe Komponenten der L Matrix in A Matrix: Durch das Speichern
    % von -L(j,k) ist kein Invertieren der L-Teilmatrizen noetig
    A(k+1:end,k) = A(k+1:end,k)/A(k,k);
    
    % Alle Zeilen unterhalb der Diagonalen bearbeiten
    for l = k+1:n
      % Multipliziere Element von L mit der k-ten Zeile, fuege das
      % zu den restlichen Spalten der j-ten Zeile
      A(k+1:n,l) = A(k+1:n,l) - A(k+1:n,k) * A(k,l);
    end
  end

  % Die rechte, obere Dreiecksmatrix R aus der Matrix A extrahieren
  R = triu(A);
  % Die linke, untere Dreiecksmatrix L aus der Matrix A extrahieren
  L = tril(A, -1) + eye(n);
end