% Angewandte Numerik 1, Blatt 2, Aufgabe 6:
%
% Berechnung der 1-Norm (=Spaltensummennorm), der Unendlich-Norm
% (=Zeilensummennorm) und der Frobenius-Norm für zufaellig erzeugte
% Matrizen mit unterschiedlichen Dimensionen und unterschiedlichen
% Wertebereichen.
%
% Letzte Aenderung: 06.05.2020

% Initialisierung
clearvars;
fprintf( "\nAngewandte Numerik 1, Blatt 2, Aufgabe 6\n" );

% Spezifikation der Variante der mynorm Function
mynorm = @mynorm3;

% Es werden 4 verschiedene Matrizen erzeugt
% Anzahl der Zeilen der Matrizen
rows   = [ 4, 5, 3, 7 ];
% Anzahl der Spalten der Matrizen
cols   = [ 4, 3, 6, 5 ];
% Verschiebung des Wertebereichs der rand Funktion
% mit shft = -0.5 Verschiebung des Wertebereichs von [0,1] nach [-0.5,0.5]
shft   = [ 0, -0.5, -0.5, 0 ];
% Skalierung des Wertebereichs der rand Funktion
scal   = [ 50, 200, 30, 100 ];

% Berechnung der Normen der Matrizen
for k = 1:length(rows)
  % Erzeugung der Matrix
  A = ( rand( rows(k), cols(k) ) + shft(k) ) * scal(k);
  
  % Ausgabe der Matrix
  fprintf( "\nMatrix A:\n" );
  disp( A )
  
  % Ausgabe der Spaltensummennorm der Matrix
  fprintf( "Spaltensummennorm von A = %8.4f", mynorm( A, ('one')' ) );
  fprintf( ", Kontrolle mit Matlab norm(A,1)     = %8.4f\n", norm(A, 1) );
  
  % Ausgabe der Zeilensummennorm der Matrix
  fprintf( "Zeilensummennorm  von A = %8.4f", mynorm( A, 'infty' ) );
  fprintf( ", Kontrolle mit Matlab norm(A,Inf)   = %8.4f\n", ...
    norm(A, Inf) );
  
  % Ausgabe der Frobenius-Norm der Matrix
  fprintf( "Frobenius-Norm    von A = %8.4f", mynorm( A, 'frobenius' ) );
  fprintf( ", Kontrolle mit Matlab norm(A,'fro') = %8.4f\n\n", ...
    norm(A, 'fro') );
end