require_relative 'GameField'
require_relative 'HelpingMethods'
require_relative 'ValuedMoveMaker'


#this is the mainclass 
running = true
while
fenComplete = gets.chomp
if fenComplete == ""
running=false
end
if running
getMove(fenComplete[1,fenComplete.length-2])
end
end
#listMoves("rr,rr,rr,rr,rr,rr/,rrrrrr,,,,/,,,,,/,,,,,/,,,,,/bb,bb,bb,bb,bb,bb r")

#getMove("rr,rr,rr,rr,rr,rr/,rrrrrr,,,,/,,,,,/,,,,,/,,,,,/,,,,r,bb r")