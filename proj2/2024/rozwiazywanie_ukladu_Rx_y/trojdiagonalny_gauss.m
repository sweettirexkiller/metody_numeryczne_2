function x = trojdiagonalny_gauss(p, q, s, y)
% Projekt 2, zadanie XXXXX
% Piotr Jankiewicz, 288767
%
% Funkcja trojdiagonalny_gauss
%
% Funkcja Znajdująca rozwiązanie równania Rx = y metodą eliminacji Gaussa, 
% gdzie R jest macierzą trójdiagonalną n na n, której diagonale są w
% wektorach p,q,s. x jest rozwiązaniem rownania.
%
% WEJŚĆIE:
%    p      - wektor wartosci z diagonali macierzy R
%    q      - wektor wartosci z jeden rzad wyzej od diagonali 
%    s      - wektor wartosci z dwa rzedy wyzej od diagonali 
%   
% WYJŚCIE:
%    x      - wektor rozwiaania Ex = y


    n = length(p);
    x = y;
  
    for i = n:-1:3
        x(i) = x(i) / p(i);
        p(i) = 1; % should be 1
    
        x(i-1) = x(i-1)  - q(i-1)*x(i);
        q(i-1) = 0;
        
        x(i-2) = x(i-2) - s(i-2)*x(i);
        s(i-2) = 0;
    end

    x(2) = x(2) / p(2);
    p(2) = 1;
    x(1) = x(1)  - q(1)*x(2);
    q(1) = 0;
    x(1) = x(1) / p(1);
    p(1) = 1; 



end