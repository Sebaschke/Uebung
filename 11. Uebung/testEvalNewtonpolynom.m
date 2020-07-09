%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Filename: testEvalNewtonpolynom.m
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Beschreibung: Angewandte Numerik 1 Aufgabe 50 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Autor: S. Maschke
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Verlauf= 08.07.2020: File erstellt, S. Maschke
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc; clear; close all;

% Test with polynom from Aufgabe 47 with 4 supporting points
x = [-2; -1; 0; 1];
f = 3.^x;
t = [0.5; 1; 2];

c = divDiff(x, f);

v = evalNewtonpolynom(x, c, t);
fprintf('Interpolation-function for 3^x at supporting points x = [ ');
fprintf('%g ', x);
fprintf('] evaluated at t = [ ');
fprintf('%g ', t);
fprintf(']. Result v = [ ');
fprintf('%g ', v);
fprintf(']\n');

% Test with polynom from Aufgabe 47 with 5 supporting points
x = [-2; -1; 0; 1; 2];
f = 3.^x;
t = [0.5; 1; 2];

c = divDiff(x, f);

v = evalNewtonpolynom(x, c, t);
fprintf('Interpolation-function for 3^x at supporting points x = [ ');
fprintf('%g ', x);
fprintf('] evaluated at t = [ ');
fprintf('%g ', t);
fprintf(']. Result v = [ ');
fprintf('%g ', v);
fprintf(']\n');

