%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Filename: testBisektion.m
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Beschreibung: Angewandte Numerik 1 Aufgabe 39 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Autor: S. Maschke
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Verlauf= 25.06.2020: File erstellt, S. Maschke
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc; clear; close all;


syms x;

% f1
f = @(x)x^2 - 2;        % f is a function handle 
a = 1;
b = 3;

fprintf('Equation: f = x^2 - 2 = 0\n');
[a, b] = bisektion(f, a, b);

% f2
f = @(x)sin(x) - cos(2*x);
a = 0;
b = 1;
fprintf('Equation: f = sin(x) - cos(2x) = 0\n');
[a, b] = bisektion(f, a, b);

% f3
f = @(x)x^3 + 7*x^2 + 6;
a = 2.7;
b = 6.5;
fprintf('Equation: f = x^3 + 7*x^2 + 6 = 0\n');
[a, b] = bisektion(f, a, b);

