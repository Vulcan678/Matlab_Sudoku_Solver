function [box] = mat2box(mat,n)
% Inputs:
% mat - 9x9 matrix with current sudoku layout
% n - the number of the box (from top left to bottem right)
% Output:
% box - 3x3 matrix of the relevent box in the sudoku layout

i=ceil(n/3);
j=mod(n,3);

if j==0
    j=3;
end

box=mat((i-1)*3+1:i*3,(j-1)*3+1:j*3);

end

