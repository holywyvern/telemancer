local door = require("prototypes.events.door")
local tv = require("prototypes.events.tvGate")

local tvEvent = tv:create('tv', {15, 3}, { map="case1/entrance", pos={14, 12, 2} })
tvEvent:addCommand("bgm", "case1/entrance.mp3")

return {
  door:create('nowhere', 'basic', {2, 3}),
  tvEvent
}
