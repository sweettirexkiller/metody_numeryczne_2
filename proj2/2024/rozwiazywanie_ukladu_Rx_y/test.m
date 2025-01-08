addpath("rozwiazywanie_ukladu_Rx_y")
addpath("mnozenie_trojdiagonal_wektor/")
fprintf("Testy poprawności funkcji eliminacji gaussa dla macierzy A(5 na 5) :\n")
p = [4, 2, 1, 2, 3];
q = [1, 2, 3, 4];
s = [2, 3, 4];



R = diag(p) + diag(q,1) + diag(s,2);
disp(R);

%Rx = y
y = [1,1,1,1,1];
x = trojdiagonalny_gauss(p, q, s, y);

fprintf("Wynik własnej funkjci dla Rx=y: \n");
disp(x);

% 
% y_correct = R\y';
% 
% y_correct'

y_test = mnozenie_trojdiagonal_wektor(p,q,s, x);
norm(y - y_test)