%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Filename: testNewtonSysBeispiel529.m
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Beschreibung: Angewandte Numerik 1 Beispiel 5.29
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Autor: S. Maschke
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Verlauf= 29.06.2020: File erstellt, S. Maschke
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc; clear; close all;

syms x1; syms x2; 
f = @(x1, x2) [6*x1 - cos(x1) - 2*x2; 8*x2 - x1*x2^2 - sin(x1)];

x0 = [0; 0];                % start value
toly = 1e-10;
maxIt = 100;

xk = newtonSys(f, jacobian(f, [x1, x2]), x0, toly, maxIt);

fprintf('Solution is x_k = [ ');
fprintf('%g ', xk(:, length(xk)));
fprintf('] f(xk) = [ ');
fprintf('%g ', f(xk(1, length(xk)), xk(2, length(xk))));
fprintf(']\n');