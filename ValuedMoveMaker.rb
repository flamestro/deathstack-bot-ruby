require_relative 'HelpingMethods'

$iterationDepth = 4
#return first calculated move
def getMove(completeFen)
	fen           = splitCompleteFen(completeFen)[0]
    player        = splitCompleteFen(completeFen)[1]
    gameStacklist = createGameStackList(fen)
    moves         = calculateMoves(gameStacklist,player)
    clearedMoves  = moves.uniq(&:asString)
    
    moveString   = "\"["+ minimax(clearedMoves,gameStacklist,player)+"]\"\n"
    print moveString
end
#estimates the new gameStacklist after the a move is made
	def afterMove(gsList,move)
	gsListnew = gsList.dup
	temp= ""
	gsListnew.each do |elem|
		if FieldPos.new(elem.row,elem.column).to_s == move.startPos.to_s
			temp1 = elem.fenfield[0,move.steps-1]
			elem.fenfield = elem.fenfield[move.steps-1,elem.value-1]
		end
	end
	gsListnew.each do |elem|
		if FieldPos.new(elem.row,elem.column).to_s == move.endPos.to_s
			elem.fenfield = temp +elem.fenfield
		end
	end
	gsListnew
    end
    
#returns the two bes moves inside the given moves array [0] -> best , [1] -> second best
def valueBest(moves,gsList,player)
	valMoves = []
	moves.each_with_index do |move, index|
		valMoves[index]= move.valueMove(gsList,player)
	end
	bestvals = valMoves.dup.sort[valMoves.length-2,valMoves.length-1]
	bestMoves = [moves[valMoves.index(bestvals[1])],moves[valMoves.index(bestvals[0])]]
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

def minimax(moves,gsList,player)
    valuesMoves = Array.new
    moves.each_with_index do |move,index|
        valuesMoves[index] = miniMaxred(move,gsList,player,player,$iterationDepth)
    end
    indexOfBest= valuesMoves.index(valuesMoves.max)
   
    
    moves[indexOfBest]
end

def miniMaxred( move, gsList,playerstart,playeriterate,iteration)
    
    max = playerstart == playeriterate
    newMoves = Array.new
    bestValed = Array.new
    
    move.valueMove(gsList,playeriterate) if iteration == 0
    
    
    newMoves = calculateMoves(afterMove(gsList,move),playeriterate)
    newMoves.delete(nil)
    clearedMoves  = newMoves.uniq(&:asString)
    
    bestValed = valueBest(clearedMoves,afterMove(gsList,move),changePlayer(playeriterate))
    
    
    if(bestValed.length >1)
    leftNode  = miniMaxred(bestValed[0], afterMove(gsList,bestValed[0]),playerstart,changePlayer(playeriterate),iteration-1)
    elsif max 
    leftNode  =1000
    else 
    leftNode  = 0
    end
    
    if(bestValed.length >1)
    rigthNode  = miniMaxred(bestValed[1], afterMove(gsList,bestValed[1]),playerstart,changePlayer(playeriterate),iteration-1)
    elsif max 
    rigthNode  = 1000
    else 
    rigthNode  = 0
    end
    
    if max && leftNode >  rightNode
        leftNode+(10^iteration)
    elsif max && leftNode <= rightNode 
        rightNode+(10^iteration)
    elsif max==false && leftNode >  rightNode
        rightNode-(10^iteration)
    elsif max==false && leftNode <= rightNode
        leftNode-(10^iteration)  
    end
    
    end
    

