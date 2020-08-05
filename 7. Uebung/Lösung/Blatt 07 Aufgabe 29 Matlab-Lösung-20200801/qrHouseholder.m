function [ V, R ] = qrHouseholder( R )
% Angewandte Numerik 1, SoSe 2020
% Uebungsblatt 07, Aufgabe 29: QR-Zerlegung mit Householder-Spiegelungen
%
% Die Funktion [V, R] = qrHouseholder(A) berechnet die QR-Zerlegung
% einer Matrix A in R^{mxn} mittels Householder-Spiegelungen.
% Dabei ist R die rechte obere Dreiecksmatrix der QR-Zerlegung der
% Matrix A. Die linke untere Dreiecksmatrix V = (v_1, v_2, ..., v_n)
% enthaelt in ihren Spalten die Householder-Vektoren v_i der einzelnen
% Spiegelungen.
%
% Input:  R     Matrix deren QR-Zerlegung berechnet werden soll
% Output: V     Linke untere Dreiecksmatrix V = (v_1, v_2, ..., v_n)
%               die in ihren Spalten die Householder-Vektoren vi der
%               einzelnen Spiegelungen enthaelt
%         R     Rechte obere Dreiecksmatrix der QR-Zerlegung
%
% Letzte Aenderung: 09.06.2020

  % Signum Funktion
  sgn = @(x) (x>=0)-(x<0);
  
  % Dimension der Matrix
  [m,n] = size(R);
  
  % Dimension der unteren Dreiecksmatrix fuer die Householder Vektoren
  V     = zeros( m, n );
  
  for j = 1:n
    % Householder Vektor
    v = R(j:m,j);
    v(1) = v(1) + sgn( v(1) ) * norm( v );
    
    % Householder Spiegelung
    R(j:m,j:n) = R(j:m,j:n) - 2 / (v'*v) * v * ( v' * R(j:m,j:n) );
    
    % Householder Vektoren speichern
    V(j:m,j) = v;
  end
end