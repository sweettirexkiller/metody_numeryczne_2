function test3()
% Test dla funkcji RobHouseholderaTrzyDiagonalnie
% Projekt 2, zadanie 14
% Piotr Jankiewicz, 288767
%
% Test sprawdza dokładność numeryczną rekonstrukcji, weryfikując czy błędy
% w odtworzonych wektorach są rzędu błędu maszynowego.

disp('Test: Weryfikacja dokładności numerycznej')
disp('Sprawdzamy różnice między oryginalnymi i zrekonstruowanymi wektorami')
disp('Naciśnij dowolny klawisz...')
pause

% Dane wejściowe
a = [5, 6, 7]; b = [1, 2, 3, 4]; c = [8, 9, 10];
[p, q, s, Householdery] = RobHouseholderaTrzyDiagonalnie(a, b, c);
n = length(b);

% Obliczenia rekonstrukcji
a_new = zeros(1, n-1); b_new = zeros(1, n); c_new = zeros(1, n-1);
for i = n-1:-1:1
    H = Householdery(:, :, i);
    if i == n-1
        R_block = [p(i), q(i); 0, p(i+1)];
        temp = H * R_block;
        a_new(i) = temp(2,1); b_new(i) = temp(1,1);
        b_new(i+1) = temp(2,2); c_new(i) = temp(1,2);
    else
        R_block = [p(i), q(i), s(i); 0, b_new(i+1), c_new(i+1)];
        temp = H * R_block;
        a_new(i) = temp(2,1); b_new(i) = temp(1,1);
        c_new(i) = temp(1,2); b_new(i+1) = temp(2,2);
        c_new(i+1) = temp(2,3);
    end
end

disp('Błędy rekonstrukcji:')
fprintf('Błąd elementów pod przekątną:     %.2e\n', norm(a - a_new))
fprintf('Błąd elementów głównej przekątnej: %.2e\n', norm(b - b_new))
fprintf('Błąd elementów nad przekątną:      %.2e\n', norm(c - c_new))

end % function test3
