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

%rozklad QR
[p,q,s,Householdery] = RobHouseholderaTrzyDiagonalnie(a,b,c);

%wybor x 

x_0 = rand(n,1);

x_prev = x_0;
lambda_current= inf;

%zamiast petli sprawdzac tolerancje w  - abs(lambda^2  - old_lambda^2)
for i = (1: +1:40)
    % 1) oblliczyć y = Q^t * x
    c_current = mnozenieQtransponowanePrzezWektor(Householdery, x_prev);
    % 2) roziwazac R*b = c dla b
    b_current = trojdiagonalny_gauss(p,q,s,c_current);
    % 3) znormalizowac
    x_current = b_current;
    % x_max = max(x_current); 
    % 
    % x_current = x_current./x_max
    lambda_current = (x_prev'*x_current)\(x_prev'*x_prev);
    
 
    x_current = x_current/sqrt(x_current.'*x_current);
  
    % lambda_current = (x_prev'*x_current)/(x_prev'*x_prev);
    

    x_prev = x_current;

end

lambda_current
v = x_prev';


% testy dla dodatnich i ujemnych
% || Av - lambda*v || <= e^-14 (lub 128*epsilon)

lvalue = mnozenie_wejsciowy_trojdiagonal_wektor(a,b,c, v);
rvalue = lambda_current*v;

lvalue' - rvalue




