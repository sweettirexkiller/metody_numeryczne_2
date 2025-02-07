function [a,b,c] = generuj_macierz_trojdiagonalna(n)
% Projekt 2, zadanie 14
% Piotr Jankiewicz, 288767
% 
% Funkcja generuj_macierz_trojdiagonalna
%
% WEJŚĆIE:
%   n - rozmiar macierzy
% WYJŚCIE:
%   a - pod-przekątna, wektor wartosci znajdujących się pod diagonalą macierzy A
%   b - przekątna, wektor wartosci znajdujących się na diagonali macierzy A
%   c - nad-przekątna , wektor wartosci znajdującyhc się nad diagonalą macierzy A


    % Podprzekątna z losowymi wartościami
    a = rand(1, n-1);
    
    % Główna przekątna z losowymi wartościami
    b = rand(1, n);
   
    % Nadprzekątna z losowymi wartościami
    c = rand(1, n-1);
    

end

