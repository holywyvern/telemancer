local door = require("prototypes.events.door")

local events = {
  door:create("bathroomDoor", "bathroom", {14, 3}, { map="home_bathroom", pos={14, 7} })
}

return events
