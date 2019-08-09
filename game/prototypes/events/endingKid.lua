
local player = require("game.player")

local event = require("prototypes.event")

local cache = require("managers.cache")
local game = require("managers.game")

local boy = event:extend()

function boy:create(position)
  local evt = self:extend()
  evt:moveTo(unpack(position))
  evt._img = cache:image("characters/case1/kid")
  evt._imgName = 'case1/kid'
  evt._directFrame = true
  evt._i = 5
  evt._j = 0
  evt._solid = false
  evt._opacity = 0
  return evt
end

function boy:getFrames()
  return 6
end

function boy:getPoses()
  return 1
end

return boy
