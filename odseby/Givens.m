function [B] = Givens(A,x)
% Projekt 2, zadanie 35
% Sebastian Prokop, 320728
% 
% Funkcja pomocnicza do funkcji P2Z35_SPR_rotivens, wykonuje deflację 
% z użyciem złożenia obrotów Givensa.
% Wejście: 
%   A   - macierz na której ma zostać przeprowadzona deflacja
%   x   - wektor własny macierzy A wyznaczony metodą potęgową
% Wyjście:
%   B   - macierz rozmiaru o 1 mniejszego od A (n-1,n-1)

n = length(x);
for i = n:-1:2
    % Obroty Givensa mam robić na wektorze własnym x. Równolegle do tego
    % mam je też wykonywać na macierzy A w sposób A = G*A*inv(G)
    a = x(1);
    b = x(i);
    r = sqrt(b^2 + a^2);
    c = a/r;
    s = -b/r;
%   G = [c, -s;
%        s,  c] -- macierz Givensa
    % Obrót na x -- liczę x = G * x
    x1 = x(1);
    xi = x(i);
    x(1) = x1*c - s*xi;
    x(i) = x1*s + c*xi;

    % Obrót na A - liczę A = G * A a potem A = A * inv(G)
    w1 = c.*A(1,:) - s.*A(i,:);
    w2 = c.*A(i,:) + s.*A(1,:);
    % G*A:
    A(1,:) = w1;
    A(i,:) = w2;
    w1 = c.*A(:,1) - s.*A(:,i);
    w2 = c.*A(:,i) + s.*A(:,1);
    % G*A*inv(G):
    A(:,1) = w1;
    A(:,i) = w2;
end
B = A(2:n,2:n);