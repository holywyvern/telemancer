local backDoor = require("prototypes.events.backDoor")
local boy = require("prototypes.events.boy")

local game = require("managers.game")

local events = {
  backDoor:create("in1_door", {7, 11 }, { map="case1/nursery_f1", pos={7, 16} }),
  backDoor:create("in2_door", {16, 11 }, { map="case1/nursery_f1", pos={14, 16} }),
  backDoor:create("in3_door", {25, 11 }, { map="case1/nursery_f1", pos={21, 16} }),
}

if game:variable("case1") < 2 then
  events[#events + 1] = boy:create({3, 4, 2})
end

return events
