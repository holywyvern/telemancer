local Command = require("prototypes.command")

local command = Command:extend()

function command:create(event, direction, wait)
  local result = self:extend()
  return result
end

return command
