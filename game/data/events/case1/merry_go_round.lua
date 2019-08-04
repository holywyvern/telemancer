local interpreter = require("game.interpreter")
local player = require("game.player")

local game = require("managers.game")

local fade = require("prototypes.transitions.fade")

local backDoor = require("prototypes.events.backDoor")

local events = {
  backDoor:create("tp1", {1, 6}, { map="case1/plaza", pos={49, 12} }),
  backDoor:create("tp2", {1, 7}, { map="case1/plaza", pos={49, 13} }),
}

function events.onEnter()
  if game:variable("case1") > 0 then
    return
  end
  interpreter:clearQueue()
  interpreter:startWork()
    local i = 0
    if player._y > 6 then
      interpreter:addCommand("move", player, 4, true)
    end
    while i < 8 do
      interpreter:addCommand("move", player, 8, true)
      i = i + 1
    end
  interpreter:addCommand("scene", "case1/intro", { transition = fade:create(0.3) })
end

return events
