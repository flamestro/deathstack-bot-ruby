require_relative 'HelpingMethods'

def getMove(completeFen)
	fen           = splitCompleteFen(completeFen)[0]
    player        = splitCompleteFen(completeFen)[1]
    gameStacklist = createGameStackList(fen)
    moves         = calculateMoves(gameStacklist,player)
    moves.delete(nil)
    clearedMoves  = moves.uniq(&:asString)
    moveString   = "\"["+ moves[0].to_s+"]\"\n"
    print moveString
end

def valueMove(move,gsList,player)
	val = 0
	gsList.each do |elem|
		if elem.ownedBy==player &&elem.val <5
		val += elem.value *10
		elsif elem.ownedBy==player &&elem.val >4
			val += (elem.value-4)*5+40
		end
	end
	val
end

def afterMove(move,gsList,player)
	gsListnew = gsList.dup
	temp1= ""
	gsListnew.each do |elem|
		if FieldPos.new(elem.row,elem.column).to_s == move.startPos.to_s
			temp1 = elem.fenField[0,move.steps-1]
			elem.fenField = elem.fenField[move.steps-1,elem.value-1]
		end
	end
	gsListnew.each do |elem|
		if FieldPos.new(elem.row,elem.column).to_s == move.endPos.to_s
			elem.fenField = temp +elem.fenField
		end
	end
	gsListnew
	
end