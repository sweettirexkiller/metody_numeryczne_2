function test10()
% Test dla funkcji mnozenie_wejsciowy_trojdiagonal_wektor
% Projekt 2, zadanie 14
% Piotr Jankiewicz, 288767
%
% Test sprawdza poprawność mnożenia wektora przez macierz trójdiagonalną.
% Używamy prostego przykładu 4x4, gdzie każdy element macierzy ma inną
% wartość, co pozwala dokładnie zweryfikować poprawność mnożenia we
% wszystkich pozycjach.

disp('Test: Mnożenie wektora przez macierz trójdiagonalną')
disp('Testujemy macierz o strukturze:')
disp('   [2  1  0  0]    gdzie:')
disp('   [3  4  5  0]    B = [2,4,6,8] (główna przekątna)')
disp('   [0  7  6  9]    C = [1,5,9]   (nad główną)')
disp('   [0  0  2  8]    A = [3,7,2]   (pod główną)')
disp('Naciśnij dowolny klawisz...')
pause

% Przygotowanie danych testowych
B = [2, 4, 6, 8];    % główna przekątna
C = [1, 5, 9];       % nad główną
A = [3, 7, 2];       % pod główną
x = [1; 1; 1; 1];    % wektor testowy

disp('Mnożymy przez wektor x = [1; 1; 1; 1]')
disp('Spodziewane wyniki dla każdego wiersza:')
disp('y(1) = 2*1 + 1*1 = 3         (pierwszy wiersz)')
disp('y(2) = 3*1 + 4*1 + 5*1 = 12  (środkowy wiersz)')
disp('y(3) = 7*1 + 6*1 + 9*1 = 22  (środkowy wiersz)')
disp('y(4) = 2*1 + 8*1 = 10        (ostatni wiersz)')
disp('Naciśnij dowolny klawisz...')
pause

% Wykonanie mnożenia
y = mnozenie_wejsciowy_trojdiagonal_wektor(A, B, C, x);

% Wyświetlenie i weryfikacja wyników
disp('Otrzymany wynik y:')
disp(y)

% Weryfikacja poprawności przez porównanie z oczekiwanymi wynikami
y_expected = [3; 12; 22; 10];
fprintf('Błąd wyniku: %.2e\n', norm(y - y_expected))

end % function test