local backDoor = require("prototypes.events.backDoor")

return {
  backDoor:create("tp1", {1, 6}, { map="case1/plaza", pos={49, 12} }),
  backDoor:create("tp2", {1, 7}, { map="case1/plaza", pos={49, 13} })  
}
