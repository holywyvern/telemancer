local backDoor = require("prototypes.events.backDoor")

local toilet = require("prototypes.events.toilet")

local events = {
  backDoor:create("backdoor", {14, 8}, { map="home", pos={14, 4} }),
  toilet:create("toilet", {11, 4})
}

return events
