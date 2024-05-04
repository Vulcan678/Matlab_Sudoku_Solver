function [n] = count_nums(mat)
% Input:
% mat - 9x9 matrix with current sudoku layout
% Output:
% n - number of filled cells

ar=reshape(mat,1,81);
ar(ar==0)=[];

n=length(ar);

end

