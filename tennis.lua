function Tennis()
    local _score = { 0, 0 }
    local score_lookup = {
        [0] = 'Love',
        [1] = 'Fifteen',
        [2] = 'Thirty',
        [3] = 'Fourty',
    }

    local function get_basic_score()
        return score_lookup[_score[1]] .. ', ' .. score_lookup[_score[2]]
    end
    local function get_advantage() 
        if _score[1] > 4 and _score[1] == (_score[2] + 1) then
            return 'Adv. player 1'
        end
        if _score[2] > 4 and _score[2] == (_score[1] + 1) then
            return 'Adv. player 2'
        end

    end
    local function get_winner()
        if _score[1] > 4 and _score[1] >= (_score[2] + 2) then
            return 'Win. player 1'
        end
        if _score[2] > 4 and _score[2] >= (_score[1] + 2) then
            return 'Win. player 2'
        end
    end

    return {
        score = function(score)
            if type(score) == 'table' then
                _score = score
            else
                return _score
            end
        end,
        get_score = function()
            return get_winner() or
                get_advantage() or
                get_basic_score()
        end
     }
end

return Tennis
