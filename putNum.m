function [mat_poss] = putNum(num,i,j,mat_poss)
% Inputs:
% num - number to put in cell (i,j) and remove from possibilities from all
%       other cells relevent to it
% i - number of row
% j - number of col
% mat_poss - 9x9x10 matrix with valid possibilities for each cell
% Output:
% mat_poss - 9x9x10 matrix with updated valid possibilities for each cell
%           mat_poss(:,:,1) holds the updated sudoku layout


n=index2box(i,j);

mat_poss(i,j,1)=num;
mat_poss(i,j,2:end)=0;

mat_poss(i,:,num+1)=0;
mat_poss(:,j,num+1)=0;

i0=ceil(n/3);
j0=mod(n,3);

if j0==0
    j0=3;
end

mat_poss((i0-1)*3+1:i0*3,(j0-1)*3+1:j0*3,num+1)=0;

end

