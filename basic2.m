function [mat_poss] = basic2(mat_poss)
% run over all possible rows, columns and boxes and if only one cell with 
% specific possability put it as number in the object
% Inputs:
% mat_poss - 9x9x10 matrix with valid possibilities for each cell
% Output:
% mat_poss - 9x9x10 matrix with updated valid possibilities for each cell
%           mat_poss(:,:,1) holds the updated sudoku layout

% iterate while there are changes made in each iteration
change=1;
while change>0
    change=0;
    
    % run over rows
    for i=1:9
        row_poss=reshape(mat_poss(i,:,:),9,10);
        
        [row_poss,change] = find_1cell_poss_in_vec(row_poss,change);
        
        mat_poss(i,:,:)=reshape(row_poss,1,9,10);        
    end
    mat_poss=basic(mat_poss);            
    
    
    % run over columns
    for j=1:9        
        col_poss=reshape(mat_poss(:,j,:),9,10); 
        
        [col_poss,change] = find_1cell_poss_in_vec(col_poss,change);
        
        mat_poss(:,j,:)=reshape(col_poss,9,1,10);        
    end
    mat_poss=basic(mat_poss);
    
    % run over boxes
    for n=1:9        
        for p=1:10
            box_poss(:,p)=reshape(mat2box(mat_poss(:,:,p),n),1,9); 
        end
        
        [box_poss,change] = find_1cell_poss_in_vec(box_poss,change);
        
        for p=1:10
            for ind=1:9
                [i,j] = boxindex2mat(ind,n);
                mat_poss(i,j,p)=box_poss(ind,p);
            end 
        end        
    end
    mat_poss=basic(mat_poss);
    
end

