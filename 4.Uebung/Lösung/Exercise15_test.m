%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Filename: Exercise15_test.m
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Beschreibung: Angewandte Numerik 1 Aufgabe 15
%               Dieses Skript soll zu Testzwecken die durchgeführte 
%               LR Zerlgung mit Zeilenskalierung und
%               Spaltenpivotisierung testen 
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

% Test of lu-disassembly with pivoting
[L, R, P, d] = lrPivot(A)

 % [L1, R1, P1] = myLUCols(A)   % without scaling 
[L2, R2, P2] = myLUCols(A)      % with row scaling

% Lösung eines LR-zerlegten Problems
% x = solveLrPivot(L, R, P, d, b)

% Matlab intern
X = linsolve(A,b)