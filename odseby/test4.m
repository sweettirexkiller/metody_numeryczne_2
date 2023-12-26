function test4()
% Projekt 2, zadanie 35
% Sebastian Prokop, 320728
fprintf("Test 4\n");
fprintf("Błąd przybliżenia maleje tak szybko jak |λ1^(-1) * λ2|^k.\n" + ...
    "Na przykładzie macierzy A, której dwie największe co do modułu \n" + ...
    "wartości własne to 6 i 5.\n" + ...
    "Przy wielokrotnym wywołaniu programu wyniki są różne, ponieważ \n" + ...
    "przybliżenie początkowe jest losowane.")
A = [-2, -4, 2;
     -2, 1, 2;
     4, 2, 5];
it = 30; % liczba iteraji
len = length(A);
lambda1 = 6;
lambda2 = -5;
err1 = zeros(it,1);
plo = 1:it;
%x = ones(len,1);
x = rand(len,1);
for i = 1:it
    x = A*x; % Krok metody potęgowej
    x = x/(norm(x)); % Normalizacja wektora
    eigenvalue = (x'*A*x)/(x'*x);
    err1(i) = lambda1 - eigenvalue;
end

ratio1 = abs(lambda2 / lambda1);
teor1 = zeros(it,1);
teor1(1) = ratio1;
for i = 2:it
    teor1(i) = teor1(i-1) * ratio1;
end



% Część 2
% A = Givens(A,x);
% it = 30; % liczba iteraji
% len = length(A);
% lambda1 = -5;
% lambda2 = 3;
% err2 = zeros(it,1);
% plo = 1:it;
% x = ones(len,1);
% for i = 1:it
%     x = A*x; % Krok metody potęgowej
%     x = x/(norm(x)); % Normalizacja wektora
%     eigenvalue = (x'*A*x)/(x'*x);
%     err2(i) = abs(lambda1 - eigenvalue);
% end
% 
% ratio2 = abs(lambda2 / lambda1);
% teor2 = zeros(it,1);
% teor2(1) = ratio2;
% for i = 2:it
%     teor2(i) = teor2(i-1) * ratio2;
% end

figure(1)
% subplot(1,2,1)
hold on
plot(plo,err1);
plot(plo,teor1);
legend("Błąd w kolejnych iteracjach","Zadany stosunek do potęgi k")
xlabel('k')
hold off
% figure(2)
% %subplot(1,2,2)
% hold on
% plot(plo,err2);
% plot(plo,teor2);
% legend("Błąd w kolejnych iteracjach","Zadany stosunek do potęgi k")
% xlabel('k')
% hold off
