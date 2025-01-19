function numtest2()
% Projekt 2, zadanie 14
% Piotr Jankiewicz, 288767
%
% Test numerycznych własności odwrotnej metody potęgowej
% Weryfikacja wrażliwości metody na parametr przesunięcia

% Parametry domyślne
tol_default = eps * 100;
maxIter_default = 1000;

disp('Test 2: Wrażliwość na parametr przesunięcia')
disp('-------------------------------------------')

% Macierz testowa
a = [1 1 1 1];
b = [10 10 10 10 10];
c = [1 1 1 1];

% Bardzo bliskie sobie wartości parametru μ
mu_values = [9.99, 10 + 10*eps, 10.01];

for i = 1:length(mu_values)
    fprintf('\nTest dla μ = %f:\n', mu_values(i));
    disp('Naciśnij dowolny klawisz, aby kontynuować...')
    pause

    % Wywołanie metody
    [lambda, ~, errEst, it] = P2Z14_PJA_odwrotna_metoda_potegowa(...
        a, b, c, mu_values(i), tol_default, maxIter_default);

    % Wyświetlenie surowych wyników bez interpretacji
    fprintf('Znaleziona wartość własna: %f\n', lambda);
    fprintf('Błąd estymacji: %e\n', errEst);
    fprintf('Liczba iteracji: %d\n', it);
end

disp('Koniec testu wrażliwości.')
end % function numtest2
