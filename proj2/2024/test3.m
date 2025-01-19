function test3()
% Projekt 2, zadanie 14
% Piotr Jankiewicz, 288767
%
% Test poprawności działania odwrotnej metody potęgowej.
% Sprawdzanie wyniku znalezionych wartości własnych
% dla różnych wartości μ dla macierzy trójdiagonalnej 20000 x 20000.
% Test wyświetla wyniki obliczeń bez ich interpretacji.
% Dane testowe zawierają wartości własne zespolone.

% Wczytanie danych testowych dla macierzy 20000 x 20000
load('wektory_test_3.mat', 'a', 'b', 'c', 'lambdas');

% Parametry dla odwrotnej metody potęgowej
tol = eps * 100;
maxIter = 1000;

% Seria testów dla 5 losowych wartości własnych
for i = 1:5
    fprintf('\nTest %d:\n', i);
    disp('Naciśnij dowolny klawisz, aby kontynuować...')
    pause

    % Losowy wybór wartości własnej
    index = randi([1, length(lambdas)]);

    % Wyświetlenie poszukiwanej wartości własnej
    fprintf('Znana wartość własna: %s\n', num2str(lambdas(index)));

    % Ustalenie parametru μ z możliwością uwzględnienia części zespolonej
    mu = lambdas(index) + 0.2*rand();
    if imag(lambdas(index)) ~= 0
        mu = mu + rand()*0.5i;
    end
    fprintf('Parametr μ (przesunięcie): %s\n', num2str(mu));

    % Wywołanie testowanej metody odwrotnej potęgowej
    [lambda, v, ~, it] = P2Z14_PJA_odwrotna_metoda_potegowa(a, b, c, mu, tol, maxIter);

    % Wyświetlenie surowych wyników bez interpretacji
    fprintf('Znaleziona wartość własna: %s\n', num2str(lambda));
    fprintf('Liczba iteracji: %d\n', it);

    % Obliczenie normy warunku bez komentarza interpretacyjnego
    condition = norm(mnozenie_wejsciowy_trojdiagonal_wektor(a, b, c, v) - lambda * v) / norm(lambda * v);
    fprintf('Wartość warunku ||Av - λv|| / ||λv||: %e\n', condition);
end

disp('Koniec testu.')
end % function
