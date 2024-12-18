function [rd, r1ud, r2ud, H] = housholderQRDecomposition(n, diagonal, du, dd, tol)
% HOUSHOLDERQRDECOMPOSITION 
% Piotr Jankiewicz, 288767
% 
% Deokmpozycja macierzy trójdiagonalnej do postaci QR, gdzie Q jest
% ortagonalne a R trójkątne górne
%
% WEJŚĆIE:
%    n      - size of matrix A (n x n)
%    d      - od diagonal, wektor wartosci z diagonali macierzy A
%    dU     - od diagonal up, wektor wartosci z jeden rzad wyzej od diagonali 
%    dd     - od diagonal down, wektor wartosci z jeden rzad nizej od diagonali 
%    tol    - tolerance for computaions 
%   
% WYJŚCIE:
%    rd     - od R diagonal, wektor wartosci z diagonali macierzy R
%    r1ud   - od R 1 up diagonal, wektor wartosci z jeden rzad wyzej od diagonali 
%    r2ud   - od R 2 up diagonal, wektor wartosci z dwa rzędy wyżej od diagonali 
%    H      - macierz wspólczynnikow kolejncyh reflektorów Housoldera [a,b,d]

 rd = diagonal; % diagonal od R
 r1ud = du; % od R 1 up diagonal (wartosci w R o 1 wyzej od diagonali)
 r2ud = zeros(1, n-2); % od R 2 up diagonal (wartosci w R o 2 wyzej od diagonali)
 H = zeros(n-1, 3); % [a,b,d]

  % form H1 to Hn
    for k = 1:n-1
            
            x = [rd(k), dd(k)];
            e = [1,0];
            u = x + sign(x(1))*norm(x)*e;
            Hk = eye(2) - 2*(u'*u)/(u*u');
        
            a = Hk(1,1);
            b = Hk(1,2);
            d = Hk(2,2);
    
            H(k, :) = [a,b,d];
           
            if  abs(b*rd(k) + d * dd(k)) > tol
%                 printf("error in household");
                   break;
            end
        
           
            % calculate H*A
            rdk = a * rd(k) + b * dd(k); % rd(k)
            rdk_next = b * r1ud(k) + d * rd(k+1); % rd(k + 1)
            r1udk = a * r1ud(k) + b * rd(k+1); % r1ud(k)
    
            if k < n - 1
                r1udk_next = d * r1ud(k+1); % r1ud(k+1)
                r2udk = a * r2ud(k)  + b * r1ud(k+1); % r2ud(k)
            end
            
        
            % assing values
            rd(k) = rdk;
            rd(k+1) = rdk_next;
            r1ud(k) = r1udk;
    
             if k < n - 1
                    r1ud(k+1) = r1udk_next;
                    r2ud(k) = r2udk;
             end
           
    end
    
    %  examplary H1*H2 for A matrix 3 on 3;
    %  [H(1, 1), H(1,2), 0; H(1,2), H(1,3), 0; 0,0,1]*[1,0,0;0, H(2, 1), H(2,2); 0,H(2,2), H(2,3)] 
    

end

