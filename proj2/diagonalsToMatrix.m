function result_matrix = diagonalsToMatrix(main_diag, upper_diag, lower_diag)
% Projekt 2, zadanie 14
% Piotr Jankiewicz, 288767
% 
% Funkcja diagonalsToMatrix
% WEJŚĆIE:
%    main_diag      - od diagonal, wektor wartosci z diagonali macierzy A
%    upper_diag     - od diagonal up, wektor wartosci z jeden rzad wyzej od diagonali 
%    lower_diag     - od diagonal down, wektor wartosci z jeden rzad nizej od diagonali 
%
% WYJŚCIE:
%    result_matrix  - macierz powstała z trzech diagonali     




  % Check if the diagonals have valid lengths
    if numel(main_diag) ~= numel(upper_diag) + 1 || numel(main_diag) ~= numel(lower_diag) + 1
        error('Diagonals lengths are not valid.');
    end

    % Get the size of the matrix based on the length of the main diagonal
    n = numel(main_diag);
    result_matrix = zeros(n);

    result_matrix=diag(main_diag,0)+diag(upper_diag,1)+diag(lower_diag, -1);



end