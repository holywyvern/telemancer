local door = require("prototypes.events.door")
local tv = require("prototypes.events.tvGate")

local events = {
  door:create("bathroomDoor", "bathroom", {14, 3}, { map="home_bathroom", pos={14, 7} }),
  door:create("exit", "basic", {3, 3}, { map="home", pos={4, 7} }),
  tv:create("tv", {4, 3}, { map="vhs_1", pos={4, 7} })
}

return events
