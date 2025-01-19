function [y] = mnozenieWektorPrzezQ(Householdery, x)
% Projekt 2, zadanie 14
% Piotr Jankiewicz, 288767
%
% Funkcja realizuje mnożenie wektora x przez macierz Q, która jest iloczynem
% macierzy Householdera. Operacja jest wykonywana bez jawnego tworzenia
% macierzy Q, poprzez sekwencyjne mnożenie przez kolejne macierze
% Householdera w odwrotnej kolejności.
%
% WEJŚCIE:
%    Householdery - tensor [2x2x(n-1)] zawierający macierze Householdera
%                   używane do transformacji macierzy trójdiagonalnej
%    x            - wektor wejściowy do przemnożenia
%
% WYJŚCIE:
%    y            - wektor wynikowy będący iloczynem Q*x

% Inicjalizacja wektora wynikowego
y = x;

% Określenie rozmiaru problemu
n = size(x);
n = n(1);

% Mnożenie kolejno przez macierze Householdera w odwrotnej kolejności
% Q*x = H1 * H2 * ... * H(n-1) * x
for i = (n-1:-1:1)
    % Pobranie i-tej macierzy Householdera
    H_i = Householdery(:, :, i);

    % Wydzielenie odpowiedniego fragmentu wektora do transformacji
    y_i = y(i:i+1, 1);

    % Wykonanie transformacji Householdera na fragmencie wektora
    y(i:i+1, 1) = H_i * y_i;
end

end % function
