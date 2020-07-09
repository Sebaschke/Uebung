%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Filename: konvergenzBereiche.m
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Beschreibung: Angewandte Numerik 1 Aufgabe 44 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Autor: S. Maschke
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Verlauf= 29.06.2020: File erstellt, S. Maschke
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc; clear; close all;

syms x;
f = @(x)atan(x)

% 200 Start values
x0 = (-9.9:0.1:10);                 % start values
anzIt = x0;                         % allocate vector to store number of iterations
toly = 1e-10;
maxIt = 100;

for i=1:length(x0)
    xk = newton1D(f, eval(['@(x)', char(diff(f(x)))]), x0(i), toly, maxIt);
    anzIt(i) = length(xk);
end

figure(1);
plot(x0, anzIt, 'b');
grid on;
title('Newton: Number of iterations over different start value [-10:10]');
xlabel('start values');
ylabel('number of its to reach accuracy');

for i=1:length(x0)
    if x0(i) > 0
        x1 = -5;
    else
        x1 = 5;
    end
    xk = sekanten(f, x0(i), x1, toly, maxIt);       % normal
    anzIt(i) = length(xk);
end

figure(2);
plot(x0, anzIt, 'b');
grid on;
title('Sekanten: Number of iterations over different start value [xk_-1 xk]');
xlabel('start values');
ylabel('number of its to reached accuracy');

for i=1:length(x0)
    if x0(i) > 0
        x1 = -5;
    else
        x1 = 5;
    end
    xk = sekanten(f, x1, x0(i), toly, maxIt);       % vertauscht
    anzIt(i) = length(xk);
end

figure(3);
plot(x0, anzIt, 'b');
grid on;
title('Sekanten: Number of iterations over different start value [xk_-1 xk] (vertauscht)');
xlabel('start values');
ylabel('number of its to reached accuracy');
