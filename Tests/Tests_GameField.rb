require_relative '../GameField'
require 'test/unit'

class Test_FieldPos < Test::Unit::TestCase
	#Tests for to_s method in GameField//FieldPos
		def testField_toS_valid
			assert_equal(FieldPos.new(2,2).to_s,"b2")
		end
		def testField_toS_nilAsRow
			assert_equal(FieldPos.new(nil,2).to_s,"x")
		end
		def testField_toS_nilAsCol
			assert_equal(FieldPos.new(2,nil).to_s,"x")
		end
		def testField_toS_bothNil
			assert_equal(FieldPos.new(nil,nil).to_s,"x")
		end
		def testField_toS_toHighRow
			assert_equal(FieldPos.new(7,2).to_s,"x")
		end
		def testField_toS_toHighCol
			assert_equal(FieldPos.new(2,7).to_s,"x")
		end
		def testField_toS_BothToHigh
			assert_equal(FieldPos.new(7,7).to_s,"x")
		end
		def testField_toS_toLowRow
			assert_equal(FieldPos.new(-1,2).to_s,"x")
		end
		def testField_toS_toLowCol
			assert_equal(FieldPos.new(2,-1).to_s,"x")
		end
		def testField_toS_BothToLow
			assert_equal(FieldPos.new(-1,-1).to_s,"x")
		end
end

