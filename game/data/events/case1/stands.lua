local backDoor = require("prototypes.events.backDoor")
local squad = require("prototypes.clownSquad")
local giantGuard = require("prototypes.events.giantGuard")

local game = require("managers.game")

local events = {
  backDoor:create("tp1", {8, 32}, { map="case1/entrance", pos={8, 2} }),
  backDoor:create("tp2", {9, 32}, { map="case1/entrance", pos={9, 2} }),
  backDoor:create("tp3", {8, 1}, { map="case1/plaza", pos={24, 49} }),
  backDoor:create("tp4", {9, 1}, { map="case1/plaza", pos={25, 49} }),
}

if game:switch("bossStart") then
  events[#events + 1] = giantGuard:create({5, 19, 2})
end

if game:variable("case1") < 1 then
  squad:create("squad1", {7, 24}, events)
  squad:create("squad2", {10, 13}, events)
end

return events
