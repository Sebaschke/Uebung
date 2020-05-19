%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Filename: Exercise8_main8.m
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Beschreibung: Angewandte Numerik 1 Aufgabe 8
%               Dieses Skript testet die selbst erstellte 
%               Matlab-Funktion normalizeMat()
%               zur Durchführung einer Äquilibrierung einer regulären 
%               Matrix 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Autor: S. Maschke
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Verlauf= 14.05.2020: File erstellt, S. Maschke
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear 
clc
close all

%% 
A = [1 2; 3 4; 5 8]

% Zeilenskalierung nach Skript S. 69
D_inf_rows = normalizeMat(A, 'infty', 'rows')
scaled_norm_inf_rows = mynorm(D_inf_rows*A, 'infinity') % succesful = 1

% Spaltenskalierung
D_one_cols = normalizeMat(A, 'one', 'cols')
scaled_norm_cols_one = mynorm(A*D_one_cols, 'one') % succesful = 1

% Die anderen Skalierungen funktionieren nicht
