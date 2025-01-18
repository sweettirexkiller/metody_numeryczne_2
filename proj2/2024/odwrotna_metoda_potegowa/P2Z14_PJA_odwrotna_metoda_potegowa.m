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
%   v       - odpowiadający znalezionej wartości własnej wektor własny
%   errEst  - oszacowanie błędu względnego przybliżenia wartości własnej
%   it      - liczba interacji, ktrórą wykonał program

% Wyznaczenie rozmiaru macierzy
n = length(b);

% Obliczenie rozkładu QR macierzy (A - mu*I)
[p, q, s, Householdery] = RobHouseholderaTrzyDiagonalnie(a, b - mu, c);

% Inicjalizacja wektora startowego
x_prev = rand(n, 1);
x_prev = x_prev / norm(x_prev);

% Inicjalizacja zmiennych pomocniczych
diff = inf;
iter = 0;

% Główna pętla metody potęgowej
while diff > tol
    % Obliczenie y = Q^T * x
    y = mnozenieQtransponowanePrzezWektor(Householdery, x_prev);
    
    % Rozwiązanie układu Rx = y
    x_current = trojdiagonalny_gauss(p, q, s, y);

    % Normalizacja wektora
    x_current = x_current / norm(x_current, 2);

    % Obliczenie różnicy między kolejnymi przybliżeniami
  
    % Norma różnicy znormalizowanych wektorów
    diff = oblicz_warunek_stopu(x_current, x_prev);

    % Aktualizacja wartości z poprzedniej iteracji
    x_prev = x_current;
    % Zwiększenie licznika iteracji
    iter = iter + 1;
             
    % Sprawdzenie warunku na maksymalną liczbę iteracji
    if iter > maxIter
        error(['Przekroczono maksymalną liczbę iteracji. ','Metoda nie osiągnęła zbieżności.']);
    end
end

% Przypisanie wartości wyjściowych
v = x_prev;
it = iter; 
Av = mnozenie_wejsciowy_trojdiagonal_wektor(a, b, c, v);
lambda = (v' * (Av)) / (v' * v);
errEst = diff;



end % function
