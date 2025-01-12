function test()
% Projekt 2, zadanie 14
% Piotr Jankiewicz, 288767
%
% Test dla funkcji eliminacji Gaussa dla macierzy trójdiagonalnej
%
% Testuje funkcje:
% 1. trojdiagonalny_gauss - rozwiązanie układu R * x = y, gdzie R jest macierzą trójdiagonalną.
% 2. mnozenie_trojdiagonal_wektor - weryfikacja wyników przez ponowne mnożenie macierzy R przez x.
%
% Testowane właściwości:
% - Poprawność rozwiązania układu R * x = y.
% - Norma różnicy norm(y - y_test) powinna być bliska zeru.

    % Dane wejściowe
    fprintf("Testy poprawności funkcji eliminacji Gaussa dla macierzy R (5x5):\n");
    p = [4, 2, 1, 2, 3]; % Główna przekątna
    q = [1, 2, 3, 4];    % Pierwsza przekątna nad główną
    s = [2, 3, 4];       % Druga przekątna nad główną

    % Konstrukcja macierzy trójdiagonalnej R (dla weryfikacji)
    R = diag(p) + diag(q, 1) + diag(s, 2);
    disp("Macierz trójdiagonalna R:");
    disp(R);

    % Wektor prawej strony równania
    y = [1, 1, 1, 1, 1];

    % Rozwiązanie układu R * x = y za pomocą własnej funkcji
    x = trojdiagonalny_gauss(p, q, s, y);
    fprintf("Wynik własnej funkcji dla R * x = y:\n");
    disp(x);

    % Weryfikacja przez mnożenie R * x
    y_test = mnozenie_trojdiagonal_wektor(p, q, s, x);

    % Obliczenie normy różnicy
    norma_difference = norm(y - y_test);

    % Wyniki testu
    fprintf("Norma różnicy między y a y_test: %.15f\n", norma_difference);

    % Podsumowanie testu
    fprintf("\nPodsumowanie testu:\n");
    if norma_difference < 1e-10
        fprintf("Test zakończony sukcesem. Wyniki są zgodne z oczekiwaniami.\n");
    else
        fprintf("Test nieudany. Wyniki różnią się od oczekiwanych.\n");
    end
end
