function test0()
% Test dla funkcji RobHousholdera
% Projekt 2, zadanie 14
% Piotr Jankiewicz, 288767
%
% Testuje działanie funkcji RobHousholdera na prostym przykładzie wektora 2D.
% Wyświetla wyniki działania oraz weryfikuje zgodność z oczekiwaniami.
%
% Testowane właściwości:
% 1. Wynik norm(x - H*y) powinien być bardzo bliski zera.
% 2. Wynik norm(x - H\y) powinien być dokładnie równy zeru.
% 3. Wynik H\y powinien odtwarzać wektor x.

    % Dane wejściowe
    x1 = 5;
    x2 = 1;
    x = [x1; x2];

    % Wywołanie funkcji
    [y1, H] = RobHousholdera(x1, x2);
    y = H * x;

    % Test 1: norm(x - H*y) powinien być bliski zeru
    test1_result = norm(x - H * y);
    fprintf('Test 1: norm(x - H*y)\n', test1_result);


    % Test 2: norm(x - H\y) powinien być dokładnie równy 0
    test2_result = norm(x - H \ y);
    fprintf('Test 2: norm(x - H\\y)\n', test2_result);

    % Test 3: H\y powinno odtwarzać x
    test3_result = H \ y;
    fprintf('Test 3: H\\y = [%f; %f]\n', test3_result(1), test3_result(2));
end
