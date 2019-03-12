$width_height = 6
    $zeileConv= {
    1 => '1',
    2 => '2',
    3 => '3',
    4 => '4',
    5 => '5',
    6 => '6',
    nil => 'x'
    }
    
    $spalteConv= {
    1 => 'a',
    2 => 'b',
    3 => 'c',
    4 => 'd',
    5 => 'e',
    6 => 'f',
    nil => 'x'
    }
#simulates a stack on the GameField
class GameStack 
    attr_accessor :fenFeld , :value , :ownedBy , :indexNr , :zeile , :spalte
    def initialize(fenFeld,indexNr)
        @indexNr    = indexNr+1
        @fenFeld    = fenFeld
        @value      = fenFeld.length
        @ownedBy    = ""
        @zeile      = zeileAusindexNr
        @spalte     = spalteAusindexNr
        if @value > 0
        @ownedBy = @fenFeld[0] 
        end
    end
    protected
    #calculates the row
    def zeileAusindexNr
        temp = @indexNr.dup
        cnt = 0
        while temp > $width_height
        temp -= $width_height
        cnt+=1
        end
        $width_height-cnt
    end
    #calculates the col
    def spalteAusindexNr
        temp = @indexNr.dup
        while temp > $width_height
        temp -= $width_height
        end
        temp
    end
end



class FieldPos
     attr_accessor :zeile , :spalte     
    def initialize(zeile,spalte)
        @zeile    = zeile
        @spalte    = spalte
    end
    def same?(other)
        @zeile == other.zeile && @spalte == other.spalte
    end
    def to_s
    if($spalteConv[spalte] == nil || $zeileConv[zeile] == nil )
        "x"
    else
        $spalteConv[spalte]+$zeileConv[zeile]
    end
    end
    
    
end

class Move 
    attr_accessor :startPos , :schritte , :endPos 
    def initialize(startPos,schritte,endPos)
        @startPos    = startPos
        @schritte    = schritte
        @endPos      = endPos
    end
   
    
    def same?(other)
        @startPos == other.startPos && @schritte == other.schritte && @endPos == other.endPos
    end
    def to_s 
        
        (startPos.to_s)+"-"+(schritte.to_s)+"-"+(endPos.to_s)
      
    end
end