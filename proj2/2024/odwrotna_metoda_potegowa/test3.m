function test3()
% Projekt 2, zadanie 14
% Piotr Jankiewicz, 288767
%
% Test poprawności działania odwrotnej metody potęgowej.
% Sprwadzanie wyników znalezionych wartości własnych dla różnych wartości mu dla macierzy trójdiagonalnej 20000 x 20000.
% Test weryfikuje, czy znaleziona wartość własna i wektor własny spełniają równanie własne z zadaną dokładnością.
% Dane testowe zawierają wartości własne zespolone. Ten test sprawdza, czy metoda znajduje również wartości zespolone.

load('wektory_test_3.mat');

% Parametry dla odwrotnej metody potęgowej
tol = eps * 100;
maxIter = 1000;

% Testowanie dla 5 losowych wartości wlasnych
for i = 1:5
    % wybierz losową wartość własną
        fprintf('\n');
        disp('Naciśnij dowolny klawisz aby kontynuować...')
        pause % Czeka na naciśnięcie klawisza
        fprintf('\n');
  % wybierz losową wartość własną
    index = randi([1, length(lambdas)]);
    disp(['poszukiwana: ', num2str(lambdas(index))]);
    mu = lambdas(index) + rand()*2;
    % przesuń czesc zespolona
    mu = mu + rand()*2i;
    disp(['mu=', num2str(mu)]);

    % Wykonanie testowanej metody
    [lambda, v, ~, it] = P2Z14_PJA_odwrotna_metoda_potegowa(a, b, c, mu, tol, maxIter);
    disp(['znaleziona: ', num2str(lambda)]);
    disp(['iteracje: ', num2str(it)]);
    % Sprawdzenie równania własnego
    condition = norm(mnozenie_wejsciowy_trojdiagonal_wektor(a, b, c, v) - lambda * v) / norm(lambda * v);
    disp(['Test ||Av - λv|| / || λv ||: ', num2str(condition)]);

    % nastepna linia w celu lepszej czytelnosci
    fprintf('\n');
end % for


end % function
