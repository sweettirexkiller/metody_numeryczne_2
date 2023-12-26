function [] = test2()
%TEST1 
% Piotr Jankiewicz, 288767
%
% Funckja testujaca P2Z46_InversePowerMethod
%
% WEJŚĆIE:
%   -
% WYJŚCIE:
%   -

fprintf("Testy działania poprawności dla macierzy 3 na 3. \nWartości własne macierzy to 2,3,4.\n")
A = diag(2*ones(1,3),0) + diag(-1*ones(1,2),1) + diag(-1*ones(1,2),-1);
main_diag = diag(A); % main diagonal elements
upper_diag = diag(A,1); % upper diagonal elements
lower_diag = diag(A,-1); % lower diagonal elements

fprintf("\n");

tic
fprintf("Test 1 - poprwanosc wyniku dla miu=5 (oczekiwana nabliższa wartosc wlasna to 4)\n");
[l,x, i] = P2Z46_InversePowerMethod(3, main_diag,upper_diag, lower_diag, 5);
fprintf("   - wynik lambda=%d, l.iteracji=%d\n", [l,i]);
toc

fprintf("\n");

tic
fprintf("Test 2 - poprwanosc wyniku dla miu=3.5 (oczekiwana nabliższa wartosc wlasna to 4)\n");
[l,x, i] = P2Z46_InversePowerMethod(3, main_diag,upper_diag, lower_diag, 3.5);
fprintf("   - wynik lambda=%d, l.iteracji=%d\n", [l,i]);
toc

fprintf("\n");

tic
fprintf("Test 2 - poprwanosc wyniku dla miu=2.2 (oczekiwana nabliższa wartosc wlasna to 2)\n");
[l,x, i] = P2Z46_InversePowerMethod(3, main_diag,upper_diag, lower_diag, 2.2);
fprintf("   - wynik lambda=%d, l.iteracji=%d\n", [l,i]);
toc


end

