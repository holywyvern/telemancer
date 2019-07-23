local roomy = require("lib.roomy")

local manager = roomy.new()

local oldSwitch = manager.switch
local oldPush = manager.push

local function setupOptions(options)
  options = options or {}
  if options.transition then
    options.screenshot = manager:takeScreenshot()
  end
  return options
end

function manager:switch(screen, options)
  options = setupOptions(options)
  oldSwitch(self, screen, options)
end

function manager:push(screen, ...)
  options = setupOptions(options)
  oldPush(self, screen, options)
end

function manager:takeScreenshot()
  local ss = love.graphics.newCanvas(engine.screen.width, engine.screen.height)
  local canvas = love.graphics.getCanvas()
  love.graphics.setCanvas(ss)
  love.graphics.push()
    self:emit('draw')
  love.graphics.pop()
  love.graphics.setCanvas(canvas)
  return ss
end

return manager
