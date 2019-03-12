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
        (6- ((@indexNr - (@indexNr % 6))/6))
    end
    #calculates the col
    def spalteAusindexNr
        (@indexNr % 6)
    end
end

