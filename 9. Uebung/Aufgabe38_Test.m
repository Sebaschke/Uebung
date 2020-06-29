%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Filename: Aufgabe38_Test.m
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Beschreibung: Angewandte Numerik 1 Aufgabe 38 
%               Simple script to confirm second and thrid order derivative
%               of iteration function Phi
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Autor: S. Maschke
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Verlauf= 23.06.2020: File erstellt, S. Maschke
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc; clear; close all;

syms x;

f = x^3 + x - 1;
fplot(f, 'm', 'Linewidth',1.5)
hold on;

phi = 1/(1 + x^2)
fplot(phi, 'g', 'Linewidth',1.5);
hold on; 

phi1 = - (2*x)/((1+x^2)^2)
fplot(phi1, 'b', 'Linewidth',1.5);
hold on; 

phi2 = diff(phi1)
fplot(phi2, 'r', 'Linewidth',1.5);
hold on; 

phi3 = diff(phi2)
fplot(phi3, 'y', 'Linewidth',1.5);

legend('f', 'phi', 'phi1', 'phi2', 'phi3');
grid on;
xlim([0 2]);
ylim([-10 10]);