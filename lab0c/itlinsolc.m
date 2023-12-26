function X = itlinsolc(ciA, vicA, b)
% ITLINSOLC Iterative solution of linear Ax=b; Jacobi method
% pozycje i wartosci niezerowych elementow w A
% ciA - w i-tym wierszu sa numery pozycji niezerowych elementow i-tego
%      wiersza w macierzy A, elementy sa uporzadkowane rosnaco 
% vicA - w i-tym wierszy sa wartosci elementow i-tego wiersza w macierzy A
% A - jest skladane z ciA i vicA
%  X - rozw

epislon = 10e-9;
iterLim = 500;
d = size(ciA,2); %liczba niezerowych elementow w wierszach A, 2 <= d <= 50
n = size(ciA, 1); % rozmiar macierzy A, 2 <= n <= 50000000

A = zeros(n,n);

%przeksztalcenie

for i = 1:n
    for j = 1:d  
        A(i, ciA(i,j)) = vicA(i,j);
    end
end

 X(1:n) = 0; %przyjmujemy zerowy poczatkowy wektor rozw.
 X_prev(1:n) = 0;


for k = 1:iterLim
    for i = 1:n
        S=0;
        for j=1:n
           if(i ==j) 
               continue   
           end
           S = S + A(i,j)*X_prev(j);
        end
        %wzor z metody Jacobiego
        X_prev(i) = (b(i) - S)/A(i,i);
    end
   
    X = X_prev;
    %walidacja osiagnietej dokladnosci
     if(abs(min(A*X' -b)) < epislon)
        break
     end
end 


end

