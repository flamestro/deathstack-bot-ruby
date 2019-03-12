#spalte die fen Notation in eine Collection mit 
#den stapeln inklusive leere Stapel
def splitFen(fenNot)
    count=0
    result =Array.new
	felder = (fenNot+",").gsub('/',',').gsub(',,',', ,').split(",")
    felder.each do |value| 
        if value== " "
            result[count] = ""
        else 
            result[count] = value
        end
    count += 1
    end
    result
end

def listMoves 
	
end