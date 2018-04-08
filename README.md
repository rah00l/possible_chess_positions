### Application -
     Possible-Chess-Positions
Command Line Chess Position identifier in Ruby

## Code details -
Add code to **master** branch

### Logic
* possible_chess_positions.rb is the class responsiable for giving list of possible-chess-positions.
* Which accept two parameters Type of chess piece (Kings, Knights, Queens, Bishops, Pawn and Rooks)
* & Current position (a1, g5, d2)
* It returns list of all the potential board positions the given piece could advance to, with one move, from the given position, with the assumption there are
no other pieces on the board.

Example:

If the code is passed: “knight, d2”

	$ chessercise.rb -piece KNIGHT -position d2

The output should be: “b1, f1, b3, f3,c4, e4"

### Tech Specs -
* Ruby 2.3.3

