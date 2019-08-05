local Command = require("prototypes.command")

local command = Command:extend()

function command:create(target, pos)
  local result = self:extend()
  result._pos = pos
  result._target = target
  return result
end

function command:start()
  self._target:moveTo(unpack(self._pos))
end

return command
