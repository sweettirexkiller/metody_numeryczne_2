function [p,q,s, Householdery] = RobHouseholderaTrzyDiagonalnie(a,b,c)
% Projekt 2, zadanie XXXX
% Piotr Jankiewicz, 288767
% 
% Funkcja RobHouseholderaTrzyDiagonalnie
% WEJŚĆIE:
%    a      - dolna diagonala
%    b      - glowna diagonala
%    c      - gorna diagonala
% 
%
% WYJŚCIE:
%    p            - glowna diagonala wyjsciowa
%    q            - gorna diagonala wyjsciowa
%    r            - droga gorna diagonala wyjsciowa
%    Householdery - macierz [2x2xn-1] wszystkich macierzy housholdera do
%                   zerowania kolejnych kolumn


%n - rozmiar macierzy
[m,n] = size(b);

%kolejne householdery
Householdery = zeros(2, 2, n -1);
% s - diagonala dwa nad glowna
size_s = n -2;
s = zeros([1,size_s]);
p = zeros([1,n]);
q = zeros([1,n-1]);

    for i = 1:(n-1)
        disp(['Zerujemy kolumne i = ', num2str(i)]);
    
        x = [b(i); a(i)];
        [y1, H] = RobHousholdera(x(1), x(2));
        Householdery(:,:, i) = H;
    
        if(i < n -1) % nie jest to przed ostatnia kolumna
            
            czesc_wejsciowej = [b(i) c(i) 0; a(i) b(i+1) c(i+1)];
            przetransformowana = H*czesc_wejsciowej;
            b(i) = y1;
            a(i) = przetransformowana(2,1);
            c(i) = przetransformowana(1,2);
            b(i+1) = przetransformowana(2,2);
            s(i) = przetransformowana(1,3);
            c(i+1) = przetransformowana(2,3);
    
            sprawdzenie = [b(1) c(1) s(1) 0 ; a(1) b(2) c(2) s(2); 0 a(2) b(3) c(3); 0 0 a(3) b(4)];
    
            disp(sprawdzenie);
    
        else % jest to przedostatnia kolumna - biedzie 2x2 i bez nadpisywania s
    
            czesc_wejsciowej = [b(i) c(i); a(i) b(i+1)];
            przetransformowana = H*czesc_wejsciowej;
            b(i) = y1;
            a(i) = 0;
            c(i) = przetransformowana(1,2);
            b(i+1) = przetransformowana(2,2);
    
        end
       
    end

 p = b;
 q = c; 
       

end

