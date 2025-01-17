function test1()
% Test dla funkcji RobHouseholderaTrzyDiagonalnie
% Projekt 2, zadanie 14
% Piotr Jankiewicz, 288767
%
% Testuje działanie funkcji RobHouseholderaTrzyDiagonalnie dla macierzy trójdiagonalnej.
% Wyświetla wyniki i weryfikuje zgodność z oczekiwaniami.
%
% Testowane właściwości:
% 1. Hn-1 * ... * H1 * A = R, gdzie R to macierz trójdiagonalna.
% 2. H0 * ... * Hn-1 * R = A, czyli rekonstruuje oryginalną macierz.

    % Dane wejściowe
    a = [5, 6, 7];
    b = [1, 2, 3, 4];
    c = [8, 9, 10];

    n = length(b); % Rozmiar macierzy

    % Oczekiwana macierz (do ręcznej weryfikacji)
    %  1  8  0  0
    %  5  2  9  0
    %  0  6  3 10
    %  0  0  7  4

    % Wywołanie funkcji
    [p, q, s, Householdery] = RobHouseholderaTrzyDiagonalnie(a, b, c);

    % Wektory na nowo
    a_new = zeros(1, n - 1);
    b_new = zeros(1, n);
    c_new = zeros(1, n - 1);
    s_new = zeros(1, n - 2);

    % Rozpoczęcie mnożenia przez Q
    for i = n-1:-1:1
        if i == n - 1
            % Przypadek dla i == n-1
            H = Householdery(:, :, i);
            R = [p(i), q(i); 0, p(i + 1)];
            temp = H * R;

            a_new(i) = temp(2, 1);
            b_new(i) = temp(1, 1);
            b_new(i + 1) = temp(2, 2);
            c_new(i) = temp(1, 2);
        else
            % Przypadek dla i < n-1
            H = Householdery(:, :, i);
            R = [p(i), q(i), s(i); 0, b_new(i + 1), c_new(i + 1)];
            temp = H * R;

            a_new(i) = temp(2, 1);
            b_new(i) = temp(1, 1);
            c_new(i) = temp(1, 2);
            c_new(i + 1) = temp(2, 3);
            s_new(i) = temp(1, 3);
            b_new(i + 1) = temp(2, 2);
        end
    end

    % Wyświetlanie wyników testu
    fprintf('Wyniki testu:\n');
    fprintf('a_new: ');
    disp(a_new);
    fprintf('b_new: ');
    disp(b_new);
    fprintf('c_new: ');
    disp(c_new);

    % Weryfikacja wyników
    fprintf('\nPodsumowanie testu:\n');
    is_correct = true;

    % Sprawdzenie wyników rekonstrukcji (przykładowo z tolerancją 1e-10)
    if max(abs(a - a_new)) > 1e-10
        fprintf('Nieprawidłowy wynik dla a_new!\n');
        is_correct = false;
    end
    if max(abs(b - b_new)) > 1e-10
        fprintf('Nieprawidłowy wynik dla b_new!\n');
        is_correct = false;
    end
    if max(abs(c - c_new)) > 1e-10
        fprintf('Nieprawidłowy wynik dla c_new!\n');
        is_correct = false;
    end

    % Wynik końcowy testu
    if is_correct
        fprintf('Wszystkie testy zakończone sukcesem.\n');
    else
        fprintf('Testy wykazały niezgodności. Sprawdź implementację RobHouseholderaTrzyDiagonalnie.\n');
    end
end
