function intApprox = simpsonSumme( f, a, b, n )
% Angewandte Numerik 1, SoSe 2020
% Uebungsblatt 12, Aufgabe 54: Zusammengesetzte Quadraturformeln
%
% Berechnet das Integral der Funktion f auf dem Intervall [a,b]
% mit Hilfe der zusammengesetzen Simpsonregel
%
% Variante: Integralberechnung mit Gewichten
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
  h                 = ( b - a ) / ( 6 * n );
  
  % Gewichte der zusammengesetzten Simpsonregel(Spaltenvektor)
  weights           = 2 * ones( 2*n+1, 1) ;
  weights([1,end])  = 1;
  weights(2:2:end ) = 4;
  
  % Zusammengesetzte Simpsonregel
  intApprox         = h * f(xvals) * weights;
end