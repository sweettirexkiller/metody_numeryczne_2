function X = gaussJordanInverion(A)
%gaussJordanInverion 
%   funkcja ta przyjmuje jeden argument, czyli macierz a zwaraca jej
%   odwrotność. Odwrotnosć uzyskujemy poprzez eliminacje Gaussa-Jordana na
%   równaniu Ax=I , I- to macierz jednostkowa. X jest nasza szukaną A^(-1)
[m,n] = size(A);
if m ~= n 
    % jesli macierz nie jest kwadratowa
   msg = 'Macierz nie jest kwadratowa i nie jest odwracalna.';
   error(msg);
end

I = eye(m);

B = [A,I];


for i=1:m % przechodzimy przez wszytskie rzedy
    
    if B(i,i) == 0
        
        for j=i:m %szukamy niezerowaego wiersza ponizej
           
            if isequal(B(j,1:n),zeros(1,m)) % macierz jest nieodwracalna, poniewaz ma zerowy rząd
                 msg = 'Macierz ma zerowy wiersz - nie jest odwracalna.';
                 error(msg);
            end
            
            if ~isequal(B(j,1:n),zeros(1,m)) && B(j,i) ~= 0 % jesli taki znajdziemy to zamieniamy kolumny
                B([i j],:) = B([j i], :);
                break;
            end
        end 
        
      
    end
    
    B(i,:) = B(i,:) / B(i,i); %wszytskie elementy w rzędzie dzielimy przez element z diagonali  
    
    for j=i+1:m %iterujemy się przez każdy następny rząd w dół
        B(j,:)= B(j,:) + (-1)*B(j,i)*B(i,:); %odejmujemy rząd wyżej razy B(j,i) by wyzerować kolumnę
    end 
    
    for j=i-1:-1:1 %iterujemy się przez każdy następny rząd w górę
        B(j,:) = B(j,:) + (-1)*B(j,i)*B(i,:); % analogicznie zerujemy kolumny wzwyż
    end
    
end %uzyskujemy macierz jednostkową



X = B(:,n+1:2*n);

if X(m,n) == 0 % ostatni wiersz jest zerowy
     msg = 'Macierz jest nieosobliwa';
     error(msg);
end

end

