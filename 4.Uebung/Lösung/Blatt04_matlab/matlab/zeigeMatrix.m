function zeigeMatrix( A )
% Angewandte Numerik 1, SoSe 2020
% Uebungsblatt 04, Aufgabe 15:
% LR-Zerlegung mit Skalierung und Spalten-Pivotisierung
%
% Die Funktion zeigeMatrix( A )gibt eine Matrix formatiert aus.
%
% Parameter:
%   A   Matrix, die ausgegeben werden soll

  for k = 1:size(A,1)
    fprintf('%20.10e', A(k,:));
    fprintf('\n');
  end
end