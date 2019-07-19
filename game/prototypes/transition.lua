local transition = {}

function transition:extend()
  return setmetatable({}, { __index = self })
end

function transition:update(dt)
end

function transition:draw()
end

function transition:isRunning()
  return false
end

function transition:start(ss, performTransition)
  self._ss = ss
  self._performTransition = performTransition
end

return transition
