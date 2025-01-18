function [y1, H] = RobHouseholdera(x1,x2)
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
%    H   - macierz Householdera

x = [x1; x2;];
x_norm = norm(x);
x_prime = x_norm * eye(2, 1);

% dostosowanie znaku x_prime dla stabilnosci numerycznej
if x(1) < 0
    x_prime = -x_prime;
end

if isreal(x)
    % Dla liczb rzeczywistych
    u = x - x_prime;
else
    % Dla liczb zespolonych
    if abs(x(1)) == 0
        x1_inv_abs = 0; % Unikaj dzielenia przez zero
    else
        x1_inv_abs = 1 / abs(x(1));
    end

    e1 = eye(2, 1); % Jednostkowy wektor e1
    % Wybór formuły w zależności od znaku części rzeczywistej x(1)
    if real(x(1)) >= 0
        u = x + x(1) * x1_inv_abs * x_norm * e1;
    else
        u = x - x(1) * x1_inv_abs * x_norm * e1;
    end
end

u = u / norm(u); % normalizacja
I = eye(2,2);
H = I - (2*(u)*u')/(u'*u);
y = H*x;
y1 = y(1,1);

end % function
