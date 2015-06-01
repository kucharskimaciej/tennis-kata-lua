Tennis = {}
Tennis.__index = Tennis

function Tennis.create()
  local self = setmetatable({}, Tennis)
  self.score = {0, 0}

  return self
end

function Tennis:translate_score(score)
  local lookup = {
    [0] = 'Love',
    [1] = 'Fifteen',
    [2] = 'Thirty',
    [3] = 'Forty'
  }

  return lookup[score] or ""
end

function Tennis:test_advantage()
  if self.score[1] >= 4 and self.score[1] == (self.score[2] + 1) then
    return "Adv. player 1"
  end

  if self.score[2] >= 4 and self.score[2] == self.score[1] + 1 then
    return "Adv. player 2"
  end
end

function Tennis:test_deuce()
  return self.score[1] == self.score[2] and self.score[1] >= 4
end

function Tennis:test_winner()
  if self.score[1] >= 4 and self.score[1] >= (self.score[2] + 2) then
    return "Winner: player 1"
  end

  if self.score[2] >= 4 and self.score[2] >= (self.score[1] + 2) then
    return "Winner: player 2"
  end
end

function Tennis:get_score()
  local score1, score2 =  self:translate_score(self.score[1]),
                          self:translate_score(self.score[2])

  local advantage, deuce, winner =  self:test_advantage(),
                                    self:test_deuce(),
                                    self:test_winner()

  if advantage then return advantage end
  if deuce then return "Deuce" end
  if winner then return winner end

  return score1..', '..score2
end

function Tennis:set_score(score)
  self.score = score
end

function Tennis:increase_score(playerIdx)
  if playerIdx == nil then error("Must pass player index") end
  self.score[playerIdx] = self.score[playerIdx] + 1
end

return Tennis
