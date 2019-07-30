local backDoor = require("prototypes.events.backDoor")

return {
  backDoor:create("in1_door", {7, 11 }, { map="case1/nursery_f1", pos={7, 16} }),
  backDoor:create("in2_door", {16, 11 }, { map="case1/nursery_f1", pos={14, 16} }),
  backDoor:create("in3_door", {25, 11 }, { map="case1/nursery_f1", pos={21, 16} }),  
}