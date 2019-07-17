local Command = require("prototypes.command")

local command = Command:extend()

function command:create(time)
  local result = self:extend()
  return result
end

return command
