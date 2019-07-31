local Command = require("prototypes.command")

local command = Command:extend()

function command:create(target, direction)
  local result = self:extend()
  result._target = target
  result._direction = direction
  return result
end

function command:start()
  self._target:face(self._direction)
end

return command
