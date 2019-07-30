local tv = require("prototypes.events.tvGate")
local backDoor = require("prototypes.events.backDoor")

local game = require("managers.game")

local events = {
  backDoor:create("tp1", {8, 1}, { map="case1/stands", pos={8, 31} }),
  backDoor:create("tp2", {9, 1}, { map="case1/stands", pos={9, 31} })
}

local fuzzy = game:variable("case1") > 0

events[#events + 1] = tv:create('tv', {14, 11}, { map="case1_house", pos={15, 4, 2}}, { fuzzy = fuzzy })

return events
