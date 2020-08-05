function intApprox = trapezSumme( f, a, b, n )
% Angewandte Numerik 1, SoSe 2020
% Uebungsblatt 12, Aufgabe 54: Zusammengesetzte Quadraturformeln
%
% Berechnet das Integral der Funktion f auf dem Intervall [a,b]
% mit Hilfe der zusammengesetzen Trapezregel
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
  
  % Berechnung der Schrittweite
  h                = ( b - a ) / n;
  
  % Berechnung der x-Werte der Stuetzstellen
  xvals            = linspace( a , b, n+1 );

  % Gewichte (Spaltenvektor)
  weights          = ones ( n+1, 1 );
  weights([1,end]) = 0.5;
  
  % Zusammengesetzte Trapezregel
  intApprox        = h * f(xvals) * weights;
  
  % Alternativ: Zusammengesetzte Trapezregel
  % intApprox = h  * ( sum( f( xvals(2:n) ) ) + ( f(a) +f(b) ) / 2 );
end