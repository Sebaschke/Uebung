function xk = newtonSys(f, df, x0, toly, maxIt)
% Angewandte Numerik 1, SoSe 2020
% Uebungsblatt 10, Aufgabe 46: Newton-Verfahren fuer Systeme
%
% Naeherungsweise Berechnung der Nullstelle eines Systems nichtlinearer
% Gleichungen f mit Hilfe des Newton-Verfahrens fuer Systeme
%
% Input:    f       System von nichtlinearen Gleichungen (f: R^n --> R^n)
%                   (mehrdimensionale Funktion f als function handle)
%           df      Jacobi-Matrix der Funktion f (df: R^n --> R^(nxn))
%                   (als function handle)
%           x0      Startwert (R^n) als Spaltenvektor
%           toly    Fehlertoleranz, 
%                   falls |f(berechneteNullstelle)| <= tol --> Abbruch
%           maxIt   Maximale Anzahl an Iterationen 
%                   falls k > maxIt --> Abbruch
%
% Output:   xk      Matrix, R^(nxk), mit den berechneten Iterationswerten
%                   aller Iterationen
%                   Jede Spalte enthaelt einen Iterationswert
%
% Letzte Aenderung: 30.06.2020

  % Initialisierung -------------------------------------------------------
  toly    = abs(toly);
  maxIt   = abs(maxIt);
  k       = 1;
  n       = length(x0);
  % Initialisierung der Matrix der Iterationswerte incl. Startwerte
  xk      = zeros(n,maxIt);
  xk(:,k) = x0(:); 
  % Berechnung des Funktionswerts der Startwerte
  Fx      = f(xk(:,k));

  % Newton-Verfahren fuer Systeme mit Konvergenztest ----------------------
  while k < maxIt && norm(Fx) > toly
    % Neue Jacobimatrix
    dFx = df(xk(:,k));
    
    % Fehlermeldung wenn Jacobi-Matrix nicht invertierbar ist
    if ( det(dFx) == 0 )
      fprintf( 2, ['\nJacobi-Matrix nicht invertierbar, ', ...
        'Abbruch bei Iteration %d'], k);
      break;
    end
    
    % Iterationszaehler erhoehen
    k       = k + 1;
    % Newton-Korrektur
    s       = - dFx \ Fx;
    % Neuer Startpunkt
    xk(:,k) = xk(:,k-1) + s;
    % Neuer Funktionswert
    Fx      = f(xk(:,k));
    % Konvergenztest
    if ( norm(dFx) < toly )
      fprintf( 2, ['Konvergenztest fehlgeschlagen in der %dten ' ...
        'Iteration. Bitte anderen Startwert waehlen!\n'], k );
      break
    end
  end
  % Warnung wenn maximale Anzahl Iterationsschritten erreicht ist
  if ( k >= maxIt )
    xval = sprintf('%5.3f,', x0);
    xval(end) = [];
    fprintf( 2, ['  Maximale Anzahl Iterationen erreicht fuer ', ...
      'x0=(%s), keine Konvergenz !\n'], xval');
  end
  % Ausgabevektor verkuerzen, wurde nicht komplett benoetigt
  xk(:,k+1:end) = [];
end