function test2()
% Projekt 2, zadanie 14
% Piotr Jankiewicz, 288767
%
% Test poprawności działania odwrotnej metody potęgowej.
% Sprawdza zgodność wyniku z wbudowaną funkcją eig dla macierzy
% trójdiagonalnej rozmiaru n x n o znanych elementach.
% Test weryfikuje, czy znaleziona wartość własna i wektor własny
% spełniają równanie własne z zadaną dokładnością.

% Inicjalizacja danych testowych
n = 100;

% Podprzekątna z losowymi wartościami w zakresie [-10, 10]
a = -100 + 200 * rand(1, n-1);

% Główna przekątna z losowymi wartościami w zakresie [-10, 10]
b = -100 + 200 * rand(1, n);

% Nadprzekątna z wartosciami jak a by zapewnic symetryczność, co zapewnia,
% ze wartosci wlasne sa rzeczywiste
c = a; % 

% % Konstrukcja macierzy testowej
A = diag(b) + diag(c, 1) + diag(a, -1);
% disp('Macierz testowa:')
% disp(A)


% Obliczenie wartości referencyjnych za pomocą eig
[V, D] = eig(A);
lambdas = diag(D);
% 
% [min_eigenvalue, min_index] = min(diag(D));

% Wyświetlenie wartości referencyjnych
% disp('Wartości referencyjne (eig):')
disp(lambdas)
% disp('Odpowiadające wektory własne:')
% disp(V')

% Zapis wektorów do pliku .mat
save('wektory.mat', 'a', 'b', 'c');


mu = 1;
disp(['Poszukwiana wartosc wlasna najblizej mu= ', num2str(mu)])

disp('Naciśnij dowolny klawisz aby kontynuować...')
pause % Czeka na naciśnięcie klawisza



% Parametry dla odwrotnej metody potęgowej

tol = 1e-12;
maxIter = 100000;



% Wykonanie testowanej metody
[lambda, v, errEst] = odwrotna_metoda_potegowa(a, b, c, mu, tol, maxIter);

% Weryfikacja poprawności wyniku
disp('Wyniki odwrotnej metody potęgowej:')
disp('Znaleziona wartość własna:')
disp(lambda)
% disp('Znaleziony wektor własny:')
% disp(v')

% Sprawdzenie równania własnego
lvalue = mnozenie_wejsciowy_trojdiagonal_wektor(a, b, c, v);
rvalue = lambda * v;
residual_norm = norm(lvalue - rvalue);

disp('Norma residuum ||Av - λv||:')
disp(residual_norm)


disp('Condition value: ||Av - λv|| / || λv ||:')
condition = residual_norm/norm(rvalue);
disp(condition)


% Weryfikacja dokładności
if condition <= 1e-11
    disp('Test zakończony pomyślnie - równanie własne spełnione')
else
    disp('Test nie powiódł się - zbyt duży błąd residuum')
end



mu = 9;
disp(['Poszukwiana wartosc wlasna najblizej mu= ', num2str(mu)])

disp('Naciśnij dowolny klawisz aby kontynuować...')
pause % Czeka na naciśnięcie klawisza


% Wykonanie testowanej metody
[lambda, v, errEst] = odwrotna_metoda_potegowa(a, b, c, mu, tol, maxIter);

% Weryfikacja poprawności wyniku
disp('Wyniki odwrotnej metody potęgowej:')
disp('Znaleziona wartość własna:')
disp(lambda)
% disp('Znaleziony wektor własny:')
% disp(v')

% Sprawdzenie równania własnego
lvalue = mnozenie_wejsciowy_trojdiagonal_wektor(a, b, c, v);
rvalue = lambda * v;
residual_norm = norm(lvalue - rvalue);


disp('Norma residuum ||Av - λv||:')
disp(residual_norm)


disp('Condition value: ||Av - λv|| / || λv ||:')
condition = residual_norm/norm(rvalue);
disp(condition)


% Weryfikacja dokładności
if condition <= 1e-11
    disp('Test zakończony pomyślnie - równanie własne spełnione')
else
    disp('Test nie powiódł się - zbyt duży błąd residuum')
end


mu = -1;
disp(['Poszukwiana wartosc wlasna najblizej mu= ', num2str(mu)])

disp('Naciśnij dowolny klawisz aby kontynuować...')
pause % Czeka na naciśnięcie klawisza


% Wykonanie testowanej metody
[lambda, v, errEst] = odwrotna_metoda_potegowa(a, b, c, mu, tol, maxIter);

% Weryfikacja poprawności wyniku
disp('Wyniki odwrotnej metody potęgowej:')
disp('Znaleziona wartość własna:')
disp(lambda)
% disp('Znaleziony wektor własny:')
% disp(v')

% Sprawdzenie równania własnego
lvalue = mnozenie_wejsciowy_trojdiagonal_wektor(a, b, c, v);
rvalue = lambda * v;
residual_norm = norm(lvalue - rvalue);



disp('Norma residuum ||Av - λv||:')
disp(residual_norm)


disp('Condition value: ||Av - λv|| / || λv ||:')
condition = residual_norm/norm(rvalue);
disp(condition)


% Weryfikacja dokładności
if condition <= 1e-11
    disp('Test zakończony pomyślnie - równanie własne spełnione')
else
    disp('Test nie powiódł się - zbyt duży błąd residuum')
end


mu = 12;
disp(['Poszukwiana wartosc wlasna najblizej mu= ', num2str(mu)])

disp('Naciśnij dowolny klawisz aby kontynuować...')
pause % Czeka na naciśnięcie klawisza


% Wykonanie testowanej metody
[lambda, v, errEst] = odwrotna_metoda_potegowa(a, b, c, mu, tol, maxIter);

% Weryfikacja poprawności wyniku
disp('Wyniki odwrotnej metody potęgowej:')
disp('Znaleziona wartość własna:')
disp(lambda)
disp('Znaleziony wektor własny:')
% disp(v')

% Sprawdzenie równania własnego
lvalue = mnozenie_wejsciowy_trojdiagonal_wektor(a, b, c, v);
rvalue = lambda * v;
residual_norm = norm(lvalue - rvalue);


disp('Norma residuum ||Av - λv||:')
disp(residual_norm)


disp('Condition value: ||Av - λv|| / || λv ||:')
condition = residual_norm/norm(rvalue);
disp(condition)


% Weryfikacja dokładności
if condition <= 1e-11
    disp('Test zakończony pomyślnie - równanie własne spełnione')
else
    disp('Test nie powiódł się - zbyt duży błąd residuum')
end

end % function