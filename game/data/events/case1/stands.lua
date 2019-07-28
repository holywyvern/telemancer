local backDoor = require("prototypes.events.backDoor")

return {
  backDoor:create("tp1", {8, 32}, { map="case1/entrance", pos={8, 2} }),
  backDoor:create("tp2", {9, 32}, { map="case1/entrance", pos={9, 2} })  
}
