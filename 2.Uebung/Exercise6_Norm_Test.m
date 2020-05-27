%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Filename: Exercise6_Norm_Test.m
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Beschreibung: Angewandte Numerik 1 Aufgabe 6
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Autor: S. Maschke
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Verlauf= 10.05.2020: File erstellt, S. Maschke
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear 
clc
close all

%% Compare mynorm() to Matlab intern function norm()
% scale rand matrix with factors, dimension m=n=5
A0 = -rand(5);
A0_norm_intern_1 = norm(A0, 1)
A0_norm_extern_1 = mynorm(A0, 'one')
A0_norm_intern_inf = norm(A0, Inf)
A0_norm_extern_inf = mynorm(A0, 'infinity')
A0_norm_intern_2 = norm(A0, 'fro')
A0_norm_extern_2 = mynorm(A0, 'frobenius')


A1 = 10*A0;
A1_norm_intern_1 = norm(A1, 1)
A1_norm_extern_1 = mynorm(A1, 'one')
A1_norm_intern_inf = norm(A1, Inf)
A1_norm_extern_inf = mynorm(A1, 'infinity')
A1_norm_intern_2 = norm(A1, 'fro')
A1_norm_extern_2 = mynorm(A1, 'frobenius')


A2 = 100*A0;
A2_norm_intern_1 = norm(A2, 1)
A2_norm_extern_1 = mynorm(A2, 'one')
A2_norm_intern_inf = norm(A2, Inf)
A2_norm_extern_inf = mynorm(A2, 'infinity')
A2_norm_intern_2 = norm(A2, 'fro')
A2_norm_extern_2 = mynorm(A2, 'frobenius')


% dimension m=6 n=5
B0 = rand(6,5)
B0_norm_intern_1 = norm(B0, 1)
B0_norm_extern_1 = mynorm(B0, 'one')
B0_norm_intern_inf = norm(B0, Inf)
B0_norm_extern_inf = mynorm(B0, 'infinity')
B0_norm_intern_2 = norm(B0, 'fro')
B0_norm_extern_2 = mynorm(B0, 'frobenius')
