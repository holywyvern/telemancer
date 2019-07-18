local character = require("prototypes.character")

local event = character:extend()

function event:isAt(x, y)
  return x == self._x and y == self._y
end

function event:call()
end

return event
