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

    %wyswietlenie opisu testu
    disp('Wykonujemy odbicia householdera na macierzy trójdiagonalnej A:');
    disp('A = ');
    A = diag(b) + diag(c, 1) + diag(a, -1);
    disp(A);
    disp('Wciśnij dowolny klawisz aby kontynuować...');
    pause;
    % Wywołanie funkcji
    [p, q, s, Householdery] = RobHouseholderaTrzyDiagonalnie(a, b, c);

    disp('Wyniki refleksji  Hn-1 * ... * H1 * A = R:');
    R = diag(p) + diag(q, 1) + diag(s, 2);
    disp(R);

    disp('Wykonujemy operację odwrotną próbując odzyskac oryginalną macierz');
    disp('Wciśnij dowolny klawisz aby kontynuować...');
    pause;

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
    disp('Odzyskana macierz H0 * ... * Hn-1 * R = A:');
    A = diag(b_new) + diag(c_new, 1) + diag(a_new, -1);
    disp(A);

    % Sprawdzenie równości
    disp('Test równości macierzy:');
    disp('|| a - a_new ||:');
    disp(norm(a - a_new));
    disp('|| b - b_new ||:');
    disp(norm(b - b_new));
    disp('|| c - c_new ||:');
    disp(norm(c - c_new));

end % function test1
