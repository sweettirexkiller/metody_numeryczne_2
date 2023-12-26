function [ X, ro ] = iter_p_m_jacobiego( A, b, M )
% Iteracja prosta - metoda Jacobiego	
	if nargin<2 
		error('Bledna ilosc argumentow!'); 
	end
	[n,m] = size(A);
	if n~=m 
		error('Macierz nie jest kwadratowa');
	end
	n = length(b);
	if n~=m 
		error('Wektor b ma zly rozmiar');
	end
	if nargin<3
		M = 100;
	end
	%rozdzielamy A na L,D i U
	L = tril(A, -1);
	U = triu(A, +1);
	D = diag(diag(A));
	if(min(abs(diag(D)))<10e-8)
		X(1:n) = NaN;
			disp('Macierz osobliwa');
		return;
	end
	B = -D^-1*(L+U);
	ro = max(abs(eig(B)));
	X(1:n) = 0;
	x(1:n) = 0;
	for k = 1:M
		for i = 1:n 
			S = 0;
			if (A(i,i) < 10e-8)
				X(1:n) = NaN;
				disp('Macierz osobliwa');
				return;
			end
			for j = 1:n
				if j == i
					continue;
				end
				S = S + A(i,j)*X(j);
			end
			x(i) = (b(i) - S)/A(i,i);
		end
		X = x;
	end
end