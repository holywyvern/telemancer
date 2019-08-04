local se = {}
local bgms = {}

local playingBgms = {}
local playingBgmsNames = {}

local audio = {}

function audio:clear()
  se = {}
  bgm = {}
end

local function getAudioOptions(options)
  options = options or {}
  options.volume = options.volume or 1
  options.pitch = options.pitch or 1
  options.index = options.index or 1
  return options  
end

local function setOptions(src, options)
  src:setVolume(options.volume)
  src:setPitch(options.pitch)
end

function audio:playSe(name, options)
  options = getAudioOptions(options)
  local src = se[name]
  if src and src:isPlaying() then
    src = love.audio.newSource("audio/se/" .. name, "static")
  else
    src = love.audio.newSource("audio/se/" .. name, "static")
    se[name] = src
  end
  setOptions(src, options)
  src:play()
end

function audio:playBgm(name, options)
  options = getAudioOptions(options)
  local src = playingBgms[options.index]
  local different = src ~= bgms[name]
  if src and different then
    src:stop()
  end
  src = bgms[name] or love.audio.newSource("audio/bgm/" .. name, "stream")
  bgms[name] = src
  playingBgms[options.index] = src
  playingBgmsNames[options.index] = {name, options, true}
  src:setLooping(true)
  setOptions(src, options)
  src:play()
end

function audio:playBgmOnce(name, options)
  options = getAudioOptions(options)
  local src = playingBgms[options.index]
  if src and src:isPlaying() then
    src:stop()
  end
  src = bgms[name] or love.audio.newSource("audio/bgm/" .. name, "stream")
  bgms[name] = src
  playingBgms[options.index] = src
  playingBgmsNames[options.index] = {name, options, false}
  src:setLooping(false)
  setOptions(src, options)
  src:play()  
end

function audio:dumpSave(dump)
  local save = {}
  for key, data in pairs(playingBgmsNames) do
    local src = playingBgms[key]
    save[key] = {data, src:tell()}
  end
  dump.audio = save
end

function audio:loadSave(dump)
  for key, data in pairs(dump.audio) do
      if data[1][3] then
        self:playBgm(unpack(data[1]))
      else
        self:playBgmOnce(unpack(data[1]))
      end
      playingBgms[key]:seek(data[2])
  end
end

function audio:stopBgm()
  for _, bgm in pairs(playingBgms) do
    bgm:stop()
  end
  playingBgms = {}
  playingBgmsNames = {}
end

return audio
