local command = {}

function command:extend()
  return setmetatable({}, { __index = self })
end

function command:hasFinished()
  return true
end

function command:update(dt)
end

return command
