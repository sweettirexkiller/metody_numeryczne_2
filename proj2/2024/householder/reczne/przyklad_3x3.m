A_0 = [1,2,1; 2,3,2; 1,2,3];
[A_num_rows, A_num_cols] = size(A_0);

%xerowanie pierwszej kolumny
x = A_0(:, 1);
x_prime = norm(x)*eye(A_num_rows, 1);
u = x - x_prime;


H_0 = eye(A_num_rows, A_num_cols) - 2*(u*u')/(u'*u);


% zerowanie drugiej kolumny

A_1 = H_0 * A_0;

x_1 = A_1(2:A_num_rows, 2);

x_1_prime = norm(x_1)*eye(A_num_rows -1, 1);

u_1 = x_1 - x_1_prime;

H_1_prime = eye(A_num_rows - 1, A_num_cols - 1) - 2*(u_1*u_1')/(u_1'*u_1);

[m_H_1_prime, n_H_1_prime] = size(H_1_prime);      % Identity matrix of size m


I = eye(1);       % 1x1 identity matrix
Z = zeros(1,2);   % 1x2 zero row vector
H_1 = [I Z; zeros(2,1) H_1_prime];

A_2 = H_1*A_1;

R = A_2;

Q = H_0' * H_1';

Q*R