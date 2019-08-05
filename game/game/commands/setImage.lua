local Command = require("prototypes.command")

local command = Command:extend()

function command:create(target, img)
  local result = self:extend()
  result._img = img
  result._target = target
  return result
end

function command:start()
  self._target:setImage(self._img)
end

return command
