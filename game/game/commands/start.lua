local Command = require("prototypes.command")

local command = Command:extend()

function command:create()
  local result = self:extend()
  return result
end

function command:update(dt)
  local interpreter = require("game.interpreter")
  interpreter:startWork()
end

return command
