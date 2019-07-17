local Command = require("prototypes.command")

local command = Command:extend()

function command:create(target, direction, wait)
  local result = self:extend()
  result._target = target
  result._direction = direction
  result._wait = wait
  return result
end

function command:start()
  self._target:move(self._direction)
end

function command:isRunning()
  return self._wait and self._target:isMoving()
end

return command
