addpath("odwrotna_metoda_potegowa");
n = 4; % Rozmiar macierzy

% Definiowanie diagonal
a = [1, 2, 3];    % Diagonalna poniżej głównej (o jeden element mniej)
b = [4, 5, 6, 7]; % Główna diagonalna
c = [8, 9, 10];    % Diagonalna powyżej głównej (o jeden element mniej)
A = diag(b) + diag(c, 1) + diag(a, -1);

disp(A)
% Znajdowanie wartości i wektorów własnych
[V, D] = eig(A);
disp('Wektory własne (kolumny macierzy V):');
disp(V); % Wektory własne (kolumny macierzy V)
% Znajdowanie największej wartości własnej
[min_eigenvalue, min_index] = min(diag(D)); % Największa wartość własna i jej indeks
% Odpowiadający wektor własny
min_eigenvector = V(:, min_index);
disp('Największa wartość własna:');
disp(min_eigenvalue);
disp("Odpowiadajacy jej wektor: ");
disp(min_eigenvector');

% ODWROTNA METODA POTEGOWA
mu = 1;
tol = 1*10^(-10);
maxIter = 100;
[lambda, v, errEst] = odwrotna_metoda_potegowa(a, b, c, mu, tol, maxIter)



% testy dla dodatnich i ujemnych
% jesli || Av - lambda*v || <= 10^-14 to akceptyjemy wynik

lvalue = mnozenie_wejsciowy_trojdiagonal_wektor(a,b,c, v);
rvalue = lambda*v;


norm(lvalue - rvalue)