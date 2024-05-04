function [n] = index2box(i,j)
% Inputs:
% i - number of row
% j - number of col
% Output:
% n - number of box

n=(ceil(i/3)-1)*3+ceil(j/3);

end

