local Command = require("prototypes.command")

local command = Command:extend()

function command:create(target)
  local result = self:extend()
  result._target = target
  return result
end

function command:start()
  self._target:call()
end

return command