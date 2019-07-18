local Command = require("prototypes.command")

local engine = require("config.engine")

local scene = require("managers.scene")

local map = require("game.map")
local player = require("game.player")

local command = Command:extend()

function command:create(destination, transition)
  local result = self:extend()
  result._destination = destination
  result._transition = transition
  return result
end

function command:start()
  if self._transition then
    self._transition:start(self:takeScreenshot())
  end
  self:changeDestination()
end

function command:isRunning()
  return self._transition and self._transition:isRunning()
end

function command:takeScreenshot()
  local ss = love.graphics.newCanvas(engine.screen.width, engine.screen.height)
  local canvas = love.graphics.getCanvas()
  love.graphics.setCanvas(ss)
  love.graphics.push()
    scene:emit('draw')
  love.graphics.pop()
  love.graphics.setCanvas(canvas)
  return ss
end

function command:changeDestination()
  map:setup(self._destination.map)
  player:moveTo(unpack(self._destination.pos))
end

function command:update(dt)
  if self._transition then
    if self._transition:isRunning() then
      self._transition:update(dt)
    end
  end
end

function command:draw()
  if self._transition then
    self._transition:draw()
  end
end

return command
