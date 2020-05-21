%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Filename: Exercise14_test.m
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Beschreibung: Angewandte Numerik 1 Aufgabe 14
%               Dieses Skript soll zu Testzwecken die von Hand
%               durchgeführte LR Zerlgung mit Zeilenskalierung und
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

% at first find normalization matrix D
D = normalizeMat(A, 'infty', 'rows')

% Afterwards do the LU decomposition of the scaled matrix ! without
% pivoting
[L, R] = gaussLR(D*A)     % LR-Zerlegung ohne Pivotisierung

Db = D*b

% Pivoting Matrizes: these matizes switch the rows 
P =  [0 1 0 0; 1 0 0 0; 0 0 1 0; 0 0 0 1] * ...
    [1 0 0 0; 0 0 1 0; 0 1 0 0; 0 0 0 1] * ...
    [1 0 0 0; 0 1 0 0; 0 0 0 1; 0 0 1 0]

DA = D*A
x = linsolve(A,b)