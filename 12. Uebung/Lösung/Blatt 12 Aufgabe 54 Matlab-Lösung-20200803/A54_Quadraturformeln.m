% Angewandte Numerik 1, SoSe 2020
% Uebungsblatt 12, Aufgabe 54: Zusammengesetzte Quadraturformeln
%
% Vergleich verschiedener zusammengesetzter Quadraturformeln:
%   - zusammengesetzte linke Rechteckregel (linke Rechteck-Summe),
%   - zusammengesetzte Mittelpunktregel (Mittelpunkt-Summe),
%   - zusammengesetzte Trapezregel (Trapez-Summe)
%   - zusammengesetzte Simpsonregel (Simpson-Summe)
% fuer 1 bis 2^17 Intervalle fuer das Integral
% I(f) = integral(f,0,1) = pi der Funktion f(x) = 4/(x^2 + 1)
%
% Der absolute Fehler wird in doppelt logarithmischer Skala in 
% Abhaengigkeit von n dargestellt.
%
% Letzte Aenderung: 14.07.2020

% Cleanup -----------------------------------------------------------------
% Alle Variablen loeschen
clearvars;
% Alle Schaubilder schliessen
close all;
% Command window leeren
clc;

% Initialisierung ---------------------------------------------------------
fprintf( '\n\nAngewandte Numerik 1, Sommersemester 2020\n' );
fprintf ...
  ( 'Uebungsblatt 12, Aufgabe 54: Zusammengesetzte Quadraturformeln\n\n' );

% Linke Integrationsgrenze                        
a     = 0;
% Rechte Integrationsgrenze
b     = 1;
% Zu integrierende Funktion
f     = @(x) 4./(x.^2+1);

% Anzahl Verfahren
Nverf = 5;

% Vektor mit den Anzahlen der Teilintervalle
Nint  = 2.^(0:17);

% Matrix fuer Werte des Integrals initialisieren
integ = zeros( length(Nint), Nverf );
% Matrix fuer Fehler der Approximationen initialisieren
err   = zeros( length(Nint), Nverf );

% Ueberschrift der Ausgabetabelle
fprintf('NUMERISCHE INTEGRATION MIT VERSCHIEDENEN QUADRATURFORMELN\n\n');
fprintf('Funktion:\tf = 1 / (1 + x^2), ');
fprintf('Integrationsgrenzen: a = %d, b = %d\n\n', a, b);
fprintf( ['-----------------------------------------------------', ...
  '--------------------------\n'] );
fprintf( ['Anzahl     | Fehler       | Fehler     | Fehler     |', ...
  ' Fehler     | Fehler     |\n'] );
fprintf( ['Teil-      | Linke Recht- | Mittel-    | Trapez-    |', ...
  ' Simpson-   | Simpson-   |\n'] );
fprintf( ['Intervalle | ecksumme     | punktsumme | Summe      |', ...
  ' Summe 1    | Summe 2    |\n'] );
fprintf( ['-----------|--------------|------------|------------|', ...
  '------------|------------|\n'] );

% Alle Quadraturformeln fuer verschiedene Anzahlen Teilintervalle ---------
for k = 1:length(Nint)
  n = Nint(k);

  % Linke Rechtecksumme ---------------------------------------------------
  % Integral berechnen
  integ(k, 1) = linkeRechteckSumme( f, a, b,  n );
  % Fehler zum exakten Integral berechnen
  err(k, 1) = abs(integ(k,1) - pi);

  % Mittelpunktsumme ------------------------------------------------------
  % Integral berechnen
  integ(k, 2) = mittelpunktSumme( f, a, b,  n ); 
  % Fehler zum exakten Integral berechnen
  err(k, 2) = abs(integ(k,2) - pi);

  % Trapezsumme -----------------------------------------------------------
  % Integral berechnen
  integ(k, 3) = trapezSumme( f, a, b, n ); 
  % Fehler zum exakten Integral berechnen
  err(k, 3) = abs(integ(k,3) - pi);

  % Simpsonsumme (vektorisiert) -------------------------------------------
  % Integral berechnen
  integ(k, 4) = simpsonSummeV( f, a, b, n );
  % Fehler zum exakten Integral berechnen
  err(k, 4) = abs(integ(k,4) - pi);

  % Simpsonsumme (mit Gewichten) ------------------------------------------
  % Integral berechnen
  integ(k, 5) = simpsonSumme( f, a, b, n );
  % Fehler zum exakten Integral berechnen
  err(k, 5) = abs(integ(k,5) - pi);

  % Fehler aller Quadraturformeln ausgeben --------------------------------
  fprintf(' %7d   | %12.4e | %10.4e | %10.4e | %10.4e | %10.4e |\n', ...
    n, err(k,1), err(k,2), err(k,3), err(k,4), err(k,5));
end

% Schaubild Quadraturfehler ueber Nint ------------------------------------
hf1 = figure( 'NumberTitle', 'off', 'Units', 'normalized', 'Name', ...
  'Angewandte Numerik 1, Blatt 11, Aufgabe 54: Quadraturfehler',   ...
  'MenuBar', 'None', 'Position', [0.08, 0.08, 0.84, 0.87] );

% Zum Plotten mit loglog: 0-Fehlerwerte auf 10^16 setzen
err(err==0) = 1e-16;

% Plot der Quadraturfehler
loglog( Nint, err(:,1), 'x-r', 'Display', 'Linke Rechteckregel' );
hold on;
loglog( Nint, err(:,2), 'd-b', 'Display', 'Mittelpunktregel' );

loglog( Nint, err(:,3), 's-g', 'Display', 'Trapezregel' );
loglog( Nint, err(:,4), '*-m', 'Display', 'Simpsonregel,vekt.' );
loglog( Nint, err(:,5), '*-c', 'Display', 'Simpsonregel,Gewichte' );

% Steigungsgeraden einzeichnen
loglog( Nint,    0.5*Nint.^-1, 'k-',  'Display', 'Steigung 1' );
loglog( Nint,   0.01*Nint.^-2, 'k:',  'Display', 'Steigung 2' );
loglog( Nint, (1e-3)*Nint.^-4, 'k-.', 'Display', 'Steigung 4' );
loglog( Nint, (1e-4)*Nint.^-6, 'k-',  'Display', 'Steigung 6' );

% Maschinengenauigkeit eps einzeichnen
loglog( Nint, eps*ones(size(Nint)), 'k:', 'Display', ...
  'Maschinengenauigkeit');
hold off;

% Achsen: Wertebereiche, Schriftgroesse
axis( [ 1, max(Nint), 6*1e-17, 30 ] );
ha = gca;
ha.FontSize = 12;
% Skalierung der x-Achse
xticks( Nint );
xlab = cellstr( string( Nint ) );
xticklabels( xlab );

% Achsenlabel, Legende und Titel
xlabel( 'n (Anzahl der Teilintervalle)', 'FontSize', 16 );
ylabel( 'Fehler', 'FontSize', 16 );
legend( 'show', 'Location', 'NorthEast', 'NumColumns', 2, 'FontSize', 12 );
title( 'Vergleich der Fehler zusammengesetzter Quadraturformeln', ...
  'FontSize', 22 );