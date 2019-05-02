require_relative 'ValuedMoveMaker' 
 #The Width and the heigth of a Gamefield
   $width_height = 6

	#this Hash can convert a column in Integer-form into a String representation 
    $columnConv= {
    1   => 'a',
    2   => 'b',
    3   => 'c',
    4   => 'd',
    5   => 'e',
    6   => 'f',
    }
#this object saves informations about the different positions on the gamefield
class GameStack 
	#this line lets us read the values inside the instance variables
    attr_accessor :fenfield , :value , :ownedBy , :indexNr , :row , :column
	#the constructor needs 2 parameters : fenfield :: String ( saves the representation of a stack on a position (a.e. "rrr","bbbb","brrb"...)
	#also it needs indexNr::Integer represents the position of every position on the gamefield in a given array 
	#[1 , 2, 3, 4, 5, 6]
	#[7, 8,9,10, 11, 12]
	#[13,14,15,16,17,18]
	#[19,20,21,22,23,24]
	#[25,26,27,28,29,30]
	#[31,32,33,34,35,36]
	#the gamefield looks like this and every position gets its own indexNr 
    def initialize(fenfield,indexNr)
        @indexNr     = indexNr+1
        @fenfield    = fenfield
        @value       = fenfield.length
        @ownedBy     = ""
        @row         = rowbyIndex
        @column      = columnbyIndex
        if @value > 0
        @ownedBy     = @fenfield[0] 
        end
    end
	
    protected
    #this method calculates the row of a this object, by its indexNr
    def rowbyIndex
        temp = @indexNr.dup
        cnt = 0
        while temp > $width_height
        temp -= $width_height
        cnt+=1
        end
        $width_height-cnt
    end
    #this method calculates the column of a this object, by its indexNr
    def columnbyIndex
        temp = @indexNr.dup
        while temp > $width_height
        temp -= $width_height
        end
        temp
    end
	
    
    
end


#This Class represents a position on the gamefield ( row and column)
class FieldPos
	#this line lets us read the values inside the instance variables
    attr_reader :row , :column
	#constructor to set the values for the instance variables: row :: Integer, column :: Integer
    def initialize(row,column)
        @row    = row
        @column    = column
    end
	#this method checks if the object, which calls the method has the same instance variable values as the given object given 
	#as parameter 
	def same?(other)
        @row == other.row && @column == other.column
    end
	#this method converts the position on the gamefield in to a readable string (like "a2","b4"...)
    def to_s
	#if something went wrong and the given position is not in a valid gamefield then "x" will be returned
    if($columnConv[column] == nil || row == nil|| row.to_s == "" || column>$width_height|| column< 1||row>$width_height||row<1)
        "x"
    else
        $columnConv[column]+row.to_s
    end
    end
    
    
end

# This Class represents a move by saving informations about the start-position, the steps and the end-position of a move
class Move 
	#this line lets us read the values of our instance variables
    attr_reader :startPos , :steps , :endPos , :asString
	
	#gets 3 parameters: startPos :: FieldPos, steps :: Integer, endPos :: FieldPos
    def initialize(startPos,steps,endPos)
        @startPos    = startPos
        @steps       = steps
        @endPos      = endPos
        @asString    = self.to_s
	end
   
    #this method checks if the object, which calls the method has the same instance variable values as the given object given 
	#as parameter
    def same(other)
       result =  @startPos == other.startPos && @steps == other.steps && @endPos == other.endPos
    end
	#this method returns the move in String form -> startPos-steps-endPos
    def to_s
        (startPos.to_s)+"-"+(steps.to_s)+"-"+(endPos.to_s)
    end
	
    #values the method is calling move object, with a given player and a given GameStackList
	def valueMove(gsList,player)
	val = 0
    gsListNew = Marshal::load(Marshal.dump(gsList))
	gsListAfterMove = afterMove(gsListNew,self)
	gsListAfterMove.each do |elem|
        
        if elem.ownedBy==player &&elem.value <5
		val += (elem.value) *10
		elsif elem.ownedBy==player &&elem.value >4
			val += (elem.value-4)*5+40
		end
        
	end
	val
	end
end