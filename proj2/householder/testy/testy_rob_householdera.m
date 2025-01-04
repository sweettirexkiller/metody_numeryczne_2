x1 = 1;
x2 = 1;

[y1, H] = RobHousholdera(x1, x2);


%check

x = [x1;x2];

y = H*x;

y

%check: inv(h)*y powinien dawac x 

H\y