local backDoor = require("prototypes.events.backDoor")

return {
  backDoor:create("mirrors_tp1", {9, 50}, { map="case1/mirrors_out", pos={13, 2} }),
  backDoor:create("mirrors_tp2", {10, 50}, { map="case1/mirrors_out", pos={14, 2} }),
  backDoor:create("stand_tp1", {24, 50}, { map="case1/stands", pos={8, 2} }),
  backDoor:create("stand_tp2", {25, 50}, { map="case1/stands", pos={9, 2} })
}
