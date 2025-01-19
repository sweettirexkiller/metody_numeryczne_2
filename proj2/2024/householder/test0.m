function test0()
% Test dla funkcji RobHousholdera
% Projekt 2, zadanie 14
% Piotr Jankiewicz, 288767

disp('Test 0: Weryfikacja własności transformacji Householdera')
disp('Dane testowe:')
disp('   Wektor wejściowy x = [5; 1]')
disp('Test sprawdza następujące własności:')
disp('   1. ||x|| = ||Hx|| (zachowanie normy)')
disp('   2. H^T = H (symetryczność)')
disp('   3. H^T * H = I (ortogonalność)')
disp('   4. H^2 = I (idempotentność)')
disp('Naciśnij dowolny klawisz...')
pause

% Dane wejściowe i obliczenia
x = [5; 1];
[y1, H] = RobHousholdera(x(1), x(2));
y = [y1; 0];

disp('Wyniki transformacji:')
disp('Macierz Householdera H =')
disp(H)
disp('Wektor wynikowy y =')
disp(y)
disp('Naciśnij dowolny klawisz...')
pause

disp('Weryfikacja własności:')
fprintf('1. |błąd normy| = %.2e\n', abs(norm(x) - norm(y)))
fprintf('2. ||H - H^T|| = %.2e\n', norm(H - H'))
fprintf('3. ||H^T*H - I|| = %.2e\n', norm(H'*H - eye(2)))
fprintf('4. ||H^2 - I|| = %.2e\n', norm(H*H - eye(2)))

end % function test0
