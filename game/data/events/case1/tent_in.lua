local backDoor = require("prototypes.events.backDoor")

local guard = require("prototypes.events.guard")
local giantGuard = require("prototypes.events.giantGuard")

return {
  backDoor:create("in_tp", {17, 32}, { map="case1/tent_out", pos={7, 9} }),
  guard:create({13, 15, 4}),
  guard:create({16, 12, 4}),
  guard:create({5, 21, 2}),
  guard:create({28, 15, 8}),
  guard:create({14, 26, 4}),
  guard:create({14, 26, 4}),
  guard:create({13, 12, 4}),
  guard:create({16, 12, 4}),
  guard:create({16, 15, 4}),
  guard:create({14, 10, 4}),
  giantGuard:create({17, 18, 2})
}
