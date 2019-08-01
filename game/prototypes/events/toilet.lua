local interpreter = require("game.interpreter")

local event = require("prototypes.event")

local player

local toilet = event:extend()

function toilet:create(name, position)
    local newToilet = self:extend()
    newToilet:moveTo(unpack(position))
    newToilet._name = name
    newToilet._solid = true
    return newToilet
  end
  
  function toilet:call()
    interpreter:startWork()
			interpreter:addCommand("se", "toilet-flush.wav")
      interpreter:addCommand("wait", 1.5)
    interpreter:addCommand("stop")
  end
  
  return toilet