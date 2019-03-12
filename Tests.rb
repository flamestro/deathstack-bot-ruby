require_relative 'Spielbrett'
require_relative 'HelpingMethods'
require 'test/unit'

class TestAll < Test::Unit::TestCase

    def test_empty_splitFen
        assert_equal([],splitFen(""))
    end

    def test_onlyslashes_splitFen
        assert_equal(["","","","","",""],splitFen("/////"))
    end
    
    def test_onlycommas_splitFen
        assert_equal(["","","","","",""],splitFen(",,,,,"))
    end
    def test_SlashesAndCommas_splitFen
        assert_equal(["","","","","",""],splitFen(",/,/,"))
    end
    def test_fenFull_splitFen
        assert_equal(["aa","aa","","","","","","aa",""],splitFen("aa,aa,/,,/,aa,"))
    end
    def test_fenFull2_splitFen
        assert_equal(["aa","aa","","","","","","aa"],splitFen("aa,aa,/,,/,aa"))
    end
    
    #SplitfenComplete Tests
    def test_splitFenComplete
        assert_equal(["aa,aa,/,,/,aa","r"],splitCompleteFen("aa,aa,/,,/,aa r"))
    end
    
    #createGameStackList Tests
    def test_createGameStackListfenFeld
        assert_equal("aa",createGameStackList("aa,aa,,,,/,,,,,/,,,,,aa/,,,,,/,,,,,/,,,,,")[0].fenFeld)
    end
    def test_createGameStackListvalue
        assert_equal(2,createGameStackList("aa,aa,,,,/,,,,,/,,,,,aa/,,,,,/,,,,,/,,,,,")[0].value)
    end
    def test_createGameStackListownedby
        assert_equal("a",createGameStackList("aa,aa,,,,/,,,,,/,,,,,aa/,,,,,/,,,,,/,,,,,")[0].ownedBy)
    end
    def test_createGameStackListfenindexNr
        assert_equal(1,createGameStackList("aa,aa,,,,/,,,,,/,,,,,aa/,,,,,/,,,,,/,,,,,")[0].indexNr)
    end
    def test_createGameStackListZeile
        assert_equal(6,createGameStackList("aa,aa,,,,/,,,,,/,,,,,aa/,,,,,/,,,,,/,,,,,")[0].zeile)
    end
    def test_createGameStackListSpalte
        assert_equal(1,createGameStackList("aa,aa,,,,/,,,,,/,,,,,aa/,,,,,/,,,,,/,,,,,")[0].spalte)
    end
    
     #createGameStackList Tests
    def test_createGameStackListfenFeldEmpty
        assert_equal("",createGameStackList("aa,aa,,,,/,,,,,/,,,,,aa/,,,,,/,,,,,/,,,,,")[3].fenFeld)
    end
    def test_createGameStackListvalueEmpty
        assert_equal(0,createGameStackList("aa,aa,,,,/,,,,,/,,,,,aa/,,,,,/,,,,,/,,,,,")[3].value)
    end
    def test_createGameStackListownedbyEmpty
        assert_equal("",createGameStackList("aa,aa,,,,/,,,,,/,,,,,aa/,,,,,/,,,,,/,,,,,")[3].ownedBy)
    end
    def test_createGameStackListfenindexNrEmpty
        assert_equal(4,createGameStackList("aa,aa,,,,/,,,,,/,,,,,aa/,,,,,/,,,,,/,,,,,")[3].indexNr)
    end
    def test_createGameStackListZeileEmpty
        assert_equal(6,createGameStackList("aa,aa,,,,/,,,,,/,,,,,aa/,,,,,/,,,,,/,,,,,")[3].zeile)
    end
    def test_createGameStackListSpalteEmpty
        assert_equal(4,createGameStackList("aa,aa,,,,/,,,,,/,,,,,aa/,,,,,/,,,,,/,,,,,")[3].spalte)
    end
    
end 