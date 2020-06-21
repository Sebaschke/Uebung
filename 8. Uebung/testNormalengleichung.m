%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Filename: testNormalengleichung.m
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Beschreibung: Angewandte Numerik 1 Aufgabe 34
%               This script calcualtes the condition of a Matrix
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Autor: S. Maschke
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Verlauf= 17.06.2020: File erstellt, S. Maschke
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc; clear;


for i=1:13
    fprintf('\n\nSolution for %d. iteration\n', i);
    An = [hilb(i); hilb(i)];            % generate matrix
    xn = rand(i,1);                 
    bn = An * xn;                       % create right side
    
    % solve compensation problem
    % backslash operator
    x_1 = An\bn;    
    x_1_rel = norm(x_1 - xn)/norm(xn);
    
    % normal equation
    x_2 = (An.'*An)\(An.'*bn);
    x_2_rel = norm(x_2 - xn)/norm(xn);

    % with qr-decomposition
    [Q,R] = qr(An);
    x_3 = R\(Q'*bn);
    x_3_rel = norm(x_3 - xn)/norm(xn);

    % plot the logarithmic fault
    figure(1);
    semilogy(i, x_1_rel, 'sb', i, x_2_rel, 'ob', i, x_3_rel, '*b');
    hold on; 
    
    fprintf('Backslash operator: x_1[');
    fprintf('%g ', x_1);
    fprintf(']\n');
    
    fprintf('normal equation: x_2[');
    fprintf('%g ', x_2);
    fprintf(']\n');
    
    fprintf('qr-decomposition: x_3[');
    fprintf('%g ', x_3);
    fprintf(']\n');
    
    % evaluate condition
    condAn = cond(An);
    condAn_ = cond(An'*An);
    
    figure(2);
    semilogy(i, condAn, 'sb', i, condAn_, 'ob');
    hold on; 
    
end
figure(1);
legend('backslash-operator', 'normal equation', 'qr-decomposition');
grid on;
title('relative fault of the normal equation');
xlabel('order n of the system');
ylabel('relative fault');

figure(2);
legend('cond A', 'cond AT*T');
grid on;
title('Condition number for increasing order');
xlabel('order n of the system');
ylabel('log of condition number');
