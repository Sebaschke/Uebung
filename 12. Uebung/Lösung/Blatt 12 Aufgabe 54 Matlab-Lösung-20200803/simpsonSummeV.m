function intApprox = simpsonSummeV( f, a, b, n )
% Angewandte Numerik 1, SoSe 2020
% Uebungsblatt 12, Aufgabe 54: Zusammengesetzte Quadraturformeln
%
% Berechnet das Integral der Funktion f auf dem Intervall [a,b]
% mit Hilfe der zusammengesetzen Simpsonregel
%
% Variante: Vektorisierte Integralberechnung
%
% Input:  f           Integrand als function handle
%         a           1. Intervallgrenze
%         b           2. Intervallgrenze
%         n           Anzahl der Teilintervalle
% Output: intApprox   Naeherungswert fuer das Integral der Funktion f(x)
%                     im Intervall [a,b]
%
% Letzte Aenderung: 13.07.2020

  % Fehlerbehandlung
  if( n <= 0 )
    fprintf( 2, '\nAnzahl der Teilintervalle ist <= 0!\n' );
    intApprox = NaN;
    return
  end
   
  % Berechnung der x-Werte der Stuetzstellen
  xvals             = linspace( a , b, 2*n+1 );
  
  % Berechnung der Schrittweite
  h         = ( b - a ) / n;
  
  % Berechnung der Funktionswerte an den Stuetzstellen
  fvals     = f(xvals);
  
  % Zusammengesetzte Simpsonregel
  intApprox = h / 6 * (fvals(1) + fvals(2*n+1) ...
    + sum( 4 * fvals(2:2:end-1) ) + sum( 2 * fvals(3:2:end-2) ) );
end