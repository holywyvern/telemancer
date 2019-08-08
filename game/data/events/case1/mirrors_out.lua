local backDoor = require("prototypes.events.backDoor")
local giantGuard = require("prototypes.events.giantGuard")

local game = require("managers.game")

local events = {
  backDoor:create("plaza_tp1", {13, 1}, { map="case1/plaza", pos={9, 49} }),
  backDoor:create("plaza_tp2", {14, 1}, { map="case1/plaza", pos={10, 49} }),
  backDoor:create("in_tp", {6, 7}, { map="case1/mirrors_in", pos={16, 29} })   
}

if game:switch("hasNet") then
  events[#events + 1] = giantGuard:create({8, 14, 8})
end

return events