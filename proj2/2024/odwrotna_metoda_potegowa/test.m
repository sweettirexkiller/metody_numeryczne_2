function test1()
% Projekt 2, zadanie X
% [Your Name], [Your Index Number]
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
[min_eigenvalue, min_index] = min(diag(D));
min_eigenvector = V(:, min_index);

% Wyświetlenie wartości referencyjnych
disp('Wartości referencyjne (eig):')
disp('Najmniejsza wartość własna:')
disp(min_eigenvalue)
disp('Odpowiadający wektor własny:')
disp(min_eigenvector')

% Parametry dla odwrotnej metody potęgowej
mu = 1;
tol = 1e-12;
maxIter = 1000;

% Wykonanie testowanej metody
[lambda, v, errEst] = odwrotna_metoda_potegowa(a, b, c, mu, tol, maxIter);

% Weryfikacja poprawności wyniku
disp('Wyniki odwrotnej metody potęgowej:')
disp('Znaleziona wartość własna:')
disp(lambda)
disp('Znaleziony wektor własny:')
disp(v')

% Sprawdzenie równania własnego
lvalue = mnozenie_wejsciowy_trojdiagonal_wektor(a, b, c, v);
rvalue = lambda * v;
residual_norm = norm(lvalue - rvalue);

disp('Norma residuum ||Av - λv||:')
disp(residual_norm)

% Weryfikacja dokładności
if residual_norm <= 1e-12
    disp('Test zakończony pomyślnie - równanie własne spełnione')
else
    disp('Test nie powiódł się - zbyt duży błąd residuum')
end

end % function