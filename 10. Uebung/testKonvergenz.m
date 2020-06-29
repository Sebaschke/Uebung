%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Filename: testKonvergenz.m
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Beschreibung: Angewandte Numerik 1 Aufgabe 41 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Autor: S. Maschke
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Verlauf= 29.06.2020: File erstellt, S. Maschke
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc; clear; close all;

%% Aufgabe 41 b) test bisketion1
syms x; 
f = @(x)x^2 - cos(x);
toll = 1e-16; toly = toll; tolx = toll;
maxIt = 100;

% calculate exakt solution x*
x_ = fzero(f, 1);

fprintf('\n**Solve f(x) = x^2 - cos(x)\n');

% call bisketion1
a = 0;
b = 3;
xk = bisektion1(f, a, b, 1e-10);
delta = abs(xk - x_);

% call newton1d
syms x;                 % had to be redefined 
x0 = 3;
xk2 = newton1D(f, eval(['@(x)', char(diff(f(x)))]), x0, toly, maxIt);
delta_n = abs(xk2 - x_);

% call sekanten method
syms x;                 % "-"
a = 0;
b = 3;
xk3 = sekanten(f, a, b, toly, maxIt);
delta_s = abs(xk3 - x_);

% print graph
figure(1);
semilogy(delta);
xlabel('number of iterations k');
ylabel('log(|x* - x_k|');
title(sprintf('|x* - x_k| of bisection method for f(x) = %s ', func2str(f)));
grid on;
hold on; 
semilogy(delta_n);
hold on; 
semilogy(delta_s);
legend('bisection', 'newton', 'sekanten');

%% Aufgabe 43 f)
syms x; 
f = @(x)(x-1)^2;
toll = 1e-14; toly = toll; tolx = toll;
maxIt = 100;

% visualize problem
% figure(2);
% fplot(f);
% grid on;

% calculate exakt solution x*
x_ = fzero(f, 1);

fprintf('\n**Solve f(x) = x^2 - 5\n');

% call bisketion1
a = -0.1;
b = 3;
xk = bisektion1(f, a, b, 1e-10);
delta = abs(xk - x_);

% call newton1d
syms x;                 % had to be redefined 
x0 = 3;
xk2 = newton1D(f, eval(['@(x)', char(diff(f(x)))]), x0, toly, maxIt);
delta_n = abs(xk2 - x_);

% call sekanten method
syms x;                 % "-"
a = -0.1;
b = 3;
xk3 = sekanten(f, a, b, toly, maxIt);
delta_s = abs(xk3 - x_);

% print graph
figure(3);
semilogy(delta);
xlabel('number of iterations k');
ylabel('log(|x* - x_k|');
title(sprintf('|x* - x_k| of bisection method for f(x) = %s ', func2str(f)));
grid on;
hold on; 
semilogy(delta_n);
hold on; 
semilogy(delta_s);
legend('bisection', 'newton', 'sekanten');

