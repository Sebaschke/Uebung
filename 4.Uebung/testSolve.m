%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Filename: testSolve.m
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Beschreibung: Angewandte Numerik 1 Aufgabe 15
%               Dieses Skript soll die durchgeführte 
%               LR Zerlgung mit Zeilenskalierung und
%               Spaltenpivotisierung testen 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Autor: S. Maschke
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Verlauf= 20.05.2020: File erstellt, S. Maschke
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear 
clc
close all

%% i)
A = [0 1; 1 1];
b = [1; 1];

disp('i)')
% without pivoting
disp('LR disassembly without pivoting')
[L, R] = gaussLR(A);
tic;
x = solveLR(L, R, b)
time(1) = toc*1e3;
disp(time)

% with scaling and pivoting
disp('LR disassembly with scaling and pivoting')
tic
[L, R, P, d] = lrPivot(A);
x = solveLrPivot(L, R, P, d, b)
time(2) = toc*1e3;

% Matlab intern algorithm
disp('Matlab solution')
tic;
X = A\b
time(3) = toc*1e3;

% plot time measurements
figure(1);
plot(1:3, time, 'o');
grid on;
title('Time measurement of solvers for i)');
legend({sprintf('1 = no pivoting\n 2 = with pivoting\n 3 = intern')});
xlabel('solver');
ylabel('time[ms]'); 
%% ii)
A = [11 44 1; -1 0.004 0.004; -1000 0.004 0.000004];
b = [1; 1; 1];

disp('ii)')
% without pivoting
disp('LR disassembly without pivoting')
tic;
[L, R] = gaussLR(A);
x = solveLR(L, R, b)
time(1) = toc*1e3;

% with scaling and pivoting
disp('LR disassembly with scaling and pivoting')
tic;
[L, R, P, d] = lrPivot(A);
x = solveLrPivot(L, R, P, d, b)
time(2) = toc*1e3;
% Matlab intern algorithm
disp('Matlab solution')
tic;
X = A\b
time(3) = toc*1e3;

% plot time measurements
figure(2);
plot(1:3, time, 'o');
grid on;
title('Time measurement of solvers for ii)');
legend({sprintf('1 = no pivoting\n 2 = with pivoting\n 3 = intern')});
xlabel('solver');
ylabel('time[ms]'); 
%% iii)
A = [0.001 1 1; -1 0.004 0.004; -1000 0.004 0.000004];
b = [1; 1; 1];

disp('iii)')
% without pivoting
disp('LR disassembly without pivoting')
tic;
[L, R] = gaussLR(A);
x = solveLR(L, R, b)
time(1) = toc*1e3;

% with scaling and pivoting
disp('LR disassembly with scaling and pivoting')
tic;
[L, R, P, d] = lrPivot(A);
x = solveLrPivot(L, R, P, d, b)
time(2) = toc*1e3;

% Matlab intern algorithm
disp('Matlab solution')
tic;
X = A\b
time(3) = toc*1e3;

% plot time measurements
figure(3);
plot(1:3, time, 'o');
grid on;
title('Time measurement of solvers for iii)');
legend({sprintf('1 = no pivoting\n 2 = with pivoting\n 3 = intern')});
xlabel('solver');
ylabel('time[ms]'); 