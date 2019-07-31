local Command = require("prototypes.command")

local command = Command:extend()

function command:create(target, values)
  local result = self:extend()
  result._t = target
  result._v = values
  return result  
end

function command:start()
  for k, v in pairs(self._v or {}) do
    self._t[k] = v
  end
end

return command