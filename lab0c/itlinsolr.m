function X = itlinsolr(riA,virA,b)
% ITLINSOLC Iterative solution of linear Ax=b; G-S method
% pozycje i wartosci niezerowych elementow w A  
% riA - w j-tej kolumnie sa numery pozycji niezerowych elementow j-tej
%      kolumny w macierzy A, elementy sa uporzadkowane rosnaco 
% virA - w i-tym wierszy sa wartosci elementow i-tego wiersza w macierzy A
% A - jest skladane z ciA i vicA
% X - rozw, iNum - liczba iteracjo

epislon = 10e-9;
iterLim = 500;
d = size(riA,1); %liczba niezerowych elementow w wierszach A, 2 <= d <= 50 (row index A)
n = size(virA, 2); % rozmiar macierzy A, 2 <= n <= 50000000 (value index row A)

A = zeros(n,n);

%przeksztalcenie

for i = 1:n % columns
    for j = 1:d %rows
        A(riA(j,i),i) = virA(j,i);
    end
end


X(1:n)=0;
X_prev(1:n)=0;

for k = 1:iterLim
	for i = 1:n
	   S = 0;
		for j = 1:n
			if j == i
				continue;
			end
			S = S + A(i,j)*X(j);
		end
		X_prev(i) = (b(i) - S)/A(i,i);  
        X(i) =X_prev(i);
    end

    %walidacja osiagniecia dokladnosci
    if(abs(min(A*X' -b)) < epislon)
            break
    end
end




end

