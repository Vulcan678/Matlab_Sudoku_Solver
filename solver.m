function [mat_poss] = solver(mat_poss)
% Inputs:
% mat_poss - 9x9x10 matrix with valid possibilities for each cell
% Output:
% mat_poss - 9x9x10 matrix with updated valid possibilities for each cell
%           mat_poss(:,:,1) holds the updated sudoku layout

%% basic - run over all eampty cells and find if there is only one 
% possibilities fiting it place due to numbers in relevent row, column and 
% box

mat_poss=basic(mat_poss);

%% basic 2 - run over all possible rows, columns and boxes and if only one
% cell with specific possability put it as number in the object

mat_poss=basic2(mat_poss);

%% advanced - run over all possible rows, columns and boxes and find subset
% of empty cells only they have the same set of possibilities and fix 
% possibilities

mat_poss=advanced(mat_poss);

end

