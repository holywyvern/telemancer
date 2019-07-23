local scene = {}

function scene:extend()
  return setmetatable({}, { __index = self })
end

function scene:enter(previous, options)
  self:start(previous, options)
end

function scene:start(previous, options)
end

function scene:leave(previous, options)
end

return scene
