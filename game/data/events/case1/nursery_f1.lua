local backDoor = require("prototypes.events.backDoor")
local door = require("prototypes.events.door")

return {
  backDoor:create("0f_tp", {24, 3}, { map="case1/nursery_f0", pos={37, 4, 2} }),
  door:create("in1_door", "bathroom", {7, 15}, { map="case1/nursery_f1_in", pos={7, 10} }),
  door:create("in2_door", "bathroom", {14, 15}, { map="case1/nursery_f1_in", pos={16, 10} }),
  door:create("in3_door", "bathroom", {21, 15}, { map="case1/nursery_f1_in", pos={25, 10} }),
}