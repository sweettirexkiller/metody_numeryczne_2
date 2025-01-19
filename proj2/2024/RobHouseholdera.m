function [y1, H] = RobHouseholdera(x1, x2)
% Projekt 2, zadanie 14
% Piotr Jankiewicz, 288767
%
% Funkcja implementuje transformację Householdera dla wektora dwuwymiarowego.
% Przekształca wektor wejściowy w taki sposób, że druga współrzędna
% wektora wynikowego jest zerowa. Transformacja zachowuje normę wektora.
%
% WEJŚCIE:
%    x1  - pierwsza współrzędna wektora wejściowego
%    x2  - druga współrzędna wektora wejściowego
%
% WYJŚCIE:
%    y1  - pierwsza współrzędna wektora wynikowego (po transformacji)
%    H   - macierz Householdera realizująca transformację

% Utworzenie wektora wejściowego
x = [x1; x2];

% Sprawdzenie, czy druga wartość jest już zerowa
if abs(x2) < 1e-10
    % Jeśli x2 jest zerowe, nie ma potrzeby wykonywania transformacji
    H = eye(2);
    y1 = x1;
    return;
end

% Obliczenie normy wektora wejściowego
x_norm = norm(x);
x_prime = x_norm * eye(2, 1);

% Dostosowanie znaku x_prime dla stabilności numerycznej
if x(1) < 0
    x_prime = -x_prime;
end

if isreal(x)
    % Dla liczb rzeczywistych - standardowa transformacja Householdera
    u = x - x_prime;
else
    % Dla liczb zespolonych - zmodyfikowana transformacja
    if abs(x(1)) == 0
        x1_inv_abs = 0; % Uniknięcie dzielenia przez zero
    else
        x1_inv_abs = 1 / abs(x(1));
    end

    e1 = eye(2, 1);
    % Wybór formuły w zależności od znaku części rzeczywistej x(1)
    if real(x(1)) >= 0
        u = x + x(1) * x1_inv_abs * x_norm * e1;
    else
        u = x - x(1) * x1_inv_abs * x_norm * e1;
    end
end

% Normalizacja wektora u
u = u / norm(u);

% Konstrukcja macierzy Householdera
I = eye(2);
H = I - (2 * (u) * u') / (u' * u);

% Obliczenie transformacji wektora wejściowego
y = H * x;
y1 = y(1);

end % function
