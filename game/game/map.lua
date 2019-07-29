local sti = require("lib.sti")
local newCamera = require("lib.stalkerx")
local moonshine = require("lib.moonshine")

local engine = require("config.engine")

local player = require("game.player")

local audio = require("managers.audio")

local currentMap, data, events, characters, eventData

local map = {}

local function sortCharacter(a, b)
  return (a._realY + a._z) < (b._realY + b._z)
end

function map:setup(name)
  self._chain = nil
  if currentMap ~= name then
    currentMap = name
    self:loadData()
    self:loadEvents()
    self:setupChain()
  end
	self._cam = newCamera(nil, nil, engine.game.width, engine.game.height)
  self._cam:setBounds(0, 0, self:getDimensions())
  self:update(0)
  if eventData and eventData.onEnter then
    eventData.onEnter()
  end
end

function map:playBgm()
  if data.properties.playingBgm then
    audio:playBgm(data.properties.playingBgm)
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
  local file = "data/events/" .. currentMap .. ".lua"
  eventData = assert(love.filesystem.load(file))()
  for _, event in ipairs(eventData) do
    events[#events + 1] = event
    characters[#characters + 1] = event
    events[event._name] = event
  end
end

function map:setupChain()
  if not self._chain then
    self._chain = moonshine(moonshine.effects.filmgrain)
                    .chain(moonshine.effects.scanlines)
                    .chain(moonshine.effects.chromasep)
                    
    self._chain.parameters = {
      scanlines = { width = 1, frequency = engine.game.height, opacity = 0.3 },
      chromasep = { angle = 0.3, radius = 3 }
    }
  end
  self:enableShaders()
end

function map:disableShaders()
  if not self._chain then return end
  self._chain.disable("desaturate", "chromasep", "scanlines", "filmgrain")
end

function map:enableShaders()
  if not self._chain then return end
  if data.properties.tvWorld then
    self._chain.enable("desaturate", "chromasep", "scanlines", "filmgrain")
  else
    self:disableShaders()
  end  
end

function map:update(dt)
  data:update(dt)
  for _, character in ipairs(characters) do
    character:update(dt)
  end
end

function map:draw()
  for _, layer in ipairs(data.layers) do
    if layer.name == 'characters' then
      self:drawCharacters()
    elseif layer.name == 'reflections' then
      self:drawReflections(layer.properties.offset or 16)
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

function map:drawReflections(offset)
  table.sort(characters, sortCharacter)
  for _, character in ipairs(characters) do
    character:drawReflection(offset)
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
  if map:_isASolidEventAt(x, y) then
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

function map:_isASolidEventAt(x, y)
  local list = self:getEventsAt(x, y)
  for _, event in ipairs(list) do
    if event._solid then
      return true
    end
  end
  return false
end

function map:getEventsAt(x, y)
  local result = {}
  for _, event in ipairs(events) do
    if event:isAt(x, y) then
      result[#result + 1] = event
    end
  end
  return result
end

function map:tilesAt(x, y)
  local result = {}
  for _, layer in ipairs(data.layers) do
    local data = layer and layer.data
    if data and data[y] and data[y][x] then
      result[#result + 1] = data[y][x]
    end
  end
  return result
end

function map:dumpSave(dump)
  local data = {}
  dump.map = data
  data.name = currentMap
  data.events = {}
  for i, event in ipairs(events) do
    data.events[i] = {event._x, event._y, event._d }
  end
end

function map:loadSave(dump)
  local data = dump.map
  map:setup(data.name)
  for i, position in ipairs(data.events) do
    if events[i] then
      events[i]:moveTo(unpack(position))
    end
  end
end

return map
