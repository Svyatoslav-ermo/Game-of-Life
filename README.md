# Game-of-Life
The script simulates John Conway's Game of Life of living cells on a 2D grid that follow a specific set of rules that define their living or dead state.

1. Introduction

Cells will exist on a 2D grid and will be either alive or dead. Initial distribution of cells will be random, and survival or death of cells in the next generation will depend on the states of 8 neighbors located orthogonally and diagonally. Periodic boundary condition will be employed for cells on the edges of the grid. The script will run simulation for specific number of generations and will visualize results for each generation. The script will plot the number of cells vs. time in a separate figure.

2. Model and Theory

The initial distribution of cells on a 2D grid will be randomly generated with 0.1 probability of each cell being alive and 0.9 probability of each cell being dead. To determine the state of each cell in the next generation, the following rules will apply:
• If a living cell has 2 or 3 living neighbors, it will survive.
• If a living cell has less than 2 or more than 3 living neighbors, it will die.
• If a dead cell has exactly 3 living neighbors, it will turn into a living cell.
Periodic boundary conditions will apply. That is, for boundary cells, the grid will wrap around and form a toroidal shape. For example, for upper boundary cells, the neighbors will be corresponding cells at the lower boundary. Similarly, for a cell in the upper right corner, the boundary neighbors will be corresponding cells at the lower and left boundaries and the cell at the lower left corner. The algorithm of identifying neighbors is showed in pseudo-code.
