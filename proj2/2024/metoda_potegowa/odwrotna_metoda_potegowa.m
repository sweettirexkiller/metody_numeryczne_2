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
%    a        - wektor wartosci znajdujących się pod diagonalą macierzy A
%    b        - wektor wartosci znajdujących się na diagonali macierzy A
%    c        - wektor wartosci znajdującyhc się nad diagonalą macierzy A
%    miu      - podana wartosc dla ktorej bedzie szukana najblisza wartosc wlasna
%                 macierzy A
%    tol      - granica dokładnosci wykonywanych iteracji 
%    maxIter  - limit liczby iteracji, dla których procedura zostanie
%             przerwana

% WYJŚCIE:
%    lambda     - znaleziona wartosc wlasna najblizsza miu
%    v          - znaleziony wektor własny 
%    errEst     - oszacowanie błędu (względnego) obliczonego przybliżenia wartości własnej  
outputArg2 = inputArg2;
end

