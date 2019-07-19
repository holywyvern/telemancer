local transition = require("prototypes.transition")

local player = require("game.player")

local engine = require("config.engine")

local tv = transition:extend()

local back

function tv:create()
  back = back or love.graphics.newImage("images/transitions/tv_back.png")
  local this = tv:extend()
  this._r = 0
  this._t = 0.5
  this._state = 'Opening'
  this._applyStencil = function()
    this:applyStencil()
  end
  return this
end

function tv:update(dt)
  local func = self["update" .. self._state]
  if func then
    func(self, dt)
  end
end

function tv:updateOpening(dt)
  if self:isOpening() then
    self._r = self._r + 32 * dt
  else
    self._state = 'Transition'
  end
end

function tv:updateTransition(dt)
  self._t = self._t - dt
  if self._t <= 0 then
    self._state = 'Closing'
  end
end

function tv:updateClosing(dt)
  if self._r <= 0 then
    self._r = 0
    self._state = 'Finished'
    self._performTransition()
  else
    self._r = self._r - 32 * dt
  end
end

function tv:isOpening()
  local w, h = player:getDimensions()
  return self._r < w or self._r < h
end

function tv:isRunning()
  return self._state ~= 'Finished'
end

function tv:draw()
  local func = self["draw" .. self._state]
  if func then
    func(self)
  end
end

function tv:drawOpening()
  love.graphics.push()
    love.graphics.stencil(self._applyStencil, "replace", 1)
      love.graphics.setStencilTest("greater", 0)
      love.graphics.draw(back)
    love.graphics.setStencilTest()
  love.graphics.pop()
  player:draw()
end

function tv:drawTransition()
  love.graphics.push()
    love.graphics.stencil(self._applyStencil, "replace", 1)
      love.graphics.setStencilTest("greater", 0)
      love.graphics.draw(back)
      player:draw()
    love.graphics.setStencilTest()
  love.graphics.pop()
end

tv.drawClosing = tv.drawTransition

function tv:applyStencil()
  love.graphics.setColor(1, 1, 1, 1)
  local w, h = player:getDimensions()
  local x, y = player._realX - w / 2, player._realY - h / 2
  love.graphics.circle("fill", x, y, self._r)
end

return tv
