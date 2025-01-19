function [stop_criterion] = oblicz_warunek_stopu(x_current, x_prev)
% Projekt 2, zadanie 14
% Piotr Jankiewicz, 288767
%
% Funkcja implementuje obliczenie warunku stopu w odwrotnej metodzie
% potęgowej. Warunek stopu jest oparty na normalizacji wektorów względem
% ich największych co do modułu współrzędnych i obliczeniu normy różnicy
% tak znormalizowanych wektorów.
%
% WEJŚCIE:
%   x_current  - wektor będący rozwiązaniem w aktualnym kroku iteracji
%   x_prev     - wektor będący rozwiązaniem w poprzednim kroku iteracji
%
% WYJŚCIE:
%   stop_criterion  - wartość warunku stopu metody, obliczona jako norma
%                    nieskończona różnicy znormalizowanych wektorów

% Znajdowanie indeksów maksymalnych wartości bezwzględnych
[~, i_max_current] = max(abs(x_current));
[~, i_max_prev] = max(abs(x_prev));

% Normalizacja wektorów względem maksymalnych składowych
current_check_value = (1 / x_current(i_max_current)) * ...
    abs(x_current(i_max_current)) * x_current;
previous_check_value = (1 / x_prev(i_max_prev)) * ...
    abs(x_prev(i_max_prev)) * x_prev;

% Obliczenie normy nieskończonej różnicy wektorów
stop_criterion = norm(current_check_value - previous_check_value, inf);

end % function
