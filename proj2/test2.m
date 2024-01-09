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

% Wygeneruj 3 różnych wartości własnych
eigenValues = randperm(10, 3);

% Inicjalizuj trójdiagonalną macierz zerami
A = zeros(3);

% Wypełnij trójdiagonalną macierz wartościami własnymi
for i = 1:2
    A(i, i) = eigenValues(i);
    A(i, i+1) = rand(); % Dodaj losową wartość na górnej diagonali
    A(i+1, i) = rand(); % Dodaj losową wartość na dolnej diagonali
end
A(3, 3) = eigenValues(3);

% disp('Trójdiagonalna macierz:');
% disp(A);

% Sprawdź wartości własne
% disp('Wartości własne:');
% disp(eig(A));


tol = 10^-8;
LIMIT = 10^3;
% 
% A = diag(2*ones(1,3),0) + diag(-1*ones(1,2),1) + diag(-1*ones(1,2),-1);
main_diag = diag(A); % main diagonal elements
upper_diag = diag(A,1); % upper diagonal elements
lower_diag = diag(A,-1); % lower diagonal elements

eigenValues = eig(A);



disp(['Testy działania poprawności dla macierzy 3 na 3. Wartości własne macierzy to  [' num2str(eigenValues(:).') ']']) ;

disp(A);


fprintf("\n");

fprintf("Naciśnij dowolny klawisz.\n");
pause;

clc();


miu = 2;
[val,idx]=min(abs(eigenValues-miu));
minVal=eigenValues(idx);



% TEST 0


fprintf("Test 2 - poprwanosc wyniku dla tolerancji=%d i limitu iteracji: %d\n", tol, LIMIT);
fprintf("Test 2:0 miu=%d \n- poprawność wyniku - oczekiwana najbliższa wartosc wlasna to %d\n", miu,minVal);
tic
[l,~, i] = P2Z14_InversePowerMethod(3, main_diag,upper_diag, lower_diag,miu, tol, LIMIT);
toc

fprintf("- wynik lambda=%d, l.iteracji=%d\n", [l,i]);


format short
fprintf("- funkcja matlabowa wygenerowała najblizszą wartość własną: %d\n", minVal);
fprintf("- różnica między wynikiem własnym a bibliotecznym:  abs(%d - %d )= %d\n", l,minVal,abs(l - minVal));




fprintf("Naciśnij dowolny klawisz.\n");
pause;

% TEST 1

clc();

miu = 5;
[val,idx]=min(abs(eigenValues-miu));
minVal=eigenValues(idx);




fprintf("Test 2 - poprwanosc wyniku dla tolerancji=%d i limitu iteracji: %d\n", tol, LIMIT);
fprintf("Test 2:0 miu=%d \n- poprawność wyniku - oczekiwana najbliższa wartosc wlasna to %d\n", miu,minVal);
tic
[l,~, i] = P2Z14_InversePowerMethod(3, main_diag,upper_diag, lower_diag,miu, tol, LIMIT);
toc

fprintf("- wynik lambda=%d, l.iteracji=%d\n", [l,i]);


format short
fprintf("- funkcja matlabowa wygenerowała najbliższa wartość własną: %d\n", minVal);
fprintf("- różnica między wynikiem własnym a bibliotecznym:  abs(%d - %d )= %d\n", l,minVal,abs(l - minVal));




fprintf("Naciśnij dowolny klawisz.\n");
pause;

clc();

% TEST 2

clc();

miu = 0;
[val,idx]=min(abs(eigenValues-miu));
minVal=eigenValues(idx);




fprintf("Test 2 - poprwanosc wyniku dla tolerancji=%d i limitu iteracji: %d\n", tol, LIMIT);
fprintf("Test 2:0 miu=%d \n- poprawność wyniku - oczekiwana najbliższa wartosc wlasna to %d\n", miu,minVal);
tic
[l,~, i] = P2Z14_InversePowerMethod(3, main_diag,upper_diag, lower_diag,miu, tol, LIMIT);
toc

fprintf("- wynik lambda=%d, l.iteracji=%d\n", [l,i]);


format short
fprintf("- funkcja matlabowa wygenerowała najbliższa wartość własną: %d\n", minVal);
fprintf("- różnica między wynikiem własnym a bibliotecznym:  abs(%d - %d )= %d\n", l,minVal,abs(l - minVal));




fprintf("Naciśnij dowolny klawisz.\n");
pause;

clc();

for idx = 1:numel(eigenValues)
    clc();
    miu = floor(eigenValues(idx));
    

    [val,idx]=min(abs(eigenValues-miu));
    minVal=eigenValues(idx);


    fprintf("Test 2:%d miu=%d \n- poprawność wyniku - oczekiwana najbliższa wartosc wlasna to %d\n", idx+2, miu,minVal);
    tic
    [l,~, i] = P2Z14_InversePowerMethod(3, main_diag,upper_diag, lower_diag,miu, tol, LIMIT);
    toc
    
    fprintf("- wynik lambda=%d, l.iteracji=%d\n", [l,i]);
    
    
    format short
    fprintf("- funkcja matlabowa wygenerowała najblizsza wartość własną: %d\n", minVal);
    fprintf("- różnica między wynikiem własnym a bibliotecznym:  abs(%d - %d )= %d\n", l,minVal,abs(l - minVal));
    
    
    
    
    fprintf("Naciśnij dowolny klawisz.\n");
    pause;
    
    clc();

   
end



end

