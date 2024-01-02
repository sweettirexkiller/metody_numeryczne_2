function [] = test0()
%TEST1 
% Piotr Jankiewicz, 288767
%
% Funckja testujaca P2Z46_InversePowerMethod
%
% WEJŚĆIE:
%   -
% WYJŚCIE:
%   -

tol = 10^-8;
LIMIT = 10^3;

fprintf("Testy działania poprawności dla macierzy 10 na 10. \nWartości własne macierzy to 1,2,3,4,5,6,7,10.\n")
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
fprintf("Test 1 - poprwanosc wyniku - oczekiwana najmniejsza wartosc wlasna to 1\n");
[l,x, i] = P2Z14_InversePowerMethod(10, main_diag,upper_diag, lower_diag,tol, LIMIT);
fprintf("   - wynik lambda=%d, l.iteracji=%d\n", [l,i]);
toc


end



