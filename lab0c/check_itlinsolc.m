clear

ciA =[ 1 ,5, 7;
 1, 2 ,8;
 3, 6, 9;
 4, 7, 8;
 1, 5, 8;
 3, 5, 6;
 6, 7, 9;
 7, 8, 9;
 2, 4, 9;];

vicA = [
 1.5247 0.2571 1.0205;
 0.8617 -4.7229 0.9298;
 -0.6349 0.0012 0.2398;
 0.9894 -0.0708 -0.6904;
 -0.6516 7.2773 -2.4863;
 1.1921 0.5812 -5.2240;
 -1.6118 9.8936 -2.1924;
 -0.0245 4.4709 -2.3193;
 -1.9488 0.0799 3.7832;
];

b = [2,1,1,4,1,1,1,1,1]';

tic
[X,iNum] = itlinsolc(ciA,vicA, b);
toc

X
iNum
