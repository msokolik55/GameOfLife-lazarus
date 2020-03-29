# GamOfLife-lazarus
 
## Description
Game of LIFE developed in Lazarus (Free Pascal) with built-in library Crt.

## Game process
Zero-player game based on rules Conway's Game of LIFE (https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life). The game shows generations until you press any button.

## Rules
- Any live cell with fewer than two live neighbours dies, as if by underpopulation.
- Any live cell with two or three live neighbours lives on to the next generation.
- Any live cell with more than three live neighbours dies, as if by overpopulation.
- Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.

These rules, which compare the behavior of the automaton to real life, can be condensed into the following:
- Any live cell with two or three neighbors survives.
- Any dead cell with three live neighbors becomes a live cell.
- All other live cells die in the next generation. Similarly, all other dead cells stay dead.
