local backDoor = require("prototypes.events.backDoor")

local clown = require("prototypes.events.happyClown")

local squad = require("prototypes.clownSquad")

local events = {
  backDoor:create("mirrors_tp1", {9, 50}, { map="case1/mirrors_out", pos={13, 2} }),
  backDoor:create("mirrors_tp2", {10, 50}, { map="case1/mirrors_out", pos={14, 2} }),
  backDoor:create("stand_tp1", {24, 50}, { map="case1/stands", pos={8, 2} }),
  backDoor:create("stand_tp2", {25, 50}, { map="case1/stands", pos={9, 2} }),
  backDoor:create("merry_go_round_tp1", {50, 12}, { map="case1/merry_go_round", pos={2, 6} }),
  backDoor:create("merry_go_round_tp2", {50, 13}, { map="case1/merry_go_round", pos={2, 7} })
}

squad:create("squad_mirrors", {10, 45}, events)

squad:create("squad_tent", {4, 2}, events)

events[#events + 1] = clown:create("squad_tent_clown", {3, 2, 2})

squad:create("squad_nursery", {47, 35}, events)

events[#events + 1] = clown:create("squad_nursery_clown2", {48, 36, 2})

return events
