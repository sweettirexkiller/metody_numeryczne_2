a = [5,6,7];
b = [1,2,3,4];
c = [8,9,10];

%
%  1  8  0  0
%  5  2  9  0
%  0  6  3  10
%  0  0  7  4


[p,q,s,Householdery] = RobHouseholderaTrzyDiagonalnie(a,b,c);

% sprawdzenie = [p(1) q(1) s(1) 0 ; 0 p(2) q(2) s(2); 0 0 p(3) q(3); 0 0 0 p(4)];
% 
% sprawdzenie

