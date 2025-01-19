function [a, b, c] = generuj_macierz_trojdiagonalna(n)
% Projekt 2, zadanie 14
% Piotr Jankiewicz, 288767
%
% Funkcja generuje losową macierz trójdiagonalną o rozmiarze n x n.
% Wszystkie elementy niezerowe są losowane z przedziału [-100, 100].
%
% WEJŚCIE:
%   n - rozmiar macierzy (liczba naturalna dodatnia)
%
% WYJŚCIE:
%   a - wektor elementów znajdujących się pod główną przekątną
%   b - wektor elementów znajdujących się na głównej przekątnej
%   c - wektor elementów znajdujących się nad główną przekątną

% Generowanie elementów pod główną przekątną (n-1 elementów)
a = -100 + 200 * rand(1, n-1);

% Generowanie elementów głównej przekątnej (n elementów)
b = -100 + 200 * rand(1, n);

% Generowanie elementów nad główną przekątną (n-1 elementów)
c = -100 + 200 * rand(1, n-1);

end % function
