local transition = require("prototypes.transition")

local engine = require("config.engine")

local fade = transition:extend()

function fade:create(t)
  local effect = self:extend()
  effect._t = t
  effect._state = 'In'
  effect._alpha = 0
  return effect
end

function fade:start(ss, performTransition)
  self._ss = ss
  self._time = self._t
  self._performTransition = performTransition
end

function fade:update(dt)
  self._time = self._time - dt
  self["update" .. self._state](self, dt)
end

function fade:updateIn(dt)
  if self._time < 0 then
    self._time = self._time + self._t
    self._performTransition()
    self._state = 'Out'
    self._alpha = 1
  else
    self._alpha = 1 - (self._time / self._t)
  end
end

function fade:updateOut(dt)
  if self._time < 0 then
    self._state = 'Done'
    self._done = true
    self._alpha = 0
  else
    self._alpha = self._time / self._t
  end
end

function fade:updateDone()
end

function fade:isRunning()
  return not self._done
end

function fade:draw()
  love.graphics.push()    
    love.graphics.setColor(0, 0, 0, self._alpha)
    love.graphics.rectangle("fill", 0, 0, engine.game.width, engine.game.height)
  love.graphics.pop()
end

return fade
