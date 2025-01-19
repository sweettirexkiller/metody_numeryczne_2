function test()
% Projekt 2, zadanie 14
% Piotr Jankiewicz, 288767
%
% Test dla funkcji generuj_macierz_trojdiagonalna i rozwiaz_invAx_rowne_b
%
% Testuje funkcje:
% 1. generuj_macierz_trojdiagonalna - generowanie dużej macierzy trójdiagonalnej.
% 2. rozwiaz_invAx_rowne_b - rozwiązywanie układu A * b = x.
% 3. mnozenie_wejsciowy_trojdiagonal_wektor - weryfikacja wyników przez mnożenie.
%
% Testowane właściwości:
% - Poprawność rozwiązania układu A * b = x.
% - Norma różnicy norm(x_prime - x) powinna być bardzo mała.


    % Parametry testu
    n = 10000; % Rozmiar macierzy
    fprintf("Test dla dużej macierzy trójdiagonalnej (%d x %d):\n", n, n);

    % Generowanie macierzy trójdiagonalnej
    [a, b, c] = generuj_macierz_trojdiagonalna(n);

    % Wektor prawej strony równania
    x = rand(n, 1); % Losowy wektor wejściowy

    % Rozwiązanie układu inv(A) * x = b
    b_wynik = rozwiaz_invAx_rowne_b(a, b, c, x);

    % Weryfikacja przez mnożenie inv(A) * b_wynik
    x_prime = mnozenie_wejsciowy_trojdiagonal_wektor(a, b, c, b_wynik);

    % Obliczenie normy różnicy
    norma_difference = norm(x_prime - x);

    % Wyniki testu
    fprintf("|| x_primne - x || = %.15f\n", norma_difference);

    % Podsumowanie testu
end
