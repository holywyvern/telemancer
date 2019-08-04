local event = require("prototypes.event")

local cache = require("managers.cache")

local clown = event:extend()

function clown:create(name, position)
  local evt = self:extend()
  evt._name = name
  evt:moveTo(unpack(position))
  evt._imgName = 'case1/clown'
  evt._img = cache:image('characters/case1/clown')
  return evt
end

return clown
