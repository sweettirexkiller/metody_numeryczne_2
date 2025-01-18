function test4()
% Projekt 2, zadanie 14
% Piotr Jankiewicz, 288767
%
% Test poprawności działania odwrotnej metody potęgowej.Test jest
% przeprowadzany dla macierzy 20000x20000 ze znanymi wartosciami własnymi.
%




% Inicjalizacja danych testowych 100 x 100.
% Wgrywanie a,b,c,lambdas i v
load("wektory_test_2.mat");
% wgrywanie lambdas_expanded
load("wektory_test_4.mat");
% rozszerzenie macierzy do rozmiaru 20 000 na 20 000
a_expantion_size = 20000 - size(a,2) - 1;
a_expanded = [a, zeros(1, a_expantion_size)];
b_expantion_size = 20000 - size(b,2);
b_expanded = [b, ones(1, b_expantion_size)];
c_expantion_size = 20000 - size(c,2) - 1;
c_expanded = [c, zeros(1, c_expantion_size)];


% Parametry dla odwrotnej metody potęgowej
tol = eps * 100;
maxIter = 1000;

mu = 2;
disp('Naciśnij dowolny klawisz aby kontynuować...')
pause % Czeka na naciśnięcie klawisza
disp(['Poszukwiana wartosc wlasna najblizej mu=', num2str(mu)]);

% Wykonanie testowanej metody
[lambda, v, ~, it] = P2Z14_PJA_odwrotna_metoda_potegowa(a_expanded, b_expanded, c_expanded, mu, tol, maxIter);
disp(['Znaleziona wartość własna: ', num2str(lambda)]);
it
% Sprawdzenie równania własnego
condition = norm(mnozenie_wejsciowy_trojdiagonal_wektor(a_expanded,b_expanded,c_expanded,v) - lambda*v)/norm(lambda*v);
disp(['Test ||Av - λv|| / || λv ||: ', num2str(condition)]);





end % function
