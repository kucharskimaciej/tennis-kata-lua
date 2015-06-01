Tennis = require "tennis"

describe("Tennis", function()
  local tennis

  before_each(function()
    tennis = Tennis.create()
  end)

  after_each(function() tennis = nil end)

  describe("#create", function()
    it("returns a Tennis insteance object", function()
      assert(getmetatable(tennis) == Tennis)
    end)

    it("sets player 1 score to 0", function ()
      assert.equal(tennis.score[1], 0)
    end)

    it("sets player 2 score to 0", function ()
      assert.equal(tennis.score[2], 0)
    end)
  end)

  describe("#set_score", function()
    it("correctly sets the score", function()
      tennis:set_score({ 5, 5 })

      assert.same(tennis.score, { 5, 5 })
    end)
  end)

  describe("#get_score", function()

    local test_cases = {
      ['Love, Love']       = { 0, 0 },
      ['Fifteen, Love']    = { 1, 0 },
      ['Thirty, Love']     = { 2, 0 },
      ['Forty, Love']      = { 3, 0 },
      ['Fifteen, Fifteen'] = { 1, 1 },
      ['Adv. player 1']    = { 4, 3 },
      ['Adv. player 2']    = { 5, 6 },
      ['Deuce']            = { 4, 4 },
      ['Winner: player 1'] = { 5, 3 },
      ['Winner: player 2'] = { 0, 4 },

    }

    for result, input in pairs(test_cases) do
      it("returns '"..result.."' when players scored "..input[1]..':'..input[2],
      function()
        tennis:set_score(input)
        assert.are.same(tennis:get_score(), result)
      end)
    end



  end)

  describe("#increase_score", function()
    it("errors when player index isn't specified", function()
      assert.has_error(function () tennis:increase_score() end)
    end)

    it("increments the score of a player", function()
      assert.equal(tennis.score[1], 0)

      tennis:increase_score(1)
      assert.equal(tennis.score[1], 1)
    end)

  end)

end)
