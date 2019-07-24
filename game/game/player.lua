local interpreter = require("game.interpreter")

local audio = require("managers.audio")

local character = require("prototypes.character")

local controls = require("config.controls")

local player = character:extend()

local oldUpdate = player.update

function player:update(dt)
  oldUpdate(self, dt)
  self:checkTouchEvents(-1)
  self:updateControls(dt)
end

function player:setup(x, y, d)
  self:moveTo(x, y, d)
  self:setImage("hero")
  self._clearsAnimation = true
  player:updateRect()
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
    self:checkSolidEvents()
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
  for _, event in ipairs(map:getEventsAt(x, y)) do
    if event._solid then
      event:call()
    end
  end
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

return player