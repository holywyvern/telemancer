local transition = require("prototypes.transition")

local fade = transition:extend()

function fade:create(t)
  local effect = self:extend()
  effect._t = t
  effect._start = t
  return effect
end

function fade:start(ss, performTransition)
  self._ss = ss
  performTransition()
end

function fade:update(dt)
  self._t = self._t - dt
  if self._t < 0 then
    self._t = 0
  end
end

function fade:draw()
  love.graphics.push()
    love.graphics.setColor(1, 1, 1, self._t / self._start)
    love.graphics.draw(self._ss)
  love.graphics.pop()
end

function fade:isRunning()
  return self._t > 0
end

return fade
