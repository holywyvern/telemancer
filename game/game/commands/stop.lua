local Command = require("prototypes.command")

local command = Command:extend()

function command:create()
  local result = self:extend()
  return result
end

return command
