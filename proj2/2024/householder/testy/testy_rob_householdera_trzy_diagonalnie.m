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

% SPRAWDZENIE

% Hn-1*...*H1A = R (p,q,s) wiec H0*....Hn-1*R = A

a_new = zeros(1,n -1);
b_new = zeros(1, n);
c_new = zeros(1, n -1);
s_new = zeros(1, n-2);

%rozpoczynamy moznenie przez Q

for i = (n-1: -1:1)
   if(i == n -1)
    H = Householdery(:,:,i);
    R = [p(i),q(i); 0, p(i+1)];
    temp = H*R;
    
    a_new(i) = temp(2,1);
    b_new(i) = temp(1,1);
    b_new(i+1) = temp(2,2);
    c_new(i) = temp(1,2);

   else % i < n - 1
    H = Householdery(:,:, i);
    R = [p(i), q(i), s(i); 0, b_new(i+1), c_new(i+1)];
    temp = H*R;
    
    a_new(i) = temp(2,1);
    b_new(i) = temp(1,1);
    c_new(i) = temp(1, 2);
    c_new(i+1) = temp(2,3);
    s_new(i) = temp(1,3);
    b_new(i+1) = temp(2,2);

   end
end


a_new
b_new
c_new



% Q = H0*H1*....*Hn-1
% Q = H0*H1*....Hn-1*I


% A = Q*R

