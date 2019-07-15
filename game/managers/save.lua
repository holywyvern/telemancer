local binser = require("lib.binser")
local time   = require("lib.time")
local game   = require("managers.game")

local save = {}

function save:save(index)
  local data = {}
  self:serialize(data)
  local file = binser.serialize(time.now(), data)
  success, message = love.filesystem.write(self:filenameFor(index), file)
  return success, message
end

function save:load(index)
  local contents, error = love.filesystem.read(self:filenameFor(index))
  if contents then
    local data, size = binser.deserialize(file)
    self:deserialize(data[2])
    return data[1]
  else
    return nil, error
  end
end

function save:serialize(data)
  data.game = game:data()
end

function save:deserialize(data)
  game:data(data.game)
end

function save:filenameFor(index)
  return "save" .. index .. ".savedata"
end

return save
