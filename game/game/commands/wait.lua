local Command = require("prototypes.command")

local command = Command:extend()

function command:create(time)
  local result = self:extend()
  self._time = time
  return result
end

function command:isRunning()
  return self._time > 0
end

function command:update(dt)
  self._time = self._time - dt
end

return command
