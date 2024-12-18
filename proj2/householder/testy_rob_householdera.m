x1 = 1;
x2 = 1;

[y1, h1, h2] = RobHousholdera(x1, x2);


%check

H = [h1, h2];

x = [x1;x2];

y = H*x;

%check: inv(h)*y powinien dawac x 

H\y