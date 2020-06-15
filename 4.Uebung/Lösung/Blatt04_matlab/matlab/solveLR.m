function x = solveLR(L, R, b)
% Angewandte Numerik 1, SoSe 2020
% Uebungsblatt 04, Aufgabe 13: LR-Zerlegung ohne Pivotisierung
%
% Die Funktion x = solveLR(L, R, b) berechnet die
% Loesung des linearen Gleichungssystems L*R*x = b
% durch Vorwaerts- und Rueckwaertseinsetzen
%
% Input:    L 	Normierte linke untere Dreiecksmatrix
%           R   Rechte obere Dreiecksmatrix
%           b   Rechte Seite b des linearen Gleichungssystems L*R*x = b
% Output:   x   Loesung des linearen Gleichungssystems L*R*x = b
%
% Letzte Aenderung: 21.05.2020

  % Sicherstellen, dass b ein Spaltenvektor ist
  b = b(:);

  % Dimension des Gleichungssystems
  n = length(b);
  
  % Initialisierung der Vektoren
  x = zeros(n, 1);
  y = zeros(n, 1);
  
  % Vorwaertseinsetzen: Loesung des LGS L*y = b
  for k = 1:n
    y(k) = b(k) - L(k,1:k-1) * y(1:k-1);
  end

  % Rueckwaertseinsetzen: Loesung des LGS R*x = y
  for k = n:-1:1
    x(k) = (y(k) - R(k,k+1:n) * x(k+1:n)) / R(k,k);
  end
end