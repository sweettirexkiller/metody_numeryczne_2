function test4()
% Test dla funkcji RobHouseholderaTrzyDiagonalnie
% Projekt 2, zadanie 14
% Piotr Jankiewicz, 288767
%
% Test sprawdza działanie funkcji dla macierzy jednostkowej 4x4.
% Jest to ważny przypadek szczególny, który weryfikuje zachowanie
% własności macierzy jednostkowej podczas transformacji.

disp('Test 4: Weryfikacja dla macierzy jednostkowej')
disp('Macierz testowa:')
disp('   [1  0  0  0]')
disp('   [0  1  0  0]')
disp('   [0  0  1  0]')
disp('   [0  0  0  1]')
disp('Naciśnij dowolny klawisz...')
pause

% Przygotowanie danych testowych
a = [0, 0, 0];        % pod-diagonala (same zera)
b = [1, 1, 1, 1];     % główna diagonala (same jedynki)
c = [0, 0, 0];        % nad-diagonala (same zera)

% Wykonanie transformacji
[p, q, s, Householdery] = RobHouseholderaTrzyDiagonalnie(a, b, c);
R = diag(p) + diag(q, 1) + diag(s, 2);

% Sprawdzenie wyników transformacji
disp('Macierz R po transformacji:')
disp(R)
disp('Naciśnij dowolny klawisz...')
pause

% Rekonstrukcja oryginalnej macierzy
n = length(b);
a_new = zeros(1, n-1);
b_new = zeros(1, n);
c_new = zeros(1, n-1);

for i = n-1:-1:1
    H = Householdery(:, :, i);
    if i == n-1
        temp = H * [p(i), q(i); 0, p(i+1)];
        a_new(i) = temp(2,1); b_new(i) = temp(1,1);
        b_new(i+1) = temp(2,2); c_new(i) = temp(1,2);
    else
        temp = H * [p(i), q(i), s(i); 0, b_new(i+1), c_new(i+1)];
        a_new(i) = temp(2,1); b_new(i) = temp(1,1);
        c_new(i) = temp(1,2); b_new(i+1) = temp(2,2);
    end
end

% Weryfikacja wyników
disp('Błędy rekonstrukcji:')
fprintf('Pod-diagonala:     %.2e\n', norm(a - a_new))
fprintf('Główna diagonala:  %.2e\n', norm(b - b_new))
fprintf('Nad-diagonala:     %.2e\n', norm(c - c_new))

end % function test4
