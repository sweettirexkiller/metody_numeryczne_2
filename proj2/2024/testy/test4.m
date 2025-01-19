function test4()
% Projekt 2, zadanie 14
% Piotr Jankiewicz, 288767
%
% Test poprawności działania odwrotnej metody potęgowej.
% Test przeprowadzany dla macierzy 20000x20000 ze znanymi wartościami własnymi.
% Weryfikacja rozszerzenia macierzy trójdiagonalnej.

% Inicjalizacja danych testowych
load("wektory_test_2.mat", "a", "b", "c");

disp('Test rozszerzenia macierzy trójdiagonalnej o znanych wartościach własnych o macierz jednostkową.');

% Rozszerzenie macierzy do rozmiaru 20 000 x 20 000
a_expantion_size = 20000 - size(a,2) - 1;
a_expanded = [a, zeros(1, a_expantion_size)];
b_expantion_size = 20000 - size(b,2);
b_expanded = [b, ones(1, b_expantion_size)];
c_expantion_size = 20000 - size(c,2) - 1;
c_expanded = [c, zeros(1, c_expantion_size)];

% Parametry dla odwrotnej metody potęgowej
tol = eps * 100;
maxIter = 1000;

mu_values = [181, 126, 75, 0.3];
known_eigenvalues = [1.792917102717827e+02, 1.260873208711071e+02, 73.943225540593602, 0.303275354731270];
% Seria testów dla różnych wartości μ
for i = 1:length(mu_values)
    fprintf('\nTest %d:\n', i);
    disp('Naciśnij dowolny klawisz, aby kontynuować...')
    pause

    mu = mu_values(i);
    fprintf('Parametr μ: %f\n', mu);
    % znana wartosc wlasna
    fprintf('Znana wartość własna: %f\n', known_eigenvalues(i));

    % Wywołanie testowanej metody
    [lambda, v, ~, it] = P2Z14_PJA_odwrotna_metoda_potegowa(...
        a_expanded, b_expanded, c_expanded, mu, tol, maxIter);

    % Wyświetlenie surowych wyników
    fprintf('Znaleziona wartość własna: %f\n', lambda);
    fprintf('Liczba iteracji: %d\n', it);

    % Obliczenie warunku bez interpretacji
    condition = norm(mnozenie_wejsciowy_trojdiagonal_wektor(...
        a_expanded, b_expanded, c_expanded, v) - lambda*v) / norm(lambda*v);
    fprintf('Wartość warunku ||Av - λv|| / ||λv||: %e\n', condition);
end



disp('Koniec testu.')
end % function
