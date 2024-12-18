a = [5,6,7];
b = [1,2,3,4];
c = [8,9,10];

%
%  1  8  0  0
%  5  2  9  0
%  0  6  3  10
%  0  0  7  4



%n - rozmiar macierzy
n = 4;

%kolejne householdery
Householdery = zeros(2, 2, n -1);
% s - diagonala dwa nad glowna
size_s = n -2;
s = zeros([1,size_s]);

%zerowanie pierwszej kolumny

% i to numer kolumny ktora zerujemy w tym kroku
i = 1;

% i < n -1 
x = [b(i); a(i)];

[y1, h1,h2] = RobHousholdera(x(1), x(2));

H1 = [h1, h2];

Householdery(:,:, i) = H1;

czesc_wejsciowej = [b(i) c(i) 0; a(i) b(i+1) c(i+1)];

przetransformowana = H1*czesc_wejsciowej;
%aktualizujemy 

b(i) = y1;
a(i) = 0;
c(i) = przetransformowana(1,2);
b(i+1) = przetransformowana(2,2);
s(i) = przetransformowana(1,3);
c(i+1) = przetransformowana(2,3);

sprawdzenie = [b(1) c(1) s(1) 0 ; a(1) b(2) c(2) 0; 0 a(2) b(3) c(3); 0 0 a(3) b(4)];

% sprawdzenie
%zerujemy druga kolumne 

% i < n-1 
i = 2;

x = [b(i); a(i)];
[y1, h1,h2] = RobHousholdera(x(1), x(2));
H2 = [h1, h2];

Householdery(:,:, i) = H2;


czesc_wejsciowej = [b(i) c(i) 0; a(i) b(i+1) c(i+1)];

przetransformowana = H2*czesc_wejsciowej;

b(i) = y1;
a(i) = 0;
c(i) = przetransformowana(1,2);
b(i+1) = przetransformowana(2,2);
s(i) = przetransformowana(1,3);
c(i+1) = przetransformowana(2,3);

sprawdzenie2 = [b(1) c(1) s(1) 0 ; a(1) b(2) c(2) s(2); 0 a(2) b(3) c(3); 0 0 a(3) b(4)];

sprawdzenie2

% zerujemy trzecia kolumne 
i =3;

%i = n -1 wiec czesc_wejsciowej bedzie 2x2 i nie ma juz aktualizacji s 

x = [b(i); a(i)];

[y1, h1,h2] = RobHousholdera(x(1), x(2));

H3 = [h1, h2];

Householdery(:,:, i) = H3;

czesc_wejsciowej = [b(i) c(i); a(i) b(i+1)];

przetransformowana = H3*czesc_wejsciowej;

przetransformowana

%aktualizujemy 

b(i) = y1;
a(i) = 0;
c(i) = przetransformowana(1,2);
b(i+1) = przetransformowana(2,2);

sprawdzenie3 = [b(1) c(1) s(1) 0 ; a(1) b(2) c(2) s(2); 0 a(2) b(3) c(3); 0 0 a(3) b(4)];

sprawdzenie3