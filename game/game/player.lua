local interpreter = require("game.interpreter")

local character = require("prototypes.character")

local controls = require("config.controls")

local player = character:extend()

local oldUpdate = player.update

function player:update(dt)
  oldUpdate(self, dt)
  self:updateControls(dt)
end

function player:setup(x, y, d)
  self:moveTo(x, y, d)
  self._img = love.graphics.newImage("images/characters/hero.png")
end

function player:updateControls(dt)
  if controls:down('up') then print(controls:down('up')) end
  if not self:canAct() then
    return
  end
  if     controls:down('up')    then
    self:move(8)
  elseif controls:down('down')  then
    self:move(2)
  elseif controls:down('left')  then
    self:move(4)
  elseif controls:down('right') then
    self:move(6)
  end
end

function player:canAct()
  if self:isMoving() then
    return false
  end
  if interpreter:isRunning() then
    return false
  end
  return true
end

return player