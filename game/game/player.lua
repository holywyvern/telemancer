local interpreter = require("game.interpreter")

local audio = require("managers.audio")
local cache = require("managers.cache")

local character = require("prototypes.character")

local controls = require("config.controls")

local player = character:extend()

local oldUpdate = player.update

player._solid = true

function player:update(dt)
  self:updateNet(dt)
  oldUpdate(self, dt)
  self:checkTouchEvents(-1)
  self:updateControls(dt)
end

function player:setup(x, y, d)
  self:moveTo(x, y, d)
  self:setImage("hero")
  self._clearsAnimation = true
  self:updateRect()
  self:setupNet()
end

function player:setupNet()
  self._netImg = cache:image("characters/case1/net")
  self._showNet = false
  local w, h = self._netImg:getDimensions()
  self._netW = w / 3
  self._netH = h / 4
  self._netI = 0
  self._netJ = 0
  self._netT = 0
  self._netQuad = love.graphics.newQuad(0, 0, w / 3, h / 4, w, h)  
end

function player:updateControls(dt)
  if not self:canAct() then
    return
  end
  if     controls:down('up')    then
    self:move(8)
  elseif controls:down('down')  then
    self:move(2)
  elseif controls:down('left')  then
    self:move(4)
  elseif controls:down('right') then
    self:move(6)
  end
  if controls:pressed('interact') then
    if not self:checkSolidEvents() then
      self:triggerNet()
    end
  end
end

local oldMove = player.move

function player:move(d)
  local triggered = false
  self:face(d)
  if self:canAct() then
    triggered = self:checkTouchEvents(d)
  end
  if not triggered then
    oldMove(self, d)
  end
end

function player:checkSolidEvents()
  if interpreter:isRunning() then
    return false
  end  
  local map = require("game.map")
  local x, y = map:_calculatePosition(self._x, self._y, self._d)
  local result = false
  for _, event in ipairs(map:getEventsAt(x, y)) do
    if event._solid then
      event:call()
      result = true
    end
  end
  return result
end

function player:checkTouchEvents(d)
  if interpreter:isRunning() then
    return false
  end
  d = d or self._d
  local triggered = false
  local map = require("game.map")
  local x, y = map:_calculatePosition(self._x, self._y, d)
  for _, event in ipairs(map:getEventsAt(x, y)) do
    if event._tactile then
      event:call()
      triggered = true
    end
  end
  return triggered
end

function player:canAct()
  if self:isMoving() then
    return false
  end
  if interpreter:isRunning() then
    return false
  end
  if interpreter:isWorking() then
    return false
  end
  return true
end

function player:playStep()
  audio:playSe("steps/" .. self:stepFilename() .. ".wav", { volume = 0.3 })
end

function player:stepFilename()
  local map = require("game.map")
  for _, tile in ipairs(map:tilesAt(self._x, self._y)) do
    local stepName = tile.properties and tile.properties.stepName
    if stepName then
      return stepName
    end
  end
  return "any"
end

function player:dumpSave(dump)
  dump.player = {self._imgName, {self._x, self._y, self._d}}
end

function player:loadSave(dump)
  local data = dump.player
  player:setImage(data[1])
  player:moveTo(unpack(data[2]))
end

function player:getFrames()
  return 6
end

function player:getPoses()
  return 6
end

function player:updateNet(dt)
  if not self._showNet then return end
  local j = (self._d - 2) / 2
  self._i = self._netI + 3
  self._netQuad:setViewport(self._netI * self._netW, j * self._netH, self._netW, self._netH)
end

function player:triggerNet()
  local game = require("managers.game")
  if not game:switch('hasNet') then return end
  if not player:canAct() then return end

  interpreter:startWork()
  self._showNet = true
  self._netI = 0
  self._netT = 2
  self._directFrame = true
  self._j = (self._d - 2) / 2
  self._i = 3
  local x, y = self:getPositionAdjust()
  interpreter:addCommand("wait", 0.5)
  interpreter:addCommand("props", self, { _netI = 1 })
  interpreter:addCommand("removeClownsAt", x, y)
  interpreter:addCommand("wait", 0.1)
  interpreter:addCommand("props", self, { _netI = 2 })
  interpreter:addCommand("wait", 0.2)
  interpreter:addCommand("props", self, { _directFrame = false, _showNet = false })  
  interpreter:addCommand("stop")
end

function player:drawNet()
  if not self._showNet then return end
  love.graphics.setColor(1, 1, 1, 1)
  love.graphics.draw(self._netImg, self._netQuad, self._realX - 32, self._realY - 48)
end

return player