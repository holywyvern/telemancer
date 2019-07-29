local Command = require("prototypes.command")

local command = Command:extend()

local scene = require("managers.scene")

local map = require("game.map")
local player = require("game.player")

function command:create(name, options, mapOpts)
  local result = self:extend()
  result._name = name
  result._opts = options
  result._mapOpts = mapOpts or {}
  return result
end

function command:start()
  scene:switch(self._name, self._opts)
  scene:apply()
  if self._mapOpts.map then
    map:setup(self._mapOpts.map)
    map:playBgm()
  end
  if self._mapOpts.pos then
    player:moveTo(unpack(self._mapOpts.pos))
  end
  local interpreter = require("game.interpreter")
  interpreter:endWork()  
end

return command
