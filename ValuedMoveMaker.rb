require_relative 'HelpingMethods'

$iterationDepth = 4
#return first calculated move
def getMove(completeFen)
	fen           = splitCompleteFen(completeFen)[0]
    player        = splitCompleteFen(completeFen)[1]
    gameStacklist = createGameStackList(fen)
    moves         = calculateMoves(gameStacklist,player)
    clearedMoves  = moves.uniq(&:asString)
    
    moveString   = "\"["+ minimax(clearedMoves,gameStacklist,player).to_s+"]\"\n"
    print moveString
end
#estimates the new gameStacklist after the a move is made
	def afterMove(gsList,move)
	gsListnew = Marshal::load(Marshal.dump(gsList))
	temp= ""
  
	gsListnew.each do |elem|
		if FieldPos.new(elem.row,elem.column).to_s == move.startPos.to_s
			temp = elem.fenfield[0,move.steps-1]
			elem.fenfield = elem.fenfield[move.steps,elem.value-1]
            elem.value = elem.fenfield.length
            if elem.value >0
            elem.ownedBy = elem.fenfield[0] 
            else 
            elem.ownedBy = ""
            end
		end
	end
	gsListnew.each do |elem|
		if FieldPos.new(elem.row,elem.column).to_s == move.endPos.to_s
			elem.fenfield = temp +elem.fenfield
            elem.value = elem.fenfield.length
            if elem.value >0
            elem.ownedBy = elem.fenfield[0] 
            else 
            elem.ownedBy = ""
            end
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
	bestvals = valMovesnew.sort[valMoves.length-2,valMoves.length-1]
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

def minimax(moves,givenGsList,player)
    valuesMoves = Array.new
    gsList = Marshal::load(Marshal.dump(givenGsList))
    moves.each_with_index do |move,index|
        valuesMoves[index] = miniMaxred(move,gsList,player,player,$iterationDepth)
        puts "----------------Move Number:"+(index+1).to_s + " From a list with the length of : " + moves.length.to_s
    end
    indexOfBest= valuesMoves.index(valuesMoves.max)
   
    p valuesMoves
    moves[indexOfBest]
end
def boardFinished(gsList,player)
    gsListNew = Marshal::load(Marshal.dump(gsList))
    otherPlayer = changePlayer(player)
    gsListNew.each do |elem|
    
    if elem.ownedBy == otherPlayer 
    return false
    end
    
    end
    
    true
end

def pow(input,power)
    power -=1
    power.times do
    input *= input
    end
    input
end
def miniMaxred( move,  givenGsList,playerstart,playeriterate,iteration)
    gsList = Marshal::load(Marshal.dump(givenGsList))
    if iteration == 0
    return move.valueMove(gsList,playerstart) 
    end
    max = playerstart == playeriterate
    newMoves = calculateMoves(afterMove(gsList,move),playeriterate)

    clearednewMoves  = newMoves.uniq(&:asString)
    
    bestValed = valueBest(clearednewMoves,afterMove(gsList,move),changePlayer(playeriterate))

    
    if(bestValed.length >1)
    puts "LeftNode iteration : " + iteration.to_s + " actual MoveVal = " + move.valueMove(givenGsList,playerstart).to_s
    leftNode  = miniMaxred(bestValed[1], afterMove(gsList,move),playerstart,changePlayer(playeriterate),iteration-1)
    elsif max 
    leftNode  = 1000
    else 
    leftNode  = 0
    end
    
    if(bestValed.length >1)
    puts "RightNode iteration : " + iteration.to_s+ " actual MoveVal = " + move.valueMove(givenGsList,playerstart).to_s
    rightNode  = miniMaxred(bestValed[0], afterMove(gsList,move),playerstart,changePlayer(playeriterate),iteration-1)
    elsif max 
    rightNode  = 1000
    else 
    rightNode  = 0
    end
    
    if boardFinished(afterMove(givenGsList,move),playeriterate)
        10000+pow(10,iteration)
    elsif max && leftNode >  rightNode
        leftNode+pow(10,iteration)
    elsif max && leftNode <= rightNode 
        rightNode+pow(10,iteration)
    elsif max==false && leftNode >  rightNode
        rightNode-pow(10,iteration)
    elsif max==false && leftNode <= rightNode
        leftNode-pow(10,iteration)
    end
    
    end
 

