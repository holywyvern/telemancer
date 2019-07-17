local sti = require("lib.sti")

local player = require("game.player")
local interpreter = require("game.interpreter")

local currentMap, data, events, characters

local map = {}

local function sortCharacter(a, b)
  return a._realY < b._realY
end

function map:setup(name)
  if currentMap ~= name then
    currentMap = name
    self:loadData()
    self:loadEvents()
  end
end

function map:loadData()
  local filename = "data/maps/" .. currentMap .. ".lua"
  data = sti(filename)
  if not data then
    error("Coudn't load map '" .. filename .. "'")
  end
end

function map:loadEvents()
  events = {}
  characters = { player }
  local eventData = require("data.events." .. currentMap)
  for _, event in ipairs(eventData) do
    events[#events + 1] = event
    characters[#characters + 1] = event
    events[event._name] = event
  end
end

function map:update(dt)
  data:update(dt)
  interpreter:update(dt)
  for _, character in ipairs(characters) do
    character:update(dt)
  end
end

function map:draw()
  for _, layer in ipairs(data.layers) do
    if layer.name == 'characters' then
      self:drawCharacters()
    elseif layer.name ~= 'collitions' then
      layer:draw()
    end
  end
end

function map:drawCharacters()
  table.sort(characters, sortCharacter)
  for _, character in ipairs(characters) do
    character:draw()
  end
end

function map:isPassable(x, y, direction)
  local collitions = data.layers.collitions
  if not collitions then
    return true
  end
  x, y = self:_calculatePosition(x, y, direction)
  if x < 1 or x > data.width then
    return false
  end
  if y < 1 or y > data.height then
    return false
  end
  return not collitions.data[y][x]
end

function map:_calculatePosition(x, y, direction)
  if direction == 2 then
    return x, y + 1
  elseif direction == 4 then
    return x - 1, y
  elseif direction == 6 then
    return x + 1, y
  elseif direction == 8 then
    return x, y - 1
  end
  return x, y
end

function map:getDimensions()
  return data.width * data.tilewidth, data.height * data.tileheight
end

function map:getTileSize()
  return data.tilewidth, data.tileheight
end

function map:callEventsAt(x, y)
  for _, event in ipairs(events) do
    if event._interactive and event:isAt(x, y) then
      event:call()
    end
  end
end

return map
