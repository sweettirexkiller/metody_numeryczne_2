function [] = test5()
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

fprintf("Testy działania poprawności dla macierzy 2000 na 2000.\n")
n=2000;
low = -99;
high = +99;
diagonal = low + (high-low) .* rand(1, n);
diagLower = low + (high-low) .* rand(1, n-1);
diagUpper = low + (high-low) .* rand(1, n-1);

tic
fprintf("Test 1 - poprwanosc wyniku dla\n");
[l,x, i] = P2Z14_InversePowerMethod(n, diagonal,diagLower, diagUpper, tol, LIMIT);
fprintf("   - wynik lambda=%d, l.iteracji=%d\n", [l,i]);
toc

end

