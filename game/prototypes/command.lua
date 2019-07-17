local command = {}

function command:extend()
  return setmetatable({}, { __index = self })
end

function command:isRunning()
  return false
end

function command:start()
end

function command:update(dt)
end

return command
