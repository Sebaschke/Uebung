%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Filename: main36.m
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Beschreibung: Angewandte Numerik 1 Aufgabe 36 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Autor: S. Maschke
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Verlauf= 23.06.2020: File erstellt, S. Maschke
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc; clear; close all;
% check with symbolic toolbox zeros of function
syms x;
f = x^2 - 5;
n = solve(f);                   % zeros of f

% d)
anzIt = 10;
x0 = 5/2;

% iteration function 1 
xks_1 = fixPktIt(@(x)(5 + x - x^2), anzIt, x0); 

% iteration function 2
xks_2 = fixPktIt(@(x)(5/x), anzIt, x0); 

% iteration function 3 
xks_3 = fixPktIt(@(x)(1 + x - (1/5)*x^2), anzIt, x0); 

% iteration function 4 
xks_4 = fixPktIt(@(x)((1/2) * ( x + 5/x)), anzIt, x0); 

% display table 
k = 0:1:10;
T = table(k.', xks_1.', xks_2.', xks_3.', xks_4.');
T.Properties.VariableNames = {'k' 'Phi1' 'Phi2' 'Phi3' 'Phi4'};

figure(1);
title('Iterations');
uitable('Data',T{:,:},'ColumnName',T.Properties.VariableNames,...
    'RowName',T.Properties.RowNames,'Units', 'Normalized', 'Position',[0, 0, 1, 1]);

% f) plot iterationsfunctions and bisecting angle (= Winkelhalbierende)
ba = x;                         % bisecting angle
phi1 = 5 + x - x^2;             % phi1 
phi2 = 5/x;                     % phi2
phi3 = 1 + x - (1/5) * x^2;     % phi3
phi4 = (1/2) * (x + 5/x);       % phi4

phi_vec = [phi1 phi2 phi3 phi4];         % place iteration functions in vector to loop over

for i=1:4
    figure(i+1);
    title(['Iteration function Phi', num2str(i)]);
    phi = phi_vec(i);                     % phi is handle to iteration function
    fplot(phi);
    hold on;
    fplot(ba);                           % plot bisecting angle
    hold on;
    str = strcat('Phi', num2str(i));     % append index to legend 
    legend(str, 'Bisecting angle');
    xlim([0 5]);
    ylim([0 15]);
    grid on;
    
    % draw first three iterations
    x = 2.5;                            % start point x_0
    for j=1:3
        xline(double(x), 'HandleVisibility','off');
        x = subs(phi);                  % subs evalutes symbolic function at x
        yline(double(x), 'HandleVisibility','off');               % converts symbolic variable to double precision
    end
end

