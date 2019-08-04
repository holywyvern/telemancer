local event = require("prototypes.event")

local cache = require("managers.cache")

local board = event:extend()

function board:create(position)
  local result = board:extend()
  result._name = 'board'
  result._directFrame = true
  result._imgName = 'case1/board'
  result._img = cache:image("characters/case1/board")
  result._z = -128
  result:moveTo(unpack(position))
  return result
end

function board:getFrames()
  return 6
end

function board:getPoses()
  return 1
end

return board
