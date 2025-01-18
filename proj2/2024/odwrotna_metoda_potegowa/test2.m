function test2()
% Projekt 2, zadanie 14
% Piotr Jankiewicz, 288767
%
% Test poprawności działania odwrotnej metody potęgowej.
% Sprawdza zgodność wyniku z wbudowaną funkcją eig dla macierzy
% trójdiagonalnej rozmiaru n x n o znanych elementach.
% Test weryfikuje, czy znaleziona wartość własna i wektor własny
% spełniają równanie własne z zadaną dokładnością.

% Inicjalizacja danych testowych 100 x 100.
% Wgrywanie a,b,c,lambdas i v
load("wektory_test_2.mat");
format long

% Parametry dla odwrotnej metody potęgowej
tol = eps * 100;
maxIter = 1000;

mu_values = [1, 9, -1, 50];

for mu = mu_values
    disp('Naciśnij dowolny klawisz aby kontynuować...')
    pause % Czeka na naciśnięcie klawisza
    disp(['Poszukwiana wartosc wlasna najblizej mu=', num2str(mu)])

    % Wykonanie testowanej metody
    [lambda, v, errEst, it] = P2Z14_PJA_odwrotna_metoda_potegowa(a, b, c, mu, tol, maxIter);
    lambda

    % Sprawdzenie równania własnego
    condition = norm(mnozenie_wejsciowy_trojdiagonal_wektor(a,b,c,v) - lambda*v)/norm(lambda*v);
    disp(['Test ||Av - λv|| / || λv ||: ', num2str(condition)]);
end

end % function
