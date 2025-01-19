function numtest3()
% Projekt 2, zadanie 14
% Piotr Jankiewicz, 288767
%
% Test numerycznych własności odwrotnej metody potęgowej
% Weryfikacja dokładności aproksymacji dla różnych macierzy

% Parametry domyślne
tol_default = eps * 100;
maxIter_default = 1000;

disp('Test 3: Dokładność aproksymacji')
disp('--------------------------------')

% Różne macierze testowe
test_cases = {
    [10 10 10 10 10],  % Stała diagonala
    [1 2 3 4 5],        % Rosnąca diagonala
    [5 4 3 2 1]         % Malejąca diagonala
    };

for i = 1:length(test_cases)
    % Przygotowanie macierzy
    b = test_cases{i};
    a = ones(1, length(b)-1);
    c = ones(1, length(b)-1);

    fprintf('\nTest dla macierzy: %s\n', mat2str(a));
    disp('Naciśnij dowolny klawisz, aby kontynuować...')
    pause

    % Różne tolerancje błędu
    tol_values = [eps*10, eps*100, eps*1000];

    for j = 1:length(tol_values)
        % Parametr przesunięcia jako średnia diagonali
        mu = mean(a);
        tol = tol_values(j);

        fprintf('\nToleancja błędu: %e\n', tol);

        % Wywołanie metody
        [lambda, ~, errEst, it] = P2Z14_PJA_odwrotna_metoda_potegowa(...
            a, b, c, mu, tol, maxIter_default);

        % Wyświetlenie surowych wyników bez interpretacji
        fprintf('Znaleziona wartość własna: %f\n', lambda);
        fprintf('Błąd estymacji: %e\n', errEst);
        fprintf('Liczba iteracji: %d\n', it);
    end
end

disp('Koniec testu dokładności.')
end % function numtest3
