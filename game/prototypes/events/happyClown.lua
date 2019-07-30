local event = require("prototypes.event")

local cache = require("managers.cache")

local clown = event:extend()

function clown:create(name, position)
  local char = self:extend()
  char._name = name
  char._imgName = 'case1/clown'
  char._img = cache:image('characters/case1/happy_clown')
  char:moveTo(unpack(position))
  char._standingAnimation = true
  char._solid = true
  return char
end

return clown
