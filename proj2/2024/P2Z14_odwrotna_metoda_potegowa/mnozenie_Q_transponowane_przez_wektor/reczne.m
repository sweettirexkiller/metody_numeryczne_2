addpath("householder");
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


% tutaj chcemy zrobić Q^t*b, gdzie b to jakiś przykladowy wektor rozmiaru n

b = [2,3,4,5]';
b


% Q^t = Hn-1 * Hn-2*.....*H1;
% Q^t*b = Hn-1*Hn-2.....*H1;

for i = (1: +1:n-1)
    H_i = Householdery(:,:,i);
    b_i = b(i:i+1,1);
    b(i:i+1, 1) = H_i*b_i;
end

b



