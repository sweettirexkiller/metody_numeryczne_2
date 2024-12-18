function [] = test1()
%TEST0
% Piotr Jankiewicz, 288767
%
% Funckja testujaca P2Z46_InversePowerMethod
%
% WEJŚĆIE:
%   -
% WYJŚCIE:
%   -

fprintf("Testy działania poprawności dla macierzy 5 na 5. \nWartości własne macierzy to 2, 3, 4, 5, 6.:\n")
A = diag(2*ones(1,5),0) + diag(-1*ones(1,4),1) + diag(-1*ones(1,4),-1);
main_diag = diag(A); % main diagonal elements
upper_diag = diag(A,1); % upper diagonal elements
lower_diag = diag(A,-1); % lower diagonal elements
disp(A);

fprintf("\n");

tic
fprintf("Test 1 - poprwanosc wyniku dla miu=4.7 (oczekiwana nabliższa wartosc wlasna to 5)\n");
[l,x, i] = P2Z46_InversePowerMethod(5, main_diag,upper_diag, lower_diag, 4.7);
fprintf("   - wynik lambda=%d, l.iteracji=%d\n", [l,i]);
toc

fprintf("\n");
tic
fprintf("Test 2 - poprwanosc wyniku dla miu=10 (oczekiwana nabliższa wartosc wlasna to 6)\n");
[l,x, i] = P2Z46_InversePowerMethod(5, main_diag,upper_diag, lower_diag, 10);
fprintf("   - wynik lambda=%d, l.iteracji=%d\n", [l,i]);
toc

fprintf("\n");
tic
fprintf("Test 3 - poprwanosc wyniku dla miu=20 (oczekiwana nabliższa wartosc wlasna to 6)\n");
[l,x, i] = P2Z46_InversePowerMethod(5, main_diag,upper_diag, lower_diag, 20);
fprintf("   - wynik lambda=%d, l.iteracji=%d\n", [l,i]);
toc

fprintf("\n");
tic
fprintf("Test 4 - poprwanosc wyniku dla miu=0 (oczekiwana nabliższa wartosc wlasna to 2)\n");
[l,x, i] = P2Z46_InversePowerMethod(5, main_diag,upper_diag, lower_diag, 0.01);
fprintf("   - wynik lambda=%d, l.iteracji=%d\n", [l,i]);
toc

end
