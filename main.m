%/*
% *	 main.m
% *  Determine the LU factorization of a square matrix 
% *
% *  Created on: April 1, 2014
% *  Author: David Crossman
% */

% Intialization 
    prompt = 'Please enter the matrix A (where [A][X]=[C]):';
    A = input(prompt);
    % default for ease of use
    if isempty(A)
        A = [3 -2 1; 2 6 -4; -8 -2 5];
    end
    prompt = 'Please enter the matrix C (where [A][X]=[C]):';
    C = input(prompt);
    % default for ease of use
    if isempty(C)
        C = [-10; 44; -26];
    end
    AC = [A C];
    % where m = row # and n = col #
    [m,n] = size(AC);
    % Identity Matrix for L
    L = eye(m);
    U = eye(m);
    
% Main Function
    % where ac is the sorted matrix A and C
    ac = sortrows(AC, -1);
    c = ac(1:m, n:n);
    % Find and set the value of the lower matrix
    for i=1:1:m
        for j=i+1:1:m
            L(j,i) = (ac(j,i))/(ac(i, i));
            % Find the value of the upper matrix
            for k=1:1:n
                ac(j,k) = ac(j,k) - L(j,i)*ac(i,k);
            end
        end
    end
    % Set the value of the upper matrix
    U = ac(1:m, 1:n-1);
    % Using Equation 1 ([L][Z]=[C])
    Z = L\c;
    % Using Equation 2 ([U][X]=[Z])
    X = U\Z;

% Display Results
disp('The intial matrix:');
disp(A);
disp('The upper matrix of A (U):');
disp(U);
disp('The lower matrix of A (L):');
disp(L);
disp('The product of L and U:');
disp(U*L);
disp('Validate our answer:');
disp('L*U*X =');
disp(L*U*X);
disp('c =');
disp(c);