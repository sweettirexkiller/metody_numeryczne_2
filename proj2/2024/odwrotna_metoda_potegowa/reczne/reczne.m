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
x_0 = eye(n,1)';

% _______________________ krok 1

%1) oblicz Rx = y;

y_1 = 

%A*x = b;
b_1 = mnozenie_wejsciowy_trojdiagonal_wektor(a,b,c, x_0);

% c = H*b; (H*b = Q^t*b);

[c_1] = mnozenieQtransponowanePrzezWektor(Householdery, b_1);


% Rx = c - rozwiaz dla x

x_1 = trojdiagonalny_gauss(p, q, s, c_1);

x_1

%normalizujemy x 
% x_1 = x_1/sqrt(x_1'*x_1);

% x_1'


% _______________________ krok 2


%A*x = b;
b_2 = mnozenie_wejsciowy_trojdiagonal_wektor(a,b,c, x_1);


% c = H*b; (H*b = Q^t*b);

[c_2] = mnozenieQtransponowanePrzezWektor(Householdery, b_2);

% Rx = c - rozwiaz dla x

x_2 = trojdiagonalny_gauss(p, q, s, c_2);

%normalizujemy x 
% x_2 = x_2/sqrt(x_2'*x_2);

x_2'



% _______________________ krok 3


%A*x = b;
b_3 = mnozenie_wejsciowy_trojdiagonal_wektor(a,b,c, x_2);

% c = H*b; (H*b = Q^t*b);

[c_3] = mnozenieQtransponowanePrzezWektor(Householdery, b_3);

% Rx = c - rozwiaz dla x

x_3 = trojdiagonalny_gauss(p, q, s, c_3);

%normalizujemy x 
% x_3 = x_3/sqrt(x_3'*x_3);

% x_3'



% 
% 
% % _______________________ krok 1
% 
% % 1) oblliczyć y = Q^t * x 
% y_0 = mnozenieQtransponowanePrzezWektor(Householdery, x_0);
% % 2) roziwazac R*b = y dla b
% b_0 = trojdiagonalny_gauss(p,q,s,y_0);
% % 3) znormalizowac
% x_1 = b_0;
% x_1 = x_1/sqrt(x_1'*x_1);
% 
% % _______________________ krok 2
% 
% % 1) oblliczyć y = Q^t * x 
% y_1 = mnozenieQtransponowanePrzezWektor(Householdery, x_1);
% % 2) roziwazac R*b = y dla b
% b_1 = trojdiagonalny_gauss(p,q,s,y_1);
% % 3) znormalizowac
% x_2 = b_1;
% x_2 = x_2/sqrt(x_2'*x_2);
% 
% 
% % _______________________ krok 3
% 
% y_2 = mnozenieQtransponowanePrzezWektor(Householdery, x_2);
% % 2) roziwazac R*b = y dla b
% b_2 = trojdiagonalny_gauss(p,q,s,y_2);
% % 3) znormalizowac
% x_3 = b_2;
% x_3 = x_3/sqrt(x_3'*x_3);
% 
% 
% % _______________________ krok 4
% 
% y_3 = mnozenieQtransponowanePrzezWektor(Householdery, x_3);
% % 2) roziwazac R*b = y dla b
% b_3 = trojdiagonalny_gauss(p,q,s,y_3);
% % 3) znormalizowac
% x_4 = b_3;
% x_4 = x_4/sqrt(x_4'*x_4);
% 
% 
% 
% % _______________________ krok 5
% 
% y_4 = mnozenieQtransponowanePrzezWektor(Householdery, x_4);
% % 2) roziwazac R*b = y dla b
% b_4 = trojdiagonalny_gauss(p,q,s,y_4);
% % 3) znormalizowac
% x_5 = b_4;
% x_5 = x_5/sqrt(x_5'*x_5);
% 
% 
% 
% % _______________________ krok 6
% 
% y_5 = mnozenieQtransponowanePrzezWektor(Householdery, x_5);
% % 2) roziwazac R*b = y dla b
% b_5 = trojdiagonalny_gauss(p,q,s,y_5);
% % 3) znormalizowac
% x_6 = b_5;
% x_6 = x_6/sqrt(x_6'*x_6);

