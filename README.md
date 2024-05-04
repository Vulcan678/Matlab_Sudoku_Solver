# Matlab Sudoku Solver
Sudoku Solver Using Algorithms in MATLAB

The code solves the hardest 9x9 sudoku problems using algorithms and strategies I use to solve them. The sudoku layout is given as a 9x9 matrix and for each cell there is a storage of possible numbers. The strategy is built from 3.5 algorithms:
1. Basic - Place a number in a cell if all the other numbers are present in the relevant row, column, and 3x3 box.
2. Basic2 - Place a number in the cell if in the row\column\box this number has possibility only in one cell.
3. Advanced - Find the smallest possible subsets of empty cells that only have a certain combination of possibilities to remove other possibilities for this subset of empty cells.
    1. If in a row\column the possibility for a specific number is found only in one 3x3 box, remove the number from the possibilities of the other cells in the box.
  
To run a solution for a specific sudoku layout, in the main.m file, in line 58 update the variable mat to a 9x9 matrix where empty cells are filled with zeros.

```
mat = [0,8,0,0,1,0,0,4,0;
      2,0,0,4,0,9,0,0,7;
      0,0,4,7,0,2,5,0,0;
      5,0,0,0,0,0,0,0,1;
      0,0,0,0,2,0,0,0,0;
      7,0,0,0,0,0,0,0,6;
      0,0,2,3,0,1,9,0,0;
      9,0,0,2,0,8,0,0,5;
      0,5,0,0,4,0,0,1,0];
```
