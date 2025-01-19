function test5()
% Projekt 2, zadanie 14
% Piotr Jankiewicz, 288767
%
% Test poprawności działania odwrotnej metody potęgowej.
% Test przeprowadzany dla macierzy 20000x20000 ze znanymi wartościami własnymi.
% Weryfikacja rozszerzenia macierzy trójdiagonalnej.

% Inicjalizacja danych testowych
load("wektory_test_2.mat", "a", "b", "c");
load("wektory_test_4.mat", "lambdas");

% Rozszerzenie macierzy do rozmiaru 20 000 x 20 000
a_expantion_size = 20000 - size(a,2) - 1;
a_expanded = [a, zeros(1, a_expantion_size)];
b_expantion_size = 20000 - size(b,2);
b_expanded = [b, ones(1, b_expantion_size)];
c_expantion_size = 20000 - size(c,2) - 1;
c_expanded = [c, zeros(1, c_expantion_size)];

% Informacja o teście
disp('Test odwrotnej metody potegowej dla rozszerzenia macierzy trójdiagonalnej o znanych wartościach własnych');
disp("Wielkość macierzy 20 000 x 20 000");

% Parametry dla odwrotnej metody potęgowej
tol = eps * 100;
maxIter = 1000;

% Informacja o sposobie wyboru wartości własnych
fprintf('Uwaga: W każdym teście wartość własna jest losowo wybierana\n');
fprintf('spośród %d znanych wartości własnych macierzy.\n\n', length(lambdas));

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
    [lambda, v, ~, it] = P2Z14_PJA_odwrotna_metoda_potegowa(a_expanded, b_expanded, c_expanded, mu, tol, maxIter);

    % Wyświetlenie surowych wyników bez interpretacji
    fprintf('Znaleziona wartość własna: %s\n', num2str(lambda));
    fprintf('Liczba iteracji: %d\n', it);

    % Obliczenie normy warunku bez komentarza interpretacyjnego
    condition = norm(mnozenie_wejsciowy_trojdiagonal_wektor(a_expanded, b_expanded, c_expanded, v) - lambda * v) / norm(lambda * v);
    fprintf('Wartość warunku ||Av - λv|| / ||λv||: %e\n', condition);
end

disp('Koniec testu.')
end % function
