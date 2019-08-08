local base = require("prototypes.scene")

local manager = require("managers.scene")
local audio = require("managers.audio")
local engine = require("config.engine")

local fade = require("prototypes.transitions.fadeInOut")

local scene = base:extend()

function scene:enter(previous, ...)
  self._t = 0
  self._font = love.graphics.newFont("fonts/game.ttf", 16)
  audio:stopBgm()
  audio:playSe("natalies2.mp3")
end

function scene:draw()
  local scrollY = engine.game.height - (self._t - 1) * 64
  local txtTitle = "Dev"
  local txtDev = "Ramiro Rojo (RR)"
  local txtTitle2 = "Music"
  local txtMusic = "Ignacio Coluccio (Colulo)"
  local twTitle = self._font:getWidth(txtTitle) + 1
  local twDev = self._font:getWidth(txtDev) + 1
  local twTitle2 = self._font:getWidth(txtTitle2) + 1
  local twMusic = self._font:getWidth(txtMusic) + 1
  local xTitle, yTitle = math.floor((engine.game.width - twTitle) / 2), 30
  local xDev, yDev = math.floor((engine.game.width - twDev) / 2), 50
  local xTitle2, yTitle2 = math.floor((engine.game.width - twTitle2) / 2), 70
  local xMusic, yMusic = math.floor((engine.game.width - twMusic) / 2), 90
  love.graphics.setFont(self._font)
  love.graphics.setColor(0.5, 0.5, 0.5, 1)
  love.graphics.print(txtTitle, xTitle, yTitle + scrollY)
  love.graphics.print(txtDev, xDev, yDev + scrollY)
  love.graphics.print(txtTitle2, xTitle2, yTitle2 + scrollY)
  love.graphics.print(txtMusic, xMusic, yMusic + scrollY)
end

function scene:update(dt)
  self._t = self._t + dt
  if self._t > 10 and not self._do then
    manager:switch("title", { transition = fade:create(0.5) })
    self._do = true
  end
end

return scene
