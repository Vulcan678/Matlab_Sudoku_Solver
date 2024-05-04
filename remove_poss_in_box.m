function [mat_poss] = remove_poss_in_box(mat_poss)
% run over all possible rows and columns and find if a possible number 
% is only in one box. In that case remove the number from the other cells 
% in the box
% Inputs:
% mat_poss - 9x9x10 matrix with valid possibilities for each cell
% Output:
% mat_poss - 9x9x10 matrix with updated valid possibilities for each cell
%           mat_poss(:,:,1) holds the updated sudoku layout

% iterate while there are changes made in each iteration
change=1;
while change>0
    change=0;
    sum_before=sum(mat_poss(:,:,2:end),'all');
    for i=1:9
        row_poss=reshape(mat_poss(i,:,:),9,10);
        
        for k=1:9
            ind=find(row_poss(:,k+1)==k);
            blockNum=ceil(ind/3);
            blockNum=unique(blockNum);
            if length(blockNum)==1
                i0=ceil(i/3);
                j0=blockNum;

                i_vec=[(i0-1)*3+1:i0*3];
                i_vec(i_vec==i)=[];

                mat_poss(i_vec,(j0-1)*3+1:j0*3,k+1)=0; 
            end
        end           
    end
    
    for j=1:9        
        col_poss=reshape(mat_poss(:,j,:),9,10); 
        
        for k=1:9
            ind=find(col_poss(:,k+1)==k);
            blockNum=ceil(ind/3);
            blockNum=unique(blockNum);
            if length(blockNum)==1
                j0=ceil(j/3);
                i0=blockNum;

                j_vec=[(j0-1)*3+1:j0*3];
                j_vec(j_vec==j)=[];

                mat_poss((i0-1)*3+1:i0*3,j_vec,k+1)=0; 
            end
        end
    end
    
    
    sum_after=sum(mat_poss(:,:,2:end),'all');
    if sum_before>sum_after
        change=change+1;
    end
end

end

