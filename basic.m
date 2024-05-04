function [mat_poss] = basic(mat_poss)
% run over all eampty cells and find if there is only one possibilities
% fiting it place due to numbers in relevent row, column and box
% Inputs:
% mat_poss - 9x9x10 matrix with valid possibilities for each cell
% Output:
% mat_poss - 9x9x10 matrix with updated valid possibilities for each cell
%           mat_poss(:,:,1) holds the updated sudoku layout

mat=mat_poss(:,:,1);

% iterate while there are changes made in each iteration
change=1;
while(change>0)
    change=0;
    for i=1:9
        for j=1:9
            if mat(i,j)==0
                n=index2box(i,j);
                box=mat2box(mat,n);
                row=mat(i,:);
                col=mat(:,j);
                
                % reshape each object to vector 1x9
                box_ar=reshape(box,1,9);
                row_ar=row;
                col_ar=reshape(col,1,9);
                
                % append all vectors, remove empty cells and find all 
                % numbers used in one of the objects relevent to cell (i,j)               
                arr=[box_ar,row_ar,col_ar];
                arr(arr==0) = [];
                
                % remove possibilities of numbers that found in arr
                mat_poss(i,j,arr+1)=0;
                
                % find all possibilities left for cell (i,j)
                ar_poss=mat_poss(i,j,2:end);
                ar_poss(ar_poss==0) = [];
                
                % if only one possibilities, fill the cell and remove
                % possibilities from all other cells relevent to cell (i,j)
                if length(ar_poss)==1
                    mat_poss=putNum(ar_poss(1,1,1),i,j,mat_poss);
                    mat(i,j)=ar_poss;    
                    
                    change=change+1;
                end  
            end            
        end
    end
end

end

