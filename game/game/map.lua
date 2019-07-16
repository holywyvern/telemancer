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
    else
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

return map
