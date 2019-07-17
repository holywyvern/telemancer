local Command = require("prototypes.command")

local command = Command:extend()

function command:create(target, value)
  local result = self:extend()
  result._target = target
  result._value = value
  return result
end

function command:start()
  self._target._solid = self._value
end

return command
