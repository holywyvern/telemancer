local se = {}
local bgms = {}

local playingBgms = {}

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
  if src and src:isPlaying() then
    src:stop()
  end
  src = bgm[name] or love.audio.newSource("audio/bgm/" .. name, "stream")
  bgm[name] = src
  playingBgms[options.index] = src
  src:setLooping(true)
  setOptions(src, options)
  src:play()
end

return audio
