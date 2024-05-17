local pd <const> = playdate
local gfx <const> = pd.graphics

class('Enemy').extends(gfx.sprite)

function Enemy:init(xPosition, yPosition, speed)
    local enemyImage = gfx.image.new("images/cyclop")
    self:setImage(enemyImage)
    self:moveTo(xPosition, yPosition)
    self:add()

    self:setCollideRect(0, 0, self:getSize())

    self.moveSpeed = speed
end

function Enemy:update()
    self:moveBy(-self.moveSpeed, 0)
    if self.x < 0 then
        resetGame()
    end
end

function Enemy:collisionResponse()
    return "overlap"
end
