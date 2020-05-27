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

% Beispiel 3.30 Skript S.93
A = [1 5 0; 2 2 2; -2 0 2];
[L, R, P, d] = lrPivot(A)

A = [2 3 -1 0;
    -6 -5 0 2;
    2 -5 6 -6;
    4 6 2 -3];
b = [20; -33; -43; 49];

% Test der LR-Zerlegung 
[L, R, P, d] = lrPivot(A)

% Lösung eines LR-zerlegten Problems
x = solveLrPivot(L, R, P, d, b)

% Matlab intern
D = diag(d);
X = linsolve(D*A,D*b)