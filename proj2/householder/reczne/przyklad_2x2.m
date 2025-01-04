A = [1 1; 1 2];
[A_num_rows, A_num_cols] = size(A);
x = A(:,1);

x_norm = norm(x);

[x_num_rows, x_num_cols] = size(x);

x_prime = x_norm * eye(x_num_rows, 1);

u = x - x_prime;

I = eye(A_num_rows, A_num_cols);


H = I - (2*u*u')/(u'*u);

H*A