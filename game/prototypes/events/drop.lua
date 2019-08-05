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
  newDrop._z = 1
  return newDrop
end

return drop
