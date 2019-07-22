local audio = require("managers.audio")
local game = require("managers.game")

local engine = require("config.engine")

local scene = {}

local PI = 3.1415
local TAU = 2 * PI

function scene:enter(previous, ...)
  self._ox = 0
  self._street = love.graphics.newImage("images/intro/street.png")
  self._speed = 1
  self._t = 0
  self._state = 'Start'
  self._bgSpeed = 1
  self._accel = 0
  self._r = 0
  self._rSpeed = PI
  local car = love.graphics.newImage("images/intro/car.png")
  self._car = {
    x = 0,
    y = engine.game.height - 8,
    img = car,
    bodyQuad = love.graphics.newQuad(0, 0, 64, 32, car:getDimensions()),
    wheelQuad = love.graphics.newQuad(64, 16, 16, 16, car:getDimensions())
  }
  audio:playBgm('intro.mp3')
end

function scene:update(dt)
  self._ox = self._ox + 32 * dt
  self._t = self._t + dt
  self['update' .. self._state](self, dt)
  self._bgSpeed = 1 + self._speed * dt
  self._rSpeed = self._rSpeed + self._accel * dt / 4
  self._r = self._r - self._rSpeed * dt
end

function scene:updateStart(dt)
  if self._t >= 23 then
    self._accel = 16
    self._state = 'ShowCar'
  end
end

function scene:updateShowCar(dt)
  if self._car.x < 16 * 5 then
    self._speed = self._speed + self._accel * dt
    self._car.x = self._car.x + self._speed * dt
  elseif self._t >= 41 then
    self._accel = 16
    self._state = 'GoingMiddle'
  else
    self._accel = 0
  end
end

function scene:updateGoingMiddle(dt)
  if self._car.x < 16 * 9 then
    self._speed = self._speed + self._accel * dt
    self._car.x = self._car.x + self._speed * dt
  elseif self._t >= 60 then
    self._accel = 16
    self._state = 'GoingOut'
  else
    self._accel = 0
  end
end

function scene:updateGoingOut(dt)
  if self._car.x < engine.game.width + 64 then
    self._speed = self._speed + self._accel * dt
    self._car.x = self._car.x + self._speed * dt
  elseif self._t >= 78 then
    self._accel = 16
    self._state = 'ShowTitle'
  else
    self._accel = 0
  end  
end

function scene:updateShowTitle(dt)
end

function scene:leave(next, ...)
	-- destroy entities and cleanup resources
end

function scene:draw()
  love.graphics.push()
    self:drawBackground()
    self:drawCar()
  love.graphics.pop()
end

function scene:drawBackground()
  self:drawStreet()
end

function scene:drawStreet()
  love.graphics.setColor(1, 1, 1, 1)
  local ox = self._ox
  local speed = self._bgSpeed
  love.graphics.draw(self._street, -((ox * speed) % 32), engine.game.height - self._street:getHeight())  
end

function scene:drawCar()
  local _, _, w, h = self._car.bodyQuad:getViewport()
  local x = self._car.x - w
  local y = self._car.y - h
  self:drawCarBody(x, y)
  self:drawCarBackWheel(x, y)
  self:drawCarFrontWheel(x, y)
end

function scene:drawCarBody(x, y)
  local impulse = math.sin(self._t * 10)
  love.graphics.draw(self._car.img, self._car.bodyQuad, x, y - impulse)
end

function scene:drawCarBackWheel(x, y)
  self:drawCarWheel(x + 1, y + 8)
end

function scene:drawCarFrontWheel(x, y)
  self:drawCarWheel(x + 28, y + 8)
end


function scene:drawCarWheel(x, y)
  local _, _, w, h = self._car.wheelQuad:getViewport()
  local ox, oy = w / 2, h / 2
  x = x + w
  y = y + h
  local r = self._r
  love.graphics.draw(self._car.img, self._car.wheelQuad, x, y, r, 1, 1, ox, oy)
end

return scene
