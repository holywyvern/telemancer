local clownSquad = {}

local clown = require("prototypes.events.happyClown")
local child = require("prototypes.events.child")

local function getRandomGenerator()
  return child
end

function clownSquad:create(baseName, clownPosition, events)
  local x, y = unpack(clownPosition)
  -- Creates a clown at the center
  events[#events + 1] = clown:create(baseName .. "_clown", {x, y, 2})
  -- Creates some random children (in the future it's going to be child or adult)
  events[#events + 1] = getRandomGenerator():create(baseName .. "_1", { x - 1, y + 2, 8})
  events[#events + 1] = getRandomGenerator():create(baseName .. "_2", { x, y + 2, 8})
  events[#events + 1] = getRandomGenerator():create(baseName .. "_3", { x + 1, y + 2, 8})
  events[#events + 1] = getRandomGenerator():create(baseName .. "_4", { x - 2, y, 6})
  events[#events + 1] = getRandomGenerator():create(baseName .. "_5", { x + 2, y, 4})
end

return clownSquad
