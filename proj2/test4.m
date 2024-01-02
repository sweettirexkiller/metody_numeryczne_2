function [] = test4()
%TEST1 
% Piotr Jankiewicz, 288767
%
% Funckja testujaca poprawnosc wyniku myGaussianElimination
%
% WEJŚĆIE:
%   -
% WYJŚCIE:
%   -


tol = 10^-8;
LIMIT = 10^3;


fprintf("Testy poprawności eliminacji gaussa dla macierzy A(5 na 5) :\n")
A = [4, 2, 1, 2, 3];
B = [1, 2, 3, 4];
C = [2, 3, 4];



M = diag(A) + diag(B,1) + diag(C,2);
disp(M);

x = [1,1,1,1,1];
y = myGaussianElimination(A, B, C, x);

fprintf("Wynik własnej funkjci dla Ay=x: \n");
disp(y);
fprintf("Wynik dla funkjci wbudowanych: \n");
y1 = inv(M)*x';
disp(y1');



end

