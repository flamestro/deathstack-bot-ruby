require_relative 'DeathStacksBot'
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
    
end