function y = mnozenie_trojdiagonal_wektor(p,q,s,x)
% Projekt 2, zadanie XXXXX
% Piotr Jankiewicz, 288767
%
% Funkcja mnozenie_trojdiagonal_wektor
%
% Funckja mnozaca Macierz trodiagonalna trojkatna gorna przez wektor x.
%
% WEJŚĆIE:
%    p      - wektor wartosci z diagonali macierzy R
%    x      - wektor wartosci z jeden rzad wyzej od diagonali 
%    s      - wektor wartosci z dwa rzedy wyzej od diagonali 
%   
% WYJŚCIE:
%    y      - wektor rozwiaania y = R*x;

    n = length(p);
    if length(q) ~= n-1 || length(s) ~= n-2 || length(x) ~= n
        error('Inputs p must have length n, q and s must have length n-1, x must have length n')
    end
    
    y = zeros(n, 1);
    
    
    for i = 1:n-2
        y(i) = p(i)*x(i) + q(i)*x(i+1) + s(i)*x(i+2);
    end
    
    y(n-1) = p(n-1)*x(n-1) + q(n-1)*x(n);
    y(n) = p(n)*x(n);

end

