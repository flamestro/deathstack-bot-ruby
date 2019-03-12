require_relative 'Spielbrett'
require_relative 'HelpingMethods'

#Got mainclass
puts "Fen eingeben"
completeFen = gets.chomp
fen         = splitCompleteFen(completeFen)[0]
player      = splitCompleteFen(completeFen)[1]

