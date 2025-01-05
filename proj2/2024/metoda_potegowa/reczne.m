n = 4; % Rozmiar macierzy

% Definiowanie diagonal
a = [1, 1, 1];    % Diagonalna poniżej głównej (o jeden element mniej)
b = [2, 3, 4, 5]; % Główna diagonalna
c = [1, 1, 1];    % Diagonalna powyżej głównej (o jeden element mniej)


% Konstruowanie macierzy trójdiagonalnej
A = diag(b) + diag(c, 1) + diag(a, -1);

% disp(A); % Wyświetlenie macierzy

% Znajdowanie wartości i wektorów własnych
[V, D] = eig(A);

% % Wyświetlenie wyników
% disp('Wartości własne (diagonalna macierzy D):');
% disp(diag(D)); % Wartości własne (elementy na diagonali macierzy D)
% 
% disp('Wektory własne (kolumny macierzy V):');
% disp(V); % Wektory własne (kolumny macierzy V)

% Znajdowanie największej wartości własnej
[max_eigenvalue, max_index] = max(diag(D)); % Największa wartość własna i jej indeks

% Odpowiadający wektor własny
max_eigenvector = V(:, max_index);

% Wyświetlenie największej wartości własnej i odpowiadającego wektora
disp('Największa wartość własna:');
disp(max_eigenvalue);

disp('Odpowiadający wektor własny:');
disp(max_eigenvector');


% ______________________ rozpoczenie METODY POTEGOWEJ


%rozklad QR
[p,q,s,Householdery] = RobHouseholderaTrzyDiagonalnie(a,b,c);

%wybor x 
x_0 = eye(n,1);

% _______________________ krok 1

% mnozymy R*x = c 


% rozwiazujemy c = H*b by dostac b

%A*x_1 = b_1;
b_1 = mnozenie_wejsciowy_trojdiagonal_wektor(a,b,c, x);

% c_1 = H*b_1; (H*b_1 = Q^t*b_1);

[c_1] = mnozenieQtransponowanePrzezWektor(Householdery, b_1);

% Rx_1 = c_1 - rozwiaz dla x_1

x_1 = trojdiagonalny_gauss(p, q, s, c_1);

%normalizujemy x 
x_1 = x_1/sqrt(x_1'*x_1);


% _______________________ krok 2


%A*x_1 = b_1;
b_2 = mnozenie_wejsciowy_trojdiagonal_wektor(a,b,c, x_1);

% c_2 = H*b_2; (H*b_3 = Q^t*b_2);

[c_2] = mnozenieQtransponowanePrzezWektor(Householdery, b_2);

% Rx_2 = c_2 - rozwiaz dla x_2

x_2 = trojdiagonalny_gauss(p, q, s, c_2);

%normalizujemy x 
x_2 = x_2/sqrt(x_2'*x_2);



% _______________________ krok 3


%A*x_1 = b_1;
b_3 = mnozenie_wejsciowy_trojdiagonal_wektor(a,b,c, x_2);

% c_3 = H*b_3; (H*b_3 = Q^t*b_3);

[c_3] = mnozenieQtransponowanePrzezWektor(Householdery, b_3);

% Rx_3 = c_3 - rozwiaz dla x_3

x_3 = trojdiagonalny_gauss(p, q, s, c_3);

%normalizujemy x 
x_3 = x_3/sqrt(x_3'*x_3);

x_3'