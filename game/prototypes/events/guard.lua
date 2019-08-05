local event = require("prototypes.events.clown")
local scene = require("managers.scene")

local player = require("game.player")
local interpreter = require("game.interpreter")

local clown = event:extend()

function clown:create(position, orientation, viewD)
  local evt = event.create(self, 'clown', position)
  evt._mode = 'Search'
  evt._d = position[3] or 2
  evt._t = 0
  evt._speed = 5
  evt._orientation = orientation or 'cw'
  evt._solid = true
  evt._tactile = true
  evt._viewD = viewD or 5
  return evt
end

function clown:update(dt)
  event.update(self, dt)
  self['update' .. self._mode](self, dt)
end

function clown:updateSearch(dt)
  self._t = self._t + dt
  if self._t > 1.2 then
    self._t = self._t - 1.2
    self:rotate(self._orientation)
  end
  if self:isLookingTo(player, 5) then
    self._mode = 'Chase'
  end
end

function clown:updateChase()
  if self:realDistanceFrom(player) < 18 then
    self:call()
    return
  end
  if self:isMoving() then return end
  if self._x ~= player._x then
    if self._x > player._x then
      self:move(4)
    else
      self:move(6)
    end
  elseif self._y ~= player._y then
    if self._y > player._y then
      self:move(8)
    else
      self:move(2)
    end
  end
end

function clown:call()
  if interpreter:isRunning() then
    return
  end
  scene:switch("gameOver")
end

return clown