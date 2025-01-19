function test12()
% Test dla funkcji RobHouseholderaTrzyDiagonalnie
% Projekt 2, zadanie 14
% Piotr Jankiewicz, 288767
%
% Test weryfikuje poprawność mnożenia przez macierz Q i jej transpozycję.
% Sprawdzamy własność Q*Q^T = I, wykonując sekwencję mnożeń:
% 1) Najpierw mnożymy wektor x przez Q^T, otrzymując y
% 2) Następnie mnożymy y przez Q, co powinno odtworzyć x
% Jeśli implementacja jest poprawna, różnica między wektorem
% początkowym x a końcowym Q*Q^T*x powinna być bliska zeru.

disp('Test: Weryfikacja własności Q*Q^T = I uzyskanej z algorytmu Householdera')
disp('Testujemy dla macierzy trójdiagonalnej:')
disp('Dane wejściowe:')
disp('a = [5, 6, 7]       (pod główną)')
disp('b = [1, 2, 3, 4]    (główna)')
disp('c = [8, 9, 10]      (nad główną)')
disp('Naciśnij dowolny klawisz...')
pause

% Przygotowanie danych testowych
a = [5, 6, 7];
b = [1, 2, 3, 4];
c = [8, 9, 10];
x = [2, 3, 4, 5]';

disp('Wektor testowy x:')
disp(x)
disp('Wykonujemy sekwencję mnożeń Q^T * x, a następnie Q * (Q^T * x)')
disp('Naciśnij dowolny klawisz...')
pause

% Obliczenie rozkładu i wykonanie mnożeń
[~,~,~, Householdery] = RobHouseholderaTrzyDiagonalnie(a, b, c);
y = mnozenieQtransponowanePrzezWektor(Householdery, x);
y_prime = mnozenieWektorPrzezQ(Householdery, y);

% Wyświetlenie wyników pośrednich i końcowych
disp('Wyniki kolejnych przekształceń:')
fprintf('1. Q^T * x = y:\n')
disp(y)
fprintf('2. Q * y = Q * (Q^T * x):\n')
disp(y_prime)
fprintf('3. Błąd: ||x - Q*(Q^T*x)|| = %.2e\n', norm(x - y_prime))

end % function
