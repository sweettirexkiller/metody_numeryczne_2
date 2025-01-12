function [lambda, v, errEst] = odwrotna_metoda_potegowa(a, b, c, mu, tol, maxIter)
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

% Wyznaczenie rozmiaru macierzy
n = length(b);

% Obliczenie rozkładu QR macierzy (A - mu*I)
[p, q, s, Householdery] = RobHouseholderaTrzyDiagonalnie(a, b - mu, c);

% Inicjalizacja wektora startowego
x_prev = rand(n, 1);
x_prev = x_prev / norm(x_prev);

% Inicjalizacja zmiennych pomocniczych
lambda_prev = inf;
diff = inf;
iter = 0;

% Główna pętla metody potęgowej
while diff > tol
    % Obliczenie y = Q^T * x
    y = mnozenieQtransponowanePrzezWektor(Householdery, x_prev);
    
    % Rozwiązanie układu Rx = y
    x_current = trojdiagonalny_gauss(p, q, s, y);
    
    % Obliczenie przybliżenia wartości własnej
    lambda_current = (x_prev' * x_current) / (x_prev' * x_prev);
    
    % Obliczenie różnicy między kolejnymi przybliżeniami
    diff = abs(lambda_prev - lambda_current);
    
    % Normalizacja wektora
    x_current = x_current / norm(x_current);
    
    % Aktualizacja wartości z poprzedniej iteracji
    x_prev = x_current;
    lambda_prev = lambda_current;
    
    % Zwiększenie licznika iteracji
    iter = iter + 1;
    
    % Sprawdzenie warunku na maksymalną liczbę iteracji
    if iter > maxIter
        error(['Przekroczono maksymalną liczbę iteracji. ','Metoda nie osiągnęła zbieżności.']);
    end
end

% Przypisanie wartości wyjściowych
v = x_prev;
lambda = 1/lambda_prev + mu;
errEst = diff;

end