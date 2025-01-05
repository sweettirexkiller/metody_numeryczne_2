function b = mnozenie_wejsciowy_trojdiagonal_wektor(A, B, C, x)
% Projekt 2, zadanie XXXX
% Piotr Jankiewicz, 288767
%
% Funkcja mnozenie_wejsciowy_trojdiagonal_wektor
%
% Funckja mnozaca Macierz trodiagonalna przez wektor x.
%
% WEJŚĆIE:
%    B      - wektor wartosci z diagonali macierzy
%    C      - wektor wartosci z jeden rzad wyzej od diagonali
%    A      - wektor wartosci z jeden rzad nizej od diagonali
%   
% WYJŚCIE:
%    b      - wektor rozwiaania  = A*x;

n = length(B);
if length(C) ~= n-1
    error('Input C must have length n-1');
end

if length(A) ~= n-1
    error('Input A must have length n-1');
end

if length(x) ~= n
    error('Input x must have length n');
end

b = zeros(n, 1);
b(1) = B(1)*x(1) + C(1)*x(2);
for i = 2:n-1
    C(i) = A(i-1)*x(i-1) + B(i)*x(i) + C(i)*x(i+1);
end
b(n) = A(n-1)*x(n-1) + B(n)*x(n);

end
