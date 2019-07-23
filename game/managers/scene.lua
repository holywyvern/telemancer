local roomy = require("lib.roomy")

local engine = require("config.engine")

local manager = roomy.new()

local function setupOptions(options)
  options = options or {}
  if options.transition then
    options.screenshot = manager:takeScreenshot()
  end
  return options
end

function manager:switch(screen, options)
  screen = assert(love.filesystem.load('scenes/' .. screen .. '.lua'))()
  options = setupOptions(options)
  local this = self
  local function call()
		local previous = this.stack[#this.stack]
		this:emit('leave', screen, options)
		this.stack[#this.stack] = screen
    this:emit('enter', previous or false, options)
	end
	table.insert(self.queue, {call, options})
end

function manager:push(screen, options)
  screen = assert(love.filesystem.load('scenes/' .. screen .. '.lua'))()
  options = setupOptions(options)
  local this = self
  local function call()
		local previous = this.stack[#this.stack]
		this:emit('pause', screen, options)
		this.stack[#this.stack + 1] = screen
    this:emit('enter', previous or false, options)
	end  
	table.insert(self.queue, {call, options})
end

function manager:apply()
	while #self.queue > 0 do
    local call, options = unpack(self.queue[1])
    if options.transition then
      options.transition:start(options.screenshot, call)
      self._transition = options.transition
    else
      call()
    end
		table.remove(self.queue, 1)
	end
end

function manager:takeScreenshot()
  local ss = love.graphics.newCanvas(engine.game.width, engine.game.height)
  local canvas = love.graphics.getCanvas()
  love.graphics.setCanvas(ss)
  love.graphics.push()
    love.graphics.clear(0, 0, 0)
    love.graphics.setColor(1, 1, 1, 1)
    self:emit('draw')
  love.graphics.pop()
  love.graphics.setCanvas(canvas)
  return ss
end

function manager:updateScene(dt)
  if self:inTransition() then
    self._transition:update(dt)
    if not self:inTransition() then
      self:emit('start')
    end
    return
  end
  self:emit('update', dt)
end

function manager:drawScene()
  love.graphics.push()
    love.graphics.setColor(1, 1, 1, 1)
    self:emit('draw')
  love.graphics.pop()
  if self:inTransition() then
    love.graphics.push()
      love.graphics.setColor(1, 1, 1, 1)
      self._transition:draw()
    love.graphics.pop()
  else
    self._transition = nil
  end
end

function manager:inTransition()
  return self._transition and self._transition:isRunning()
end

return manager
