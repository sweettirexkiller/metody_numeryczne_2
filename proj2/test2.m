function [] = test2()
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

A = diag(2*ones(1,3),0) + diag(-1*ones(1,2),1) + diag(-1*ones(1,2),-1);
main_diag = diag(A); % main diagonal elements
upper_diag = diag(A,1); % upper diagonal elements
lower_diag = diag(A,-1); % lower diagonal elements
% disp(A);

eigenValues = eig(A);


disp(['Testy działania poprawności dla macierzy 3 na 3. Wartości własne macierzy to  [' num2str(eigenValues(:).') ']']) ;

fprintf("\n");

tic
fprintf("Test 2 - poprwanosc wyniku dla tolerancji=%d i limitu iteracji: %d\n", tol, LIMIT);
fprintf("Test 2 \n- poprawność wyniku - oczekiwana najmniejsza wartosc wlasna to 0.58579\n");
[l,~, i] = P2Z14_InversePowerMethod(3, main_diag,upper_diag, lower_diag,tol, LIMIT);
fprintf("- wynik lambda=%d, l.iteracji=%d\n", [l,i]);


format short
smallest = min(eigenValues);

fprintf("- funkcja matlabowa wygenerowała najmniejszą wartość własną: %d\n", smallest);
fprintf("- różnica między wynikiem własnym a bibliotecznym:  abs(%d - %d )= %d\n", l,smallest,abs(l - smallest));


toc


end

