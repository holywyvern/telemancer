local character = require("prototypes.character")

local event = character:extend()

function event:isAt(x, y)
  return x == self._x and y == self._y
end

function event:call()
  if not self._called then
    self._called = true
    self:callOnce()
  end
end

return event
