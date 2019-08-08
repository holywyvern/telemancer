local event = require("prototypes.event")

local cache = require("managers.cache")

local drop = event:extend()

function drop:create(name, position)
  local newDrop = self:extend()
  newDrop._name = name
  newDrop._imgName = 'case1/drop'
  newDrop._img = cache:image('characters/case1/drop')
  newDrop:moveTo(unpack(position))
  newDrop._standingAnimation = true
  newDrop._solid = true
  newDrop._z = 3
  return newDrop
end

function drop:getFrames()
  return 6
end

function drop:getPoses()
  return 1
end

return drop
