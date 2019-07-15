local engine = require("game.engine")

local player = engine.newCharacter()

local oldUpdate = player.update

function player:update(dt)
  self:updateControls(dt)
  oldUpdate(self, dt)
  if self:isMoving() then
    return
  end
  
end

function player:updateControls(dt)
end

return player