function test1()
% Projekt 2, zadanie 14
% Piotr Jankiewicz, 288767
%
% Test poprawności działania odwrotnej metody potęgowej.
% Sprawdza zgodność wyniku z wbudowaną funkcją eig dla macierzy
% trójdiagonalnej 4x4 o znanych elementach.
% Test weryfikuje, czy znaleziona wartość własna i wektor własny
% spełniają równanie własne z zadaną dokładnością.

% Inicjalizacja danych testowych
n = 4;
a = [1, 2, 3];        % Poddiagonala
b = [4, 5, 6, 7];     % Diagonala główna
c = [8, 9, 10];       % Naddiagonala

% Konstrukcja macierzy testowej
A = diag(b) + diag(c, 1) + diag(a, -1);
disp('Macierz testowa:')
disp(A)

% Obliczenie wartości referencyjnych za pomocą eig
[V, D] = eig(A);
lambdas = diag(D);

[min_eigenvalue, min_index] = min(diag(D));

% Wyświetlenie wartości referencyjnych
disp('Wartości referencyjne (eig):')
disp(lambdas)

% Ogólne parametry dla odwrotnej metody potęgowej dla wszystkich testów
tol = 100*eps;
maxIter = 1000;

mu_values = [1, 9, -1, 12];
tol = 100 * eps;
maxIter = 1000;

for i = 1:length(mu_values)
    mu = mu_values(i);
    disp(['mu= ', num2str(mu)])
    disp('Naciśnij dowolny klawisz aby kontynuować...')
    pause % Czeka na naciśnięcie klawisza

    % Wykonanie testowanej metody
    [lambda, v, errEst, it] = P2Z14_PJA_odwrotna_metoda_potegowa(a, b, c, mu, tol, maxIter);
    % Weryfikacja poprawności wyniku
    lambda, it
    % Sprawdzenie równania własnego
    condition = norm(mnozenie_wejsciowy_trojdiagonal_wektor(a, b, c, v) - lambda * v) / norm(lambda * v);
    disp(['Test ||Av - λv|| / || λv ||: ', num2str(condition)]);
end


end % function
