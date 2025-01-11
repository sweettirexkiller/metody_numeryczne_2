
a = [5,6,7];
b = [1,2,3,4];
c = [8,9,10];

n = size(b);
n = n(2);

% macierz 4x4
%  1  8  0  0
%  5  2  9  0
%  0  6  3  10
%  0  0  7  4


[p,q,s,Householdery] = RobHouseholderaTrzyDiagonalnie(a,b,c);


x = [2,3,4,5]';
[y] = mnozenieQtransponowanePrzezWektor(Householdery, x);

%test Q*y = x --> powinno wrocic do x;


%sprawdzenie H1*H2*H3....Hn-1*y = x
y_prime = mnozenieWektorPrzezQ(Householdery, y);


norm(x' - y_prime')


