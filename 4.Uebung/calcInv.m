%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Filename: calcInv.m
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Beschreibung: Angewandte Numerik 1 Aufgabe 15
%               Dieses Skript soll nach der 
%               LR Zerlgung mit Zeilenskalierung und
%               Spaltenpivotisierung die Inverse einer Matrix effizient bestimmen 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Autor: S. Maschke
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Verlauf= 22.05.2020: File erstellt, S. Maschke
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear 
clc
close all

% Matrix iii)
A = [0.001 1 1; -1 0.004 0.004; -1000 0.004 0.000004];
b = [1; 1; 1];

% with scaling and pivoting
disp('LR disassembly with scaling and pivoting')
[L, R, P] = lrPivotNoScale(A);

n = size(A,2);
e = eye(n);
x = eye(n);

for i=1:n
    x(:,i) = solveInv(L, R, P, e(:,i));
end
disp(x)

invA = inv(A)