%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Filename: laufzeiten.m
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Beschreibung: Angewandte Numerik 1 Aufgabe 22
%               This script measures duration of computing the LR disassembly of multiple
%               Tridiagonal matrizes
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Autor: S. Maschke
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Verlauf= 01.06.2020: File erstellt, S. Maschke
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear 
clc
close all

%% 
i_min = 3;               % n_min = 2^i_min
i_max = 12;              % n_max = 2^i_max
flag = 0;                % flag to plot regression line 0=no, 1=yes

% plot multiple times for constant results
for j=1:1
    figure(j);
    grid on;
    xlabel('dimension of Matrix A');
    ylabel('time [s]');
    title('LR disassembly of tridiagnoal matrizes - Comparison');
    fprintf('\n\nDurchlauf: %d\n', j);
    
    % allocate n and time vector
    n = zeros(1, i_max - i_min + 1);        % row vector, 2^i_min is included in n vector -> dimension + 1
    time = zeros(1, i_max - i_min + 1);     % thomas algorithm
    timeG = zeros(1, i_max - i_min + 1);    % gausLR
    timeC = zeros(1, i_max - i_min + 1);    % cholesky

    % iterate over dimensions 
    for i = i_min:i_max
        n(i - (i_min - 1)) = 2^i;           % store beginning from n(1) the number of dimensions
        
        fprintf('Aktuelles i = %d \nn = 2^i = %d\n', i, n(i - (i_min - 1)));
        
        % thomas
        fprintf('-Thomas Algorithmus: ');
        ad = 2.*ones(n(i - (i_min - 1)), 1);            % construct diagonal with right dimensions
        nd = -1.*ones(n(i - (i_min - 1))-1, 1);         % construct nd with right dimensions
        tic
        [lnd, rd, rnd] = LR_TriDiag(nd, ad, nd);        % thomas algorithm
        time(i-(i_min - 1)) = toc;
        fprintf('%d\n', time(i-(i_min - 1)));
        
        % gauss
        fprintf('--Gauss Algorithmus: ');
        A = diag(ad) + diag(nd, 1) + diag(nd, -1);
        tic;
        [L, R] = gaussLR(A);                            % gaussLR
        timeG(i-(i_min - 1)) = toc;
        fprintf('%d\n', timeG(i-(i_min - 1)));
        
%         % cholesky
%         fprintf('---Cholesky Algorithmus: ');
%         tic;
%         [L, D] = cholesky(A);
%         timeC(i-(i_min - 1)) = toc;
%         fprintf('%d\n\n', timeC(i-(i_min - 1)));
    end
    
    % plot
    subplot(2,1,1);                                    % plot times
    loglog(n, time, '*r')
    hold on;
    loglog(n, timeG, '+g')
%     hold on;
%     loglog(n, timeC, 'ob')
%     grid on;
%    legend('Thomas', 'Gauss', 'Cholesky');
    legend('Thomas', 'Gauss');

    
    % plot again with regression
    subplot(2,1,2);                                    % plot time and regression line
    loglog(n, time, '*r')
    hold on;
    loglog(n, timeG, '+g')
%     hold on;
%     loglog(n, timeC, 'ob')
%     grid on;
    loglog(n, polyval(polyfit(n, time, 1), n), 'r-');
    loglog(n, polyval(polyfit(n, timeG, 1), n), 'g-');
%    loglog(n, polyval(polyfit(n, timeC, 1), n), 'b-');
%    legend('Thomas', 'Gauss', 'Cholesky', 'g_{thomas}', 'g_{gauss}', 'g_{chol}');
    legend('Thomas', 'Gauss', 'g_{thomas}', 'g_{gauss}');

end

