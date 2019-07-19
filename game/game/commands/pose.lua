local Command = require("prototypes.command")

local command = Command:extend()

function command:create(target, index, direction)
  local result = self:extend()
  result._direction = direction or target._d
  result._pattern = index
  result._target = target
  return result
end

function command:start()
  self._target._pattern = self._pattern
  self._target._d = self._direction
end

return command
