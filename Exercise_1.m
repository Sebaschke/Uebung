%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Filename: ‹bung1.m
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Beschreibung: Angewandte Numerik 1 ‹bungsblatt 1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Autor: S. Maschke
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Verlauf= 27.04.2020: File erstellt, S. Maschke
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Loeschen der Variablen, Aufraeumen des COMMAND Windows und Schlieﬂen
% aller Graphiken
% Achtung: Vermeidet Fehler beim Kennenlernen von Matlab
clear 
clc
close all

%% Aufgabe 1 d)
% gut konditioniertes Problem
syms x y1 y2
y1 = 1000*x + 1
y2 = 0.001*x + 1
figure(1);
grid on
title([]);
%title(['Gut konditioniertes Problem']);
ezplot(y1)
hold on;
ezplot(y2)
legend

% schlecht konditioniertes Problem
syms x1 x2 y1 y2
y1 = x + 1
y2 = (1/1.05)*x + (1/1.05)
figure(2) 
title('Schlecht konditioniertes Problem');
grid on;
ezplot(y1)
hold on;
ezplot(y2)
legend


