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

clear();

tol = 10^-8;
LIMIT = 10^5;

n=20000;
low = -99;
high = +99;
diagonal = low + (high-low) .* rand(1, n);
diagLower = low + (high-low) .* rand(1, n-1);
diagUpper = low + (high-low) .* rand(1, n-1);

matrix = diagonalsToMatrix(diagonal, diagUpper, diagLower);

eigenValues = eig(matrix);

disp(['Testy działania poprawności dla macierzy 20000 na 20000. Wartości własne macierzy to  [' num2str(eigenValues(:).') ']']) ;

tic
fprintf("Test 6 - poprwanosc wyniku dla\n");
[l,~, i] = P2Z14_InversePowerMethod(n, diagonal,diagLower, diagUpper, tol, LIMIT);
fprintf("- wynik lambda=%d, l.iteracji=%d\n", [l,i]);


format short

smallest = min(eigenValues);

fprintf("- funkcja matlabowa wygenerowała najmniejszą wartość własną: %d\n", smallest);
fprintf("- różnica między wynikiem własnym a bibliotecznym:  abs(%d - %d )= %d\n", l,smallest,abs(l - smallest));

toc

end

