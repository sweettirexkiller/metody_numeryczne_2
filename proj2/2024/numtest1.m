function numtest1()
% Projekt 2, zadanie 14
% Piotr Jankiewicz, 288767
%
% Test numerycznych własności odwrotnej metody potęgowej
% Weryfikacja konwergencji metody dla różnych parametrów

% Parametry domyślne
tol_default = eps * 100;
maxIter_default = 1000;

disp('Test 1: Konwergencja odwrotnej metody potęgowej')
disp('-----------------------------------------------')

% Macierz testowa - prosta macierz trójdiagonalna
a = [1 1 1 1];
b = [10 10 10 10 10];
c = [1 1 1 1];

% Obliczanie wartości i wektorów własnych
A = diag(b) + diag(c, 1) + diag(a, -1);
[V, D] = eig(A);
% wartosci wlasne
disp('Wektory własne (kolumny macierzy V):');
disp(V); % Wektory własne (kolumny macierzy V)
% Wszystkie wartości własne
disp('Wartości własne:');
disp(diag(D));

% Różne parametry przesunięcia
mu_values = [8, 10.0000001, 12];

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

disp('Koniec testu konwergencji.')
end