%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Filename: testqrHouseholder.m
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Beschreibung: Angewandte Numerik 1 Aufgabe 24 b)
%               This script executes qr disassembly with householder
%               transformations
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Autor: S. Maschke
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Verlauf= 09.06.2020: File erstellt, S. Maschke
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear 
clc
close all

% Beispiel 3.52
% A1 = [1 1; 2 0; 2 0];
% b1 = [2; 2; 3];         % not in example
% [V1, R1] = qrHouseholder(A1);
% x1 = solveHouseholder(V1,R1,b1); 

% Aufgabe 28 d)
A = [1 1; 1 2; 1 2; 1 5];   % 4x2 Matrix
b = [2; 2; 4; 6];

[V, R] = qrHouseholder(A);
x = solveHouseholder(V,R,b)

% Aufgabe 30 b)
A2 = [1 0 1; 1 sin(1/3*pi) cos(1/3*pi); 1 sin(2/3*pi) cos(2/3*pi);
    1 sin(pi) cos(pi); 1 sin(4/3*pi) cos(4/3*pi); 1 sin(5/3*pi) cos(5/3*pi)];
b2 = [19/10; 3; 13/5; 11/10; 2/5; 3/2];

[V2, R2] = qrHouseholder(A2);
x2 = solveHouseholder(V2,R2,b2)

% Aufgabe 30 c)
figure(1);
t = 0:2:10;                 % measurements
plot(t, b2, ':', t, A2*x2, '-');
hold on; 
title('Linear regression problem');
legend('measurements', 'regression points');

% Beispiel Durchführung der QR-Zerlegung mit Householder Matrizen. Jede
% Matrix Qv explizit aufstellen
A = [1 -11/12 3;
    2 0 0;
    2 -1 6];

% hand written results
Q_v1 = [-1/3 -2/3 -2/3; 
    -2/3 2/3 -1/3; 
    -2/3 -1/3 2/3];
Q_v2 = [1 0 0;
    0 -4/5 -3/5;
    0 -3/5 4/5];
Qt = Q_v2 * Q_v1    % transponiertes Q (Qt * A = R => Q^-1 * R = A)
Q = Qt'
R = Q_v2*Q_v1*A
cond_Q = cond(Q)
condQ_man = norm(inv(Q), 2)*norm(Q,2)
lambda = sqrt(max(eig(Q'*Q)))     % manuelle Berechnung der relativen Konditionszahl zur 2-Norm


% matlab intern implementation
[Q_in, R_in] = qr(A)
condQ_in = cond(Q_in)

% online qr zerlegung (http://elsenaju.info/Rechner/QR-Zerlegung.htm)
Q_online = [-1/3 0.933 0.133;
    -2/3 -1/3 2/3;
    -2/3 -0.133 -0.733]
condQ_online = cond(Q_online)