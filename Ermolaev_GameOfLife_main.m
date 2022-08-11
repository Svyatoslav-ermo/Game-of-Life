%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Title: The Game of Life Script
%   Description:
%   The code simulates the Game of Life according to the rules of
%   mathematician John Conway. The code iterates living matrix, which
%   contains cells' states of 1s and 0s, through a set number of
%   iterations. The script makes animation of living cells for each
%   generation and in the end plots the number of living cells vs. time.
%   Periodic boundary condition is employed to ensure continuity of matrix
%   space. The script employs two functions: IdNeighbors and NextGen to
%   determine indicies of neighbors and to advance matrix one generation
%   forward, respectively.
%
%   Author: Slava Ermolaev
%   Date: 08/05/2022
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Clear Cache
clear all %#ok<*CLALL>
close all
clc
rng('shuffle') % Set random seed to current time

%%  The Game of Life
%--------------------------------------------------------------------%
% Part a
%--------------------------------------------------------------------%
%   Set the size of matrix
num_rows = 150;
num_cols = 200;

%   Set probability value of being alive
prob = 0.1;

%   Set number of generations to run simulation for
num_gens = 300;

%   Set linear vector of generation numbers from 0 to num_gens
gens_vec = linspace(0,num_gens,num_gens+1);

%   Set 1D vector of size num_gens+1 to hold the number of living
%   cells for each generation. The vector will hold the zeroth
%   generation's living population and all further generations'
%   number of living cells.
living_vec = zeros(1,num_gens+1);

%   Randomize matrix where each cell has 'prob' probabilty of being
%   alive and '1 - prob' probablity of being dead
%--------------------------------------------------------------------%
%   Create matrix of proper size with random entries between 0 and 1
A = rand(num_rows,num_cols);

%   Each entry is reassigned 1 if it is less or equal to 'prob' or 0
%   if it is greater.
A = A <= prob;
%--------------------------------------------------------------------%

%   Sum up the current population and store it as 0-th generation in
%   living_vec. Syntax is valid for versions R2018b and later.
living_vec(1) = sum(A, 'all');

%   Set figure 1 for living colony visualization
figure(1)

%   Create an animation of the 0-th generation
imagesc(A)

%   Display generation number
title(['Generation ' num2str(gens_vec(1))],'FontSize',24);

%   Set equal aspect ratio
axis equal

%   Set axes line width and font size
set(gca,'LineWidth',3,'FontSize',20)

text(12,5,'Press any key to start simulation','FontSize',20,'Color','w',BackgroundColor='k')

%   Display the current generation
drawnow

%   Pause until user input
pause

%   For every generation k from 2 to num_gens+1
for k = 2:1:num_gens+1

    %   Call NextGen and update A
    A = NextGen(A);

    %   Sum up the number of living cells and store them in
    %   living_vec(k). Syntax valid for versions R2018b and later.
    living_vec(k) = sum(A, 'all');

    figure(1)

    %   Create an animation of the current generation
    imagesc(A)

    %   Update generation number
    title(['Generation ' num2str(gens_vec(k))],'FontSize',24);

    %   Set axes line width and font size
    set(gca,'LineWidth',3,'FontSize',20)

    %   Display the current generation
    drawnow

end % End for loop for all generations

%   Plot the number of living cells vs. time (number of generations)
%--------------------------------------------------------------------%
%   Set figure 2 for the plot
figure(2)

hold on
grid on

%   Plot generation number and number of living cells vectors
plot(gens_vec,living_vec,'b','LineWidth',3)

%   Set title
title('Number of Living Cells Over Time','FontSize',24)

%   Set x and y axes limits
xlim([min(gens_vec) max(gens_vec)])
ylim([min(living_vec) max(living_vec)])

% Set position on monitor
set(gcf,'Position',[75 75 1275 600])

% Set axes line width and font size
set(gca,'LineWidth',3,'FontSize',20)

% Set axes labes
xlabel('Number of Generations')
ylabel('Number of Living Cells')
%--------------------------------------------------------------------%
% Part b - See NextGen and IdNeighbors functions
% For experiment cases, some parts of original functions must be commented
% out to avoid conflicts.
%--------------------------------------------------------------------%