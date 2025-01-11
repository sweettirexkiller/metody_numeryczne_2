function [b] = rozwiaz_invAx_rowne_b(a,b,c, x)
% Projekt 2, zadanie 14
% Piotr Jankiewicz, 288767
% 
% Funkcja rozwiaz_invAx_rowne_b
% 
% metoda realizuje roziwazanie ukladu inv(A)x = b w trzech krokach.
% Rozklada wejsciowa macierz na QR za pomoca refleksji Householdera. Potem
% wymnaża c = Q^t*x a następnie rozwiązuje Rb = c.
%
% WEJŚĆIE:
%    a        - pod-przekątna, wektor wartosci znajdujących się pod diagonalą macierzy A
%    b        - przekątna, wektor wartosci znajdujących się na diagonali macierzy A
%    c        - nad-przekątna , wektor wartosci znajdującyhc się nad diagonalą macierzy A
%    x        - wektor wejsciowy rownania
%
% WYJŚCIE:
%    b        - wynik rozwiązania układu.


    % 1)rozklad QR
    [p,q,s,Householdery] = RobHouseholderaTrzyDiagonalnie(a,b,c);
    % 2) oblliczyć c = Q^t * x
    c = mnozenieQtransponowanePrzezWektor(Householdery, x);
    % 3) rozwiazac R*b = c dla b
    b = trojdiagonalny_gauss(p,q,s,c);

end

