#Eingabe der fen Not und des Players
puts     "Enter Fen"
fen    = gets.chomp
puts     "Enter Player Char"
player = gets.chomp


#spalte die fen Notation in eine Collection mit 
#den stapeln inklusive leere Stapel
#aa,aa,aa,aa,aa,aa,aa,/,/,aa,aa,aa,aa
def splitFen(fenNot)
	felder = fenNot.gsub('/',',').split(",")
end
p splitFen(fen)
def listMoves 
	
end

