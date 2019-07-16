local character = require("prototypes.character")

local player = character:extend()

local oldUpdate = player.update

function player:update(dt)
  oldUpdate(self, dt)
  if self:isMoving() then
    return
  end
  self:updateControls(dt)
end

function player:updateControls(dt)
end

return player