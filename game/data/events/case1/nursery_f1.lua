local backDoor = require("prototypes.events.backDoor")
local door = require("prototypes.events.door")

local guard = require("prototypes.events.guard")

return {
  backDoor:create("0f_tp", {24, 3}, { map="case1/nursery_f0", pos={37, 4, 2} }),
  door:create("in1_door", "bathroom", {7, 15}, { map="case1/nursery_f1_in", pos={7, 10} }),
  door:create("in2_door", "bathroom", {14, 15}, { map="case1/nursery_f1_in", pos={16, 10} }),
  door:create("in3_door", "bathroom", {21, 15}, { map="case1/nursery_f1_in", pos={25, 10} }),
  guard:create({27, 6, 4}),
  guard:create({24, 9, 6}),
  guard:create({28, 13, 8}),
  guard:create({19, 18, 8}),
  guard:create({19, 18, 8}),
  guard:create({3, 16, 4}),
}