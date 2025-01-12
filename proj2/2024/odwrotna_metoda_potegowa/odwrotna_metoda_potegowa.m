function [lambda, v, errEst] = odwrotna_metoda_potegowa(a, b, c, mu, tol, maxIter)
% Projekt 2, zadanie 14
% Piotr Jankiewicz, 288767
% 
% Funkcja odwrotna_metoda_potegowa
%
% Odnajdywanie wartości własnej macieży A najbliżej podanej 
% wartości miu metodą odwrotną potęgową z normowaniem dla 
% macierzy trójdiagonalnej 
%
% WEJŚĆIE:
%    a        - pod-przekątna, wektor wartosci znajdujących się pod diagonalą macierzy A
%    b        - przekątna, wektor wartosci znajdujących się na diagonali macierzy A
%    c        - nad-przekątna , wektor wartosci znajdującyhc się nad diagonalą macierzy A
%    mu      - podana wartosc dla ktorej bedzie szukana najblisza wartosc wlasna
%               macierzy A
%    tol      - granica dokładnosci wykonywanych iteracji 
%    maxIter  - limit liczby iteracji, dla których procedura zostanie
%               przerwana

% WYJŚCIE:
%    lambda     - znaleziona wartosc wlasna najblizsza miu (przybliżona)
%    v          - znaleziony wektor własny 
%    errEst     - oszacowanie błędu (względnego) obliczonego przybliżenia wartości własnej 


% TODO: przesuwamy b - mu

n = size(b);
n = n(2);

%poczatkowy rozklad QR
[p,q,s,Householdery] = RobHouseholderaTrzyDiagonalnie(a,b,c);

%wybor wktora poczatkowego metody potegowej
x_0 = rand(n,1);

%zmienne do przetrzymywania wartosci z poprzedniego kroku metody potegowej
x_prev = x_0;
lambda_current= inf;
lambda_prev = inf;
diff = inf;
iter = 0;

%dopoki roznica przy nastepncyh krokach nie jest mniejsza od przyjetej
%toleracji to wykonuj krok
while(diff > tol)
    % 1) oblliczyć y = Q^t * x 
    c_current = mnozenieQtransponowanePrzezWektor(Householdery, x_prev);
    % 2) roziwazac R*b = c dla b
    b_current = trojdiagonalny_gauss(p,q,s,c_current);
    x_current = b_current; 
    % 3) obliczyc lambde
    lambda_current = (x_prev'*x_current)\(x_prev'*x_prev);
    % 4) obliczyc czy sie zblizamy do wyniku
    diff = abs(lambda_prev - lambda_current);
    % 5) znormalizowac
    x_current = x_current/sqrt(x_current.'*x_current);
    lambda_prev = lambda_current;
    % 6) oblicz wartość przybliżonego błędu
    errEst = diff;
    x_prev = x_current;

    %7) zwieksz liczbe iteracji i jesli jest za duzo to wyjdz
    iter = iter +1;

    % Sprawdź, czy przekroczono liczbę iteracji
    if iter > maxIter
        error('Maksymalna liczba iteracji została przekroczona. Algorytm nie skonwergował.');
    end
   
end

v = x_prev;
lambda = lambda_prev;


end

