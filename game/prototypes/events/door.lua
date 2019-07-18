local interpreter = require("game.interpreter")

local event = require("prototypes.event")

local door = event:extend()

local player

function door:create(name, image, position, destination)
  local newDoor = self:extend()
  newDoor._d = 2
  newDoor._name = name
  newDoor._z = 1
  newDoor:moveTo(unpack(position))
  newDoor._img = love.graphics.newImage('images/doors/' .. image .. '.png')
  newDoor._destination = destination
  newDoor._interactive = true
  newDoor._solid = true
  newDoor._tactile = true
  return newDoor
end

function door:call()
  player = player or require("game.player")
  interpreter:startWork()
    interpreter:addCommand("changeSolid", self, false)
    interpreter:addCommand("pose", self, 1)
    interpreter:addCommand("wait", 0.1)
    interpreter:addCommand("pose", self, 2)
    interpreter:addCommand("wait", 0.1)
    interpreter:addCommand("move", player, 8, true)
    interpreter:addCommand("pose", self, 1)
    interpreter:addCommand("wait", 0.1)
    interpreter:addCommand("pose", self, 0)
    interpreter:addCommand("wait", 0.1)
    interpreter:addCommand("teleport", self._destination)
    interpreter:addCommand("changeSolid", self, true)
  interpreter:addCommand("stop")
end

function door:getFrames()
  return 3
end

function door:getPoses()
  return 1
end

function door:_getPose()
  return self._pattern
end

return door
