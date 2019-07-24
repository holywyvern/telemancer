local Command = require("prototypes.command")

local save = require("managers.save")

local command = Command:extend()

function command:create(target, value)
  local result = self:extend()
  return result
end

function command:start()
  save:dump()
end

return command