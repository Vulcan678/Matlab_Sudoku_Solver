function [i,j] = boxindex2mat(k,n)
% Inputs:
% k - index of number in the box
% n - number of box
% Outputs:
% i - number of row
% j - number of col

i=ceil(n/3);
j=mod(n,3);

if j==0
    j=3;
end

dj=ceil(k/3);
di=mod(k,3);

if di==0
    di=3;
end

i=(i-1)*3+di;
j=(j-1)*3+dj;


end

