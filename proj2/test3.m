function [] = test3()
%TEST1 
% Piotr Jankiewicz, 288767
%
% Funckja testujaca poprawnosc wyniku householderQRDecomposition
%
% WEJŚĆIE:
%   -
% WYJŚCIE:
%   -

tol = 10^-8;
LIMIT = 10^3;

fprintf("Testy poprawności dla macierzy A(3 na 3) :\n")
A = diag(2*ones(1,3),0) + diag(-1*ones(1,2),1) + diag(-1*ones(1,2),-1);

disp(A);
fprintf("Naciśnij dowolny klawisz.\n");
pause;

main_diag = diag(A); % main diagonal elements
upper_diag = diag(A,1); % upper diagonal elements
lower_diag = diag(A,-1); % lower diagonal elements
tol = 10^-5;

fprintf("\n");
[rd, r1ud, r2ud, H] = housholderQRDecomposition(length(main_diag), main_diag, upper_diag, lower_diag, tol);
fprintf("Wynik R własnej funkcji:\n");
Rown = diag(rd) + diag(r1ud,1) + diag(r2ud,2);


disp(Rown);
fprintf("Naciśnij dowolny klawisz.\n");
pause;

fprintf("Wynik R funkcji wbudowanej (prawidłowy):\n");
[Q,R] = qr(A);


disp(R);
fprintf("Naciśnij dowolny klawisz.\n");
pause;

fprintf("Wynik Q własnej funkcji:\n");
QOwn = eye(3);
 for i = 2:-1:1
        tmp = eye(3,3);
        Hi = [H(i, 1), H(i,2); H(i,2), H(i,3)];
        tmp(i:i+1, i:i+1) = Hi;
       
        QOwn = tmp*QOwn;
        
 end

 disp(QOwn);
  fprintf("Naciśnij dowolny klawisz.\n");
 pause;


 fprintf("Wynik Q wbudowanej funkcji:\n");
    disp(Q);
  


end

