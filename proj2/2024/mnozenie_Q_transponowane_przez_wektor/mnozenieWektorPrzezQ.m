function [y] = mnozenieWektorPrzezQ(Householdery,x)
% Projekt 2, zadanie 14
% Piotr Jankiewicz, 288767
% 
% Funkcja mnozenieWektorPrzezQ
% 
% wektor_wynikowy = Q*x;
%
% WEJŚĆIE:
%    Householdery - macierz [2x2xn-1] wszystkich macierzy housholdera do
%                   zerowania kolejnych kolumn
%    x            - wektor x wejsciowy 
%   
% 
%
% WYJŚCIE:
%    y            - wynik mnozenia wektora przez Q

% Q = H1*H2*....Hn-1*Hn-2;
% Q*x = H1*H2.....*Hn-1*x;
    y = x;
    n = size(x);
    n = n(1);

     for i = (n-1: -1:1)
        H_i = Householdery(:,:,i);
        y_i = y(i:i+1,1);
        y(i:i+1, 1) = H_i*y_i;
    end
end % function
