local base = require("prototypes.scene")

local manager = require("managers.scene")
local audio = require("managers.audio")
local engine = require("config.engine")

local fade = require("prototypes.transitions.fadeInOut")

local scene = base:extend()

function scene:enter(previous, ...)
  self._t = 0
  self._font = love.graphics.newFont("fonts/game.ttf", 16)
  audio:playSe("natalies2.mp3")
  audio:playBgm("credits.mp3")
end

function scene:draw()
  local scrollY = engine.game.height + 96 - (self._t - 1) * 64
  local txtTitle = "Dev"
  local txtDev = "Ramiro Rojo (RR)"
  local txtDev2 = "Gonzalo Leonel Gutierrez (Guty)"
  local txtTitle2 = "Music"
  local txtMusic = "Ignacio Coluccio (Colulo)"
  local twTitle = self._font:getWidth(txtTitle) + 1
  local twDev = self._font:getWidth(txtDev) + 1
  local twDev2 = self._font:getWidth(txtDev2) + 1
  local twTitle2 = self._font:getWidth(txtTitle2) + 1
  local twMusic = self._font:getWidth(txtMusic) + 1
  local xTitle, yTitle = math.floor((engine.game.width - twTitle) / 2), 30
  local xDev, yDev = math.floor((engine.game.width - twDev) / 2), 50
  local xDev2, yDev2 = math.floor((engine.game.width - twDev2) / 2), 70
  local xTitle2, yTitle2 = math.floor((engine.game.width - twTitle2) / 2), 100
  local xMusic, yMusic = math.floor((engine.game.width - twMusic) / 2), 120
  love.graphics.setFont(self._font)
  love.graphics.setColor(self:titleColor())
  love.graphics.print(txtTitle, xTitle, yTitle + scrollY)
  love.graphics.setColor(self:textColor())
  love.graphics.print(txtDev, xDev, yDev + scrollY)
  love.graphics.print(txtDev2, xDev2, yDev2 + scrollY)
  love.graphics.setColor(self:titleColor())
  love.graphics.print(txtTitle2, xTitle2, yTitle2 + scrollY)
  love.graphics.setColor(self:textColor())
  love.graphics.print(txtMusic, xMusic, yMusic + scrollY)
end

function scene:titleColor()
  return 0.6, 0.2, 0.5, 1
end

function scene:textColor()
  return 0.5, 0.5, 0.5, 1
end

function scene:update(dt)
  self._t = self._t + dt
  if self._t > 10 and not self._do then
    manager:switch("title", { transition = fade:create(0.5) })
    self._do = true
  end
end

return scene
