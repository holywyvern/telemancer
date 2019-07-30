local backDoor = require("prototypes.events.backDoor")

return {
  backDoor:create("in_tp", {7, 8}, { map="case1/tent_in", pos={17, 31} }),
  backDoor:create("plaza_tp1", {13, 18}, { map="case1/plaza", pos={3, 2} }),
  backDoor:create("plaza_tp2", {14, 18}, { map="case1/plaza", pos={4, 2} })  
}
