function test17()
% Test dla funkcji RobHouseholderaTrzyDiagonalnie
% Projekt 2, zadanie 14
% Piotr Jankiewicz, 288767
%
% Test weryfikuje proces rekonstrukcji macierzy wejściowej poprzez
% sprawdzenie, czy potrafimy odtworzyć oryginalną macierz A z rozkładu QR.

disp('Test: Rekonstrukcja macierzy wejściowej')
a = [5, 6, 7]; b = [1, 2, 3, 4]; c = [8, 9, 10];
[p, q, s, Householdery] = RobHouseholderaTrzyDiagonalnie(a, b, c);
n = length(b);

disp('Wykonujemy rekonstrukcję macierzy A poprzez mnożenie Q^T * R')
disp('Naciśnij dowolny klawisz...')
pause

% Rekonstrukcja macierzy
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

disp('Zrekonstruowana macierz A:')
A_reconstructed = diag(b_new) + diag(c_new, 1) + diag(a_new, -1);
disp(A_reconstructed)

end % function test2
