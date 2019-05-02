require_relative 'HelpingMethods'

$iterationDepth = 4
#return first calculated move
def getMove(completeFen)
	fen           = splitCompleteFen(completeFen)[0]
    player        = splitCompleteFen(completeFen)[1]
    gameStacklist = createGameStackList(fen)
    moves         = calculateMoves(gameStacklist,player)
    clearedMoves  = moves.uniq(&:asString)
    
    moveString   =  minimax(clearedMoves,gameStacklist,player).to_s
    print moveString
end
#estimates the new gameStacklist after the a move is made
	def afterMove(gsList,move)
	gsListnew = Marshal::load(Marshal.dump(gsList))
	temp= ""
  
	gsListnew.each do |elem|
		if FieldPos.new(elem.row,elem.column).to_s == move.startPos.to_s
			temp          = elem.fenfield[0,move.steps	]
			elem.fenfield = elem.fenfield[move.steps,elem.fenfield.length-1]
            elem.value    = elem.fenfield.length
            if elem.value > 0
            elem.ownedBy  = elem.fenfield[0] 
            else 
            elem.ownedBy  = ""
            end
		end
	end
	gsListnew.each do |elem|
		if FieldPos.new(elem.row,elem.column).to_s == move.endPos.to_s
			elem.fenfield = temp << elem.fenfield
            elem.value    = elem.fenfield.length
            elem.ownedBy  = elem.fenfield[0] 
		end
	end
    
	gsListnew
    end
    
#returns the two best moves inside the given moves array [0] -> best , [1] -> second best
def valueBest(moves,gsList,player)
	valMoves = []
    gsListNew = Marshal::load(Marshal.dump(gsList))
	moves.each_with_index do |move, index|
		valMoves[index]= move.valueMove(gsListNew,player)
       
	end
   
    valMovesnew = Marshal::load(Marshal.dump(valMoves))
    if valMovesnew.length <= 1 
    bestvals = valMovesnew.sort[0]
    bestMoves = [moves[valMoves.index(bestvals[0])],moves[valMoves.index(bestvals[0])]]
    else
    bestvals = valMovesnew.sort[valMoves.length-2,valMoves.length-1]
	bestMoves = [moves[valMoves.index(bestvals[1])],moves[valMoves.index(bestvals[0])]]
    end
	
end

def changePlayer(player)
    if player == "b"
    "r"
    elsif player == "r"
    "b"
    else 
    "x"
    end
end

def gsAsFen(gsList)
	asString = ""
	gsList.each do |elem|
	asString += elem.fenfield + ","
	end
	asString
end
def minimax(moves,givenGsList,player)
    valuesMoves = Array.new
    gsList = Marshal::load(Marshal.dump(givenGsList))
    moves.each_with_index do |move,index|
    valuesMoves[index] = miniMaxred(move,gsList,player,player,$iterationDepth)
    end
    indexOfBest = valuesMoves.index(valuesMoves.max)
   
    moves[indexOfBest]
end
def boardFinished(gsList,player)
    otherPlayer = changePlayer(player)
    gsList.each do |elem|
    
    if elem.ownedBy == otherPlayer 
    return false
    end
    
    end
    
    true
end

def pow(input,power)
    power -=1
	if power == 0
	return input
	elsif power == -1
	return 1
	end
	
    power.times do
    input *= input
    end
    input
end
def miniMaxred( move,  givenGsList,playerstart,playeriterate,iteration)
    gsList = Marshal::load(Marshal.dump(givenGsList))
    if iteration ==0    
        return move.valueMove(gsList,playerstart)
    elsif boardFinished(afterMove(gsList,move),playerstart)
		
        return  1000+pow(10,iteration)
    elsif boardFinished(afterMove(gsList,move),changePlayer(playerstart))
		
        return -1000-pow(10,iteration)
    end
    max                       = playeriterate == playerstart
    playeriterate             = changePlayer(playeriterate)
    nextPossibleMoves         = calculateMoves(afterMove(gsList,move),playeriterate)
    clearedMoves              = nextPossibleMoves.uniq(&:asString)
    bestValued                = valueBest(clearedMoves,afterMove(gsList,move),playeriterate)
    
    leftNode                  = miniMaxred(bestValued[0],afterMove(gsList,move),playerstart,playeriterate,iteration-1)
    rightNode                 = miniMaxred(bestValued[1],afterMove(gsList,move),playerstart,playeriterate,iteration-1)
    
    if      max && leftNode > rightNode 
                leftNode    +pow(10,iteration)
    elsif   max && leftNode <= rightNode 
                rightNode   +pow(10,iteration)
    elsif   max==false && leftNode > rightNode 
                rightNode   -pow(10,iteration)
    elsif   max==false && leftNode <= rightNode 
                leftNode    -pow(10,iteration)
    end
end
 

