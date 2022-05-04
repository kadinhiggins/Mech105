function [A] = specialMatrix(n,m)
% This function should return a matrix A as described in the problem statement
% Inputs n is the number of rows, and m the number of columns
% It is recomended to first create the matrxix A of the correct size, filling it with zeros to start with is not a bad choice
A = zeros(n,m);
% Now the real challenge is to fill in the correct values of A
if nargin ~= 2
    error('Error: Invalid number of input arguments')
end
for i = 1:m
    for j = 1:n
        A(1,i) = i;
        A(j,1) = j;
    end
end
for i = 2:m
    for j = 2:n
        A(j,i) = A(j,i-1) + A(j-1,i);
    end
end