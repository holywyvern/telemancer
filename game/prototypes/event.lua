local character = require("prototypes.character")

local interpreter = require("game.interpreter")

local event = character:extend()

function event:create(name, img, position, props)
  local result = self:extend()
  result._name = name
  result._imgName = img
  result._img = love.graphics.newImage("images/characters/" .. img)
  result:moveTo(unpack(position))
  for k, v in pairs(props or {}) do
    result[k] = v
  end
  return result
end

function event:isAt(x, y)
  return x == self._x and y == self._y
end

function event:call()
end

function event:addCommand(...)
  self._extraCommands = self._extraCommands or {}
  self._extraCommands[#self._extraCommands + 1] = {...}
  return self
end

function event:callExtraCommands()
  for _, command in ipairs(self._extraCommands or {}) do
    interpreter:addCommand(unpack(command))
  end
end

return event
