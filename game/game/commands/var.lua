local Command = require("prototypes.command")

local game = require("managers.game")

local command = Command:extend()

function command:create(k, v)
  local result = self:extend()
  result._k = k
  result._v = v
  return result
end

function command:start()
  game:variable(self._k, self._v)
end

return command
