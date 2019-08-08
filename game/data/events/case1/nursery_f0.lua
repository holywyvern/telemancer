local backDoor = require("prototypes.events.backDoor")
local door = require("prototypes.events.door")

local guard = require("prototypes.events.guard")

return {
  backDoor:create("out_tp", {45, 12}, { map="case1/nursery_out", pos={31, 8} }),
  backDoor:create("1f_tp", {37, 3}, { map="case1/nursery_f1", pos={24, 4, 2} }),
  door:create("in1_door", "bathroom", {4, 7}, { map="case1/nursery_f0_in", pos={3, 12} }),
  door:create("in2_door", "bathroom", {11, 7}, { map="case1/nursery_f0_in", pos={10, 12} }),
  door:create("in3_door", "bathroom", {18, 9}, { map="case1/nursery_f0_in", pos={16, 15} }),
  door:create("in4_door", "bathroom", {22, 9}, { map="case1/nursery_f0_in", pos={23, 15} }),
  door:create("in5_door", "bathroom", {26, 9}, { map="case1/nursery_f0_in", pos={30, 15} }),
  door:create("in6_door", "bathroom", {30, 9}, { map="case1/nursery_f0_in", pos={37, 15} }),
  door:create("in7_door", "bathroom", {34, 9}, { map="case1/nursery_f0_in", pos={44, 15} }),
  guard:create("nursery1", {40, 6, 2}),
  guard:create("nursery2", {42, 6, 2}),
  guard:create("nursery3", {36, 5, 6}),
  guard:create("nursery4", {47, 9, 4})
}
