%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Filename: testLR_TriDiag.m
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Beschreibung: Angewandte Numerik 1 Aufgabe 21
%               This script tests the LR_TriDiag function
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Autor: S. Maschke
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Verlauf= 01.06.2020: File erstellt, S. Maschke
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear 
clc
close all

A_TriD = [2 3 0 0;
    1 4 3 0;
    0 3 7 4;
    0 0 2 1];

n = size(A_TriD, 1);
aUnd = zeros(n-1, 1);
ad = zeros(n, 1);
aOnd = zeros(n-1, 1);

for i=1:n-1
    aUnd(i) = A_TriD(i+1, i);
    aOnd(i) = A_TriD(i, i+1);
end

for i=1:n
    ad(i) = A_TriD(i, i);
end

[lnd, rd, rnd] = LR_TriDiag(aUnd, ad, aOnd);

% get whole matrizes from diagonals
L = eye(size(lnd, 1) + 1) + [zeros(1, size(lnd, 1) + 1); diag(lnd) zeros(size(lnd, 1), 1)]
R = diag(rd) + [zeros(size(rnd, 1), 1) diag(rnd); zeros(1, size(rnd, 1) + 1)]