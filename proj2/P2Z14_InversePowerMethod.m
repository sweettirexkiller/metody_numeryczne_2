function [lambda, x_k, iter] = P2Z14_InversePowerMethod(n, diag, du, dd, miu, tol, LIMIT)
% Projekt 2, zadanie 14
% Piotr Jankiewicz, 288767
% 
% Funkcja P2Z46_InversePowerMethod
%
% Odnajdywanie wartości własnej macieży A najbliżej podanej 
% wartości miu metodą odwrotną potęgową z normowaniem dla 
% macierzy trójdiagonalnej 
%
% WEJŚĆIE:
%    n      - size of matrix A (n x n)
%    d      - od diagonal, wektor wartosci z diagonali macierzy A
%    dU     - od diagonal up, wektor wartosci z jeden rzad wyzej od diagonali 
%    dd     - od diagonal down, wektor wartosci z jeden rzad nizej od diagonali 
%    tol    - granica dokładnosci wykonywanych iteracji 
%    LIMIT  - limit liczby iteracji, dla których procedura zostanie
%             przerwana
%    miu    - podana wartosc dla ktorej bedzie szukana najblisza wartosc wlasna
%                 macierzy A
% WYJŚCIE:
%    lambda     - znaleziona wartosc wlasna najblizsza miu
%    x_k        - znaleziony wektor własny 
%    iter       - liczba wykonanych iteracji




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%% FIRST PART %%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Change diagonal to get A - miu * I
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

dI = ones(1, n);
AlessMiuIDiag = diag - miu.*dI';


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 1) QR decomposition of A with 
%    Householder Reflectors
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[rd, r1ud, r2ud, H] = housholderQRDecomposition(n, AlessMiuIDiag, du, dd, tol);
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%% SECOND PART %%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 1) Solve QRb(k+1) = bk for b(k+1)
% 2) divide b(k+1) by norm( R^-1 * Q' * b(k))
% 3) go back to 1 until abs(bk+1 - bk) < tol 
%    or end procedure if limit of interations
%    is exceeded.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
% inital eigen vector for iterations

rng('shuffle');
low = -9;
high = +9;
x_k = low + (high-low) .*rand(1, n);
prev = x_k;
iterations = 0;
while(1)

    % y to nasze Qt*x_k
    %y = Q' * x_k
    %y = (H(1)* ..... *H(n-1))' * x_k)
    %y = H(n-1) * ..... * H(1) * x(k)
   y = x_k;
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
  
    if max(abs(x_k_1 - x_k)) < tol
        break;
    end
    if iterations > LIMIT
%         disp("Limit of iterations");
        break;
    end
    
    prev = x_k;
    x_k = x_k_1;
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%% THIRD PART %%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
     
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%s
% 1) find eigen value for eigen vector x_k form A*x_k = lambda * x_k;
% lambda = (x_k'*A*x_k)/(x_k'*x_k) 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Ax_k  = matrixVectorMultiplication(diag,du,dd,x_k);
nominator = dot(x_k, Ax_k);
denominator = dot(x_k,  x_k);
lambda = nominator / denominator;

x_k = x_k';
iter = iterations;
    
end

