% Angewandte Numerik 1, SoSe 2020
% Uebungsblatt 05, Aufgabe 18: Wert einer Gleitpunktdarstellung
%
% Testprogramm fuer die Funktion x = value(b, d, v, t)
%
% Letzte Aenderung: 22.05.2020



%% Initialisierung

clearvars;
close all;
clc;

tol = 1e-14;                    % Geforderte Genauigkeit der Berechnungen

fprintf( "\n");
fprintf( "Angewandte Numerik 1, Blatt 5, Aufgabe 17\n" );
fprintf( "\n");



%% Definition und Durchfuehrung der Testfaelle

testfall = 0;
while 1                         % alle Testfaelle untersuchen
    testfall = testfall + 1;    % naechster Testfall
    
    
    %% alle Testfaelle definieren
    
    switch testfall
        case 1                  % Testfall 1
            b = 2;                      % Basis
            d = [1 0 1 0 0 1 0 0];      % Mantisse
            v = [0 0 1 0 0];            % Exponent
            t = 1;                      % Vorzeichen Exponent
            x = 10.25;                  % Wert der Zahl
        case 2                  % Testfall 2
            b = 2;                      % Basis
            d = [1 0 1];                % Mantisse
            v = [0 0 1];                % Exponent
            t = -1;                     % Vorzeichen Exponent
            x = 0.3125;                 % Wert der Zahl
        case 3                  % Testfall 3
            b = 8;                      % Basis
            d = [7 5 0];                % Mantisse
            v = [0 0 1];                % Exponent
            t = -1;                     % Vorzeichen Exponent
            x = 0.119140625;            % Wert der Zahl
        otherwise
            break;              % keine Testfaelle mehr vorhanden
    end
    
    
    %% Testfall durchfuehren und Ergebnis ausgeben
    
    spezString = 'Testfall %d: %s.\n';
    if abs(x - value(b,d,v,t)) < tol
        fprintf(spezString, testfall, 'Bestanden');
    else
        fprintf(2, spezString, testfall, 'Fehlgeschlagen');
    end
    
end