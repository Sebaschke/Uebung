%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Filename: testA14.m
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Beschreibung: Angewandte Numerik 1 Aufgabe 15
%               Dieses Skript soll für die in Aufgabe 14 dargstellte Matrix
%               eine numerische Lösung einmal ohne Pivotisierung und einmal
%               mit Pivotisierung lösen
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Autor: S. Maschke
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Verlauf= 20.05.2020: File erstellt, S. Maschke
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear 
clc
close all


A = [2 3 -1 0;
    -6 -5 0 2;
    2 -5 6 -6;
    4 6 2 -3];
b = [20; -33; -43; 49];

% without pivoting
disp('LR disassembly without pivoting')
[L, R] = gaussLR(A);
x = solveLR(L, R, b)

% with scaling and pivoting
disp('LR disassembly with scaling and pivoting')
[L, R, P, d] = lrPivot(A);
x = solveLrPivot(L, R, P, d, b)