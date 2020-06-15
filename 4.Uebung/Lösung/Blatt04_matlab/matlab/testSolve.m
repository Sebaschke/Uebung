% Angewandte Numerik 1, SoSe 2020
% Uebungsblatt 04, Aufgabe 15:
% LR-Zerlegung mit Skalierung und Spalten-Pivotisierung
%
% testSolve vergleicht die LR-Zerlegung
%   ohne Pivotisierungstrategie (Funktion gaussLR) und
%   mit Skalierung und Spalten-Pivotisierung (Funktion lrPivot)
% anhand der erhaltenen Loesung bei verschiedenen Gleichungssysteme
%
% Letzte Aenderung: 21.05.2020

clearvars;
close all;
clc;

% Initialisierungen
fprintf('\nAngewandte Numerik 1, Sommersemester 2020\n');
fprintf('Uebungsblatt 4, Aufgabe 15: LR-Zerlegung mit Skalierung und ');
fprintf('Spaltenpivotisierung\n\n');
fprintf('Vergleiche LR-Zerlegung ohne und mit Pivotisierung\n\n');

gaussLR = @gaussLR_S2;  % Spezifikation der Variante der gaussLR_VN
                        % Functions mit N=1,2,3: Anzahl der Schleifen
                        % und V=S,Z: Spaltenweiser oder zeilenweiser
                        % Matrixzugriff
lrPivot = @lrPivot_S2;  % Spezifikation der Variante der lrPivot_VN
                        % Functions mit N=1,2: Anzahl der Schleifen
                        % und V=S,Z: Spaltenweiser oder zeilenweiser
                        % Matrixzugriff

tol = 1e-13;            % Geforderte Genauigkeit der Berechnungen
fprintf('Akzeptierter Fehler: %g\n', tol);

% Untersuchung der Testfaelle
for bsp = [1 2 3 4]
  % Testfaelle
  switch bsp
    case 1
      A = [0, 1; 1, 1];
      b = [1; 1];
    case 2
      A = [11, 44, 1; 0.1, 0.4, 3; 0, 1, -1];
      b = [1; 1; 1];
    case 3
      A = [0.001, 1, 1; -1, 0.004, 0.004; -1000, 0.004, 0.000004];
      b = [1; 1; 1];
    case 4
      A = [ 5, 3, 0, 9; 4, 7, 0, 3; 9, 6, 0, 7; 2, 4, 0, 8];
      b = [1; 1; 1; 1];
    otherwise
      error('Testfall %d nicht implementiert', bsp)
  end
    
  % Testfall und exakte Loesung ausgeben
  fprintf('\n*********************************************************\n');
  % Exakte Loesung
  warnid = 'MATLAB:singularMatrix';
  warning('off', warnid);
  xExakt = A\b;
  warning('on', warnid);
  
  fprintf('\nTestfall %d:\n', bsp);
  fprintf('Matrix A:\n');                disp(A);
  fprintf('Rechte Seite b:\n');          disp(b);
  fprintf('Exakte Loesung xExakt:\n');   zeigeMatrix(xExakt);
    
  % Testfall ohne Pivotisierung mit gaussLR loesen
  fprintf('\n---------------------------------------------------------\n');
  fprintf('\nTestfall %d ohne Pivotisierungsstrategie:\n', bsp);
  
  % LR-Zerlegung ohne Pivotisierung
  [L, R] = gaussLR(A);
  
  if any( isnan(L), 'all' )
    % LR-Zerlegung fehlgeschlagen
    fprintf(2, 'Testfall %d ohne Pivotisierung fehlgeschlagen\n', bsp);
    err = NaN;
  else
    fprintf('\nMatrix L:\n');                zeigeMatrix(L);
    fprintf('\nMatrix R:\n');      	         zeigeMatrix(R);

    % Berechnung der Näherungslösung   
    xG  = solveLR( L, R, b);
    fprintf('\nNaeherungsloesung xG:\n');    zeigeMatrix(xG);
  
    % Fehler der Naeherungsloesung
    err = xExakt - xG;
    fprintf('\nFehler der Naeherungsloesung:\n');
    fprintf('%21.16f\n', err);
  end
    
  % Testfall mit Skalierung und Spalten-Pivotisierung mit lrPivot loesen
  fprintf('\n---------------------------------------------------------\n');
  fprintf('\nTestfall %d mit Skalierung und Spalten-Pivotisierung:\n', ...
    bsp);
  
  % LR-Zerlegung mit Skalierung und Spalten-Pivotisierung
  [L, R, P, d] = lrPivot(A);
  
  if any( isnan(L), 'all' )
    % LR-Zerlegung fehlgeschlagen
    fprintf(2, 'Testfall %d mit Pivotisierung fehlgeschlagen\n\n', bsp);
    errP = NaN;
  else
    fprintf('\nMatrix L:\n');                 zeigeMatrix(L);
    fprintf('\nMatrix R:\n');      	          zeigeMatrix(R);
    fprintf('\nPermutations-Matrix P:\n');    disp(P);

    % Berechnung der Näherungslösung   
    xGP = solveLR( L, R, P*(d(:).*b));
    fprintf('Naeherungsloesung xGP:\n');      zeigeMatrix(xGP);
  
    % Fehler der Naeherungsloesung
    errP = xExakt - xGP;
    fprintf('\nFehler der Naeherungsloesung:\n');
    fprintf('%21.16f\n', errP);
  end
  
  fprintf('                                       ');
  fprintf('ohne Pivotisierung   mit Pivotisierung\n');
  fprintf('Maximale Abweichung in den Komponenten:  %10.9g', ...
    max(abs(err)) );
  fprintf('         %10.8g\n', max(abs(errP)) );
  fprintf('Relativer Fehler in euklidischen Norm:   %10.9g', ...
    norm(err) / norm(xExakt) );
  fprintf('         %10.8g\n', norm(errP) / norm(xExakt) );
  fprintf('Relativer Fehler in Maximums-Norm:       %10.9g', ...
    norm(err,Inf) / norm(xExakt,Inf) );    
  fprintf('         %10.8g\n', norm(errP,Inf) / norm(xExakt,Inf) );
end