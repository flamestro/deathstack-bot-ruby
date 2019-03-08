#Eingabe der fen Not und des Players
puts     "Enter Fen"
fen    = gets.chomp
puts     "Enter Player Char"
player = gets.chomp

#spalte die fen Notation in eine Collection mit 
#den stapeln inklusive leere Stapel
def splitFen(fenNot)
	felder = fen.split("/")
	felder = felder.join(",")
	felder = felder.split(",")
	return felder
end



def listMoves 
	
end

