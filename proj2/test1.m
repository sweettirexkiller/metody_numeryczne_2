function [] = test1()
%TEST0
% Piotr Jankiewicz, 288767
%
% Funckja testujaca P2Z14_InversePowerMethod
%
% WEJŚĆIE:
%   -
% WYJŚCIE:
%   -


clc();

% Wygeneruj 5 różnych wartości własnych
eigenValues = randperm(10, 5);

% Inicjalizuj trójdiagonalną macierz zerami
A = zeros(5);

% Wypełnij trójdiagonalną macierz wartościami własnymi
for i = 1:4
    A(i, i) = eigenValues(i);
    A(i, i+1) = rand(); % Dodaj losową wartość na górnej diagonali
    A(i+1, i) = rand(); % Dodaj losową wartość na dolnej diagonali
end
A(5, 5) = eigenValues(5);

% disp('Trójdiagonalna macierz:');
% disp(A);

% Sprawdź wartości własne
% disp('Wartości własne:');
% disp(eig(A));

tol = 10^-8;
LIMIT = 10^5;
% 
% A = diag(2*ones(1,5),0) + diag(-1*ones(1,4),1) + diag(-1*ones(1,4),-1);
main_diag = diag(A); % main diagonal elements
upper_diag = diag(A,1); % upper diagonal elements
lower_diag = diag(A,-1); % lower diagonal elements


% eigenValues = eig(A);


disp(['Testy działania poprawności dla macierzy 5 na 5. Wartości własne macierzy to  [' num2str(eigenValues(:).') ']']) ;

disp(A);

fprintf("\n");

fprintf("Naciśnij dowolny klawisz.\n");
pause;

clc();



% disp(A - miu.*eye(5));

% [Q1,R1] = qr(A - miu.*eye(5));

% disp(R1);

miu = 2;
[val,idx]=min(abs(eigenValues-miu));
minVal=eigenValues(idx);


fprintf("Test 1 - poprwanosc wyniku dla tolerancji=%d i limitu iteracji: %d\n", tol, LIMIT);
fprintf("Test 1:1 miu=%d\n - poprawność wyniku - oczekiwana najblizsza wartosc wlasna to %d\n", miu, minVal);
tic
[l,~, i] = P2Z14_InversePowerMethod(5, main_diag,upper_diag, lower_diag,miu,tol, LIMIT);
toc
fprintf("- wynik lambda=%d, l.iteracji=%d\n", [l,i]);


format short

fprintf("- funkcja matlabowa wygenerowała najblisza wartość własną: %d\n", minVal);
fprintf("- różnica między wynikiem własnym a bibliotecznym:  abs(%d - %d )= %d\n", l,minVal,abs(l - minVal));


fprintf("Naciśnij dowolny klawisz.\n");
pause;

clc();


miu = 5;
[val,idx]=min(abs(eigenValues-miu));
minVal=eigenValues(idx);


fprintf("Test 1 - poprwanosc wyniku dla tolerancji=%d i limitu iteracji: %d\n", tol, LIMIT);
fprintf("Test 1:2 miu=%d\n - poprawność wyniku - oczekiwana najblizsza wartosc wlasna to %d\n", miu, minVal);
tic
[l,~, i] = P2Z14_InversePowerMethod(5, main_diag,upper_diag, lower_diag,miu,tol, LIMIT);
toc
fprintf("- wynik lambda=%d, l.iteracji=%d\n", [l,i]);


format short

fprintf("- funkcja matlabowa wygenerowała najblizsza wartość własną: %d\n", minVal);
fprintf("- różnica między wynikiem własnym a bibliotecznym:  abs(%d - %d )= %d\n", l,minVal,abs(l - minVal));


fprintf("Naciśnij dowolny klawisz.\n");
pause;

clc();


miu = 0;
[val,idx]=min(abs(eigenValues-miu));
minVal=eigenValues(idx);


fprintf("Test 1 - poprwanosc wyniku dla tolerancji=%d i limitu iteracji: %d\n", tol, LIMIT);
fprintf("Test 1:3 miu=%d\n - poprawność wyniku - oczekiwana najblizsza wartosc wlasna to %d\n", miu, minVal);
tic
[l,~, i] = P2Z14_InversePowerMethod(5, main_diag,upper_diag, lower_diag,miu,tol, LIMIT);
toc
fprintf("- wynik lambda=%d, l.iteracji=%d\n", [l,i]);


format short

fprintf("- funkcja matlabowa wygenerowała najblizsza wartość własną: %d\n", minVal);
fprintf("- różnica między wynikiem własnym a bibliotecznym:  abs(%d - %d )= %d\n", l,minVal,abs(l - minVal));


fprintf("Naciśnij dowolny klawisz.\n");
pause;

clc();


miu = 10;
[val,idx]=min(abs(eigenValues-miu));
minVal=eigenValues(idx);


fprintf("Test 1 - poprwanosc wyniku dla tolerancji=%d i limitu iteracji: %d\n", tol, LIMIT);
fprintf("Test 1:4 miu=%d\n - poprawność wyniku - oczekiwana najblizsza wartosc wlasna to %d\n", miu, minVal);
tic
[l,~, i] = P2Z14_InversePowerMethod(5, main_diag,upper_diag, lower_diag,miu,tol, LIMIT);
toc
fprintf("- wynik lambda=%d, l.iteracji=%d\n", [l,i]);


format short

fprintf("- funkcja matlabowa wygenerowała najblizsza wartość własną: %d\n", minVal);
fprintf("- różnica między wynikiem własnym a bibliotecznym:  abs(%d - %d )= %d\n", l,minVal,abs(l - minVal));


fprintf("Naciśnij dowolny klawisz.\n");
pause;

clc();





end
