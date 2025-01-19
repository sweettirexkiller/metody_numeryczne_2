function test5()
% Test dla funkcji RobHousholdera
% Projekt 2, zadanie 14
% Piotr Jankiewicz, 288767
%
% Testuje działanie funkcji RobHousholdera na wektorze 2D z liczbami zespolonymi.
% Jest to istotny przypadek testowy, ponieważ transformacja Householdera
% musi zachowywać własności wektorów zespolonych, w tym ich normę oraz
% wzajemne relacje między częściami rzeczywistymi i urojonymi.
%
% Testowane właściwości:
% 1. Wynik norm(x - H*y) powinien być bardzo bliski zera, co potwierdza,
%    że transformacja zachowuje wektor wejściowy.
% 2. Wynik norm(x - H\y) powinien być dokładnie równy zeru, co weryfikuje
%    poprawność macierzy odwrotnej.
% 3. Wynik H\y powinien dokładnie odtwarzać wektor x, co potwierdza
%    pełną odwracalność transformacji.

disp('Test: Transformacja Householdera dla liczb zespolonych')
disp('Testujemy wektor zespolony dwuwymiarowy:')
disp('x = [5 + 3i; 1 - 2i]')
disp('Naciśnij dowolny klawisz...')
pause

% Dane wejściowe zerspolone
x1 = 5 + 3i;  % Liczba zespolona
x2 = 1 - 2i;  % Liczba zespolona
x = [x1; x2];

% Wywołanie funkcji
disp('Wykonujemy transformację Householdera:')
[y1, H] = RobHousholdera(x1, x2);
y = H * x;
disp('Macierz H (macierz Householdera):')
disp(H)
disp('Naciśnij dowolny klawisz...')
pause

% Test 1: norm(x - H*y) powinien być bliski zeru
disp('Weryfikacja własności transformacji:')
test1_result = norm(x - H * y);
fprintf('1. Zachowanie wektora: norm(x - H*y) = %e\n', test1_result);

% Test 2: norm(x - H\y) powinien być dokładnie równy 0
test2_result = norm(x - H \ y);
fprintf('2. Dokładność odwrotności: norm(x - H\\y) = %e\n', test2_result);

% Test 3: H\y powinno odtwarzać x
test3_result = H \ y;
fprintf('3. Rekonstrukcja wektora x:\n')
fprintf('   H\\y = [%f + %fi; %f + %fi]\n', ...
    real(test3_result(1)), imag(test3_result(1)), ...
    real(test3_result(2)), imag(test3_result(2)));

end % function test5
