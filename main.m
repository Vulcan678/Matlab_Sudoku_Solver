clc
clear all
close all

% initializing different sudoku layouts

mat_easy=[1,0,8,6,0,2,0,0,0;
        0,0,3,0,8,0,0,2,0;
        2,9,4,0,0,0,0,6,1;
        8,0,0,0,4,9,1,0,0;
        7,0,0,5,0,6,0,0,2;
        0,0,1,8,3,0,0,0,4;
        9,1,0,0,0,0,7,5,3;
        0,5,0,0,6,0,2,0,0;
        0,0,0,7,0,1,6,0,9];

mat_medium=[0,0,4,2,5,0,0,0,9;
            6,0,0,9,4,0,8,7,0;
            0,0,9,0,0,0,0,6,0;
            0,0,0,0,0,4,7,9,0;
            0,0,0,0,0,0,0,0,0;
            0,5,1,8,0,0,0,0,0;
            0,9,0,0,0,0,1,0,0;
            0,4,6,0,3,2,0,0,7;
            3,0,0,0,6,9,5,0,0];

mat_hard=[0,0,4,0,0,0,6,0,0;
        1,0,0,0,7,0,9,0,3;
        0,0,0,0,2,0,0,0,0;
        0,1,6,0,0,2,8,0,0;
        7,0,0,0,5,0,0,0,4;
        0,0,3,6,0,0,2,9,0;
        0,0,0,0,8,0,0,0,0;
        2,0,7,0,3,0,0,0,9;
        0,0,9,0,0,0,7,0,0];

mat_extreme1=[0,0,2,0,0,0,6,0,1;
            0,8,9,0,2,0,0,0,3;
            0,0,0,0,9,0,0,0,5;
            0,0,4,0,0,2,0,0,0;
            0,9,0,5,0,3,0,8,0;
            0,0,0,6,0,0,1,0,0;
            9,0,0,0,7,0,0,0,0;
            1,0,0,0,6,0,9,4,0;
            4,0,7,0,0,0,5,0,0];

mat_extreme2=[0,8,0,0,1,0,0,4,0;
            2,0,0,4,0,9,0,0,7;
            0,0,4,7,0,2,5,0,0;
            5,0,0,0,0,0,0,0,1;
            0,0,0,0,2,0,0,0,0;
            7,0,0,0,0,0,0,0,6;
            0,0,2,3,0,1,9,0,0;
            9,0,0,2,0,8,0,0,5;
            0,5,0,0,4,0,0,1,0];

tic      
mat=mat_extreme2;

% initialize zero's in every number possibility for each cell
mat_poss=zeros(9,9,10);

for i=1:9
    for j=1:9
        if mat(i,j)==0
            % eampty cells set all numbers as possible
            for k=1:10
                mat_poss(i,j,k)=k-1;
            end
        else
            % non-empty cell set as number in initial layout
            mat_poss(i,j,1)=mat(i,j);
        end
    end
end

count=0;
n_before=0;
n_now=count_nums(mat);

% continue while the solver iteration doesn't add new numbers
while n_now>n_before
    n_before=n_now;
    % perform solver iteration
    mat_poss=solver(mat_poss);
    % print current sudoku layout
    mat=mat_poss(:,:,1)
    n_now=count_nums(mat)
    count=count+1
end
toc
