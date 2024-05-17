import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"

import "entities/player"
import "manager/enemySpawner"
import "manager/screenShake"
import "ui/scoreDisplay"

local pd <const> = playdate
local gfx <const> = pd.graphics

local screenShakeSprite = ScreenShake()

function resetGame()
    resetScore()
    clearEnemies()
    stopSpawner()
    startSpawner()
    setShakeAmount(10)
end

function setShakeAmount(amount)
    screenShakeSprite:setShakeAmount(amount)
end

local backgroundImage = gfx.image.new("images/background")
assert(backgroundImage)

gfx.sprite.setBackgroundDrawingCallback(
    function(xPosition, yPosition, width, height)
        backgroundImage:draw(0, 0)
    end
)

createScoreDisplay()
Player(30, 120)
startSpawner()

function pd.update()
    gfx.sprite.update()
    pd.timer.updateTimers()
end
