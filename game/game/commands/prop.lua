local Command = require("prototypes.command")

local command = Command:extend()

function command:create(target, name, value)
  local result = self:extend()
  result._target = target
  result._name = name
  result._value = value
  return result  
end

function command:start()
  self._target[self._name] = self._value
end

return command