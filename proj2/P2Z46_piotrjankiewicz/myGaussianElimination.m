function y = myGaussianElimination(A, B, C, x)
% myGaussianElimination
% Piotr Jankiewicz, 288767
%
% Funkcja Znajdująca rozwiązanie równania Ey = x metodą eliminacji Gaussa, 
% gdzie E jest macierzą trójdiagonalną n na n, której diagonale są w
% wektorach A,B,C. y jest rozwiązaniem rownania.
%
% WEJŚĆIE:
%    A      - wektor wartosci z diagonali macierzy A
%    B      - wektor wartosci z jeden rzad wyzej od diagonali 
%    C      - wektor wartosci z jeden rzad nizej od diagonali 
%   
% WYJŚCIE:
%    y      - wektor rozwiaania Ey = x


    n = length(A);
    y = x;
  
    for i = n:-1:3
        y(i) = y(i) / A(i);
        A(i) = 1; % should be 1
    
        y(i-1) = y(i-1)  - B(i-1)*y(i);
        B(i-1) = 0;
        
        y(i-2) = y(i-2) - C(i-2)*y(i);
        C(i-2) = 0;
    end

    y(2) = y(2) / A(2);
    A(2) = 1;
    y(1) = y(1)  - B(1)*y(2);
    B(1) = 0;
    y(1) = y(1) / A(1);
    A(1) = 1; 


end