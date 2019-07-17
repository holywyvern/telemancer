local interpreter = require("game.interpreter")

local event = require("prototypes.event")

local door = event:extend()

local player

function door:create(name, image, destination)
  local newDoor = self:extend()
  newDoor._name = name
  newDoor._img = love.graphics.newImage('images/doors/' .. image .. '.png')
  newDoor._destination = destination
  newDoor._interactive = true
  return newDoor
end

function door:call()
  player = player or require("game.player")
  interpreter:addCommand("start")
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
  interpreter:addCommand("stop")
end

return door
