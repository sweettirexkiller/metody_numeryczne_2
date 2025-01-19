function [y] = rozwiaz_invAx_rowne_b(a, b, c, x)
% Projekt 2, zadanie 14
% Piotr Jankiewicz, 288767
%
% Funkcja rozwiązuje układ równań inv(A)x = b, gdzie A jest macierzą
% trójdiagonalną. Rozwiązanie realizowane jest w trzech krokach:
% 1. Rozkład macierzy A na iloczyn QR za pomocą refleksji Householdera
% 2. Wymnożenie wektora x przez Q^T (transpozycję Q)
% 3. Rozwiązanie układu równań Ry = Q^T*x
%
% WEJŚCIE:
%    a  - wektor elementów znajdujących się pod główną przekątną macierzy A
%    b  - wektor elementów znajdujących się na głównej przekątnej macierzy A
%    c  - wektor elementów znajdujących się nad główną przekątną macierzy A
%    x  - wektor wejściowy równania
%
% WYJŚCIE:
%    y  - wektor rozwiązania układu równań inv(A)x = y, lub wektor NaN
%         gdy wymiary wektorów są nieprawidłowe

% Rozkład macierzy A na iloczyn QR metodą Householdera
[p, q, s, Householdery] = RobHouseholderaTrzyDiagonalnie(a, b, c);

% Obliczenie iloczynu Q^T * x
qt_x = mnozenieQtransponowanePrzezWektor(Householdery, x);

% Rozwiązanie układu równań Ry = Q^T*x metodą Gaussa
y = trojdiagonalny_gauss(p, q, s, qt_x);

end % function
