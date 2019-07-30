local event = require("prototypes.event")

local cache = require("managers.cache")

local generator = event:extend()

function generator:create(name, position)
  assert(name ~= nil, "Name should not be nil")
  local char = self:extend()
  char._name = name
  char._body = cache:image(self:getFilename('bodies', love.math.random(self:maxBodies())))
  char._clothes = cache:image(self:getFilename('clothes', love.math.random(self:maxClothes())))
  char._hair = cache:image(self:getFilename('hair', love.math.random(self:maxHairstyles())))
  char:moveTo(unpack(position))
  char._solid = true
  return char
end

function generator:updateRect()
  if not self._body then
    return
  end
  if self._body ~= self._oldImg and self._rect then
    self._rect:release()
    self._rect = nil
  end
  local wi, hi = self._body:getDimensions()
  local w = wi / self:getFrames()
  local h = hi / self:getPoses()
  local i = self:_getPose()
  local j = (self._d - 2) / 2
  if not self._rect then
    self._rect = love.graphics.newQuad(i * w, j * h, w, h, wi, hi)
    j = ((10 - self._d) - 2) / 2
    self._reflectionRect = love.graphics.newQuad(i * w, j * h, w, h, wi, hi)
  else
    self._rect:setViewport(i * w, j * h, w, h)
    j = ((10 - self._d) - 2) / 2
    self._reflectionRect:setViewport(i * w, j * h, w, h)
  end
end

function generator:draw()
  if not self._body or not self._rect then return end
  local x, y, w, h = self._rect:getViewport()
  love.graphics.draw(self._body, self._rect, self._realX - w / 2, self._realY, 0, 1, 1, w / 2, h )
  love.graphics.draw(self._clothes, self._rect, self._realX - w / 2, self._realY, 0, 1, 1, w / 2, h )
  love.graphics.draw(self._hair, self._rect, self._realX - w / 2, self._realY, 0, 1, 1, w / 2, h )
end

function generator:getFilename(part, index)
  return "characters/" .. self:baseFolder() .. "/" .. part .. "/" .. index
end

function generator:baseFolder()
  return ''
end

function generator:maxBodies()
  return 4
end

function generator:maxHairstyles()
  return 1
end

function generator:maxClothes()
  return 1
end

return generator
