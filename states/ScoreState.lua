ScoreState = Class{__includes = BaseState}

local GOLD_MEDAL = love.graphics.newImage('medal-gold.png')
local SILVER_MEDAL = love.graphics.newImage('medal-silver.png')
local BRONZE_MEDAL = love.graphics.newImage('medal-bronze.png')

function ScoreState:enter(params) 
    self.score = params.score 
end

function ScoreState:update(dt)
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then 
        gStateMachine:change('countdown')
    end
end

function ScoreState:render() 
    love.graphics.setFont(flappyFont) 
    love.graphics.printf('Oof! You lost!', 0, 64, VIRTUAL_WIDTH, 'center')

    love.graphics.setFont(mediumFont)
    love.graphics.printf('Score: ' ..tostring(self.score), 0, 100, VIRTUAL_WIDTH, 'center')

    if self.score <= 5 then
        love.graphics.draw(BRONZE_MEDAL, VIRTUAL_WIDTH / 2 - 31, VIRTUAL_HEIGHT / 2 - 15, 0, 0.3, 0.3)
    elseif self.score <= 15 then
        love.graphics.draw(SILVER_MEDAL, VIRTUAL_WIDTH / 2 - 33, VIRTUAL_HEIGHT / 2 - 17, 0, 0.15, 0.15)
    else 
        love.graphics.draw(GOLD_MEDAL, VIRTUAL_WIDTH / 2 - 40, VIRTUAL_HEIGHT / 2 - 25, 0, 0.15, 0.15)
    end

    love.graphics.printf('Press Enter to Play again!', 0, 210, VIRTUAL_WIDTH, 'center')
end