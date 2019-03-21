require_relative 'GameField'
require_relative 'HelpingMethods'
require_relative 'ValuedMoveMaker'


#this is the mainclass 
fenComplete = gets.chomp
getMove(fenComplete[1,fenComplete.length-2])
#listMoves("rr,rr,rr,rr,rr,rr/,rrrrrr,,,,/,,,,,/,,,,,/,,,,,/bb,bb,bb,bb,bb,bb r")

#getMove("rr,rr,rr,rr,rr,rr/,rrrrrr,,,,/,,,,,/,,,,,/,,,,,/,,,,r,bb r")