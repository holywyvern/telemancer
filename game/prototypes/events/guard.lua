local event = require("prototypes.events.clown")
local scene = require("managers.scene")
local game = require("managers.game")

local player = require("game.player")
local interpreter = require("game.interpreter")

local clown = event:extend()

function clown:create(switch, position, orientation, viewD)
  local evt = event.create(self, 'clown', position)
  evt._mode = 'Search'
  evt._switch = switch
  evt._d = position[3] or 2
  evt._t = 0
  evt._speed = 5
  evt._orientation = orientation or 'cw'
  evt._solid = not game:switch(switch)
  evt._tactile = not game:switch(switch)
  evt._viewD = viewD or 6
  evt._size = 1
  if game:switch(switch) then
    evt._opacity = 0
  end
  return evt
end

function clown:update(dt)
  if self._opacity < 1 then return end
  event.update(self, dt)
  self['update' .. self._mode](self, dt)
end

function clown:updateSearch(dt)
  self._t = self._t + dt
  if self._t > 1.2 then
    self._t = self._t - 1.2
    self:rotate(self._orientation)
  end
  if self:isLookingTo(player, self._viewD) then
    self._mode = 'Chase'
  end
end

function clown:updateChase()
  if self:isLookingTo(player, self._size) then
    self:callGameOver()
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
  if self:isMoving() then return end
  player:triggerNet()
end

function clown:callGameOver()
  if self:isMoving() then return end
  if self._opacity < 1 then return end
  if interpreter:isRunning() then
    return
  end
  scene:switch("gameOver")
end

function clown:onCatch()
  if game:switch(self._switch) then return end
  game:switch(self._switch, true)
  game:variable('clowns', game:variable('clowns') + 1)
  self._solid = false
  self._tactile = false
  self._opacity = 0
end

return clown