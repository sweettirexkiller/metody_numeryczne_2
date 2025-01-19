function [p, q, s, Householdery] = RobHouseholderaTrzyDiagonalnie(a, b, c)
% Projekt 2, zadanie 14
% Piotr Jankiewicz, 288767
%
% Funkcja implementuje transformację macierzy trójdiagonalnej do postaci
% prawie górnej trójkątnej za pomocą transformacji Householdera. Kolejno
% zeruje elementy pod główną przekątną, zachowując strukturę trójdiagonalną.
%
% WEJŚCIE:
%    a  - wektor elementów pod główną przekątną (dolna diagonala)
%    b  - wektor elementów na głównej przekątnej
%    c  - wektor elementów nad główną przekątną (górna diagonala)
%
% WYJŚCIE:
%    p  - wektor elementów na głównej przekątnej macierzy wynikowej
%    q  - wektor elementów nad główną przekątną macierzy wynikowej
%    s  - wektor elementów dwa poziomy nad główną przekątną
%    Householdery - tensor [2x2x(n-1)] zawierający wszystkie macierze
%                   Householdera użyte do transformacji

% Określenie rozmiaru macierzy wejściowej
[~, n] = size(b);

% Inicjalizacja tablic wynikowych
Householdery = zeros(2, 2, n - 1);
s = zeros(1, n - 2);  % Diagonala dwa poziomy nad główną
p = zeros(1, n);      % Główna przekątna wynikowa
q = zeros(1, n - 1);  % Pierwsza przekątna nad główną

% Iteracja po kolejnych kolumnach macierzy
for i = 1:(n - 1)
    % Wyznaczenie transformacji Householdera dla bieżącej kolumny
    x = [b(i); a(i)];
    [y1, H] = RobHousholdera(x(1), x(2));
    Householdery(:, :, i) = H;

    if i < n - 1
        % Transformacja fragmentu macierzy 2x3 dla kolumn nie-przedostatnich
        czesc_wejsciowa = [b(i) c(i) 0; a(i) b(i+1) c(i+1)];
        przetransformowana = H * czesc_wejsciowa;

        % Aktualizacja elementów macierzy
        b(i) = y1;                    % Element na głównej przekątnej
        a(i) = przetransformowana(2, 1);  % Element pod główną (powinien być ≈0)
        c(i) = przetransformowana(1, 2);  % Element nad główną
        b(i+1) = przetransformowana(2, 2); % Następny element głównej
        s(i) = przetransformowana(1, 3);   % Element dwa nad główną
        c(i+1) = przetransformowana(2, 3); % Następny element nad główną
    else
        % Transformacja ostatniego fragmentu macierzy 2x2
        czesc_wejsciowa = [b(i) c(i); a(i) b(i+1)];
        przetransformowana = H * czesc_wejsciowa;

        % Aktualizacja ostatnich elementów
        b(i) = y1;
        a(i) = 0;
        c(i) = przetransformowana(1, 2);
        b(i+1) = przetransformowana(2, 2);
    end
end

% Przypisanie wyników końcowych
p = b;
q = c;

end % function
