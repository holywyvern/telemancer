local binser = require("lib.binser")
local time   = require("lib.time")
local game   = require("managers.game")
local audio  = require("managers.audio")
local map    = require("game.map")
local player = require("game.player")

local save = {}

local filename = 'game.savedata'

function save:dump()
  local data = {}
  self:serialize(data)
  local file = binser.serialize(time.now(), data)
  success, message = love.filesystem.write(filename, file)
  return success, message
end

function save:load()
  local contents, error = love.filesystem.read(filename)
  if contents then
    local data, size = binser.deserialize(contents)
    self:deserialize(data[2])
    return data[1]
  else
    return nil, error
  end
end

function save:serialize(data)
  data.game = game:data()
  audio:dumpSave(data)
  map:dumpSave(data)
  player:dumpSave(data)
end

function save:deserialize(data)
  game:data(data.game)
  audio:loadSave(data)
  map:loadSave(data)
  map:playBgm()
  player:loadSave(data)
end

function save:exists()
  return love.filesystem.getInfo(filename, "file")
end

return save
