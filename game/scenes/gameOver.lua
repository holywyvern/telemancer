local base = require("prototypes.scene")

local manager = require("managers.scene")
local audio = require("managers.audio")

local fade = require("prototypes.transitions.fadeInOut")

local scene = base:extend()

function scene:enter(previous, ...)
  self._t = 0
  audio:stopBgm()
  audio:playSe("laugh.wav")
end

function scene:update(dt)
  self._t = self._t + dt
  if self._t > 5.5 and not self._do then
    manager:switch("title", { transition = fade:create(0.5) })
    self._do = true
  end
end

return scene
