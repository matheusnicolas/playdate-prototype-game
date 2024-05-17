local pd <const> = playdate
local gfx <const> = pd.graphics

import "bullet"

class('Player').extends(gfx.sprite)

function Player:init(xPosition, yPosition)
    local playerImage = gfx.image.new("images/player")
    self:setImage(playerImage)
    self:moveTo(xPosition, yPosition)
    self:add()
    self.speed = 3
end

function Player:update()
    if pd.buttonIsPressed(pd.kButtonUp) and self.y > 20 then
        self:moveBy(0, -self.speed)
    elseif pd.buttonIsPressed(pd.kButtonDown) and self.y < 220 then
        self:moveBy(0, self.speed)
    end

    if pd.buttonJustPressed(pd.kButtonA) then
        Bullet(self.x + 15, self.y - 10, 5)
    end
end
