local interpreter = require("game.interpreter")
local player = require("game.player")

local backDoor = require("prototypes.events.backDoor")

local board = require("prototypes.events.board")

local clown = require("prototypes.events.clown")

local events = {
  backDoor:create("back", {16, 30}, { map="case1/mirrors_out", pos={6, 8} }),
}

local newBoard = board:create({16, 25})
local clown1 = clown:create('clown1', { 16, 29, 8 })
clown1._opacity = 0

events[#events + 1] = newBoard

events[#events + 1] = clown1

function events.onEnter()
  interpreter:clearQueue()
  interpreter:startWork()
    for _=1, 4, 1 do
      interpreter:addCommand("move", player, 8, true)
    end
    interpreter:addCommand("props", player, { _fixDirection = true, _speed = 4 })
    for i=1,5, 1 do
      interpreter:addCommand("prop", board, "_i", i)
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
      interpreter:addCommand("wait", 0.2)
    end
    interpreter:addCommand("face", player, 2)
    interpreter:addCommand("wait", 2)
    interpreter:addCommand("scene", "gameOver")
  interpreter:addCommand("stop")
end

return events
