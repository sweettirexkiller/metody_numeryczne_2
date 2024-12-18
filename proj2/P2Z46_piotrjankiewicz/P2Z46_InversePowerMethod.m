function [lambda x_k, iter] = P2Z46_InversePowerMethod(n, diag, du, dd,miu)
% Projekt 2, zadanie 46
% Piotr Jankiewicz, 288767
% 
% Odnajdywanie wartości własnej macieży A najbliżej podanej 
% wartości miu od metodą potęgową z normowaniem dla 
% macierzy trójdiagonalnej 
% WEJŚĆIE:
%    n      - size of matrix A (n x n)
%    d      - od diagonal, wektor wartosci z diagonali macierzy A
%    dU     - od diagonal up, wektor wartosci z jeden rzad wyzej od diagonali 
%    dd     - od diagonal down, wektor wartosci z jeden rzad nizej od diagonali 
%    miu    - podana wartosc dla ktorej bedzie szukana najblisza wartosc wlasna
%                 macierzy A
% WYJŚCIE:
%    lambda     - znaleziona wartosc wlasna najblizsza miu
%    x_k        - znaleziony wektor własny odpowiadający lambda
%    iter       - liczba wykonanych iteracji

tol = 10^-8;
LIMIT = 10^3;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%% FIRST PART %%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 1) Change diagonal to get A - miu * I
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

dI = ones(1, n);
AlessMiuIDiag = diag - miu.*dI';

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 2) QR decomposition of A - miu* I with 
%    Householder Reflectors
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[rd, r1ud, r2ud, H] = housholderQRDecomposition(n, AlessMiuIDiag, du, dd, tol);
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%% SECOND PART %%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%s
% 1) Solve QRb(k+1) = bk for b(k+1)
% 2) divide b(k+1) by norm( R^-1 * Q' * b(k))
% 3) go back to 1 until abs(bk+1 - bk) < tol
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
% inital eigen vector for iterations

rng('shuffle');
low = -9;
high = +9;
x_k = low + (high-low) .*rand(1, n);
x_k_1 = low + (high-low) .*rand(1,n);
iterations = 0;
prev = low + (high-low) .*rand(1, n);

while(1)

    %y = Q' * x(k)
    %y = (H(1)* ..... *H(n-1))' * x(k))
    %y = H(n-1) * ..... * H(1) * x(k)
   y = prev;
   for i = n-1:-1:1
        Hi = [H(i, 1), H(i,2); H(i,2), H(i,3)];
        y(i:i+1) = (Hi*y(i:i+1)')';
   end
   
   

   % Rx = y for findind norm, then divide y by norm
%    x_prev_norm = norm(myGaussianElimination(rd, r1ud, r2ud, y));
%     
%    y = y/x_prev_norm;
   % R * x_next = y
    x_k_1 = myGaussianElimination(rd, r1ud, r2ud, y);
    x_k_1 = x_k_1/ norm(x_k_1);
    iterations = iterations + 1;
    prev = x_k;
    x_k = x_k_1;
  
    if max(abs(x_k_1 - prev)) < tol
        break;
    end
    if iterations > LIMIT
%         disp("Limit of iterations");
        break;
    end
    
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%% THIRD PART %%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
     
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%s
% 1) find eigen value for eigen vector x_k form A*x_k = lambda * x_k;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% x_k is eigen vector closest to miu in A^-1
lambdaXk = matrixVectorMultiplication(diag,du,dd,x_k');

lambda = lambdaXk' * x_k';

x_k = x_k';
iter = iterations;
    
end

