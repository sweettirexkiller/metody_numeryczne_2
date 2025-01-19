function test7()
% Projekt 2, zadanie 14
% Piotr Jankiewicz, 288767
%
% Test własności wartości własnych dla macierzy trójdiagonalnej
% o specjalnej strukturze: stała wartość głównej diagonali = 10
% i stała wartość subdiagonali = 3. Macierz rozmiaru 50 000 x 50 000.

load('wektory_test_6.mat', 'lambdas');

% Rozmiar macierzy
n = 10000;

% Ustalone wartości dla tego testu
x = 1;  % Wartość na głównej diagonali
y = 5000;   % Wartość na subdiagonalach

fprintf('Test odwrotnej metodypotęgowej dla macierzy trójdiagonalnej:\n');
fprintf('Rozmiar: %d x %d\n', n, n);
fprintf('Diagonala główna: %f\n', x);
fprintf('Subdiagonale: %f\n', y);

% Oczekiwany zakres wartości własnych
mu_min = x - 2*y;  % 10 - 2*3 = 4
mu_max = x + 2*y;  % 10 + 2*3 = 16

fprintf('Oczekiwany zakres wartości własnych: %f do %f\n', mu_min, mu_max);

% Tworzenie macierzy trójdiagonalnej
b = x * ones(1, n);
a = y * ones(1, n-1);
c = y * ones(1, n-1);

% Parametry dla odwrotnej metody potęgowej
tol = eps * 100;
maxIter = 1000;

% Losowy wybór parametru μ w oczekiwanym zakresie

for i = 1:5
    fprintf('\nTest %d:\n', i);
    disp('Naciśnij dowolny klawisz, aby kontynuować...')
    pause

    % Losowy wybór wartości własnej
    mu = mu_min + rand() * (mu_max - mu_min);

    % Ustalenie parametru μ z możliwością uwzględnienia części zespolonej
    fprintf('Losowa wartość miu:  %s\n', num2str(mu));

    % Wywołanie testowanej metody odwrotnej potęgowej
    [lambda, v, ~, it] = P2Z14_PJA_odwrotna_metoda_potegowa(a, b, c, mu, tol, maxIter);

    % Wyświetlenie surowych wyników bez interpretacji
    fprintf('Znaleziona wartość własna: %s\n', num2str(lambda));
    % Czy taka wartość własna jest w lambdas ?
    if any(abs(lambdas - lambda) < 1e-10)
        fprintf('Znaleziona wartość własna jest zgodna z wartością w zestawie znanych wart. wł.\n');
    else
        fprintf('Znaleziona wartość własna nie jest zgodna z zestawem wartości zananch wart. wł.\n');
    end
    fprintf('Liczba iteracji: %d\n', it);

    % Obliczenie normy warunku bez komentarza interpretacyjnego
    condition = norm(mnozenie_wejsciowy_trojdiagonal_wektor(a, b, c, v) - lambda * v) / norm(lambda * v);
    fprintf('Wartość warunku ||Av - λv|| / ||λv||: %e\n', condition);
end


disp('Koniec testu.')
end % function
