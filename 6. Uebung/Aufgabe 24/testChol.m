%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Filename: testChol.m
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Beschreibung: Angewandte Numerik 1 Aufgabe 24
%               This script executes cholesky disassembly for different
%               matrizes
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Autor: S. Maschke
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Verlauf= 01.06.2020: File erstellt, S. Maschke
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear 
clc
close all

A1 = [1 -1 0;
    -1 1 1;
    0 -1 2];
A2 = [1 2 1;
    2 1 1;
    1 1 -2];
A3 = [1 2 1;
    2 8 2;
    1 2 2];

H = hilb(5);               % Hilbert matrix of order 12 -> poorly conditioned matrix
condH = cond(H);

% Hilbert matrix H
fprintf('Cholesky with Hilbert Matrix H(12)\n')
[L, D] = cholesky(H);      % Hilbert matrix has bad condition -> condition results in unavoidable error    
if abs(H - L*D*L') < 10e-5
    fprintf('Succesful\n\n')
else
    fprintf('Not succesful\n\n')
end

% test matrix A1
fprintf('Cholesky with Test Matrix A1\n')
[L, D] = cholesky(A1);
if abs(A1 - L*D*L') < 10e-5
    fprintf('Succesful\n\n')
else
    fprintf('Not succesful\n\n')
end

% test matrix A2
fprintf('Cholesky with Test Matrix A2\n')
[L, D] = cholesky(A2);
if abs(A2 - L*D*L') < 10e-5
    fprintf('Succesful\n\n')
else
    fprintf('Not succesful\n\n')
end

% test matrix A3
fprintf('Cholesky with Test Matrix A3\n')
[L, D] = cholesky(A3);
if abs(A3 - L*D*L') < 10e-5
    fprintf('Succesful\n\n')
else
    fprintf('Not succesful\n\n')
end


