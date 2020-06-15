% Angewandte Numerik 1, SoSe 2020
% Uebungsblatt 04, Aufgabe 15:
% LR-Zerlegung mit Skalierung und Spalten-Pivotisierung
%
% testA14 loest das Gleichungssystem Ax = b aus Aufgabe 14 numerisch
% mit Skalierung und Spaltenpivotisierung
%
% Letzte Aenderung: 21.05.2020

clearvars;
close all;
clc;

% Initialisierungen
fprintf('\nAngewandte Numerik 1, Sommersemester 2020\n');
fprintf('Uebungsblatt 4, Aufgabe 15: LR-Zerlegung mit Skalierung und ');
fprintf('Spaltenpivotisierung\n\n');
fprintf('Loest das Gleichungssystem Ax = b aus Aufgabe 14\n');

lrPivot = @lrPivot_S1;  % Spezifikation der Variante der lrPivot Function

% Definition des Testfalls
A = [ 2  3 -1  0; ...
     -6 -5  0  2; ...
      2 -5  6 -6; ...
      4  6  2 -3];
b = [20; -33; -43; 49];

% Testfall und exakte Loesung ausgeben
fprintf('\n*********************************************************\n');
% Exakte Loesung
warnid = 'MATLAB:singularMatrix';
warning('off', warnid);
xExakt = A\b;
warning('on', warnid);

format rat;
fprintf('\nMatrix A:\n');              disp(A);
fprintf('Rechte Seite b:\n');          disp(b);
fprintf('Exakte Loesung xExakt:\n');   disp(xExakt);

% Testfall mit Skalierung und Spalten-Pivotisierung mit lrPivot loesen
fprintf('---------------------------------------------------------\n');
fprintf('\nTestfall mit Skalierung und Spalten-Pivotisierung:\n');

% LR-Zerlegung mit Skalierung und Spalten-Pivotisierung
[L, R, P, d] = lrPivot(A);

if any( isnan(L), 'all' )
  % LR-Zerlegung fehlgeschlagen
  fprintf(2, 'Testfall mit Pivotisierung fehlgeschlagen\n\n');
  errP = NaN;
else
  fprintf('\nMatrix L:\n');                         disp(L);
  fprintf('Matrix R:\n');      	                    disp(R);
  fprintf('Permutations-Matrix P:\n');              disp(P);
  fprintf('Diagonalmatrix der Skalierung D:\n');    disp(diag(d));

  % Berechnung der Naeherungsloesung   
  xGP = solveLR( L, R, P*(d(:).*b));
  fprintf('Naeherungsloesung xGP:\n');      disp(xGP);

  % Fehler der Naeherungsloesung
  errP = xExakt - xGP;
  fprintf('Fehler der Naeherungsloesung:\n');
  fprintf('%21.16f\n', errP);
end

fprintf('\nMaximale Abweichung in den Komponenten:  %10.9g\n', ...
  max(abs(errP)) );
fprintf('Relativer Fehler in euklidischen Norm:   %10.9g\n', ...
  norm(errP) / norm(xExakt) );
fprintf('Relativer Fehler in Maximums-Norm:       %10.9g\n', ...
  norm(errP,Inf) / norm(xExakt,Inf) );
format short;