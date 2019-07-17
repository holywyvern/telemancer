local Command = require("prototypes.command")

local command = Command:extend()

function command:create(target, index, direction)
  direction = direction or target._d
  local result = self:extend()
  return result
end

return command
