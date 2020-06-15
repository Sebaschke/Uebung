% Angewandte Numerik 1, SoSe 2020
% Uebungsblatt 04, Aufgabe 13: LR-Zerlegung ohne Pivotisierung
%
% Testprogramm fuer die Loesung des linearen Gleichungssystems Ax = b mit
% LR-Zerlegung (Funktion [A] = gaussLR(A)), wobei die zurueckgegebene
% Matrix A sowohl die linke untere nxn-Dreiecksmatrix L als auch die
% rechte, obere nxn-Dreiecksmatrix R der LR-Zerlegung enthaelt.
% Anschliessend erfolgt die Loesung des linearen Gleichungssystems LRx = b
% durch Vorwaerts- und Rueckwaertseinsetzen (Funktion x = solveLR2(A, b)).
% Speicheroptimierte Variante.
%
% Letzte Aenderung: 21.05.2020

clearvars;
close all;
clc;

% Initialisierungen
fprintf('\nAngewandte Numerik 1, Sommersemester 2020\n');
fprintf('Uebungsblatt 4, Aufgabe 13: LR-Zerlegung mit Gauss\n\n');
fprintf('Teste Berechnung der Loesung Linearer Gleichungssysteme\n\n');

gaussLR = @gaussLR_S1;  % Spezifikation der Variante der gaussLR Function
                        
ausgabe = true;         % ausfuehrliche Ausgabe der Testfaelle
tol = 1e-13;            % Geforderte Genauigkeit der Berechnungen
fprintf('Akzeptierter Fehler: %g\n', tol);

% Untersuchung der Testfaelle
testfall = 0;
while 1
  testfall = testfall + 1;    % naechster Testfall
    
  % alle Testfaelle definieren
  switch testfall
    case 1                  % Testfall 1: Aufgabe 11
      A      = [  6  -4   7;
                -12   5 -12;
                 18   0  22];
      b      = [41/12; -22/3; 29/2];
      xExakt = [1/2; 1/3; 1/4];

    case 2                  % Testfall 2
      A      = rand(3);
      xExakt = ones(3, 1);
      b      = A * xExakt;

    case 3                  % Testfall 3
      A      = rand(5);
      xExakt = rand(5, 1);
      b      = A * xExakt;
      
    case 4                  % Testfall 4
      A      = rand(7);
      xExakt = ones(7, 1) * 7;
      b      = A * xExakt;
              
    otherwise
      break;              % keine Testfaelle mehr vorhanden
  end
    
  % Testfall durchfuehren und ausgeben
  if ausgabe
    fprintf('\n******************************************************\n');
    fprintf('\nTestfall %d:\n', testfall);
    fprintf('Matrix A:\n'); disp(A);
    fprintf('Rechte Seite b:\n'); disp(b);
    fprintf('Exakte Loesung xExakt:\n'); disp(xExakt);
  end
  
  % LR-Zerlegung der Testfalls
  A = gaussLR(A);
  
  % Ueberpruefen, ob die LR-Zerlegung erfolgreich war
  if any( isnan(A), 'all' )
    % LR-Zerlegung fehlgeschlagen
    fprintf(2, 'Testfall %d fehlgeschlagen\n', testfall);
  else
    % Erfolgreich: Ausgabe der LR-Zerlegung
    if ausgabe
      fprintf('A:\n'); disp(A);
    end
    
    % Loesung des LGS LRx = b durch Vorwaerts- und Rueckwaertseinsetzen
   	x = solveLR2(A, b);
    
    % Berechnete Loesung des LGS Ax = b
    if ausgabe
        fprintf('Berechnete Loesung x des LGS Ax=b:\n');
        fprintf('%21.16f\n', x);
    end

    % Testfall bewerten
    err = max( abs( x - xExakt ) );
    spezString = '\nTestfall %d: Mit Fehler %g %s.\n';
    if( err < tol )
      fprintf(spezString, testfall, err, 'bestanden');
    else
      fprintf(2, spezString, testfall, err, 'fehlgeschlagen');
    end
  end
end