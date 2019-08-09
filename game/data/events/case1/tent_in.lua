local backDoor = require("prototypes.events.backDoor")

local guard = require("prototypes.events.guard")
local giantGuard = require("prototypes.events.giantGuard")

return {
  backDoor:create("in_tp", {17, 32}, { map="case1/tent_out", pos={7, 9} }),
  guard:create("tent_in_1", {13, 15, 4}),
  guard:create("tent_in_2", {16, 12, 4}),
  guard:create("tent_in_3", {5, 21, 2}),
  guard:create("tent_in_4", {28, 15, 8}),
  guard:create("tent_in_5", {14, 26, 4}),
  guard:create("tent_in_6", {13, 26, 4}),
  guard:create("tent_in_8", {16, 12, 4}),
  guard:create("tent_in_9", {16, 15, 4}),
  guard:create("tent_in_10", {14, 10, 4}),
  giantGuard:create({17, 18, 2})
}
