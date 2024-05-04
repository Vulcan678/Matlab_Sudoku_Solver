function [vec_poss,change] = find_1cell_poss_in_vec(vec_poss,change)
% if in vector there is only one cell with specific possability put it as
% number in vector
% Inputs:
% vec_poss - 9x10 matrix with valid possibilities for each cell in vector
% Output:
% vec_poss - 9x10 matrix with valid possibilities for each cell in vector
%            vec_poss(,:,1) holds the updated sudoku layout in the vector

for k=1:9
    ind=find(vec_poss(:,k+1)==k);
    if length(ind)==1                
        vec_poss(ind,1)=k;
        vec_poss(ind,2:end)=0;
        change=change+1;
    end
end

end

