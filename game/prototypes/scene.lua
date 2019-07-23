local scene = {}

function scene:extend()
  return setmetatable({}, { __index = self })
end

function scene:updateScene(dt)
  if self:inTransition() then
    self._transition:update(dt)
    return
  end
  self:update(dt)
end

function scene:drawScene()
  self:draw()
  if self:inTransition() then
    self._transition:draw()
  end
end

function scene:inTransition()
  return self._transition and self._transition:isRunning()
end

function scene:enter(previous, options)
  local this = self
  local function performTransition()
    this._transitioned = true
  end
  if options.transition then
    options.transition:start(options.screenshot, performTransition)
    self._transition = options.transition
  end
  self:start(previous, options)
end

function scene:start(previous, options)
end

function scene:leave(previous, options)
end

return scene
