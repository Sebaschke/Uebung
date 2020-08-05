function intApprox = linkeRechteckSumme( f, a, b, n )
% Angewandte Numerik 1, SoSe 2020
% Uebungsblatt 12, Aufgabe 54: Zusammengesetzte Quadraturformeln
%
% Berechnet das Integral der Funktion f auf dem Intervall [a,b]
% mit Hilfe der summierten linken Rechteckregel.
%
% Input:  f           Integrand als function handle
%         a           1. Intervallgrenze
%         b           2. Intervallgrenze
%         n           Anzahl der Teilintervalle
% Output: intApprox   Naeherungswert fuer das Integral
%
% Letzte Aenderung: 13.07.2020

  % Fehlerbehandlung
  if( n <= 0 )
    fprintf( 2, '\nAnzahl der Teilintervalle ist <= 0!\n' );
    intApprox = NaN;
    return
  end
  
  % Berechnung der Schrittweite
  h         = ( b - a ) / n;
  
  % Linke und rechte Intervallgrenze festlegen
  xmin      = min( a, b );
  xmax      = max( a, b );
  
  % Berechnung der x-Werte der Stuetzstellen
  xval      = linspace( xmin, xmax, n+1 );
  
  % Funktionswerte an den linken Stuetzstellen
  fval      = f( xval(1:n) );
  
  % Berechnung des Integrals 
  intApprox = h * sum( fval );
end