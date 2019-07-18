local backDoor = require("prototypes.events.backDoor")

local events = {
  backDoor:create("backdoor", {14, 8}, { map="home", pos={14, 4} })
}

return events
