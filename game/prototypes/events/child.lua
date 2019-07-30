local generator = require("prototypes.events.generator")

local child = generator:extend()

function child:baseFolder()
  return 'children'
end

function child:maxHairstyles()
  return 8
end

function child:maxClothes()
  return 5
end

return child
