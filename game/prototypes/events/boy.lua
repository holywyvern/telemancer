local interpreter = require("game.interpreter")
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
  evt._crying = true
  evt._directFrame = true
  evt._i = 0
  evt._solid = true
  return evt
end

function boy:getFrames()
  return 6
end

function boy:getPoses()
  return 1
end

function boy:update(dt)
  event.update(self, dt)
  if self._crying then
    self:updateCry(dt)
  end
end

function boy:updateCry(dt)
  self._cryT = (self._cryT or 0) + dt
  while self._cryT > 0.4 do
    self._cryT = self._cryT - 0.4
    self._i = (self._i + 1) % 2
  end
end

function boy:call()
  if game:variable("case1") > 1 then
    return
  end
  interpreter:startWork()
    interpreter:addCommand("props", player, { _directFrame = true, _i = 1, _j = 4 })
    interpreter:addCommand("wait", 0.2)
    interpreter:addCommand("prop", player, "_i", 2)
    interpreter:addCommand("wait", 2)
    interpreter:addCommand("props", self, { _i = 2, _crying = false })
    interpreter:addCommand("wait", 0.3)
    interpreter:addCommand("prop", player, "_i", 1)
    interpreter:addCommand("wait", 0.3)
    interpreter:addCommand("props", player, { _i = 0, _j = 5 })
    interpreter:addCommand("wait", 0.3)
    interpreter:addCommand("prop", player, "_i", 1)
    interpreter:addCommand("wait", 1)
    interpreter:addCommand("stopBgm")
    interpreter:addCommand("prop", player, "_i", 2)
    for i=3,5,1 do
      interpreter:addCommand("prop", self, "_i", i)
      interpreter:addCommand("wait", 0.3)
    end
    for i=4,0,-1 do
      interpreter:addCommand("prop", player, "_opacity", i / 5)
      interpreter:addCommand("wait", 0.3)
    end
    interpreter:addCommand("props", player, { _directFrame = false }) 
    interpreter:addCommand("moveTo", player, {3, 4, 2})
    interpreter:addCommand("setImage", player, "case1/hero")
    interpreter:addCommand("props", player, { _opacity = 1 })    
    interpreter:addCommand("props", self, { _opacity = 0, _solid = false })
    interpreter:addCommand("bgm", "case1/dream.mp3")
    interpreter:addCommand("var", "case1", 2)
    interpreter:addCommand("save")
  interpreter:addCommand("stop")
end

return boy
