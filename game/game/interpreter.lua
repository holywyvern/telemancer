local interpreter = {}

local pendingCommands = {}
local currentCommand = nil

local commandTypes = {}

local running = false

function interpreter:isRunning()
  return running
end

function interpreter:update(dt)
  if not self:isWorking() then
    self:_getNextCommand()
  end  
  if currentCommand then
    currentCommand:update(dt)
  end
end

function interpreter:isWorking()
  return currentCommand and currentCommand:isRunning()
end

function interpreter:_getNextCommand()
  currentCommand = nil
  if #pendingCommands > 0 then
    local newCommand = table.remove(pendingCommands, 1)
    currentCommand = self:_createCommand(newCommand[1], newCommand[2])
  end
end

function interpreter:_createCommand(type, args)
  commandTypes[type] = commandTypes[type] or require("game.commands." .. type)
  local command = commandTypes[type]:create(unpack(args))
  command:start()
  return command
end

function interpreter:addCommand(type, ...)
  local args = {...}
  pendingCommands[#pendingCommands + 1] = { type, args }
end

function interpreter:startWork()
  running = true
end

function interpreter:endWork()
  running = false
end

function interpreter:draw()
  if currentCommand then
    currentCommand:draw()
  end
end

return interpreter
