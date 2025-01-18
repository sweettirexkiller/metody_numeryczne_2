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
load("wektory_test_1.mat");
format long

% Parametry dla odwrotnej metody potęgowej
tol = eps * 100;
maxIter = 1000;

mu = 1;
disp('Naciśnij dowolny klawisz aby kontynuować...')
pause % Czeka na naciśnięcie klawisza
disp(['Poszukwiana wartosc wlasna najblizej mu=', num2str(mu)]);

% Wykonanie testowanej metody
[lambda, v, errEst, it] = odwrotna_metoda_potegowa(a, b, c, mu, tol, maxIter);
disp(['Znaleziona wartość własna: ', num2str(lambda)]);

% Sprawdzenie równania własnego
condition = norm(mnozenie_wejsciowy_trojdiagonal_wektor(a,b,c,v) - lambda*v)/norm(lambda*v);
disp(['Test ||Av - λv|| / || λv ||: ', num2str(condition)]);

mu = 9;
disp('Naciśnij dowolny klawisz aby kontynuować...')
pause % Czeka na naciśnięcie klawisza
disp(['Poszukwiana wartosc wlasna najblizej mu=', num2str(mu)])

% Wykonanie testowanej metody
[lambda, v, errEst, it] = odwrotna_metoda_potegowa(a, b, c, mu, tol, maxIter);
disp(['Znaleziona wartość własna: ', num2str(lambda)]);

% Sprawdzenie równania własnego
condition = norm(mnozenie_wejsciowy_trojdiagonal_wektor(a,b,c,v) - lambda*v)/norm(lambda*v);
disp(['Test ||Av - λv|| / || λv ||: ', num2str(condition)]);

mu = -1;
disp('Naciśnij dowolny klawisz aby kontynuować...')
pause % Czeka na naciśnięcie klawisza
disp(['Poszukwiana wartosc wlasna najblizej mu=', num2str(mu)])

% Wykonanie testowanej metody
[lambda, v, errEst, it] = odwrotna_metoda_potegowa(a, b, c, mu, tol, maxIter);
disp(['Znaleziona wartość własna: ', num2str(lambda)]);

% Sprawdzenie równania własnego
condition = norm(mnozenie_wejsciowy_trojdiagonal_wektor(a,b,c,v) - lambda*v)/norm(lambda*v);
disp(['Test ||Av - λv|| / || λv ||: ', num2str(condition)]);

mu = 50;
disp('Naciśnij dowolny klawisz aby kontynuować...')
pause % Czeka na naciśnięcie klawisza
disp(['Poszukwiana wartosc wlasna najblizej mu=', num2str(mu)])

% Wykonanie testowanej metody
[lambda, v, errEst, it] = odwrotna_metoda_potegowa(a, b, c, mu, tol, maxIter);
disp(['Znaleziona wartość własna: ', num2str(lambda)]);

% Sprawdzenie równania własnego
condition = norm(mnozenie_wejsciowy_trojdiagonal_wektor(a,b,c,v) - lambda*v)/norm(lambda*v);
disp(['Test ||Av - λv|| / || λv ||: ', num2str(condition)]);

end % function
