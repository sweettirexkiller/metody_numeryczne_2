function [] = test5()
%TEST1 
% Piotr Jankiewicz, 288767
%
% Funckja testujaca P2Z14_InversePowerMethod
%
% WEJŚĆIE:
%   -
% WYJŚCIE:
%   -

clc();

tol = 10^-5;
LIMIT = 10^4;

n=10000;
low = -99;
high = +99;
diagonal = low + (high-low) .* rand(1, n);
diagLower = low + (high-low) .* rand(1, n-1);
diagUpper = low + (high-low) .* rand(1, n-1);
matrix = diagonalsToMatrix(diagonal, diagUpper, diagLower);

fprintf("Testy działania poprawności dla trójdiagonalnej macierzy 10000 na 10000 generowanej losowo.\n");
fprintf("\n... trwają obliczenie funkcji wbudowanej... poczekaj.\n\n");

eigenValues = eigs(matrix,1,'smallestabs');

disp(['Wartość własna macierzy to  [' num2str(eigenValues(:).') ']']) ;

tic
fprintf("Test 6 - poprwanosc wyniku dla tolerancji=%d i limitu iteracji: %d\n", tol, LIMIT);
[l,~, i] = P2Z14_InversePowerMethod(n, diagonal,diagLower, diagUpper, tol, LIMIT);
fprintf("- wynik lambda=%d, l.iteracji=%d\n", [l,i]);


format short

smallest = min(eigenValues);

fprintf("- funkcja matlabowa wygenerowała najmniejszą wartość własną: %d\n", smallest);
fprintf("- różnica między wynikiem własnym a bibliotecznym:  abs(%d - %d )= %d\n", l,smallest,abs(l - smallest));

toc

end

