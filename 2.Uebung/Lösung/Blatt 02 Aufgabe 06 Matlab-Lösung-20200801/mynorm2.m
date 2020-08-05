function Norm = mynorm2( A, flag )
% Angewandte Numerik 1, Blatt 2, Aufgabe 6:
% Die Function mynorm gibt in Abhaengigkeit vom Eingabeparameter flag
% die 1-Norm (=Spaltensummennorm), die Unendlich-Norm (=Zeilensummennorm)
% oder die Frobenius-Norm der uebergebenen Matrix A zurück
%
% Verbesserte Variante mit String Array, if/else Abfrage und sum Funktion
%
% Bei der Matlab Funktion sum(M,d) gibt der 2. Parameter die Richtung der
% Summantion in der Matrix an: d=1: Summation der Spalten der Matrix M
%                              d=2: Summation der Zeilen der Matrix M
%                              d=[1 2]: Summation aller Elemente der Matrix
%
% Letzte Aenderung: 06.05.2020
%
% Input:  A     Matrix A, von der die Matrix-Normen berechnet werden sollen
%         flag  Flag, das festlegt, ob die Spaltensummennorm, die
%               Zeilensummennorm oder die Frobenius-Norm der Matrix A
%               berechnet werden soll (Character-Vektor oder String)
% Output: Norm  Die berechnete Norm (mit grossem N am Anfang um die Matlab
%               Funktion norm nicht zu ueberschreiben)

  % Initialisierung und Fehlerbehandlung
  % Sicherstellen, dass flag ein Character-Vektor oder ein String ist
  if( ~ischar(flag) && ~isstring(flag) )
    % Fehler: flag ist kein String
    fprintf( "\nEingabevariable flag = %s ist kein String !!\n\n", ...
      string( flag ) );
    % Die Ausgabevariable muss auch im Fehlerfall gesetzt sein
    Norm = -1;
    return;
  end
  
  % Sicherstellen, dass flag ein Zeilenvektor ist, Umwandeln in String
  flag = string( flag(:)' );
  
  % Berechnung der Normen
  if( flag == "one" )
    % Berechnung der 1-Norm = Spaltensummennorm
    Norm = max( sum( abs(A), 1 ) );
  elseif( flag == "infty" )
    % Berechnung der Unendlich-Norm = Zeilensummennorm
    Norm = max( sum( abs(A), 2 ) );
  elseif( flag == "frobenius" )
    % Berechnung der Frobenius-Norm
    % (zunaechst Matrix elementweise quadrieren)
    Norm = sqrt( sum( A.^2, [1 2] ) );
  else
    % Keine bekannte Norm
    fprintf( "\nNorm %s ist nicht bekannt !!\n\n", flag );
    % Die Ausgabevariable muss auch im Fehlerfall gesetzt sein
    Norm = -1;
    return;
  end
end