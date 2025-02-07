function [y] = mnozenieQtransponowanePrzezWektor(Householdery,x)
% Projekt 2, zadanie XXXX
% Piotr Jankiewicz, 288767
% 
% Funkcja mnozenieQtransponowanePrzezWektor
% 
% wektor_wynikowy = Q^t*x;
%
% WEJŚĆIE:
%    Householdery - macierz [2x2xn-1] wszystkich macierzy housholdera do
%                   zerowania kolejnych kolumn
%    x            - wektor x wejsciowy 
%   
% 
%
% WYJŚCIE:
%    y            - wynik mnozenia wektora przez Q transponowane



% Q^t = Hn-1 * Hn-2*.....*H1;
% Q^t*x = Hn-1*Hn-2.....*H1*x;

    y = x;
    n = size(x);
    n = n(1);

    for i = (1: +1:n-1)
      H_i = Householdery(:,:,i);
      y_i = y(i:i+1,1);
      y(i:i+1, 1) = H_i*y_i;
    end

end

