function Norm = mynorm1( A, flag )
% Angewandte Numerik 1, Blatt 2, Aufgabe 6:
% Die Function mynorm gibt in Abhaengigkeit vom Eingabeparameter flag
% die 1-Norm (=Spaltensummennorm), die Unendlich-Norm (=Zeilensummennorm)
% oder die Frobenius-Norm der uebergebenen Matrix A zurueck
%
% Einfache Variante mit Character Array, if/else Abfrage und for Loop
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
  
  % Sicherstellen,dass flag ein Zeilenvektor ist(fuer Vergleich mit strcmp)
  flag = flag(:)';
  
  % Groesse der Matrix bestimmen
  [m,n] = size( A );
  
  % Initialisierung der Arrays
  % Spaltensummen
  ssum = zeros( 1, n );
  % Zeilensummen
  zsum = zeros( 1, m );
  
  % Berechnung der Normen
  if strcmp( flag, 'one' )
    % Berechnung der 1-Norm = Spaltensummennorm
    for ks = 1:n
      for kz = 1:m
        ssum(ks) = ssum(ks) + abs( A(kz,ks) );
      end
    end
    Norm = max( ssum );
  elseif strcmp( flag, 'infty' )
    % Berechnung der Unendlich-Norm = Zeilensummennorm
    for kz = 1:m
      for ks = 1:n
        zsum(kz) = zsum(kz) + abs( A(kz,ks) );
      end
    end
    Norm = max( zsum );
  elseif strcmp( flag, 'frobenius' )
    % Berechnung der Frobenius-Norm
    fsum = 0;
    for ks = 1:n
      for kz = 1:m
        fsum = fsum + ( A(kz,ks) )^2;
      end
    end
    Norm = sqrt( fsum );
  else
    % Keine bekannte Norm
    fprintf( "\nNorm %s ist nicht bekannt !!\n\n", flag );
    % Die Ausgabevariable muss auch im Fehlerfall gesetzt sein
    Norm = -1;
    return;
  end
end