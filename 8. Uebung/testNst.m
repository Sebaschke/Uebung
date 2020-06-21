%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Filename: testNst.m
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Beschreibung: Angewandte Numerik 1 Aufgabe 35
%               This script calcualtes the solutions of a qaudratic
%               equation
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Autor: S. Maschke
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Verlauf= 19.06.2020: File erstellt, S. Maschke
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc; clear;

%% 
q = 1;              % q is constant
t = 0:0.1:12;
p = 10.^t;          % p-vector

x1_rf = 1:length(t);          % store relative fault of deletion in pq-formula
x2_rf = 1:length(t);

% solve equation x^2 + 2*p*x - q = 0 for positive p
for i=1:length(t)
    % non-stable algorithm
    [x1, x2] = nst(2*p(i), -q);

    % stable algorithm
    [x1_s, x2_s] = nstStabil(2*p(i), -q);
    
    % calculate relative fault of pq-formula
    x1_rf(i) = norm(x1 - x1_s)/norm(x1_s);
    x2_rf(i) = norm(x2 - x2_s)/norm(x2_s);
end

figure(1);
loglog(p, x1_rf, 'sb', p, x2_rf, '*b');
legend('relative fault of x1', 'relative fault of x2');
title('Relative fault over p = 10^t (positive p)');
grid on;
xlabel('p of equation x^2 + 2*p*x - q');
ylabel('relative fault compared to stable solution');

%%
q = 1;              % q is constant
t = 0:0.1:12;
p = -10.^t;          % p-vector

x1_rf = 1:length(t);          % store relative fault of deletion in pq-formula
x2_rf = 1:length(t);

% solve equation x^2 + 2*p*x - q = 0 for positive p
for i=1:length(t)
    % non-stable algorithm
    [x1, x2] = nst(2*p(i), -q);

    % stable algorithm
    [x1_s, x2_s] = nstStabil(2*p(i), -q);
    
    % calculate relative fault of pq-formula
    x1_rf(i) = norm(x1 - x1_s)/norm(x1_s);
    x2_rf(i) = norm(x2 - x2_s)/norm(x2_s);
end

figure(2);
loglog(abs(p), x1_rf, 'sb', abs(p), x2_rf, '*b');
legend('relative fault of x1', 'relative fault of x2');
title('Relative fault over p = -10^t (negative p)');
grid on;
xlabel('p of equation x^2 + 2*p*x - q');
ylabel('relative fault compared to stable solution');

