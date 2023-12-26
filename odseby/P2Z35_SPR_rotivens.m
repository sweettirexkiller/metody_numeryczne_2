function [vec] = P2Z35_SPR_rotivens(A, prec, m)
% Projekt 2, zadanie 35
% Sebastian Prokop, 320728
% 
% Przybliżanie tylu wartości własnych λ1, λ2,..., λs macierzy A, gdzie 
% |λ1| > |λ2| > ... > |λs| na ile pozwalają podane parametry. Deflacja za 
% pomocą złożenia n-1 obrotów Givensa. Metoda jest iteracyjna, dlatego 
% przyjmuje parametry dotyczące żądanej dokładności, oraz maksymalnej 
% liczby iteracji.
%
% Wejście:
%   A       - macierz kwadratowa, której wartości własne są szukane
%   prec    - dokładność z jaką mają być wyznaczane wartości własne
%   m       - maksymalna ilośc iteracji dla wyznaczania pojedynczej
%             wartości włanej
% Wyjście:
%   vec     - wektor wyznaczonych wartości własnych

N = length(A);
eigenvalues = zeros(N,1);
len = N;
for i = 1:N
    x = rand(len,1); % losowe przybliżenie początkowe
    done = 0;
    for j = 1:m
        x_new = A*x; % Krok metody potęgowej
        x_new = x_new/(norm(x_new)); % Normalizacja wektora
        [~,m1] = max(abs(x_new)); % Znak elementu o maks. module 
        [~,m2] = max(abs(x));
        m1 = sign(x_new(m1));
        m2 = sign(x(m2));
        err = norm(m1.*x_new - m2.*x); % Wyznaczenie błędu
        x = x_new;
        if(err < prec)
            done = 1; % Oznaczenie że osiągnięto dokładność
            break;
        end
    end
    if (done ~= 1) % Jeżeli nie udało się osiągnąć dokładności - zakończ
        solved = i-1; % Ilość wyznaczonych wartości własnych
        break;
    end
    eigenvalues(i) = (x'*A*x)/(x'*x); % Wartość własna na podst. wektora
    len = len - 1;
    A = Givens(A,x); % Deflacja z użyciem dodatkowej funkcji
    solved = i;
end
vec = eigenvalues(1:solved);