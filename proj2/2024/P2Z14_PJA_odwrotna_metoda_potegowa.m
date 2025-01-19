function [lambda, v, errEst,it] = P2Z14_PJA_odwrotna_metoda_potegowa(a, b, c, mu, tol, maxIter)
% Projekt 2, zadanie 14
% Piotr Jankiewicz, 288767
%
% Funkcja implementuje odwrotną metodę potęgową z normowaniem dla macierzy
% trójdiagonalnej. Metoda znajduje wartość własną macierzy A najbliższą
% zadanej wartości mu.
%
% WEJŚCIE:
%   a       - wektor elementów pod-diagonalnych macierzy A
%   b       - wektor elementów diagonalnych macierzy A
%   c       - wektor elementów nad-diagonalnych macierzy A
%   mu      - wartość, względem której szukana jest najbliższa wartość własna
%   tol     - tolerancja błędu (kryterium stopu)
%   maxIter - maksymalna dozwolona liczba iteracji
%
% WYJŚCIE:
%   lambda  - znaleziona wartość własna najbliższa mu (przybliżona)
%            lub NaN jeśli nie osiągnięto zbieżności
%   v       - odpowiadający znalezionej wartości własnej wektor własny
%            lub NaN jeśli nie osiągnięto zbieżności
%   errEst  - oszacowanie błędu względnego przybliżenia wartości własnej
%   it      - liczba iteracji, którą wykonał program

% Wyznaczenie rozmiaru macierzy i inicjalizacja rozkladu QR macierzy A - mu*I
n = length(b);
[p, q, s, Householdery] = RobHouseholderaTrzyDiagonalnie(a, b - mu, c);

% Inicjalizacja wektora startowego
x_prev = rand(n, 1);
x_prev = x_prev / norm(x_prev);

% Inicjalizacja zmiennych iteracyjnych
diff = inf;
iter = 0;

% Główna pętla metody potęgowej
while diff > tol && iter < maxIter
    y = mnozenieQtransponowanePrzezWektor(Householdery, x_prev);
    x_current = trojdiagonalny_gauss(p, q, s, y);
    x_current = x_current / norm(x_current, 2);

    diff = oblicz_warunek_stopu(x_current, x_prev);
    x_prev = x_current;
    iter = iter + 1;
end

% Sprawdzenie zbieżności i przypisanie wyników
if iter == maxIter
    v = NaN;
    lambda = NaN;
    it = NaN;
    errEst = NaN;
else
    v = x_prev;
    it = iter;
    Av = mnozenie_wejsciowy_trojdiagonal_wektor(a, b, c, v);
    lambda = (v' * (Av)) / (v' * v);
    errEst = diff;
end

end % function
