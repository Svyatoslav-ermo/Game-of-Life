function [N, W, S, E ] = IdNeighbors(cellIndx, gridSize)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Definition of IdNeighbors function.
%--------------------------------------------------------------------%
%   Function accepts current cell's index and 2D grid size. It identifies
%   4 indicies for all 8 neighbors employing periodic boundary conditions.
%   N - North, W - West, S - South, E - East.
%   It returns all four indicies as a vector.
%
%   Name: Slava Ermolaev
%   UID: 005543860
%   Date: 8/5/2022
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%--------------------------------------------------------------------%
% Part b 
%--------------------------------------------------------------------%
%   Experimenting with consideration of neighbors beyond original 8 by 1
%   level. Function returns 4 more indicies.
% function [upN, N, leftW, W, lowS, S, rightE, E ] = IdNeighbors(cellIndx, gridSize)
%--------------------------------------------------------------------%

%   Error check that input vectors are both length of 2
if length(cellIndx) ~= 2 || length(gridSize) ~= 2
    error('Error: cellIndx and gridSize must be vectors of size 2\n')
end % End length check

%   Error check that inputs are numeric
if ~isnumeric(cellIndx) || ~isnumeric(gridSize)
    error('Error: cellIndx and gridSize must be numeric vectors\n')
end % End numeric check

%   Error check that inputs are real
if ~isreal(cellIndx) || ~isreal(gridSize)
    error('Error: cellIndx and gridSize must be real\n')
end % End real check

%   Error check that inputs are integers
if sum((mod(cellIndx,1)>1e-14))
    error('Error: cellIndx and gridSize must have integers\n')
end % End integer check

%   Error check that gridSize is not smaller than 2x2
if sum(gridSize < 2)
    error('Error: gridSize must be 2x2 or larger\n')
end % End gridSize check

%   Error check that cellIndx is within gridSize
if sum(cellIndx < [1 1]) || sum(gridSize > gridSize)
    error('Error: cellIndx must be within gridSize\n')
end % End bounds check for cellIndx

%   Begin upper and lower indicies assignment
%   If upper wall
if cellIndx(1) == 1
    %   Wrap around to the lower wall
    N = gridSize(1);
    S = cellIndx(1) + 1;

%   Else if lower wall
elseif cellIndx(1) == gridSize(1)
    %   Wrap around to the upper wall
    N = cellIndx(1) - 1;
    S = 1;

%   Else the cell is not adjacent to upper or lower walls
else
    N = cellIndx(1) - 1;
    S = cellIndx(1) + 1;

end % End upper and lower indicies assignment

%   Begin left and right indicies assignment
%   If left wall
if cellIndx(2) == 1
    %   Wrap around to the right wall
    W = gridSize(2);
    E = cellIndx(2) + 1;

%   Else if right wall
elseif cellIndx(2) == gridSize(2)
    %   Wrap around to the left wall
    W = cellIndx(2) - 1;
    E = 1;

%   Else the cell is not adjacent to left or right wall
else
    W = cellIndx(2) - 1;
    E = cellIndx(2) + 1;
end % End left and right indicies assignment

%--------------------------------------------------------------------%
% Part b - Considering neighbors beyond original
%--------------------------------------------------------------------%
% %   If N is adjacent to upper wall
% if N == 1
%     %   Wrap around to the lower wall
%     upN = gridSize(1);
%     lowS = S + 1;
% 
% %   Else if lower wall
% elseif S == gridSize(1)
%     %   Wrap around to the upper wall
%     upN = N - 1;
%     lowS = 1;
% 
% %   Else N and S are not adjacent to upper or lower walls
% else
%     upN = N - 1;
%     lowS = S + 1;
% end % End upN and lowS indicies assignment
% 
% %   Begin leftW and rightE indicies assignment
% %   If left wall
% if W == 1
%     %   Wrap around to the right wall
%     leftW = gridSize(2);
%     rightE = E + 1;
% 
% %   Else if right wall
% elseif E == gridSize(2)
%     %   Wrap around to the left wall
%     leftW = W - 1;
%     rightE = 1;
% 
% %   Else the W or E are not adjacent to left or right wall
% else
%     leftW = W - 1;
%     rightE = E + 1;
% end % End left and right indicies assignment
% %--------------------------------------------------------------------%

end % End of IdNeighbors function