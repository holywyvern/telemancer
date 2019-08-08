local game = require("managers.game")
local cache = require("managers.cache")

local guard = require("prototypes.events.guard")

local giant = guard:extend()

function giant:create(position, orientation, viewD)
  local evt = guard.create(self, 'big_clown', position)
  evt._mode = 'Chase'
  evt._d = position[3] or 2
  evt._speed = 2
  evt._orientation = orientation or 'cw'
  evt._viewD = viewD or 6
  evt._size = 2
  evt._solid = true
  evt._tactile = true
  evt._imgName = 'case1/big_clown'
  evt._img = cache:image('characters/case1/big_clown')  
  return evt
end

function giant:call()
end

return giant
