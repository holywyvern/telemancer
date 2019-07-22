local audio = require("managers.audio")
local game = require("managers.game")

local controls = require("config.controls")
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
  self._font = love.graphics.newFont("fonts/game.ttf", 16)
  local car = love.graphics.newImage("images/intro/car.png")
  self._car = {
    x = 0,
    y = engine.game.height - 8,
    img = car,
    bodyQuad = love.graphics.newQuad(0, 0, 64, 32, car:getDimensions()),
    wheelQuad = love.graphics.newQuad(64, 16, 16, 16, car:getDimensions())
  }
  self._sky = love.graphics.newImage("images/intro/sky.png")
  self._clouds = love.graphics.newImage("images/intro/clouds.png")
  self._buildingsBack = love.graphics.newImage("images/intro/buildings_back.png")
  self._buildingsFront = love.graphics.newImage("images/intro/buildings_front.png")
  audio:playBgmOnce('intro.mp3')
  local eye = love.graphics.newImage("images/intro/eye.png")
  local w, h = eye:getDimensions()
  self._logo = {
    eye = eye,
    back = love.graphics.newImage("images/intro/logo_back.png"),
    front = love.graphics.newImage("images/intro/logo_front.png"),
    opacity = 0,
    frame = 0,
    time = 0,
    w = w / 4,
    h = h
  }
  self._logo.eyeQuad = love.graphics.newQuad(0, 0, w / 4, h, w, h)
end

function scene:update(dt)
  self._t = self._t + dt
  self['update' .. self._state](self, dt)
  self._bgSpeed = 1 + self._speed * dt
  self._rSpeed = self._rSpeed + self._accel * dt / 4
  self._r = self._r - self._rSpeed * dt
  self._ox = self._ox + 4 * self._speed * dt
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
  elseif self._t >= 77 then
    self._accel = 16
    self._state = 'ShowTitle'
  else
    self._accel = 0
  end  
end

function scene:updateShowTitle(dt)
  if self._logo.opacity < 1 then
    self._logo.opacity = self._logo.opacity + dt
  else
    self._state = 'OpenEye'
  end
end

function scene:updateOpenEye(dt)
  local frame = self._logo.frame
  if frame < 3 then
    local t = self._logo.time + dt
    while t > 0.15 and frame < 3 do
      t = t - 0.15
      frame = frame + 1
    end
    local w, h = self._logo.w, self._logo.h
    self._logo.frame = frame
    self._logo.time = t
    self._logo.eyeQuad:setViewport(frame * w, 0, w, h)
  else
    self._push = true
    self._state = 'PushButton'
  end
end

function scene:updatePushButton(dt)
end


function scene:leave(next, ...)
	-- destroy entities and cleanup resources
end

function scene:draw()
  love.graphics.push()
    self:drawBackground()
    self:drawCar()
    self:drawLogo()
    self:drawPush()
  love.graphics.pop()
end

function scene:drawBackground()
  self:drawSky()
  self:drawClouds()
  self:drawBuildings()
  self:drawStreet()
end

function scene:drawSky()
  love.graphics.draw(self._sky)
end

function scene:drawClouds()
  local w = self._clouds:getDimensions()
  local ox = (self._ox * 0.01) % w
  love.graphics.draw(self._clouds, - ox)
  love.graphics.draw(self._clouds, w - ox)
end

function scene:drawBuildings()
  local w = self._buildingsBack:getDimensions()
  local ox = (self._ox * 0.3) % w
  love.graphics.draw(self._buildingsBack, - ox)
  love.graphics.draw(self._buildingsBack, w - ox)
  w = self._buildingsFront:getDimensions()
  ox = (self._ox * 0.5) % w
  love.graphics.draw(self._buildingsFront, - ox)
  love.graphics.draw(self._buildingsFront, w - ox)
end

function scene:drawStreet()
  love.graphics.setColor(1, 1, 1, 1)
  local ox = self._ox
  local speed = self._bgSpeed
  love.graphics.draw(self._street, -(ox % 32), engine.game.height - self._street:getHeight())  
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

function scene:drawLogo()
  love.graphics.setColor(1, 1, 1, self._logo.opacity)
  local offset = self._logo.frame
  local x, y = (engine.game.width - self._logo.w) / 2, 64
  love.graphics.draw(self._logo.eye, self._logo.eyeQuad, x, y)
  x, y = 0, 8
  love.graphics.draw(self._logo.back, x + offset, y + offset)
  love.graphics.draw(self._logo.front, x, y)
  love.graphics.setColor(1, 1, 1, 1)
end

function scene:drawPush()
  if not self._push then
    return
  end
  local dev = controls:getActiveDevice()
  local txt = "Press 'Interact'"
  if dev == "joy" then
    txt = "Press 'A'"
  elseif "kbm" then
    txt = "Press 'X'"
  end
  local tw = self._font:getWidth(txt) + 1
  local x, y = math.floor((engine.game.width - tw) / 2), 120
  local a = math.abs(math.sin(self._t * 1.3))
  love.graphics.setColor(0.3, 0.3, 0.3, a)
  love.graphics.print(txt, x + 1, y + 1)
  love.graphics.setColor(1, 1, 1, a)
  love.graphics.print(txt, x, y)
  love.graphics.setColor(1, 1, 1, 1)
end

return scene
