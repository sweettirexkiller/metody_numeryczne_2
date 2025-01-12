function test0()
% Projekt 2, zadanie 14
% Piotr Jankiewicz, 288767
%
% Test dla funkcji RobHouseholderaTrzyDiagonalnie oraz mnożenia Q i Q^T przez wektor
%
%
% Testuje działanie funkcji RobHouseholderaTrzyDiagonalnie oraz mnożenie macierzy Q
% i jej transpozycji przez wektor. 
% Wyświetla wyniki testu i weryfikuje zgodność z oczekiwaniami.
%
% Testowane właściwości:
% 1. Q^T * x = y (wektor wynikowy po mnożeniu przez transpozycję Q).
% 2. Q * y = x (powrót do oryginalnego wektora po przemnożeniu przez Q).

    % Dane wejściowe
    a = [5, 6, 7];
    b = [1, 2, 3, 4];
    c = [8, 9, 10];

    n = length(b); % Rozmiar macierzy
    x = [2, 3, 4, 5]'; % Wektor wejściowy

    % Wywołanie funkcji RobHouseholderaTrzyDiagonalnie
    [p, q, s, Householdery] = RobHouseholderaTrzyDiagonalnie(a, b, c);

    % Mnożenie Q^T przez wektor
    y = mnozenieQtransponowanePrzezWektor(Householdery, x);

    % Mnożenie Q przez wektor
    y_prime = mnozenieWektorPrzezQ(Householdery, y);

    % Wynik normy: norm(x - y_prime)
    norma_difference = norm(x - y_prime);

    % Wyświetlanie wyników
    fprintf('Wyniki testu:\n');
    fprintf('Norma różnicy norm(x - y_prime): %.15f\n', norma_difference);

    % Podsumowanie testu
    fprintf('\nPodsumowanie testu:\n');
    if norma_difference < 1e-10
        fprintf('Test zakończony sukcesem. Wyniki są zgodne z oczekiwaniami.\n');
    else
        fprintf('Test nieudany. Wyniki różnią się od oczekiwanych.\n');
    end
end
