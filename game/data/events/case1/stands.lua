local backDoor = require("prototypes.events.backDoor")

return {
  backDoor:create("tp1", {8, 32}, { map="case1/entrance", pos={8, 2} }),
  backDoor:create("tp2", {9, 32}, { map="case1/entrance", pos={9, 2} }),
  backDoor:create("tp3", {8, 1}, { map="case1/plaza", pos={24, 49} }),
  backDoor:create("tp4", {9, 1}, { map="case1/plaza", pos={25, 49} }),
}