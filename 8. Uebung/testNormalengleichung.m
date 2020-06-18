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
    xn = rand(i,1);                     % randomly create right side
    bn = An * xn;
    
    % backslash operator
    x_1 = An\bn;
    
    % normal equation
    x_2 = (An.'*An)\(An.'*bn);
    
    % with qr-decomposition
    [Q,R] = qr(An);
    x_3 = R\(Q'*bn);
    
    % own qr decomposition with householder matrizes
    [V_, R_] = qrHouseholder(An);
    x_3_ = solveHouseholder(V_, R_, bn); 
    
    fprintf('Backslash operator: x_1[');
    fprintf('%g ', x_1);
    fprintf(']\n');
    
    fprintf('normal equation: x_2[');
    fprintf('%g ', x_2);
    fprintf(']\n');
    
    fprintf('qr-decomposition: x_3[');
    fprintf('%g ', x_3);
    fprintf(']\n');
 
    fprintf('qr-decomposition householder: x_3_[');
    fprintf('%g ', x_3_);
    fprintf(']\n');
    
    % evaluate condition
    condAn = cond(An);
    
    condAn_ = cond(An'*An);
end

