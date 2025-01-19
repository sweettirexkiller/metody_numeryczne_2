function x = trojdiagonalny_gauss(p, q, s, y)
% Projekt 2, zadanie 14
% Piotr Jankiewicz, 288767
%
% Funkcja znajduje rozwiązanie układu równań Rx = y metodą eliminacji Gaussa,
% gdzie R jest macierzą górną trójdiagonalną n×n. Macierz R ma strukturę:
%   [p1 q1 s1  0  0]
%   [0  p2 q2 s2  0]
%   [0   0 p3 q3 s3]
%   [0   0  0 p4 q4]
%   [0   0  0  0 p5]
%
% WEJŚCIE:
%    p  - wektor wartości z głównej przekątnej macierzy R
%    q  - wektor wartości z pierwszej przekątnej nad główną
%    s  - wektor wartości z drugiej przekątnej nad główną
%    y  - wektor wyrazów wolnych układu równań
%
% WYJŚCIE:
%    x  - wektor rozwiązania układu Rx = y, lub wektor NaN gdy wymiary
%         wektorów są nieprawidłowe

% Sprawdzenie wymiarów wektorów wejściowych
n = length(p);
if length(q) ~= n-1 || length(s) ~= n-2 || length(y) ~= n
    x = NaN(n, 1);
    return;
end

% Inicjalizacja wektora rozwiązania
x = y;

% Rozwiązywanie układu metodą podstawiania wstecz
% Zaczynamy od ostatniego równania i idziemy w górę
for i = n:-1:3
    % Obliczenie i-tej niewiadomej
    x(i) = x(i) / p(i);

    % Podstawienie wartości do równań wyżej
    x(i-1) = x(i-1) - q(i-1)*x(i);
    x(i-2) = x(i-2) - s(i-2)*x(i);
end

% Osobna obsługa dwóch pierwszych równań
x(2) = x(2) / p(2);
x(1) = (x(1) - q(1)*x(2)) / p(1);

end % function
