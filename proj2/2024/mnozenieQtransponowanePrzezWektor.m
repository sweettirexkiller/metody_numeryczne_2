function [y] = mnozenieQtransponowanePrzezWektor(Householdery, x)
% Projekt 2, zadanie 14
% Piotr Jankiewicz, 288767
%
% Funkcja realizuje mnożenie wektora x przez macierz transponowaną Q^T.
% Macierz Q^T jest iloczynem macierzy Householdera w odwrotnej kolejności
% niż w przypadku macierzy Q. Ze względu na własności macierzy Householdera
% (H^T = H), mnożenie przez transpozycję sprowadza się do mnożenia przez
% te same macierze w przeciwnej kolejności.
%
% WEJŚCIE:
%    Householdery - tensor [2x2x(n-1)] zawierający macierze Householdera
%                   używane do transformacji macierzy trójdiagonalnej
%    x            - wektor wejściowy do przemnożenia
%
% WYJŚCIE:
%    y            - wektor wynikowy będący iloczynem Q^T * x

% Inicjalizacja wektora wynikowego
y = x;

% Określenie rozmiaru problemu
n = size(x);
n = n(1);

% Mnożenie kolejno przez macierze Householdera w naturalnej kolejności
% Q^T * x = H(n-1) * H(n-2) * ... * H1 * x
for i = 1:n-1
    % Pobranie i-tej macierzy Householdera
    H_i = Householdery(:, :, i);

    % Wydzielenie odpowiedniego fragmentu wektora do transformacji
    y_i = y(i:i+1, 1);

    % Wykonanie transformacji Householdera na fragmencie wektora
    y(i:i+1, 1) = H_i * y_i;
end

end % function
