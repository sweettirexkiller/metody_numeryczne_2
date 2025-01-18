function [diff] = oblicz_warunek_stopu(x_current,x_prev)
% Projekt 2, zadanie 14
% Piotr Jankiewicz, 288767
%
% Funkcja implementuje obliczenie warunku stopu w odwrotnej metodzie
% potęgowej.
%
% WEJŚCIE:
%   x_current  - wektor będący rozwiązaniem w aktualnym kroku iteracji
%   x_prev     - wektor będący rozwiązaniem w poprzednim kroku iteracji
%
% WYJŚCIE:
%   diff  - wartosc warunku stopu metody

[~, i_max_current] = max(abs(x_current));
[~, i_max_prev] = max(abs(x_prev));
current_check_value = (1 / x_current(i_max_current)) * abs(x_current(i_max_current)) * x_current;
previous_check_value = (1 / x_prev(i_max_prev)) * abs(x_prev(i_max_prev)) * x_prev;

% Norma różnicy znormalizowanych wektorów
diff = norm(current_check_value - previous_check_value, inf);

end % function
