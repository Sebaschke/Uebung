% Angewandte Numerik 1, SoSe 2020
% Uebungsblatt 07, Aufgabe 29: QR-Zerlegung mit Householder-Spiegelungen
%
% Berechnet die Loesung x des linearen Ausgleichsproblems
% min{x in R^n}(||Ax - b||^2) mit Householder Spiegelung
%
% Letzte Aenderung: 09.06.2020

% Cleanup
clearvars
close all
clc

% Initialisierung ---------------------------------------------------------
fprintf('\nAngewandte Numerik 1, Sommersemester 2020\n');
fprintf( ['Uebungsblatt 7, Aufgabe 29d: QR-Zerlegung mit ', ...
  'Householder Spiegelung'] );
fprintf('\nLoest das lineare Ausgleichsproblem min(|| Ax - b ||^2)');
fprintf(' aus Aufgabe 28d\n\n');

A = [ 1 1; ... 
      1 2; ...
      1 2; ...
      1 5 ];
b = [ 2; 2; 4; 6 ];

% Loesung des linearen Ausgleichsproblems ---------------------------------
fprintf( 'Lineares Ausgleichsproblems min{x in R^n}(||Ax - b||^2): \n' );
fprintf( '                ( %d  %d )       ( %d )\n', A(1,:), b(1) );
fprintf( '  A * x = b :   ( %d  %d ) * x = ( %d )\n', A(2,:), b(2) );
fprintf( '                ( %d  %d )       ( %d )\n', A(3,:), b(3) );
fprintf( '                ( %d  %d )       ( %d )\n', A(4,:), b(4) );

% Householder Spiegelung
[V, R] = qrHouseholder(A);

% Loesung des linearen Ausgleichsproblems
x      = solveHouseholder(V, R, b);

fprintf( '\nLoesung des linearen Ausgleichsproblems:\n');
fprintf( '  x = ( %d )\n', x(1) );
fprintf( '      ( %d )\n', x(2) );

% Test
A = [1 -11/12 3;
    2 0 0;
    2 -1 6];
[V, R] = qrHouseholder(A)