local interpreter = require("game.interpreter")

local event = require("prototypes.event")

local backDoor = event:extend()

local player

function backDoor:create(name, position, destination)
  local newDoor = self:extend()
  newDoor:moveTo(unpack(position))
  newDoor._name = name
  newDoor._destination = destination
  newDoor._solid = true
  newDoor._tactile = true
  return newDoor
end

function backDoor:call()
  interpreter:startWork()
    interpreter:addCommand("teleport", self._destination)
    interpreter:addCommand("wait", 0.2)
  interpreter:addCommand("stop")
end

return backDoor