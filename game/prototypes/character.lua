local character = { 
  _x = 0,
  _y = 0,
  _d = 0,
  _img = nil,
  _animDelay = 0,
  _speed = 3,
  _frame = 0,
  _pattern = 0,
  _standingAnimation = false
}

local TILE_SIZE = 16

function character:update(dt)
  self:updateAnimation(dt)
  self:updateMovement(dt)
  self:updateRect()
end

function character:updateAnimation(dt)
  if self:hasAnimation() then
    self._animDelay = self._animDelay - dt
    while self._animDelay < 0 do
      self._animDelay = self._animDelay + self._speed * 2
      self._pattern = (self._pattern + 1) % 4
    end
  else
    self._pattern = 0
  end
end

function character:hasAnimation()
  return self:isMoving() or self._standingAnimation
end

function character:updateMovement(dt)
  if not self:isMoving() then
    return
  end
  local ms = self:_calculateMoveSpeed(dt)  
  self._realX = self:_updateMovementAxis(dt, ms, self._x * TILE_SIZE, self._realX)
  self._realY = self:_updateMovementAxis(dt, ms, self._y * TILE_SIZE, self._realY)
end

function character:_updateMovementAxis(dt, ms, target, current)
  local unit = 0
  if  target < current then
    unit = -1
  elseif target > current then
    unit = 1
  end
  return self:_adjustPosition(current, ax, math.floor(unit * ms))
end

function character:_adjustPosition(current, target, distance)
  if math.abs(current - target) < math.abs(distance) then
    return target
  end
  return current + distance
end

function character:_calculateMoveSpeed(dt)
  return self._speed * dt
end

function character:_calculateAnimationDelay()
  return self._speed
end

function character:updateRect()
  if not self._img then
    return
  end
  if self._img ~= self._oldImg and self._rect then
    self._rect:release()
    self._rect = nil
  end
  local w, h = self._img:getDimensions()
  w = w / 3
  h = h / 4
  local i = self:_getPose()
  local j = (self._d - 2) / 2
  if not self._rect then
    self._rect = love.graphics.newQuad(i * w, j * h, w, h)
  else
    self._rect:setViewport(i * w, j * h, w, h)
  end
end

function character:_getPose()
  if i == 0 then
    return 1
  elseif i == 1 then
    return 0
  elseif i == 2 then
    return 1
  else
    return 2
  end
  return 1
end

function character:face(direction)
  if     direction == 2 then
    self._d = direction
  elseif direction == 4 then
    self._d = direction
  elseif direction == 6 then
    self._d = direction
  elseif direction == 8 then
    self._d = direction
  end
end

function character:move(direction)
  if     direction == 2 then
  elseif direction == 4 then
  elseif direction == 6 then
  elseif direction == 8 then
  end
end

function character:draw()
  if not self._img or not self._rect then
    return
  end
  local x, y, w, h = self._rect:getViewport()
  love.graphics.draw(self._img, self._rect, self._realX, self._realY, 0, 1, 1, w / 2, h )
end

function character:setup(x, y, d)
  self._x = x
  self._y = y
  self._d = d
  self._realX = x * TILE_SIZE
  self._realY = y * TILE_SIZE
end

function character:isMoving()
  local xAdjust = self._x * TILE_SIZE ~= self._realX
  local yAdjust = self._y * TILE_SIZE ~= self._realY
  return xAdjust or yAdjust
end

function character:extend()
  return setmetatable({}, { __index = self })
end

return character
