addpath("generuj_macierz_trojdiagonalna");

n = 10000;
[a,b,c] = generuj_macierz_trojdiagonalna(n);
x = rand(1, n);



b = rozwiaz_invAx_rowne_b(a,b,c, x');

b