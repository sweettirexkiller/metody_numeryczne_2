function b = mnozenie_wejsciowy_trojdiagonal_wektor(A, B, C, x)
% Projekt 2, zadanie 14
% Piotr Jankiewicz, 288767
%
% Funkcja realizuje mnożenie wektora x przez macierz trójdiagonalną.
% Macierz ma następującą strukturę:
%   [B1 C1  0  0  0]
%   [A1 B2 C2  0  0]
%   [0  A2 B3 C3  0]
%   [0   0 A3 B4 C4]
%   [0   0  0 A4 B5]
%
% WEJŚCIE:
%    B  - wektor wartości z głównej diagonali macierzy
%    C  - wektor wartości z jeden rząd wyżej od głównej diagonali
%    A  - wektor wartości z jeden rząd niżej od głównej diagonali
%    x  - wektor wejściowy do przemnożenia
%
% WYJŚCIE:
%    b  - wektor rozwiązania b = A*x, lub wektor NaN gdy wymiary
%         wektorów są nieprawidłowe

% Sprawdzenie wymiarów wektorów wejściowych
n = length(B);
if length(C) ~= n-1 || length(A) ~= n-1 || length(x) ~= n
    b = NaN(n, 1);
    return;
end

% Inicjalizacja wektora wynikowego
b = zeros(n, 1);

% Obliczenie dla pierwszego wiersza
b(1) = B(1)*x(1) + C(1)*x(2);

% Obliczenie dla wierszy środkowych
for i = 2:n-1
    b(i) = A(i-1)*x(i-1) + B(i)*x(i) + C(i)*x(i+1);
end

% Obliczenie dla ostatniego wiersza
b(n) = A(n-1)*x(n-1) + B(n)*x(n);

end % function
