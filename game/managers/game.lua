local setup = require("game.setup")
local player = require("game.player")
local map = require("game.map")

local data = {}

local game = {}

function game:clear()
  data = {
    switches = {},
    variables = {},
    items = {}
  }
  map:setup('home')
  player:setup(
    setup.player.start.x, setup.player.start.y, setup.player.start.direction
  )  
end

function game:switch(id, value)
  if value ~= nil then
    data.switches[id] = value and true
  end
  return data.switches[id]
end

function game:variable(id, value)
  if value ~= nil then
    data.variables[id] = value
  end
  return data.variables[id]
end

function game:data(value)
  if value then
    data = value
  end
  return data
end

return game
