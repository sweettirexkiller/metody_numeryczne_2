function [y1, h1, h2] = RobHouseholdera(x1,x2)
% Projekt 2, zadanie XXXX
% Piotr Jankiewicz, 288767
% 
% Funkcja RobHouseholdera
% WEJŚĆIE:
%    x1     - pierwsza wspolrzedna wektora wejsciowego 
%    x2     - droga wspolrzedna wektora wejsciowego
% 
%
% WYJŚCIE:
%    y1  - pierwsza wspolrzaedna wektora wyjsciowego (refkleksji x)
%    h1  - pierwsza kolumna reflektora
%    h2  - droga kolumna reflektora

y1 = 0;
h1 = 0;
h2 = 0;

x = [x1; x2;];

x_norm = norm(x);

x_prime = x_norm * eye(2, 1);

u = x - x_prime;

I = eye(2,2);

H = I - (2*(u)*u')/(u'*u);


h1 = H(:,1);
h2= H(:, 2);

y = H*x;


y1 = y(1,1);

end