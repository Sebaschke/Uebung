% Angewandte Numerik 1, SoSe 2020
% Uebungsblatt 04, Aufgabe 13: LR-Zerlegung ohne Pivotisierung
%
% Testprogramm fuer die Funktion [L, R] = gaussLR(A):
% Berechnung der LR-Zerlegung ohne Pivotisierung einer regulaeren 
% quadratischen Matrix A, so dass L*R=A.
%
% Letzte Aenderung: 21.05.2020

clearvars;
close all;
clc;

% Initialisierungen
fprintf('\nAngewandte Numerik 1, Sommersemester 2020\n');
fprintf('Uebungsblatt 4, Aufgabe 13: LR-Zerlegung mit Gauss\n');
fprintf('\nTeste Berechnung der LR-Zerlegung mit Gauss\n\n');

gaussLR = @gaussLR_S1;  % Spezifikation der Variante der gaussLR_VN
                        % Functions mit N=1,2,3: Anzahl der Schleifen
                        % und V=S,Z: Spaltenweiser oder zeilenweiser
                        % Matrixzugriff
                        
ausgabe = true;         % Ausfuehrliche Ausgabe der Testfaelle
tol     = 1e-13;        % Geforderte Genauigkeit der Berechnungen
fprintf('Akzeptierter Fehler: %g\n', tol);

% Untersuchung der Testfaelle
testfall = 0;
while 1
  testfall = testfall + 1;       % naechster Testfall
      
  % Alle Testfaelle definieren
  switch testfall
    case 1                       % Testfall 1: Aufgabe 12
       A = [  6  -4   7;
            -12   5 -12;
             18   0  22];
    case 2                       % Testfall 2
       A = rand(3);
    case 3                       % Testfall 3
       A = (rand(5) - 0.5) * 200;
    case 4                       % Testfall 4
       A = rand(7) * 50;
    case 5                       % Testfall 5: Keine LR-Zerlegung moeglich
       A = [0 1;
            1 0];
    otherwise
       break;                    % keine Testfaelle mehr vorhanden
  end
  
  % Testfall durchfuehren und ausgeben
  if ausgabe
    fprintf('\n******************************************************\n');
    fprintf('\nTestfall %d:\n', testfall);
    fprintf('Berechne LR-Zerlegung der Matrix\n'); disp(A);
  end
    
  % LR-Zerlegung der Testfalls
  [L,R] = gaussLR(A);
  LR    = L*R;
  
  % Ueberpruefen, ob die LR-Zerlegung erfolgreich war
  if any( isnan(LR), 'all' )
    % LR-Zerlegung fehlgeschlagen
    fprintf(2, 'Testfall %d fehlgeschlagen\n', testfall);
  else
    % Erfolgreich: Ausgabe der LR-Zerlegung
    if ausgabe
      fprintf('L:\n'); disp(L);
      fprintf('R:\n'); disp(R);
      fprintf('L*R:\n'); disp(LR);
    end
    
    % Testfall bewerten
    err = max( abs( LR - A ),[], 'all' );
    spezString = 'Testfall %d: Mit Fehler %g %s.\n';
    if( err < tol )
      fprintf(spezString, testfall, err, 'bestanden');
    else
      fprintf(2, spezString, testfall, err, 'fehlgeschlagen');
    end
  end
end