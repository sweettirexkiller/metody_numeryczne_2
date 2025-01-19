function test1()
% Projekt 2, zadanie 14
% Piotr Jankiewicz, 288767
%
% Test funkcji odwrotnej metody potęgowej dla macierzy trójdiagonalnej 4x4
% o znanych elementach. Prezentuje wyniki działania funkcji
% P2Z14_PJA_odwrotna_metoda_potegowa dla różnych wartości parametru mu,
% w porównaniu z wynikami referencyjnymi uzyskanymi za pomocą wbudowanej
% funkcji eig.
%
% WEJŚCIE:
% - Macierz A w postaci wektorów a, b, c zawierających odpowiednio
%   elementy poddiagonali, diagonali głównej i naddiagonali.
% - Wektor mu_values zawierający testowe wartości parametru mu.
% - Tolerancja tol i maksymalna liczba iteracji maxIter.
%
% WYJŚCIE:
% - Wartości własne lambdas i wektor własny v zwrócone przez funkcję
%   P2Z14_PJA_odwrotna_metoda_potegowa dla każdej wartości mu.
% - Liczba iteracji it wykonanych przez funkcję.
% - Wartość ||Av - λv|| / ||λv|| obrazująca spełnienie równania własnego.
% - Referencyjne wartości własne macierzy A wyznaczone funkcją eig.

disp('Test funkcji odwrotnej metody potęgowej dla macierzy trójdiagonalnej 4x4');

% Inicjalizacja danych testowych
a = [1, 2, 3];        % Poddiagonala
b = [4, 5, 6, 7];     % Diagonala główna
c = [8, 9, 10];       % Naddiagonala

% Konstrukcja macierzy testowej
A = diag(b) + diag(c, 1) + diag(a, -1);
disp('Macierz testowa:');
disp(A);

% Obliczenie wartości referencyjnych za pomocą eig
[~, D] = eig(A);
lambdas_ref = diag(D);
disp('Referencyjne wartości własne (eig):');
disp(lambdas_ref');

% Parametry dla odwrotnej metody potęgowej
mu_values = [1, 9, -1, 12];
tol = 100 * eps;
maxIter = 1000;

for i = 1:length(mu_values)
    mu = mu_values(i);
    disp(['Test dla mu = ', num2str(mu), ' (blisko lambda_', ...
        num2str(find(abs(lambdas_ref - mu) == min(abs(lambdas_ref - mu)))), '):']);
    disp('Naciśnij dowolny klawisz, aby kontynuować...');
    pause;

    % Wykonanie testowanej metody
    [lambda, v, ~, it] = P2Z14_PJA_odwrotna_metoda_potegowa(a, b, c, mu, tol, maxIter);

    % Wyświetlenie wyników
    disp('Wartość własna lambda:');
    disp(lambda);

    disp('Wektor własny v:');
    disp(v);

    disp(['Liczba iteracji: ', num2str(it)]);

    % Wartość wskaźnika spełnienia równania własnego
    condition = norm(mnozenie_wejsciowy_trojdiagonal_wektor(a, b, c, v) - lambda * v) ...
        / norm(lambda * v);
    disp(['||Av - λv|| / ||λv||: ', num2str(condition)]);

    disp(' ');
end

end % function
