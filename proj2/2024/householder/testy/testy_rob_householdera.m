x1 = 5;
x2 = 1;
x = [x1;x2];

[y1, H] = RobHousholdera(x1, x2);

y = H*x;

%to powinno byc bardzi bliskie zera
norm(x - H*y)

%to powinno byc 0
norm(x - H\y)

%check: inv(h)*y powinien dawac x 
H\y