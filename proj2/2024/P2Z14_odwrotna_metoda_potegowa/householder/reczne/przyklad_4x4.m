A_0 = [1,0,1,1; 0,1,1,1; 1,1,1,0; 1, 1, 0, 1];
[A_num_rows, A_num_cols] = size(A_0);

%xerowanie pierwszej kolumny
x = A_0(:, 1);
x_prime = norm(x)*eye(A_num_rows, 1);
u = x - x_prime;


H_0 = eye(A_num_rows, A_num_cols) - 2*(u*u')/(u'*u);



% zerowanie drugiej kolumny

A_1 = H_0 * A_0;


x_1 = A_1(2:A_num_rows, 2);

x_1_prime = norm(x_1)*eye(A_num_rows - 1, 1);

u_1 = x_1 - x_1_prime;

H_1_prime = eye(A_num_rows - 1, A_num_cols - 1) - 2*(u_1*u_1')/(u_1'*u_1);

[m_H_1_prime, n_H_1_prime] = size(H_1_prime);   


I = eye(1);       % 1x1 identity matrix
Z = zeros(1,A_num_cols - 1);   % 1x2 zero row vector
H_1 = [I Z; zeros(A_num_rows - 1,1) H_1_prime];


A_2 = H_1*A_1;


% zerowanie trzeciej kolumny

x_2 = A_2(3:A_num_rows, 3);

x_2_prime = norm(x_2)*eye(A_num_rows - 2, 1);

u_2 = x_2 - x_2_prime;


H_2_prime = eye(A_num_rows - 2, A_num_cols - 2) - 2*(u_2*u_2')/(u_2'*u_2);

[m_H_2_prime, n_H_2_prime] = size(H_2_prime);   

I = eye(2);       % 1x1 identity matrix
Z = zeros(2,A_num_cols - 2);     % 1x2 zero row vector
H_2 = [I Z; zeros(A_num_rows - 2,2) H_2_prime];

A_3 = H_2 * H_1 * A_1;

R = A_3;

%check 

Q = H_0' * H_1' * H_2;


Q*R