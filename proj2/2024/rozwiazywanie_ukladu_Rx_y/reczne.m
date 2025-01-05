
addpath("./householder/");
addpath("./mnozenie_Q_transponowane_przez_wektor/");
addpath("./mnozenie_wejsciowy_trojdiagonal_wektor/")
A = [5,6,7];
B = [1,2,3,4];
C = [8,9,10];

n = size(b);
n = n(2);

% macierz 4x4
%  1  8  0  0
%  5  2  9  0
%  0  6  3  10
%  0  0  7  4


[p,q,s,Householdery] = RobHouseholderaTrzyDiagonalnie(A,B,C);

R = diag(p) + diag(q,1) + diag(s,2);

%Ax = b
%QRx = b
%Rx = Q^tb
%c = Q^t*b

b_first = ones(n, 1);
% c = H*b
[c] = mnozenieQtransponowanePrzezWektor(Householdery, b_first);

%szukanie tego x w petli to bedzie wlasnie metoda potegowa
%Rx = c
x = trojdiagonalny_gauss(p, q, s, c);

%test Rx = c
c_test = mnozenie_trojdiagonal_wektor(p,q,s, x);

norm(c - c_test)


%sprawdzenie || Ax - b ||

%Ax = b;
b_next = mnozenie_wejsciowy_trojdiagonal_wektor(A,B,C, x);






