function test3()
% Projekt 2, zadanie 35
% Sebastian Prokop, 320728
fprintf("Test 3\n");
fprintf("Funkcja główna korzysta z dodatkowej funkcji, która \n" + ...
    "przeprowadza deflację z użyciem obrotów Givensa. Ten test \n" + ...
    "ma na celu sprawdzenie jej poprawności. Pomocnicza funkcja \n" + ...
    "Givens.m zwraca jednak wycinek macierzy na której przeprowadzono \n" + ...
    "deflację - konkretniej bez pierwszej kolumny i pierwszego \n" + ...
    "wiersza, gdyż tylko to jest potrzebne programowi głównemu. \n" + ...
    "Dla testów używana jest funkcja Givens_kopia.m której jedyną \n" + ...
    "różnicą jest zwracanie całej macierzy a nie tylko wycinka.\n")

% krok 1 - wyznaczenie dominującej wartości własnej
A = [7,4,-7,0,2;
     13,45,13,0,-6;
     0,1,-1,0,5;
     2,24,70,70,0
     1,5,5,0,6]; % dominująca ww = 70
fprintf("Macierz, na której testowana będzie funkcja - jej dominująca\n" + ...
    "wartość własna to 70:\n")
disp(A)
pause();
% obliczanie wektora własnego:
len = length(A);
x = rand(len,1);
M = 200;
for i = 1:M
    x = A*x; % Krok metody potęgowej
    x = x/(norm(x)); % Normalizacja wektora
end
eigenvalue = (x'*A*x)/(x'*x);
fprintf("Oczekiwany wynik deflacji - macierz, która w pierwszej\n" + ...
    "kolumnie ma zerowe elementy, poza polem A(1,1) gdzie znajduje się\n" + ...
    "dominująca wartość własna.\n")
fprintf("Wynik deflacji: \n")
B = Givens_kopia(A,x);
disp(B)
