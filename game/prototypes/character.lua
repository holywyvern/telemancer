local character = { _x = 0, _y = 0, _d = 0, _img = nil, _animDelay = 0, _frame = 0 }

function character:update(dt)
end

function character:draw(dt)
end

function character:setup(x, y, d)
  self._x = x
  self._y = y
  self._d = d
  self._realX = x * 16
  self._realY = y * 16
end

function character:isMoving()
  self._x ~= self._realX or self._y ~= self._realY
end

return character
