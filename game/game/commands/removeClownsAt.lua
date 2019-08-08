local Command = require("prototypes.command")

local map = require("game.map")

local command = Command:extend()

function command:create(x, y)
  local remove = self:extend()
  remove._x = x
  remove._y = y
  return remove
end

function command:start()
  for _, event in ipairs(map:getEventsAt(self._x, self._y)) do
    if event.onCatch then
      event:onCatch()
    end
  end
end

return command