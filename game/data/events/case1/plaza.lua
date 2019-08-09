local backDoor = require("prototypes.events.backDoor")

local game = require("managers.game")

local clown = require("prototypes.events.happyClown")
local giantGuard = require("prototypes.events.giantGuard")

local squad = require("prototypes.clownSquad")

local events = {
  backDoor:create("nursery_tp1", {50, 35}, { map="case1/nursery_out", pos={2, 7} }),
  backDoor:create("nursery_tp2", {50, 36}, { map="case1/nursery_out", pos={2, 8} }),  
  backDoor:create("mirrors_tp1", {9, 50}, { map="case1/mirrors_out", pos={13, 2} }),
  backDoor:create("mirrors_tp2", {10, 50}, { map="case1/mirrors_out", pos={14, 2} }),
  backDoor:create("stand_tp1", {24, 50}, { map="case1/stands", pos={8, 2} }),
  backDoor:create("stand_tp2", {25, 50}, { map="case1/stands", pos={9, 2} }),
  backDoor:create("merry_go_round_tp1", {50, 12}, { map="case1/merry_go_round", pos={2, 6} }),
  backDoor:create("merry_go_round_tp2", {50, 13}, { map="case1/merry_go_round", pos={2, 7} }),
  backDoor:create("tent_tp1", {3, 1}, { map="case1/tent_out", pos={13, 17} }),
  backDoor:create("tent_tp2", {4, 1}, { map="case1/tent_out", pos={14, 17} })
}

if game:variable("case1") < 1 then

  squad:create("squad_mirrors", {10, 45}, events)

  squad:create("squad_tent", {4, 2}, events)

  events[#events + 1] = clown:create("squad_tent_clown", {3, 2, 2})

  squad:create("squad_nursery", {47, 35}, events)
  events[#events + 1] = clown:create("squad_nursery_clown2", {48, 36, 2})
end

if game:switch("hasNet") then
  events[#events + 1] = giantGuard:create({24, 27, 2})

  if game:variable("clowns") >= 10 then
    events[#events + 1] = giantGuard:create({11, 15, 2})
  end

  if game:variable("clowns") >= 20 then
    events[#events + 1] = giantGuard:create({41, 7, 2})
  end
  
  if game:variable("clowns") >= 30 then
    events[#events + 1] = giantGuard:create({37, 37, 2})
  end  
end

return events
