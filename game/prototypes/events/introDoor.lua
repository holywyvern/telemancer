local interpreter = require("game.interpreter")

local event = require("prototypes.events.door")

local fade = require("prototypes.transitions.fade")

local door = event:extend()

local player

function door:call()
  player = player or require("game.player")
  interpreter:startWork()
    interpreter:addCommand("se", "doors/" .. self._imgName .. "/open.wav")
    interpreter:addCommand("changeSolid", self, false)
    interpreter:addCommand("pose", self, 1)
    interpreter:addCommand("wait", 0.1)
    interpreter:addCommand("pose", self, 2)
    interpreter:addCommand("wait", 0.1)
    interpreter:addCommand("move", player, 8, true)
    interpreter:addCommand("se", "doors/" .. self._imgName .. "/close.wav")
    interpreter:addCommand("pose", self, 1)
    interpreter:addCommand("wait", 0.1)
    interpreter:addCommand("pose", self, 0)
    interpreter:addCommand("wait", 0.1)
    interpreter:addCommand("changeSolid", self, true)
    self:callExtraCommands()
  interpreter:addCommand("scene", "intro", { transition = fade:create(0.3) }, { map = 'case1_house', pos = {3, 8, 8} })
end

return door
