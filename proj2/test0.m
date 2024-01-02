function [] = test0()
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

tol = 10^-8;
LIMIT = 10^3;

fprintf("Testy działania poprawności dla macierzy 10 na 10.\n")
A = [
    10 1 0 0 0 0 0 0 0 0; 
    1 9 1 0 0 0 0 0 0 0;
    0 1 8 1 0 0 0 0 0 0;
    0 0 1 7 1 0 0 0 0 0;
    0 0 0 1 6 1 0 0 0 0;
    0 0 0 0 1 5 1 0 0 0;
    0 0 0 0 0 1 4 1 0 0;
    0 0 0 0 0 0 1 3 1 0;
    0 0 0 0 0 0 0 1 2 1;
    0 0 0 0 0 0 0 0 1 1];
main_diag = diag(A); % main diagonal elements
upper_diag = diag(A,1); % upper diagonal elements
lower_diag = diag(A,-1); % lower diagonal elements

tic
fprintf("Test 0 - poprwanosc wyniku dla tolerancji=%d i limitu iteracji: %d\n", tol, LIMIT);
fprintf("Test 0 \n- poprawność wyniku - oczekiwana najmniejsza wartosc wlasna to 0.2538\n");
[l,x, i] = P2Z14_InversePowerMethod(10, main_diag,upper_diag, lower_diag,tol, LIMIT);
fprintf("- wynik lambda=%d, l.iteracji=%d\n", [l,i]);

eigenValues = eig(A);

format short

smallest = min(eigenValues);

fprintf("- funkcja matlabowa wygenerowała najmniejszą wartość własną: %d\n", smallest);
fprintf("- różnica między wynikiem własnym a bibliotecznym:  abs(%d - %d )= %d\n", l,smallest,abs(l - smallest));

toc



end



