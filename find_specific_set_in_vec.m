function [vec_poss,change] = find_specific_set_in_vec(vec_poss,change)
% find subset of empty cells only they have the same set of possibilities 
% and fix possibilities according to the seperation
% Inputs:
% vec_poss - 9x10 matrix with valid possibilities for each cell in vector
% Output:
% vec_poss - 9x10 matrix with valid possibilities for each cell in vector
%            vec_poss(,:,1) holds the updated sudoku layout in the vector

if sum(vec_poss(:,2:end),'all')>0 
    % find all possible values in vector i
    poss_nums=reshape(vec_poss(:,2:end),1,81);
    poss_nums(poss_nums==0)=[];
    poss_nums=unique(poss_nums);

    len=length(poss_nums);

    % create binary representation of all sets of possible numbers with at 
    % least 2 different numbers and not all numbers
    binary_mat_poss=zeros(1,len+1);
    binary_mat_poss(2:3)=1;
    binary_mat_poss(1)=sum(binary_mat_poss);
    for j=4:pow2(len)-2
        bin_ar=de2bi(j,len);
        if sum(bin_ar)>1
            bin_ar=[sum(bin_ar),bin_ar];
            binary_mat_poss=[binary_mat_poss;bin_ar];
        end
    end
    
    binary_mat_poss=sortrows(binary_mat_poss,'descend');
    binary_mat_poss(:,1)=[];

    % iterate over different sets of possible numbers to find a combination
    % that repeats only on subset of the empty cells
    for j=1:length(binary_mat_poss(:,1))
        ar_comb=poss_nums(binary_mat_poss(j,:)==1);
        count=0;
        vec_cell_set=[];
        % count the amount of cells with all of ar_comb number in
        % their possabilities 
        for k=1:9
            if vec_poss(k,1)==0
                % find all possbilities in each cell
                ar_k_poss=vec_poss(k,2:end);                    
                ar_k_poss(ar_k_poss==0)=[];

                % if all the numbers in the chosen combination are 
                % in the possibilities of k, increment the counter                       
                if any(ismember(ar_comb,ar_k_poss))
                    count=count+1;
                    vec_cell_set=[vec_cell_set,k];
                end
            end
        end   
        % if the number of cells with ar_comb in their
        % possibilities equals to numbers in ar_comb remove ar_comb
        % from other cells possibilities and keep only ar_comb as 
        % possibilities in the selected cells
        if count==length(ar_comb)            
            sum_before=sum(vec_poss(:,2:end),'all');
            
            % remove other possibilities from cells with
            % ar_comb as possibilities
            other_nums=[1:9];
            other_nums(ar_comb)=[];
            
            vec_poss(vec_cell_set,other_nums+1)=0;
            
            % remove ar_comb possibilities from other cells
            other_cells=[1:9];
            other_cells(vec_cell_set)=[];
                        
            vec_poss(other_cells,ar_comb+1)=0;
                        
            sum_after=sum(vec_poss(:,2:end),'all');
            
            if sum_before>sum_after
                change=change+1;
            end
        end
    end
end

