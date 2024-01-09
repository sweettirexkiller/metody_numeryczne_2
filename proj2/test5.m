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
n= 2000;
% Wygeneruj 2000 różnych wartości własnych
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


disp(['Testy działania poprawności dla macierzy 2000 na 2000.']); 
% disp(['[' num2str(eigenValues(:).') ']']) ;


fprintf("Naciśnij dowolny klawisz.\n");
pause;

clc();

iter = 0;
for idx = randi([0 2000],1,10)
    clc();
     moveByInt = randi([-50 50]);
     
    miu = floor(eigenValues(idx));
    miu = miu + moveByInt;
    [val,idx]=min(abs(eigenValues-miu));
    minVal=eigenValues(idx);

    
    fprintf("Test 5:%d miu=%d \n- poprawność wyniku - oczekiwana najblizsza wartosc wlasna to %d\n", iter, miu,minVal);
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

