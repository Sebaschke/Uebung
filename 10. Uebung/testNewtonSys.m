%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Filename: testNewtonSys.m
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Beschreibung: Angewandte Numerik 1 Aufgabe 46 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Autor: S. Maschke
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Verlauf= 29.06.2020: File erstellt, S. Maschke
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc; clear; close all;

%% Aufgabe 46 test newton1Sys
clear;
syms x1; syms x2; 
f = @(x1, x2) [2*x1.^2*x2 + 1; 2*x1*(1 + 2*x2.^2) - 2]; 

x0 = [1; 0];                % start value
toly = 1e-10;
maxIt = 200;

% xk = newtonSys(f, eval(['@(x1, x2)', char(jacobian(f, [x1, x2]))]), x0, toly, maxIt);
xk = newtonSys(f, jacobian(f, [x1, x2]), x0, toly, maxIt);

fprintf('Solution is x_k = [ ');
fprintf('%g ', xk(:, length(xk)));
fprintf('] f(xk) = [ ');
fprintf('%g ', f(xk(1, length(xk)), xk(2, length(xk))));
fprintf(']\n');