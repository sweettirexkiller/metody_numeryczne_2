function test11()
% Test dla funkcji mnozenie_trojdiagonal_wektor
% Projekt 2, zadanie 14
% Piotr Jankiewicz, 288767
%
% Test sprawdza poprawność mnożenia wektora przez macierz górną
% trójdiagonalną. Używamy prostego przykładu 4x4, gdzie możemy
% łatwo zweryfikować wyniki ręcznie.

disp('Test: Mnożenie wektora przez macierz górną trójdiagonalną')
disp('Testujemy macierz R:')
disp('   [1  2  3  0]    gdzie:')
disp('   [0  4  5  6]    p = [1,4,7,9] (główna przekątna)')
disp('   [0  0  7  8]    q = [2,5,8]   (pierwsza nad główną)')
disp('   [0  0  0  9]    s = [3,6]     (druga nad główną)')
disp('Naciśnij dowolny klawisz...')
pause

% Przygotowanie danych testowych
p = [1, 4, 7, 9];    % główna przekątna
q = [2, 5, 8];       % pierwsza nad główną
s = [3, 6];          % druga nad główną
x = [1; 1; 1; 1];    % wektor testowy

disp('Mnożymy przez wektor x = [1; 1; 1; 1]')
disp('Spodziewany wynik:')
disp('y(1) = 1*1 + 2*1 + 3*1 = 6')
disp('y(2) = 4*1 + 5*1 + 6*1 = 15')
disp('y(3) = 7*1 + 8*1 = 15')
disp('y(4) = 9*1 = 9')
disp('Naciśnij dowolny klawisz...')
pause

% Wykonanie mnożenia
y = mnozenie_trojdiagonal_wektor(p, q, s, x);

% Wyświetlenie wyników
disp('Otrzymany wynik y:')
disp(y)

% Weryfikacja poprawności
y_expected = [6; 15; 15; 9];
fprintf('Błąd wyniku: %.2e\n', norm(y - y_expected))

end % function test