local interpreter = require("game.interpreter")
local player

local event = require("prototypes.event")

local tv = require("prototypes.transitions.tv")

local tvGate = event:extend()

function tvGate:create(name, position, destination)
  local gate = self:extend()
  gate._name = name
  gate:moveTo(unpack(position))
  gate._destination = destination
  gate._interactive = true
  gate._solid = true
  return gate
end

function tvGate:call()
  player = player or require("game.player")
  interpreter:startWork()
  interpreter:addCommand("teleport", self._destination, tv:create())
  interpreter:addCommand("stop")
end

return tvGate
