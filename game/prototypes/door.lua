local interpreter = require("game.interpreter")

local event = require("prototypes.event")

local door = event:extend()

local player

function door:create(name, image, position, destination)
  local newDoor = self:extend()
  newDoor._name = name
  newDoor._z = 1
  newDoor:moveTo(unpack(position))
  newDoor._img = love.graphics.newImage('images/doors/' .. image .. '.png')
  newDoor._destination = destination
  newDoor._interactive = true
  newDoor._solid = true
  return newDoor
end

function door:call()
  player = player or require("game.player")
  interpreter:addCommand("start")
    interpreter:addCommand("changeSolid", self, false)
    interpreter:addCommand("pose", self, 1)
    interpreter:addCommand("wait", 0.4)
    interpreter:addCommand("pose", self, 2)
    interpreter:addCommand("wait", 0.4)
    interpreter:addCommand("move", player, 8, true)
    interpreter:addCommand("pose", self, 1)
    interpreter:addCommand("wait", 0.4)
    interpreter:addCommand("pose", self, 0)
    interpreter:addCommand("wait", 0.4)
    interpreter:addCommand("teleport", self._destination)
    interpreter:addCommand("changeSolid", self, true)
  interpreter:addCommand("stop")
end

function door:updateRect()
  if not self._img then
    return
  end
  if self._img ~= self._oldImg and self._rect then
    self._rect:release()
    self._rect = nil
  end
  local wi, hi = self._img:getDimensions()
  local w = wi / 3
  local h = hi
  local i = self:_getPose()
  local j = 0
  if not self._rect then
    self._rect = love.graphics.newQuad(i * w, j * h, w, h, wi, hi)
  else
    self._rect:setViewport(i * w, j * h, w, h)
  end
end

function door:hasAnimation()
  return false
end

return door
