local backDoor = require("prototypes.events.backDoor")
local door = require("prototypes.events.door")

return {
  door:create("in_tp", "bathroom", {31, 7}, { map="case1/nursery_f0", pos={45, 11} }),
  backDoor:create("plaza_tp1", {1, 7}, { map="case1/plaza", pos={49, 35} }),
  backDoor:create("plaza_tp2", {1, 8}, { map="case1/plaza", pos={49, 36} })    
}
