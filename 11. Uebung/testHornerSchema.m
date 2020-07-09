%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Filename: testKonvergenz.m
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Beschreibung: Angewandte Numerik 1 Aufgabe 49
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Autor: S. Maschke
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Verlauf= 7.7.2020: File erstellt, S. Maschke
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc; clear; close all;

fprintf('Compare hornerSchema with polyval\n');

% first test
a = [1; 2; 3; 4];      % x^3 + 2*x^2 + 3*x + 4
t = [1; 2; 3];         % at x = 1, 2, 3

pt = hornerSchema(a, t);
pt_ = polyval(a, t);
fprintf('a = [ ');
fprintf('%g ', a);
fprintf('] at t = [ ');
fprintf('%g ', t);
fprintf(' ] -> horner scheme: pt = [ ');
fprintf('%g ', pt);
fprintf('] vs. polyval: pt_ = [ ');
fprintf('%g ', pt_);
fprintf(']\n');

% second test
a = [2; 2; 3; 4];      % 2x^3 + 2*x^2 + 3*x + 4
t = [1; 2; 3];      % at x = 1, 2, 3
pt = hornerSchema(a, t);
pt_ = polyval(a, t);
fprintf('a = [ ');
fprintf('%g ', a);
fprintf('] at t = [ ');
fprintf('%g ', t);
fprintf(' ] -> horner scheme: pt = [ ');
fprintf('%g ', pt);
fprintf('] vs. polyval: pt_ = [ ');
fprintf('%g ', pt_);
fprintf(']\n');
