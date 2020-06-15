function [ d, A ] = scaleMat( A, Norm, type )
% Angewandte Numerik 1, Blatt 4, Aufgabe 15
%
% Fuer eine regulaere Matrix A in R^(n x n) wird ein Vektor d erzeugt, mit
% dem mit A=diag(d)*A eine Zeilen-Aequilibrierung bzw. mit A=A*diag(d) eine
% Spalten-Aequilibrierung durchgefuehrt wird.
% (Modifizierte Version der Function normalizeMat aus Blatt 3, Aufgabe 8)
%
% Input:  A       Die zu aequilibrierende regulaere Matrix
%         Norm    Ein String, der festlegt, ob bezueglich der Maximumnorm
%                 (norm == ’infty’) oder bezueglich der Summennorm 
%                 (norm == ’one’) aequilibriert werden soll
%         type    Ein String, der die Art der Aequilibrierung festlegt.
%                 Es soll gelten:
%                   ||(DA)_i||=1, für alle i in {1,...,n}, 
%                        falls type == ’rows’ ist, wobei (DA)_i die
%                        i-te Zeile der Matrix DA ist
%                   ||(DA)_j||=1, für alle j in {1,...,n},
%                        falls type == ’cols’ ist, wobei (DA)_j die
%                        die j-te Spalte der Matrix AD bezeichnen
% Output: d       Vektor, mit dem die Matrix A aequlilibriert werden kann
%         A       Die aequlilibrierte Matrix

  % Initialisierung und Fehlerbehandlung
  % Die Ausgabevariablem muessen auch im Fehlerfall gesetzt sein
  d = NaN;
  
  % Sicherstellen, dass Norm ein Character-Vektor oder ein String ist
  if( ~ischar(Norm) && ~isstring(Norm) )
    % Fehler: Norm ist kein String
    fprintf( "\nEingabevariable Norm = %s ist kein String !!\n\n", ...
      string( flag ) );
    A = NaN;
    return;
  end
  
  % Sicherstellen, dass type ein Character-Vektor oder ein String ist
  if( ~ischar(type) && ~isstring(type) )
    % Fehler: type ist kein String
    fprintf( "\nEingabevariable Norm = %s ist kein String !!\n\n", ...
      string( flag ) );
    A = NaN;
    return;
  end
  
  % Sicherstellen, dass Norm, type Zeilenvektoren sind, umwandeln in String
  Norm = string( Norm(:)' );
  type = string( type(:)' );
  
  if( type == "cols" )
    % Transponieren der Matrix bei Spalten-Aequilibrierung
    A = A';
  elseif( type ~= "rows" )
    fprintf( "\nFalscher Type %s eingegeben\n\n", type );
    A = NaN;
    return;
  end
    
  % Aequilibrierung
  switch Norm
    case "one"
      w = sum( abs( A ), 2 );
      % Alternativ: w = abs(A)*ones(length(A),1);
    case "infty"
      w = max( abs( A ), [], 2 );
      % Alternativ: w = max(abs(A'));
    otherwise
      fprintf( "\nFalsche Norm %s eingegeben\n\n", Norm );
      A = NaN;
      return;
  end
  
  % Matrix regulaer?
  if( prod( w ) == 0 )
    fprintf('\nMatrix A kann nicht aequlilibriert werden\n\n');
    A = NaN;
    return;
  end
  
  % Vektor, mit dem die Matrix A aequlilibriert werden kann
  d = 1 ./ w;
  
  % Aequlilibrierte Matrix
  if( type == "rows" )
    A = diag(d) * A;
  else
    A = A' * diag(d);
  end
end