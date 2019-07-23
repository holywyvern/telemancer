local Command = require("prototypes.command")

local command = Command:extend()

local scene = require("managers.scene")

local map = require("game.map")
local player = require("game.player")

function command:create(name, options)
  local result = self:extend()
  result._name = name
  result._opts = options
  return result
end

function command:start()
  scene:switch(self._name, self._opts)
  scene:apply()
  map:setup(self:getDestination())
  map:playBgm()
  player:moveTo(self:getPosition())
  local interpreter = require("game.interpreter")
  interpreter:endWork()  
end

function command:getDestination()
  return 'case1_house'
end

function command:getPosition()
  return 3, 8, 8
end


return command
