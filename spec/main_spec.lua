Tennis = require "tennis"

describe("Tennis", function() 
    local tennis

    before_each(function() 
        tennis = Tennis()
    end)

    after_each(function()
        tennis = nil
    end)

    describe("#score", function() 
        it("sets the score to passed array", function()
            tennis.score({1 ,1})
            assert.are_same(tennis.score(), {1, 1})
        end)

        it("is 0-0 by default", function()
            assert.are_same(tennis.score(), {0, 0})
        end)
    end)

    describe("#get_score", function() 
        it("displays correct results for simple values", function() 
            assert.are_equal(tennis.get_score(), 'Love, Love')
            
            tennis.score({1, 0})
            assert.are_equal(tennis.get_score(), 'Fifteen, Love')
        
            tennis.score({1, 1})
            assert.are_equal(tennis.get_score(), 'Fifteen, Fifteen')
            
            tennis.score({2, 3})
            assert.are_equal(tennis.get_score(), 'Thirty, Fourty')
        end)

        it("recognizes advantages correctly", function() 
            tennis.score({5, 4})
            assert.are_equal(tennis.get_score(), 'Adv. player 1')
            tennis.score({6, 5})
            assert.are_equal(tennis.get_score(), 'Adv. player 1')
            tennis.score({6, 7})
            assert.are_equal(tennis.get_score(), 'Adv. player 2')

        end)
        it("recognizes wins correctly", function()
            tennis.score({5, 3})
            assert.are_equal(tennis.get_score(), 'Win. player 1')
            tennis.score({6, 4})
            assert.are_equal(tennis.get_score(), 'Win. player 1')
            tennis.score({5, 7})
            assert.are_equal(tennis.get_score(), 'Win. player 2')
        end)
    end)
end)
