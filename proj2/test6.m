
function [] = test6()
%TEST1 
% Piotr Jankiewicz, 288767
%
% Funckja testujaca P2Z14_InversePowerMethod
%
% WEJŚĆIE:
%   -
% WYJŚCIE:
%   -
% 

clc();
n= 10000;
% Wygeneruj 10000 różnych wartości własnych
eigenValues = randi([-10*n 10*n],n, 1);

% Inicjalizuj trójdiagonalną macierz zerami
A = zeros(n);

% Wypełnij trójdiagonalną macierz wartościami własnymi
for i = 1:n-2
    A(i, i) = eigenValues(i);
    A(i, i+1) = rand(); % Dodaj losową wartość na górnej diagonali
    A(i+1, i) = rand(); % Dodaj losową wartość na dolnej diagonali
end
A(n, n) = eigenValues(n);

tol = 10^-8;
LIMIT = 10^3;

main_diag = diag(A); % main diagonal elements
upper_diag = diag(A,1); % upper diagonal elements
lower_diag = diag(A,-1); % lower diagonal elements

fprintf("Testy działania poprawności dla trójdiagonalnej macierzy 10000 na 10000 generowanej losowo.\n");
fprintf("Test 6 - poprwanosc wyniku dla tolerancji=%d i limitu iteracji: %d\n", tol, LIMIT);
fprintf("Naciśnij dowolny klawisz.\n");
pause;

clc();

iter = 0;
for idx = randi([0 10000],1,5)
    clc();
    moveByInt = randi([-50 50]);
    miu = floor(eigenValues(idx));
    miu = miu + moveByInt;
    [val,idx]=min(abs(eigenValues-miu));
    minVal=eigenValues(idx);
    
    fprintf("Test 6:%d miu=%d \n- poprawność wyniku - oczekiwana najblizsza wartosc wlasna to %d\n", iter, miu,minVal);
    tic
    [l,~, i] = P2Z14_InversePowerMethod(n, main_diag,upper_diag, lower_diag,miu, tol, LIMIT);
    toc
    iter = iter+1;
    
    fprintf("- wynik lambda=%d, l.iteracji=%d\n", [l,i]);
    format short
    fprintf("- funkcja matlabowa wygenerowała najblizszą wartość własną: %d\n", minVal);
    fprintf("- różnica między wynikiem własnym a bibliotecznym:  abs(%d - %d )= %d\n", l,minVal,abs(l - minVal));
    fprintf("Naciśnij dowolny klawisz.\n");
    pause;
    
    clc();

   
end



end

