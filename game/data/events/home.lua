local door = require("prototypes.door")

local events = {
  door:create("bathroomDoor", "bathroom", {14, 3}, { map="home_bathroom", pos={14, 3} })
}

return events
