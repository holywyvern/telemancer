local base = require("prototypes.scene")
local engine = require("config.engine")

local audio = require("managers.audio")
local manager = require("managers.scene")

local w, h = engine.game.width, engine.game.height

local scene = base:extend()

local PI = 3.1415
local TAU = 2 * PI

function scene:enter()
  self._state = 'Start'
  self._img = love.graphics.newImage("images/slides/case1.png")
  iw, ih = self._img:getDimensions()
  self._backQuad = love.graphics.newQuad(0, 0, w, h, iw, ih)
  self._skyQuad = love.graphics.newQuad(0, h, w, h, iw, ih)
  self._horseQuad = love.graphics.newQuad(48, h * 2, 128, 144, iw, ih)
  self._childQuad = love.graphics.newQuad(0, h * 2, 48, 77, iw, ih)
  self._clownQuad = love.graphics.newQuad(176, h * 2, 80, 96, iw, ih)
  self._faceQuad = love.graphics.newQuad(w, 0, w, h, iw, ih)
  self._faceQuad2 = love.graphics.newQuad(w, h, w, h, iw, ih)
  self._postQuad = love.graphics.newQuad(0, h * 3, 16, h, iw, ih)
  self._t = 0
  self._clownX = 0
  self._faceOpacity = 0
  self._faceOpacity2 = 0
  self._scaryTimes = 0
  self._childY = 24
  audio:playBgm("case1/peace.mp3")
end

function scene:update(dt)
  self._t = self._t + dt
  self['update' .. self._state](self, dt)
end

function scene:updateStart(dt)
  if self._t > 2 and self._clownX < 96 then
    self._clownX = self._clownX + 24 * dt
  elseif self._t > 8 then
    self._state = 'Face1'
  end  
end

function scene:updateFace1(dt)
  if self._faceOpacity < 1 then
    self._faceOpacity = self._faceOpacity + dt
    if self._oneLoop then
      self._faceOpacity2 = 1 - self._faceOpacity
    end
  else
    self._oneLoop = true
    self._state = 'Face2'
  end
end

function scene:updateFace2(dt)
  if self._faceOpacity2 < 1 then
    self._faceOpacity2 = self._faceOpacity2 + dt
    self._faceOpacity = 1 - self._faceOpacity2
  elseif self._t > 15 then
    audio:playBgm("case1/circus.mp3")
    self._state = 'Jumpscare'
  else
    self._state = 'Face1'
  end  
end

function scene:updateJumpscare(dt)
  if self._scaryTimes < 3 then
    if not self._scary then
      self._scary = true
      self._scaryDt = 0.3
    else
      if self._scaryDt > 0 then
        self._scaryDt = self._scaryDt - dt
      else
        self._scary = false
        self._scaryTimes = self._scaryTimes + 1
      end
    end
  else
    self._childY = 64
    self._scary = true
    self._state = 'Falling'
    self._childQuad:setViewport(16, h * 3, 80, 64)
  end
  self:updateFace2Quad()
end

function scene:updateFace2Quad()
  local i = 1
  if self._scary then
    i = 2
  end
  self._faceQuad2:setViewport(w, h * i, w, h)
end

function scene:updateFalling(dt)
  if self._faceOpacity2 > 0 then
    self._faceOpacity2 = self._faceOpacity2 - dt
  end
  if self._childY < h then
    self._childY = self._childY + dt * 32
  else
    manager:switch("map")
  end
end

function scene:draw()
  local gb = 1
  if self._scary then
    gb = 0.5
  end  
  love.graphics.setColor(1, gb, gb, 1)
  self:drawCarrouselBack()
  self:drawPosts()
  self:drawHorses()
  self:drawChild()
  self:drawClown()
  self:drawFace()
end

function scene:drawCarrouselBack()
  local ox = (self._t * 16) % w
  if self._scary then ox = 0 end
  love.graphics.draw(self._img, self._backQuad, -ox)
  love.graphics.draw(self._img, self._backQuad, w - ox)
  love.graphics.draw(self._img, self._skyQuad)
end

function scene:drawPosts()
  love.graphics.draw(self._img, self._postQuad, 96, 0)
end

function scene:drawHorses()
  local oy = math.cos(PI * self._t) * 16
  if self._scary then oy = 0 end
  love.graphics.draw(self._img, self._horseQuad, 32, 16 - oy)
  oy = math.sin(PI * self._t) * 16
  if self._scary then oy = 0 end
  love.graphics.draw(self._img, self._horseQuad, 16 * 12, 16 - oy)
end

function scene:drawChild()
  local oy = math.cos(PI * self._t) * 16
  if self._scary then oy = 0 end
  love.graphics.draw(self._img, self._childQuad, 80, self._childY - oy)
end

function scene:drawClown()
  love.graphics.draw(self._img, self._clownQuad, self._clownX - 80, h - 96)
end

function scene:drawFace()
  love.graphics.setColor(1, 1, 1, self._faceOpacity)
  love.graphics.draw(self._img, self._faceQuad)
  local gb = 1
  if self._scary then
    gb = 0.5
  end
  love.graphics.setColor(1, gb, gb, self._faceOpacity2)
  love.graphics.draw(self._img, self._faceQuad2)  
end

return scene
