%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Filename: Aufgabe33.m
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Beschreibung: Angewandte Numerik 1 Aufgabe 33
%               This script calcualtes the condition of a Matrix
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Autor: S. Maschke
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Verlauf= 17.06.2020: File erstellt, S. Maschke
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc;
clear all;

A = [1 1; 1e-50 0; 0 1e-5];
% a) Condition number of A
condA = cond(A)

% b) Condition number of AT*A
condA_ = cond(A.'*A)

% c) Condition number of AT*A + delta(AT*A)
delta = [-1e-10 0; 0 -1e-10];
cond_g = cond(A.'*A + delta)