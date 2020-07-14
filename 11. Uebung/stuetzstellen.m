%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Filename: stuetzstellen.m
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Beschreibung: Angewandte Numerik 1 Aufgabe 51 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Autor: S. Maschke
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Verlauf= 09.07.2020: File erstellt, S. Maschke
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc; clear; close all;
%%
% a) äquidistante Stuetzstellen 
fprintf('Äquidistante Stützstellen\n');
n = [2; 4; 8; 16; 31];          % number of supporting points
h = zeros(length(n),1);         % vector to store width op intervall

% i)
a = 0; b = pi;
t = (a:0.01:b)';                  % point where to evaluate the interpolation polynom
maxF = zeros(length(n), 1);      % vector to save max interpolation error

figure(1);
plot(t, sin(t));
hold on;
grid on;
for i=1:length(n)
    h(i) = (b-a)/n(i);
    x = (a:h(i):b)';              % supporting points
    f = sin(x); 
    c = divDiff(x, f);           % get coefficients for interpol. polynom
    v = evalNewtonpolynom(x, c, t);  % eval interpolation polynom with supporting points 
    plot(t, v);
    hold on;
    maxF(i) = max(abs(sin(t)-v)); 
end
title('function  f(x) = sin(x) vs interpolated function ');
legend('normal', 'n=2', 'n=4', 'n=8', 'n=16', 'n=16');
fprintf('i) Max error over n = [ ');
fprintf('%g ', n);
fprintf('] error = [ ');fprintf('%g ', maxF);
fprintf(']. Absolut maximum is %d\n', max(maxF));

% ii)
a = 0; b = 1;
t = (a:0.01:b)';
figure(2);
plot(t, sqrt(t));
hold on;
grid on;
for i=1:length(n)
    h(i) = (b-a)/n(i);
    x = (a:h(i):b)';              % supporting points
    f = sqrt(x); 
    c = divDiff(x, f);
    v = evalNewtonpolynom(x, c, t);
    plot(t, v);
    hold on;
    maxF(i) = max(abs(sin(t)-v)); 
end
title('function  f(x) = sqrt(x) vs interpolated function ');
legend('normal', 'n=2', 'n=4', 'n=8', 'n=16', 'n=16');
fprintf('ii) Max error over n = [ ');
fprintf('%g ', n);
fprintf('] error = [ ');
fprintf('%g ', maxF);
fprintf(']. Absolut maximum is %d\n', max(maxF));

% iii)
a = -5; b = 5;
t = (a:0.01:b)';
figure(3);
plot(t, (1./(1 + t.^2)));
hold on;
grid on;
for i=1:length(n)
    h(i) = (b-a)/n(i);
    x = (a:h(i):b)';              % supporting points
    f = 1./(1 + x.^2); 
    c = divDiff(x, f);
    v = evalNewtonpolynom(x, c, t);
    plot(t, v);
    hold on;
    maxF(i) = max(abs(sin(t)-v)); 
end
title('function  f(x) = 1/(1 + x^2) vs interpolated function ');
legend('normal', 'n=2', 'n=4', 'n=8', 'n=16', 'n=16');
fprintf('iii) Max error over n = [ ');
fprintf('%g ', n);
fprintf('] error = [ ');fprintf('%g ', maxF);
fprintf(']. Absolut maximum is %d\n\n', max(maxF));

%% Tschebyscheff Stützstellen
fprintf('\nTschebyscheff Stützstellen\n');

% i)
a = 0; b = pi;
t = (a:0.01:b)';                  % point where to evaluate the interpolation polynom
maxF = zeros(length(n), 1);      % vector to save max interpolation error

figure(4);
plot(t, sin(t));
hold on;
grid on;
for i=1:length(n)
    y = zeros(n(i),1);
    for j=1:n(i)
        y(j) = cos((2*j+1)/(2*(n(i)+1)) * pi);
    end
    % transformieren 
    x = (b-a)/2 * (y + 1) + a;               % supporting points
    f = sin(x); 
    c = divDiff(x, f);           % get coefficients for interpol. polynom
    v = evalNewtonpolynom(x, c, t);  % eval interpolation polynom with supporting points 
    plot(t, v);
    hold on;
    maxF(i) = max(abs(sin(t)-v)); 
end
title('Tschebyscheff: function  f(x) = sin(x) vs interpolated function ');
legend('normal', 'n=2', 'n=4', 'n=8', 'n=16', 'n=16');
fprintf('i) Max error over n = [ ');
fprintf('%g ', n);
fprintf('] error = [ ');fprintf('%g ', maxF);
fprintf(']. Absolut maximum is %d\n', max(maxF));

% ii)
a = 0; b = 1;
t = (a:0.01:b)';                  % point where to evaluate the interpolation polynom
maxF = zeros(length(n), 1);      % vector to save max interpolation error

figure(5);
plot(t, sqrt(t));
hold on;
grid on;
for i=1:length(n)
    y = zeros(n(i),1);
    for j=1:n(i)
        y(j) = cos((2*j+1)/(2*(n(i)+1)) * pi);
    end
    % transformieren 
    x = (b-a)/2 * (y + 1) + a;               % supporting points
    f = sqrt(x); 
    c = divDiff(x, f);           % get coefficients for interpol. polynom
    v = evalNewtonpolynom(x, c, t);  % eval interpolation polynom with supporting points 
    plot(t, v);
    hold on;
    maxF(i) = max(abs(sin(t)-v)); 
end
title('Tschebyscheff: function  f(x) = sqrt(x) vs interpolated function ');
legend('normal', 'n=2', 'n=4', 'n=8', 'n=16', 'n=16');
fprintf('i) Max error over n = [ ');
fprintf('%g ', n);
fprintf('] error = [ ');fprintf('%g ', maxF);
fprintf(']. Absolut maximum is %d\n', max(maxF));

% iii)
a = -5; b = 5;
t = (a:0.01:b)';                  % point where to evaluate the interpolation polynom
maxF = zeros(length(n), 1);      % vector to save max interpolation error

figure(6);
plot(t, 1/(1 + t.^2));
hold on;
grid on;
for i=1:length(n)
    y = zeros(n(i),1);
    for j=1:n(i)
        y(j) = cos((2*j+1)/(2*(n(i)+1)) * pi);
    end
    % transformieren 
    x = (b-a)/2 * (y + 1) + a;               % supporting points
    f = 1/(1+ x.^2); 
    c = divDiff(x, f);           % get coefficients for interpol. polynom
    v = evalNewtonpolynom(x, c, t);  % eval interpolation polynom with supporting points 
    plot(t, v);
    hold on;
    maxF(i) = max(abs(sin(t)-v)); 
end
title('Tschebyscheff: function  f(x) = 1/(1 + x^2) vs interpolated function ');
legend('normal', 'n=2', 'n=4', 'n=8', 'n=16', 'n=16');
fprintf('i) Max error over n = [ ');
fprintf('%g ', n);
fprintf('] error = [ ');fprintf('%g ', maxF);
fprintf(']. Absolut maximum is %d\n', max(maxF));