function y = matrixVectorMultiplication(A, B, C, x)
% Projekt 2, zadanie 14
% Piotr Jankiewicz, 288767
%
% Funkcja MatrixVectorMultiplication
%
% Funckja mnozaca Macierz trodiagonalna przez wektor x.
%
% WEJŚĆIE:
%    A      - wektor wartosci z diagonali macierzy A
%    B      - wektor wartosci z jeden rzad wyzej od diagonali 
%    C      - wektor wartosci z jeden rzad nizej od diagonali 
%   
% WYJŚCIE:
%    y      - wektor rozwiaania y = A*x;

n = length(A);
if length(B) ~= n-1 || length(C) ~= n-1 || length(x) ~= n
    error('Inputs A must have length n, B and C must have length n-1, x must have length n')
end

y = zeros(n, 1);
y(1) = A(1)*x(1) + B(1)*x(2);
for i = 2:n-1
    y(i) = C(i-1)*x(i-1) + A(i)*x(i) + B(i)*x(i+1);
end
y(n) = C(n-1)*x(n-1) + A(n)*x(n);


end
