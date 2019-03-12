require_relative 'Spielbrett'

#spalte die fen Notation in eine Collection mit 
#den stapeln inklusive leere Stapel
def splitFen(fenNot)
    count=0
    result =Array.new
	fields = (fenNot+",").gsub('/',',').gsub(',,',', ,').split(",")
    fields.each do |value| 
        if value== " "
            result[count] = ""
        else 
            result[count] = value
        end
    count += 1
    end
    result
end

#splits a complete fen in to a List of [0]=> fen [1]=>player
def splitCompleteFen(input)
    splitedList = input.split(" ")
end

#converts splitedFen into a GameStackList
def createGameStackList(inputFen)
    inputFen    = splitFen(inputFen)
    count       = 0
    outputList  = Array.new
    while count < inputFen.length
        outputList[count] = GameStack.new(inputFen[count],count)
        count +=1
    end
    outputList
end
def listMoves 
	
end
