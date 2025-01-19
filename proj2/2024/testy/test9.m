function test9()
% Projekt 2, zadanie 14
% Piotr Jankiewicz, 288767
%
% Test sprawdza poprawność działania funkcji trojdiagonalny_gauss
% rozwiązującej układ równań R * x = y z macierzą trójdiagonalną R
% oraz funkcji mnozenie_trojdiagonal_wektor dokonującej mnożenia
% macierzy trójdiagonalnej przez wektor.
%
% Weryfikacja polega na rozwiązaniu układu R * x = y dla zadanej
% macierzy R i wektora y, a następnie pomnożeniu otrzymanego x
% przez macierz R. Jeśli funkcje działają poprawnie, uzyskany wektor
% y_test powinien być taki sam jak wejściowy y.
%
% WEJŚCIE:
% - Macierz R w postaci wektorów p, q, s zawierających odpowiednio
%   elementy głównej przekątnej, pierwszej i drugiej przekątnej nad główną
% - Wektor prawych stron równania y
%
% WYJŚCIE:
% - Komunikat o wyniku testu

% Definicja danych wejściowych
p = [4, 2, 1, 2, 3];  % Główna przekątna
q = [1, 2, 3, 4];     % Pierwsza przekątna nad główną
s = [2, 3, 4];        % Druga przekątna nad główną
y = [1, 1, 1, 1, 1]; % Wektor prawych stron

disp('Test funkcji trojdiagonalny_gauss i mnozenie_trojdiagonal_wektor');
disp('dla układu równań R * x = y z macierzą trójdiagonalną R (5x5).');
disp(' ');

% Konstrukcja macierzy R z zadanych wektorów
R = diag(p) + diag(q, 1) + diag(s, 2);
disp('Macierz trójdiagonalna R:');
disp(R);
disp('Wektor prawych stron y:');
disp(y);
disp('Naciśnij dowolny klawisz, aby kontynuować...');
pause;

% Rozwiązanie układu R * x = y
disp('Rozwiązywanie układu R * x = y za pomocą trojdiagonalny_gauss...');
x = trojdiagonalny_gauss(p, q, s, y);
disp('Otrzymany wektor x:');
disp(x');

% Weryfikacja przez mnożenie R * x
disp('Weryfikacja wyniku przez mnożenie R * x za pomocą mnozenie_trojdiagonal_wektor...');
y_test = mnozenie_trojdiagonal_wektor(p, q, s, x);

% Obliczenie normy różnicy między y a y_test
norma_diff = norm(y - y_test);
disp('|| y - y_test || = ');
disp(norma_diff);
disp(' ');

end  % function
