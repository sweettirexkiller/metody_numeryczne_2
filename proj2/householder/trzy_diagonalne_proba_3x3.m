a = [2,3];
b = [1,2,2];
c = [1,1];

%
% 1 1 0
% 2 2 1
% 0 3 2
%

s = zeros([1,1]);

%zerowanie pierwszej kolumny

% i t numer kolumny ktora zerujemy w tym kroku
%i < n - 1 
i = 1;

x = [b(i); a(i)];

[y1, h1,h2] = RobHousholdera(x(1), x(2));

H1 = [h1, h2];

czesc_wejsciowej = [b(i) c(i) 0; a(i) b(i+1) c(i+1)];

przetransformowana = H1*czesc_wejsciowej;

przetransformowana

%aktualizujemy 

b(i) = y1;
a(i) = 0;
c(i) = przetransformowana(1,2);
b(i+1) = przetransformowana(2,2);
s(i) = przetransformowana(1,3);
c(i+1) = przetransformowana(2,3);

sprawdzenie = [b(1) c(1) s(1) ; a(1) b(2) c(2); 0 a(2) b(3)];

%zerujemy druga kolumne 

%i = n-2 wiec czesc_wejsciowe bedzie 2x2
i = 2;

x = [b(i); a(i)];

[y1, h1,h2] = RobHousholdera(x(1), x(2));

H2 = [h1, h2];

czesc_wejsciowej = [b(i) c(i); a(i) b(i+1)];

przetransformowana = H2*czesc_wejsciowej;

przetransformowana

%aktualizujemy 

b(i) = y1;
a(i) = 0;
c(i) = przetransformowana(1,2);
b(i+1) = przetransformowana(2,2);

sprawdzenie2 = [b(1) c(1) s(1) ; a(1) b(2) c(2); 0 a(2) b(3)];

sprawdzenie2