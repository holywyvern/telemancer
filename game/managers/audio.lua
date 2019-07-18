local se = {}
local bgm = {}

local audio = {}

function audio:clear()
  se = {}
  bgm = {}
end

function audio:playSe(name)
  local src = se[name]
  if src and src:isPlaying() then
    src = love.audio.newSource("audio/se/" .. name, "static")
  else
    src = love.audio.newSource("audio/se/" .. name, "static")
    se[name] = src
  end
  src:play()
end

return audio
