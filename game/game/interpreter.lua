local interpreter = {}

local runing = false

function interpreter:isRunning()
  return runing
end

function interpreter:update(dt)
end

return interpreter
