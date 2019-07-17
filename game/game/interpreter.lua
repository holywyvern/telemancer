local interpreter = {}

local pendingCommands = {}
local currentCommand = nil

local commandTypes = {}

local runing = false

function interpreter:isRunning()
  return runing
end

function interpreter:update(dt)
  if currentCommand then
    if currentCommand:hasFinished() then
      self:_getNextCommand()
    end
    if currentCommand then
      currentCommand:update(dt)
    end
  end
end

function interpreter:_getNextCommand()
  currentCommand = nil
  if #pendingCommands > 0 then
    local newCommand = table.remove(pendingCommands, 1)
    currentCommand = self:_createCommand(newCommand[1], newCommand[2])
  end
end

function self:_createCommand(type, args)
  commandTypes[type] = commandTypes[type] or require("game.commands." .. type)
  return commandTypes[type]:create(unpack(args))
end

function interpreter:addCommand(type, ...)
  local args = {...}
  pendingCommands[#pendingCommands + 1] = { type, args }
end

return interpreter
