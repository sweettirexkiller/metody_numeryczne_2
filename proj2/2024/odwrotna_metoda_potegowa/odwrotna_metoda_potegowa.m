function [lambda, v, errEst,it] = odwrotna_metoda_potegowa(a, b, c, mu, tol, maxIter)
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
% x_prev = x_prev / norm(x_prev);

% Inicjalizacja zmiennych pomocniczych
lambda_prev = inf;
diff = inf;
iter = 0;
x_last = x_prev;
x_i_k_prev = inf;

% Główna pętla metody potęgowej
while diff > tol
    % Obliczenie y = Q^T * x
    y = mnozenieQtransponowanePrzezWektor(Householdery, x_prev);
    
    % Rozwiązanie układu Rx = y
    x_current = trojdiagonalny_gauss(p, q, s, y);
    
    % Obliczenie przybliżenia wartości własnej

    % lambda_current = (x_prev' * x_current) / (x_prev' * x_prev);
    Av = mnozenie_wejsciowy_trojdiagonal_wektor(a, b, c, x_current);
    lambda_current = (x_current' * (Av)) / (x_current' * x_current);
   
 
    % Normalizacja wektora
    x_current = x_current / norm(x_current, 2);

    % Obliczenie różnicy między kolejnymi przybliżeniami
    % diff = norm(lambda_prev - lambda_current);
    % diff = norm(x_current - x_prev) / norm(x_current);
    % diff = abs((lambda_current - lambda_prev)/lambda_current);

    x_i_k_abs = max(abs(x_current));
    

    current_check_value = (1/max(x_current))*x_i_k_abs*max(x_current);
    previous_check_value =  (1/max(x_prev))*x_i_k_prev*max(x_prev);
    diff = norm(current_check_value- previous_check_value);
   
 
    
    % Aktualizacja wartości z poprzedniej iteracji
    x_prev = x_current;
    lambda_prev = lambda_current;
    x_i_k_prev = x_i_k;
    
    % Zwiększenie licznika iteracji
    iter = iter + 1;
    
    % Sprawdzenie warunku na maksymalną liczbę iteracji
    if iter > maxIter
        error(['Przekroczono maksymalną liczbę iteracji. ','Metoda nie osiągnęła zbieżności.']);
    end
end

% Przypisanie wartości wyjściowych
% v = x_last;
v = x_prev;
it = iter; 
lambda = lambda_current;
errEst = diff;



end