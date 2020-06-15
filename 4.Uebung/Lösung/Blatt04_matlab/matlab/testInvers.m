% Angewandte Numerik 1, SoSe 2020
% Uebungsblatt 04, Aufgabe 15:
% LR-Zerlegung mit Skalierung und Spalten-Pivotisierung
%
% testInvers berechnet die Inverse von Matrizen mit LR-Zerlegung
% mit Skalierung und Spaltenpivotisierung und bestimmt den Fehler
%
% Letzte Aenderung: 21.05.2020

clearvars;
close all;
clc;

% Initialisierungen
fprintf('\nAngewandte Numerik 1, Sommersemester 2020\n');
fprintf('Uebungsblatt 4, Aufgabe 15: LR-Zerlegung mit Skalierung und ');
fprintf('Spaltenpivotisierung\n\n');
fprintf('Inverse einer Matrix mit LR-Zerlegung und Pivotisierung\n');

% Untersuchung der Testfaelle
for bsp = [1 2 3]
  % Testfaelle
  switch bsp
    case 1
      A = [ 0  1; ...
            1  1 ];
    case 2
      A = [ 5  3  0  9; ...
            4  7  0  3; ...
            9  6  0  7; ...
            2  4  0  8];
    case 3
      A = [ 2  3 -1  0; ...
           -6 -5  0  2; ...
            2 -5  6 -6; ...
            4  6  2 -3];
    otherwise
      error('Testfall %d nicht implementiert', bsp)
  end
  fprintf('\n*********************************************************\n');
  fprintf('\nTestfall %d:\n', bsp);
  fprintf('\nMatrix A:\n');                disp(A);
  
  % Exakte Loesung
  warnid = 'MATLAB:singularMatrix';
  warning('off', warnid);
  invExakt = inv(A);
  warning('on', warnid);
  
  fprintf('Exakte Loesung Matlab inv(A):\n');   zeigeMatrix(invExakt);
  
  % Inverse Matrix berechnen
  [invA] = inversMat( A );
  
  if any( isnan(invA), 'all' )
    % Matrix Invertierung fehlgeschlagen
    err = NaN;
  else
    % Inverse Matrix
    fprintf('\nInverse Matrix invA:\n');   zeigeMatrix(invA);
    
    % Fehler der Naeherungsloesung
    err = invExakt - invA;
    fprintf('\nFehler der Naeherungsloesung: inv(A) - invA\n');
    zeigeMatrix(err);
    fprintf('\nMaximale Abweichung in den Komponenten:  %10.9g\n', ...
      max( abs(err), [], 'all') );
    fprintf('Relativer Fehler in euklidischen Norm:   %10.9g\n', ...
      norm(err) / norm(invExakt) );
    fprintf('Relativer Fehler in Maximums-Norm:       %10.9g\n', ...
      norm(err,Inf) / norm(invExakt,Inf) );
    
    % Fehler invA * A - eye(n)
    n    = size( A, 1 );
    err1 = invA * A - eye(n);
    fprintf('\nFehler: invA * A - eye(n)\n');
    zeigeMatrix(err1);
    
    % Fehler A * invA - eye(n)
    err2 = A * invA - eye(n);
    fprintf('\nFehler: A * invA - eye(n)\n');
    zeigeMatrix(err2);
  end
end