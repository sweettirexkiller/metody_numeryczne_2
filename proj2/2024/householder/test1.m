function test1()
% Test dla funkcji RobHouseholderaTrzyDiagonalnie
% Projekt 2, zadanie 14
% Piotr Jankiewicz, 288767
%
% Test sprawdza poprawność rozkładu QR macierzy trójdiagonalnej.
% Weryfikujemy, czy funkcja poprawnie rozkłada macierz wejściową na iloczyn
% macierzy Q (jako iloczyn reflektorów Householdera) i R (górna trójdiagonalna).

disp('Test: Rozkład QR macierzy trójdiagonalnej')
disp('Macierz testowa A o strukturze:')
disp('   [1  8  0  0]    gdzie:')
disp('   [5  2  9  0]    a = [5, 6, 7]     (pod przekątną)')
disp('   [0  6  3 10]    b = [1, 2, 3, 4]  (główna przekątna)')
disp('   [0  0  7  4]    c = [8, 9, 10]    (nad przekątną)')
disp('Naciśnij dowolny klawisz...')
pause

% Dane testowe i utworzenie macierzy
a = [5, 6, 7]; b = [1, 2, 3, 4]; c = [8, 9, 10];
A = diag(b) + diag(c, 1) + diag(a, -1);
disp('Macierz wejściowa A:')
disp(A)
[p, q, s, H] = RobHouseholderaTrzyDiagonalnie(a, b, c);
R = diag(p) + diag(q, 1) + diag(s, 2);
disp('Macierz górna R (wynik rozkładu):')
disp(R)

end % function test1
