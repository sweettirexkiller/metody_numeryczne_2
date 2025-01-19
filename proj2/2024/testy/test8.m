function test8()
% Projekt 2, zadanie 14
% Piotr Jankiewicz, 288767
%
% Test sprawdza współdziałanie funkcji rozwiaz_invAx_rowne_b oraz
% mnozenie_wejsciowy_trojdiagonal_wektor przy rozwiązywaniu układu równań
% z zadaną macierzą trójdiagonalną.
%
% Weryfikacja polega na rozwiązaniu układu inv(A)*x = b dla znanej macierzy A
% i wektora x, a następnie pomnożeniu wyniku b przez macierz A. Jeśli
% implementacje są poprawne, w wyniku otrzymamy z powrotem oryginalny wektor x.
%
% Macierz A jest zdefiniowana jako:
%   [  4   1   0   0   0 ]
%   [  1   4   1   0   0 ]
%   [  0   1   4   1   0 ]
%   [  0   0   1   4   1 ]
%   [  0   0   0   1   4 ]
% gdzie:
%   - wektor a zawiera elementy podprzekątnej   (tu: 1)
%   - wektor b zawiera elementy głównej przekątnej (tu: 4)
%   - wektor c zawiera elementy nadprzekątnej   (tu: 1)
%
% Wektor x to: [1; 2; 3; 4; 5]
% Spodziewany wynik x_prime to taki sam wektor jak x.
%
% Oczekiwany wynik:
% - Wizualna zgodność wektorów x oraz x_prime.
% - Błąd rozwiązania ||x_prime - x|| bliski zeru (<1e-10).

disp('Test: Rozwiązywanie układu równań z zadaną macierzą trójdiagonalną');
disp('Testujemy następującą sekwencję operacji:');
disp('1. Definiujemy macierz A i wektor x');
disp('2. Rozwiązujemy układ inv(A)*x = b');
disp('3. Weryfikujemy rozwiązanie mnożąc A*b');

% Definicja macierzy A i wektora x
n = 5;
a = ones(n-1, 1)';      % podprzekątna
b = 4*ones(n, 1)';      % główna przekątna
c = ones(n-1, 1)';      % nadprzekątna
x = (1:n)';

disp(' ');
disp('Macierz A:');
A = diag(b) + diag(c, 1) + diag(a, -1);
disp(full(A));
disp('Wektor x:');
disp(x');

disp('Naciśnij dowolny klawisz, aby rozpocząć obliczenia...');
pause;

% Rozwiązanie układu i weryfikacja
disp('Rozwiązywanie układu równań...');
b_wynik = rozwiaz_invAx_rowne_b(a, b, c, x);
x_prime = mnozenie_wejsciowy_trojdiagonal_wektor(a, b, c, b_wynik);

% Prezentacja wyników
disp('Wyniki testu:');
disp('Wektor x:');
disp(x');
disp('Uzyskany wektor x_prime:');
disp(x_prime');

err = norm(x_prime - x);
fprintf('Błąd rozwiązania: ||x_prime - x|| = %.2e\n', err);

end % function
