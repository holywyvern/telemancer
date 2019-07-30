local backDoor = require("prototypes.events.backDoor")

return {
  backDoor:create("in1_door", {3, 13}, { map="case1/nursery_f0", pos={4, 8} }),
  backDoor:create("in2_door", {10, 13}, { map="case1/nursery_f0", pos={11, 8} }),
  backDoor:create("in3_door", {16, 16 }, { map="case1/nursery_f0", pos={18, 10} }),
  backDoor:create("in4_door", {23, 16 }, { map="case1/nursery_f0", pos={22, 10} }),
  backDoor:create("in5_door", {30, 16 }, { map="case1/nursery_f0", pos={26, 10} }),
  backDoor:create("in6_door", {37, 16 }, { map="case1/nursery_f0", pos={30, 10} }),
  backDoor:create("in7_door", {44, 16 }, { map="case1/nursery_f0", pos={34, 10} })  
}
