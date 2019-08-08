local event = require("prototypes.event")

local game = require("managers.game")
local cache = require("managers.cache")
local save = require("managers.save")
local audio = require("managers.audio")

local net = event:extend()

function net:create(position)
  local n = self:extend()
  n._directFrame = true
  n._i = 0
  n._j = 0
  n._imgName = "characters/case1/net_icon"
  n._img = cache:image("characters/case1/net_icon")
  n._solid = not game:switch("hasNet")
  n._tactile = not game:switch("hasNet")
  if game:switch("hasNet") then
    n._opacity = 0
  end
  n:moveTo(unpack(position))
  return n
end

function net:getFrames()
  return 1
end

function net:getPoses()
  return 1
end

function net:call()
  if game:switch("hasNet") then
    return
  end
  audio:playBgm("case1/triunph.mp3")
  game:switch("hasNet", true)
  save:dump()
  self._solid = false
  self._tactile = false
  self._opacity = 0
end

return net
