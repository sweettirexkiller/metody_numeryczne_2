function test2()
% Projekt 2, zadanie 14
% Piotr Jankiewicz, 288767
%
% Test poprawności działania odwrotnej metody potęgowej
% dla macierzy trójdiagonalnej rozmiaru 100 x 100.

% Inicjalizacja danych testowych
load("wektory_test_2.mat",'a', 'b','c', 'lambdas');
format long

% Parametry dla odwrotnej metody potęgowej
tol = eps * 100;
maxIter = 1000;

% Rozpoczęcie serii testów
disp('Test metody odwrotnej potęgowej')
disp('--------------------------------')

for i = 1:5
    fprintf('\nTest %d:\n', i);
    disp('Naciśnij dowolny klawisz, aby kontynuować...')
    pause

    % Losowy wybór wartości własnej
    index = randi([1, length(lambdas)]);

    % Wyświetlenie danych wejściowych
    fprintf('Znana wartość własna: %f\n', lambdas(index));

    % Parametr przesunięcia mu
    mu = lambdas(index) + 0.1*rand();
    fprintf('Parametr μ: %f\n', mu);

    % Wywołanie testowanej metody
    [lambda, v, errEst, it] = P2Z14_PJA_odwrotna_metoda_potegowa(a, b, c, mu, tol, maxIter);

    % Wyświetlenie surowych wyników bez interpretacji
    fprintf('Wyniki testu:\n');
    fprintf('Znaleziona wartość własna: %f\n', lambda);
    fprintf('Długość wektora własnego: %f\n', norm(v));
    fprintf('Oszacowanie błędu: %e\n', errEst);
    fprintf('Liczba iteracji: %d\n', it);

    % Obliczenie normy warunku bez komentarza
    condition = norm(mnozenie_wejsciowy_trojdiagonal_wektor(a,b,c,v) - lambda*v)/norm(lambda*v);
    fprintf('Wartość warunku ||Av - λv|| / ||λv||: %e\n', condition);
end

disp('Koniec testu.')
end % function
