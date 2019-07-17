local Command = require("prototypes.command")

local command = Command:extend()

function command:create()
  local result = self:extend()
  return result
end

function command:start()
  local interpreter = require("game.interpreter")
  interpreter:endWork()
end

return command
