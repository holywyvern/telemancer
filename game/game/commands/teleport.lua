local Command = require("prototypes.command")

local command = Command:extend()

function command:create(destination)
  local result = self:extend()
  return result
end

return command
