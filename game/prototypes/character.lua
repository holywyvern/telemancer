local character = { 
  _x = 0,
  _y = 0,
  _realX = 0,
  _realY = 0,
  _z = 0,
  _d = 0,
  _img = nil,
  _animDelay = 0,
  _speed = 3,
  _frame = 0,
  _pattern = 0,
  _opacity = 1,
  _directFrame = false,
  _i = 0,
  _j = 0,
  _priority = 0,
  _standingAnimation = false
}

local map

function character:update(dt)
  self:updateAnimation(dt)
  self:updateMovement(dt)
  self:updateRect()
end

function character:setImage(name)
  if name then
    self._img = love.graphics.newImage("images/characters/" .. name .. ".png")
  else
    self._img = nil
  end
  self._imgName = name
end

function character:updateAnimation(dt)
  if self:hasAnimation() then
    self._animDelay = self._animDelay - dt
    while self._animDelay < 0 do
      self._animDelay = self._animDelay + 0.5 / self._speed
      self._pattern = (self._pattern + 1) % 4
      if self:isMoving() then
        self:playStep()
      end
    end
  elseif self._clearsAnimation then
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
  map = map or require("game.map")
  local tx, ty = map:getTileSize()
  local mx = self:_calculateMoveSpeed(dt, tx)
  local my = self:_calculateMoveSpeed(dt, ty)
  self._realX = self:_updateMovementAxis(mx, self._x * tx, self._realX)
  self._realY = self:_updateMovementAxis(my, self._y * ty, self._realY)
end

function character:_updateMovementAxis(ms, target, current)
  local unit = 0
  if  target < current then
    unit = -1
  elseif target > current then
    unit = 1
  end
  return self:_adjustPosition(current, target, unit * ms)
end

function character:_adjustPosition(current, target, distance)
  if math.abs(current - target) < math.abs(distance) then
    return target
  end
  return current + distance
end

function character:_calculateMoveSpeed(dt, tileSize)
  return self._speed * tileSize * dt
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
  local wi, hi = self._img:getDimensions()
  local w = wi / self:getFrames()
  local h = hi / self:getPoses()
  local i = self:_getPose()
  local d = self:_getDirection()
  local j = (d - 2) / 2
  if not self._rect then
    self._rect = love.graphics.newQuad(i * w, j * h, w, h, wi, hi)
    j = ((10 - d) - 2) / 2
    self._reflectionRect = love.graphics.newQuad(i * w, j * h, w, h, wi, hi)
  else
    self._rect:setViewport(i * w, j * h, w, h)
    j = ((10 - d) - 2) / 2
    self._reflectionRect:setViewport(i * w, j * h, w, h)
  end
end

function character:_getDirection()
  if self._directFrame then
    return self._j * 2 + 2
  end
  return self._d
end

function character:_getPose()
  if self._directFrame then
    return self._i
  end  
  if self._pattern == 0 then
    return 1
  elseif self._pattern == 1 then
    return 0
  elseif self._pattern == 2 then
    return 1
  else
    return 2
  end
  return 1
end

function character:getFrames()
  return 3
end

function character:getPoses()
  return 4
end

function character:face(direction)
  if not self:canFace(direction) then
    return
  end
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

function character:getPositionAdjust(direction)
  direction = direction or self._d
  if     direction == 2 then
    return self._x, self._y + 1
  elseif direction == 4 then
    return self._x - 1, self._y
  elseif direction == 6 then
    return self._x + 1, self._y
  elseif direction == 8 then
    return self._x, self._y - 1
  end
  return self._x, self._y
end

function character:move(direction)
  if self._d ~= direction then
    self:face(direction)
  end
  if not self:canMove(direction) then
    return
  end
  if     direction == 2 then
    self._y = self._y + 1
  elseif direction == 4 then
    self._x = self._x - 1
  elseif direction == 6 then
    self._x = self._x + 1
  elseif direction == 8 then
    self._y = self._y - 1
  end
end

function character:canMove(direction)
  map = map or require("game.map")
  return map:isPassable(self._x, self._y, direction, self._solid)
end

function character:canFace(direction)
  return not self._fixDirection
end

function character:draw()
  if not self._img or not self._rect then
    return
  end
  local x, y, w, h = self._rect:getViewport()
  love.graphics.setColor(1, 1, 1, self._opacity)
  love.graphics.draw(self._img, self._rect, self._realX - w / 2, self._realY, 0, 1, 1, w / 2, h )
  love.graphics.setColor(1, 1, 1, 1)
end

function character:drawReflection(offset)
  if not self._img or not self._reflectionRect then
    return
  end
  love.graphics.push()
    love.graphics.setColor(1, 1, 1, self._opacity * 0.6)
    local x, y, w, h = self._rect:getViewport()
    love.graphics.draw(self._img, self._reflectionRect, self._realX - w / 2, self._realY - offset, 0, -1, 1, w / 2, h )
    love.graphics.setColor(1, 1, 1, 1)
  love.graphics.pop()
end

function character:moveTo(x, y, d)
  d = d or self._d
  map = map or require("game.map")
  local tx, ty = map:getTileSize()
  self._x = x
  self._y = y
  self._d = d
  self._realX = x * tx
  self._realY = y * ty
end

function character:isMoving()
  map = map or require("game.map")
  local tx, ty = map:getTileSize()  
  local xAdjust = self._x * tx ~= self._realX
  local yAdjust = self._y * ty ~= self._realY
  return xAdjust or yAdjust
end

function character:extend()
  return setmetatable({}, { __index = self })
end

function character:getDimensions()
  if not self._img then
    return 0, 0
  end
  local x, y = self._img:getDimensions()
  return x / self:getFrames(), y / self:getPoses()
end

function character:playStep()
end

function character:rotate()
  if     self._d == 2 then
    self:face(6)
  elseif self._d == 4 then
    self:face(2)
  elseif self._d == 6 then
    self:face(8)
  elseif self._d == 8 then
    self:face(4)
  end
end

function character:isLookingTo(char, max)
  local d = math.abs(self._x - char._x) + math.abs(self._y - char._y)
  if d > max then
    return false
  end
  if self._d == 2 or self._d == 8 then
    if self._x ~= char._x then
      return false
    end
  end
  if self._d == 4 or self._d == 6 then
    if self._y ~= char._y then
      return false
    end
  end
  if self._d == 2 and self._y < char._y then
    return self:hasDirectSight(self._x, self._x, self._y, char._y)
  end
  if self._d == 8 and self._y > char._y then
    return self:hasDirectSight(self._x, self._x, char._y, self._y)
  end
  if self._d == 6 and self._x < char._x then
    return self:hasDirectSight(self._x, char._x, self._y, self._y)
  end
  if self._d == 4 and self._x > char._x then
    return self:hasDirectSight(char._x, self._x, self._y, self._y)
  end
end

function character:realDistanceFrom(char)
  local x = math.abs(self._realX - char._realX)
  local y = math.abs(self._realY - char._realY)
  return x + y
end

function character:hasDirectSight(x1, x2, y1, y2)
  for x=x1,x2,1 do
    for y=y1,y2,1 do
      map = map or require("game.map")
      if (x == x1 and y == y1) or (x == x2 and y == y2) then
        if not map:isPassable(x, y, self._d, false) then
          return false
        end
      elseif not map:isPassable(x, y, self._d, self._solid) then
        return false
      end
    end
  end
  return true
end

return character
