function y = mnozenie_trojdiagonal_wektor(p, q, s, x)
% Projekt 2, zadanie 14
% Piotr Jankiewicz, 288767
%
% Funkcja realizuje mnożenie wektora x przez macierz górną trójdiagonalną R.
% Macierz R ma następującą strukturę:
%   [p1 q1 s1  0  0]
%   [0  p2 q2 s2  0]
%   [0   0 p3 q3 s3]
%   [0   0  0 p4 q4]
%   [0   0  0  0 p5]
%
% WEJŚCIE:
%    p  - wektor elementów z głównej przekątnej
%    q  - wektor elementów z pierwszej przekątnej nad główną
%    s  - wektor elementów z drugiej przekątnej nad główną
%    x  - wektor wejściowy do przemnożenia
%
% WYJŚCIE:
%    y  - wektor wynikowy będący iloczynem R*x, lub wektor NaN gdy wymiary
%         wektorów wejściowych są nieprawidłowe

% Sprawdzenie wymiarów wektorów wejściowych
n = length(p);
if length(q) ~= n-1 || length(s) ~= n-2 || length(x) ~= n
    y = NaN(n, 1);
    return;
end

% Inicjalizacja wektora wynikowego
y = zeros(n, 1);

% Obliczenie iloczynu dla wierszy zawierających trzy elementy niezerowe
for i = 1:n-2
    y(i) = p(i)*x(i) + q(i)*x(i+1) + s(i)*x(i+2);
end

% Obliczenie dla przedostatniego wiersza (dwa elementy niezerowe)
y(n-1) = p(n-1)*x(n-1) + q(n-1)*x(n);

% Obliczenie dla ostatniego wiersza (jeden element niezerowy)
y(n) = p(n)*x(n);

end % function
