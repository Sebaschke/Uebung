function x = solveHouseholder(V, R, b)
% Angewandte Numerik 1, SoSe 2020
% Uebungsblatt 07, Aufgabe 29: QR-Zerlegung mit Householder-Spiegelungen
%
% Die Funktion x = solveHouseholder(V, R, b) berechnet die die
% Loesung x des linearen Ausgleichsproblems min{x in R^n}(||Ax - b||_2 ^2)
% Dabei sind V und R die von der Matlab-Funktion
% [V, R] = qrHouseholder(A) berechneten Matrizen. b ist der Vektor b
% des linearen Ausgleichsproblems
%
% Input:  V     Linke untere Dreiecksmatrix V = (v_1, v_2, ..., v_n),
%               die in ihren Spalten die Householder-Vektoren v_i der
%               einzelnen Spiegelungen enthaelt
%         R     Rechte obere Dreiecksmatrix der QR-Zerlegung
%         b     Vektor b des linearen Ausgleichsproblems
% Output: x     Loesung x des linearen Ausgleichsproblems
%
% Letzte Aenderung: 09.06.2020

  % Dimension der Matrizen
  [m,n] = size( V );

  % Vektor Q'*b berechnen -------------------------------------------------
  % Wende Householder-Spiegelungen auf den Vektor b an, und
  % zwar in gleicher Reihenfolge wie sie zur Berechnung von R
  % angewendet wurden
  for i = 1:n
    % Householder-Vektor des i-ten Schritts
    v      = V(i:m, i);
    b(i:m) = b(i:m) - 2 / (v'*v) * (v'*b(i:m)) * v;
  end

  % Rueckwaertseinsetzen --------------------------------------------------
  x = zeros(n, 1);
  for i = n:-1:1
    x(i) = (b(i) - R(i,i+1:n) * x(i+1:n)) / R(i,i);
  end
end