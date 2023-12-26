function test1()
% Projekt 2, zadanie 35
% Sebastian Prokop, 320728
fprintf("Test 1\n");
fprintf("Pierwszy test dotyczy działania programu na prostych \n" + ...
    "macierzach, których wartości własne są znane.\n" + ...
    "wyniki są sortowane, dla ułatwienia porównania.\n\n")
% test 1
fprintf("test 1.1\n")
fprintf("Macierz 3x3. Jej wartości własne: \n")

A = [-2, -4, 2;
     -2, 1, 2;
     4, 2, 5];
eigs = [6;-5;3];
eigs = sort(eigs,'descend');
eigs = eigs';
disp(eigs);
fprintf("Wynik działania programu dla prec = 1e-7, iter = 3e6 :\n")
moje = P2Z35_SPR_rotivens(A,1e-7,3e4);
moje=sort(moje, 'descend');
moje = moje';
disp(moje)
pause();
fprintf("\n")

% test 2 
fprintf("test 1.2\n")
fprintf("Macierz 3x3. Jej wartości własne: \n")
A = [5,2,0;
     2,5,0;
     -3,4,6];
eigs = [6;3;7];
eigs = sort(eigs,'descend');
eigs = eigs';
disp(eigs);
fprintf("Wynik działania programu dla prec = 1e-7, iter = 3e6 :\n")
moje = P2Z35_SPR_rotivens(A,1e-7,3e6);
moje=sort(moje, 'descend');
moje = moje';
disp(moje)


% A = randi([-100,100], 5);
% sizes = [10,100,200,1000];
% for i = 1:tested
% A1 = rand(sizes(i));
% B1 = eig(A1);
% a1_eigs = real(B1(imag(B1)==0);
% a1_sorted = sort(a1_eigs,'descend');
% 
% moje = 
% end

