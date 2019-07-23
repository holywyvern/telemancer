local door = require("prototypes.events.door")
local introDoor = require("prototypes.events.introDoor")
local tv = require("prototypes.events.tvGate")

local events = {
  door:create("bathroomDoor", "bathroom", {14, 3}, { map="home_bathroom", pos={14, 7} }),
  introDoor:create("exit", "basic", {3, 3}),
}

return events
