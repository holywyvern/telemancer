local interpreter = require("game.interpreter")
local player = require("game.player")

local game = require("managers.game")

local backDoor = require("prototypes.events.backDoor")

local board = require("prototypes.events.board")

local clown = require("prototypes.events.clown")
local guard = require("prototypes.events.guard")

local events = {
  backDoor:create("in_tp", {7, 8}, { map="case1/tent_in", pos={17, 31} }),
  backDoor:create("plaza_tp1", {13, 18}, { map="case1/plaza", pos={3, 2} }),
  backDoor:create("plaza_tp2", {14, 18}, { map="case1/plaza", pos={4, 2} })  
}

if game:variable("case1") < 2 then
  local newBoard = board:create({13, 14})
  local clown1 = clown:create('clown1', { 13, 18, 8 })
  local clown2 = clown:create('clown2', { 14, 18, 8 })
  clown1._opacity = 0
  clown2._opacity = 0

  events[#events + 1] = newBoard

  events[#events + 1] = clown1
  events[#events + 1] = clown2

  function events.onEnter()
    interpreter:clearQueue()
    interpreter:startWork()
      if player._x > 13 then
        interpreter:addCommand("move", player, 4, true)
      end
      for _=1, 4, 1 do
        interpreter:addCommand("move", player, 8, true)
      end
      interpreter:addCommand("props", player, { _fixDirection = true, _speed = 4 })
      for i=1,5, 1 do
        interpreter:addCommand("prop", newBoard, "_i", i)
        if i < 3 then
          interpreter:addCommand("move", player, 2, true)
        else
          interpreter:addCommand("wait", 0.2)
        end
      end
      interpreter:addCommand("props", player, { _fixDirection = false, _speed = 3 })
      interpreter:addCommand("se", "nose.wav")
      interpreter:addCommand("wait", 0.4)
      for i=1,5,1 do
        interpreter:addCommand("prop", clown1, "_opacity", i / 5)
        interpreter:addCommand("prop", clown2, "_opacity", i / 5)
        interpreter:addCommand("wait", 0.2)
      end
      interpreter:addCommand("face", player, 2)
      interpreter:addCommand("wait", 2)
      interpreter:addCommand("scene", "gameOver")
    interpreter:addCommand("stop")
  end
else
  local d = 2
  if game:switch("hasNet") then
    d = 8
  end
  events[#events + 1] = guard:create("tent_out1", {13, 13, d})
  events[#events + 1] = guard:create("tent_out2", {14, 13, d})
end

return events
