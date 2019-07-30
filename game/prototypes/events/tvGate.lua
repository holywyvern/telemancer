local interpreter = require("game.interpreter")
local player

local cache = require("managers.cache")

local event = require("prototypes.event")

local tv = require("prototypes.transitions.tv")

local tvGate = event:extend()

function tvGate:create(name, position, destination, options)
  local gate = self:extend()
  gate._name = name
  gate:moveTo(unpack(position))
  gate._imgName = 'tv'
  gate._img = cache:image('characters/tv')  
  gate._destination = destination
  gate._interactive = true
  gate._solid = true
  gate._opts = options or {}
  if gate._opts.off then
    gate._d = 8
  elseif gate._opts.fuzzy then
    gate._d = 6
    gate._standingAnimation = true
  else
    gate._d = 4
    gate._standingAnimation = true
  end
  return gate
end

function tvGate:call()
  if self._opts.fuzzy or self._opts.off then return end
  player = player or require("game.player")
  interpreter:startWork()
  interpreter:addCommand("teleport", self._destination, tv:create())
  self:callExtraCommands()
  interpreter:addCommand("stop")
end

return tvGate
