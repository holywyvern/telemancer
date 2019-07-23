local scene = {}

function scene:extend()
  return setmetatable({}, { __index = self })
end

function scene:enter(previous, options)
end

function scene:start()
end

function scene:leave(previous, options)
end

return scene
