
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

%test H*y = x --> powinno wrocic do x;

%sprawdzenie H1*H2*H3....Hn-1*y = x

    
n = size(x);
n = n(1);
y_prime = y;



 for i = (n-1: -1:1)
    H_i = Householdery(:,:,i);
    y_prime_i = y_prime(i:i+1,1);
    y_prime(i:i+1, 1) = H_i*y_prime_i;
 end

x'
y'
y_prime'



