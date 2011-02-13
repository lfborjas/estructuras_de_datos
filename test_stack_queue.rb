require 'test/unit'

class TestStack < Test::Unit::TestCase
    def setup
        @s = Stack.new
        5.downto(1){|e| @s.push e }
    end
    
    def test_purge
        @s.purge
        assert_equal 0, @s.size
    end
    def test_peek
        assert_equal 1, @s.peek
        assert_equal 5, @s.size
    end

    def test_push
        @s.push 666
        assert_equal 666, @s.peek
        assert_equal 6, @s.size
    end

    def test_pop
        e = @s.pop
        assert_equal 1, e
    end

    def test_empty
        @s.purge
        assert @s.empty?
    end
end
