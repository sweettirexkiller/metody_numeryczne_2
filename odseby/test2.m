function test2()
% Projekt 2, zadanie 35
% Sebastian Prokop, 320728
fprintf("Test 2\n");
fprintf("Metodę potęgową można stosować tylko dla macierzy z dominującymi \n" + ...
    "wartościami własnymi - jest to warunek zbieżności.\n")
% test 1
fprintf("Macierz 3x3 ze zdublowaną wartością własną.\n" + ...
    "Jej wartości własne: \n")

A = [5,-4,0;
    1,0,2;
    0,2,5;];
eigs = [5;5;0];
eigs = sort(eigs,'descend');
eigs = eigs';
disp(eigs);
fprintf("Wynik działania programu dla prec = 1e-12, iter = 3e6 :\n")
moje = P2Z35_SPR_rotivens(A,1e-12,3e6);
moje=sort(moje, 'descend');
moje = moje';
disp(moje)
pause()

% test 2
fprintf("Macierz 3x3, z dwoma wartościami własnymi o tym samym module\n" + ...
    "ale przeciwnych znakach. Test przeprowadzany dla kilku dokładności. \n" + ...
    "Jej wartości własne: \n")

A = [3,0,0;
     2,-1,0;
     5, -9, 1];
eigs = diag(A);
eigs = sort(eigs,'descend');
eigs = eigs';
disp(eigs);
fprintf("Wynik działania programu dla prec = 1e-3, iter = 3e6 :\n")
moje = P2Z35_SPR_rotivens(A,1e-3,3e6);
moje=sort(moje, 'descend');
moje = moje';
disp(moje)
fprintf("Wynik działania programu dla prec = 1e-4, iter = 3e6 :\n")
moje = P2Z35_SPR_rotivens(A,1e-4,3e6);
moje=sort(moje, 'descend');
moje = moje';
disp(moje)
fprintf("Wynik działania programu dla prec = 1e-5, iter = 3e6 :\n")
moje = P2Z35_SPR_rotivens(A,1e-5,3e6);
moje=sort(moje, 'descend');
moje = moje';
disp(moje)
fprintf("Wynik działania programu dla prec = 1e-6, iter = 3e6 :\n")
moje = P2Z35_SPR_rotivens(A,1e-6,3e6);
moje=sort(moje, 'descend');
moje = moje';
disp(moje)