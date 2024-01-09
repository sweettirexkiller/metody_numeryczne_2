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



fprintf("- przyjęta tolerancja=%d i limit iteracji: %d\n Macierz A:\n", tol, LIMIT);

disp(A);

fprintf("Naciśnij dowolny klawisz.\n");
pause;

clc();

eigenValues = eig(A);
miu = 2;
[val,idx]=min(abs(eigenValues-miu));
minVal=eigenValues(idx);


fprintf("Test 0:1 miu=2\n- poprawność wyniku - oczekiwana najmniejsza wartosc wlasna to %d\n", minVal);
tic
[l,x, i] = P2Z14_InversePowerMethod(10, main_diag,upper_diag, lower_diag,miu,tol, LIMIT);
toc

fprintf("- wynik lambda=%d, l.iteracji=%d\n", [l,i]);


format short

fprintf("- funkcja matlabowa wygenerowała najmniejszą wartość własną: %d\n", minVal);
fprintf("- różnica między wynikiem własnym a bibliotecznym:  abs(%d - %d )= %d\n", l,minVal,abs(l - minVal));

fprintf("Naciśnij dowolny klawisz.\n");
pause;

clc();

miu = 3;
[val,idx]=min(abs(eigenValues-miu));
minVal=eigenValues(idx);

fprintf("Test 0:2 miu=3 \n- poprawność wyniku - oczekiwana najmniejsza wartosc wlasna dla miu=3 to %d\n", minVal);

tic
[l,x, i] = P2Z14_InversePowerMethod(10, main_diag,upper_diag, lower_diag,miu,tol, LIMIT);
toc

fprintf("- wynik lambda=%d, l.iteracji=%d\n", [l,i]);
fprintf("- różnica między wynikiem własnym a bibliotecznym:  abs(%d - %d )= %d\n", l,minVal,abs(l - minVal));


fprintf("Naciśnij dowolny klawisz.\n");
pause;

clc();

miu = 5;
[val,idx]=min(abs(eigenValues-miu));
minVal=eigenValues(idx);

fprintf("Test 0:3 miu=5 \n- poprawność wyniku - oczekiwana najmniejsza wartosc wlasna dla miu=5 to %d\n", minVal);

tic
[l,x, i] = P2Z14_InversePowerMethod(10, main_diag,upper_diag, lower_diag,miu,tol, LIMIT);
toc

fprintf("- wynik lambda=%d, l.iteracji=%d\n", [l,i]);
fprintf("- różnica między wynikiem własnym a bibliotecznym:  abs(%d - %d )= %d\n", l,minVal,abs(l - minVal));


fprintf("Naciśnij dowolny klawisz.\n");
pause;

clc();

miu = 8;
[val,idx]=min(abs(eigenValues-miu));
minVal=eigenValues(idx);

fprintf("Test 0:3 miu=8 LIMIT=3000 \n- poprawność wyniku - oczekiwana najmniejsza wartosc wlasna dla miu=8 to %d\n", minVal);

tic
[l,x, i] = P2Z14_InversePowerMethod(10, main_diag,upper_diag, lower_diag,miu,tol, 3000);
toc

fprintf("- wynik lambda=%d, l.iteracji=%d\n", [l,i]);
fprintf("- różnica między wynikiem własnym a bibliotecznym:  abs(%d - %d )= %d\n", l,minVal,abs(l - minVal));



end



