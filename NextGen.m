function A_new = NextGen(A)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Definition of NextGen function.
%--------------------------------------------------------------------%
%   Function accepts matrix A that represents living cells on a 2D grid.
%   Matrix must be 2x2 or larger and have either 0 or 1 as its entries.
%   The function calls IdNeighbors function from within and identifies the
%   states of 8 adjacent neighbors. The function uses the following rules
%   to define the fate of each cell in the future generation:
%   - If cell is set to 1 and has 2 or 3 living neighbors, it will remain 1
%   - If cell is set to 1 and has less than 2 or more than 3 living
%     neighbors, it will be set to 0
%   - If cell is set to 0 and has exactly 3 neighbors, it will be set to 1
%
%   The function assigns new generation values to corresponding matrix
%   A_new and returns it.
%
%   Name: Slava Ermolaev
%   UID: 005543860
%   Date: 08/05/2022
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%   Set number of rows and columns
num_rows = size(A,1);
num_cols = size(A,2);

%   Error check that matrix A is 2x2 or larger
if sum([num_rows num_cols] < [2 2])
    error('Error: Matrix A cannot be less than 2x2 in size\n')
end % End size check

%   Error check that A entries are either 1 or 0
for row = 1:1:num_rows
    for col = 1:1:num_cols
        if A(row,col) ~= 1 && A(row,col) ~= 0
            error('Error: Matrix A entries can only be 1s or 0s\n')
        end % End error check
    end % End column iteration
end % End row iteration

%   Allocate A_new matrix of zeros the size of A
A_new = zeros(num_rows, num_cols);

%   For each row
for row = 1:1:num_rows
    %   For each column
    for col = 1:1:num_cols
        %   Identify current neighbors' indicies
        [N, W, S, E] = IdNeighbors([row col], [num_rows num_cols]);
        
        %   Sum all neighbors' states
        statesSum = A(N,W) + A(row,W) + A(S,W) + A(N,col) + A(S,col) + A(N,E) + A(row,E) + A(S,E);

        %   If the current cell is alive, and the number of living neighbors
        %   is less than 2 or more than 3
        if A(row,col) == 1 && (statesSum < 2 || statesSum > 3)
            %   Cell will die in the next generation
            A_new(row,col) = 0;

        %   Else if the current cell is dead, and the number of neighbors
        %   is 3
        elseif A(row,col) == 0 && statesSum == 3
            %   Cell will be alive in the next generation
            A_new(row,col) = 1;

        %   Else the current state of cell is not changing
        else
            A_new(row,col) = A(row,col);
        end % End of if for state determination

%--------------------------------------------------------------------%
% Part b - Commented regions are experiments using different rules
%--------------------------------------------------------------------%
%         %   Experimenting with 4 neighbors leading to survival
%         if A(row,col) == 1 && (statesSum < 2 || statesSum > 4)
%             %   Cell will die in the next generation
%             A_new(row,col) = 0;
% 
%         %   Else if the current cell is dead, and the number of neighbors
%         %   is 3
%         elseif A(row,col) == 0 && statesSum == 3
%             %   Cell will be alive in the next generation
%             A_new(row,col) = 1;
% 
%         %   Else the current state of cell is not changing
%         else
%             A_new(row,col) = A(row,col);
%         
%         end % End of if for state determination
%--------------------------------------------------------------------%
%         %   Experimenting with diagonal neighbors weighing half as much as
%         %   orthogonal and changing the number of living cells required for
%         %   dead cell to become alive to range of [2,4]
%         statesSum = A(N,W)/2 + A(row,W) + A(S,W)/2 + A(N,col) + A(S,col) + A(N,E)/2 + A(row,E) + A(S,E)/2;
% 
%         if A(row,col) == 1 && (statesSum < 2 || statesSum > 3)
%             %   Cell will die in the next generation
%             A_new(row,col) = 0;
% 
%         %   Else if the current cell is dead, and the number of neighbors
%         %   is in the range [2,4]
%         elseif A(row,col) == 0 && (statesSum >= 2 && statesSum <= 4)
%             %   Cell will be alive in the next generation
%             A_new(row,col) = 1;
% 
%         %   Else the current state of cell is not changing
%         else
%             A_new(row,col) = A(row,col);
%         
%         end % End of if for state determination
%--------------------------------------------------------------------%
%         [upN, N, leftW, W, lowS, S, rightE, E] = IdNeighbors([row col], [num_rows num_cols]);
%         %   Considering neighbors one level beyond original 8
%         %   Sum all neighbors' states
%         statesSum = A(upN,leftW) + A(N,leftW) + A(row,leftW) + A(S,leftW) + A(lowS,leftW) + A(upN,W) + A(N,W) + A(row,W) + A(S,W) + A(lowS,W) ...
%         + A(upN,col) + A(N,col) + A(S,col) + A(lowS,col) + A(upN,E) + A(N,E) + A(row,E) + A(S,E) + A(lowS,E) + A(upN,rightE) + A(N,rightE) + A(row,rightE) + A(S,rightE) + A(lowS,rightE);
% 
%         %   If the current cell is alive, and the number of living neighbors
%         %   is less than 2 or more than 3
%         if A(row,col) == 1 && (statesSum < 2 || statesSum > 3)
%             %   Cell will die in the next generation
%             A_new(row,col) = 0;
% 
%         %   Else if the current cell is dead, and the number of neighbors
%         %   is 3
%         elseif A(row,col) == 0 && statesSum == 3
%             %   Cell will be alive in the next generation
%             A_new(row,col) = 1;
% 
%         %   Else the current state of cell is not changing
%         else
%             A_new(row,col) = A(row,col);
%         end % End of if for state determination
%--------------------------------------------------------------------%

        
    end % End of for loop for each column
end % End of for loop for each row

end % End of NextGen function