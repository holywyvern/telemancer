local base = require("prototypes.scene")

local manager = require("managers.scene")
local audio = require("managers.audio")
local engine = require("config.engine")

local fade = require("prototypes.transitions.fadeInOut")

local scene = base:extend()

local txtTitle = "Coding"
local txtDev = "Ramiro Rojo (RR)"
local txtDev2 = "Gonzalo Leonel Gutierrez (Guty)"
local txtTitle2 = "Music"
local txtMusic = "Ignacio Coluccio (Colulo)"
local txtTnks = "Special Thanks"
local txtTitle3 = "Sound effects"
local txtFree = "Freesound.com"
local thanks = {
  "Natalia Pastorutti (Nati <3)",
  "Soledad Pastorutti (Sole)",
  "Ariel Cid (Acid)",
  "Mom",
  "Dad",
  "Nicolás Zarewsky (Nicolás Zarewsky)",
  "Franco Prudhomme (Prudi)",
  "Leon Calermo (Lion)",
  "Manuel Tejedor (Manu)",
  "Gustavo Hernan Siciliano (Dictador Gus)",
  "Wolox",
}
local speed = 32

local txtYou = "And YOU"

function scene:enter(previous, ...)
  self._t = 0
  self._font = love.graphics.newFont("fonts/game.ttf", 16)
  audio:playSe("natalies2.mp3")
  audio:playBgm("credits.mp3")
end

function scene:draw()
  local scrollY = engine.game.height + 96 - (self._t - 1) * speed
  local twTitle = self._font:getWidth(txtTitle) + 1
  local twDev = self._font:getWidth(txtDev) + 1
  local twDev2 = self._font:getWidth(txtDev2) + 1
  local twTitle2 = self._font:getWidth(txtTitle2) + 1
  local twTitle3 = self._font:getWidth(txtTitle3) + 1
  local twMusic = self._font:getWidth(txtMusic) + 1
  local twTkT = self._font:getWidth(txtTnks) + 1
  local twYou = self._font:getWidth(txtYou) + 1
  local twFree = self._font:getWidth(txtFree) + 1
  local twThnks = {}
  local xThnks = {}
  local yThnks = {}
  for i, txt in ipairs(thanks) do
    w = self._font:getWidth(txt)
    twThnks[i] = w
    xThnks[i] = math.floor((engine.game.width - w) / 2)
    yThnks[i] = 210 + 20 * i
  end
  local xTitle, yTitle = math.floor((engine.game.width - twTitle) / 2), 30
  local xDev, yDev = math.floor((engine.game.width - twDev) / 2), 50
  local xDev2, yDev2 = math.floor((engine.game.width - twDev2) / 2), 70
  local xTitle2, yTitle2 = math.floor((engine.game.width - twTitle2) / 2), 100
  local xMusic, yMusic = math.floor((engine.game.width - twMusic) / 2), 120
  local xTitle3, yTitle3 = math.floor((engine.game.width - twTitle3) / 2), 160
  local xFree, yFree = math.floor((engine.game.width - twFree) / 2), 180
  local xTkt, yTkt = math.floor((engine.game.width - twTkT) / 2), 210
  local xYou, yYou = math.floor((engine.game.width - twYou) / 2), yThnks[#yThnks] + 90
  love.graphics.setFont(self._font)
  love.graphics.setColor(self:titleColor())
  love.graphics.print(txtTitle, xTitle, yTitle + scrollY)
  love.graphics.print(txtTitle2, xTitle2, yTitle2 + scrollY)
  love.graphics.print(txtTitle3, xTitle3, yTitle3 + scrollY)
  love.graphics.print(txtTnks, xTkt, yTkt + scrollY)
  love.graphics.setColor(self:textColor())
  love.graphics.print(txtDev, xDev, yDev + scrollY)
  love.graphics.print(txtDev2, xDev2, yDev2 + scrollY)  
  love.graphics.print(txtMusic, xMusic, yMusic + scrollY)
  love.graphics.print(txtFree, xFree, yFree + scrollY)
  for i, txt in ipairs(thanks) do
    love.graphics.print(txt, xThnks[i], yThnks[i] + scrollY)  
  end
  love.graphics.print(txtYou, xYou, yYou + scrollY)
end

function scene:titleColor()
  return 0.6, 0.2, 0.5, 1
end

function scene:textColor()
  return 0.5, 0.5, 0.5, 1
end

function scene:update(dt)
  self._t = self._t + dt
  if self._t > self:maxT() and not self._do then
    manager:switch("title", { transition = fade:create(0.5) })
    self._do = true
  end
end

function scene:maxT()
  return (2 * engine.game.height + 20 * (#thanks + 10) + 120) / speed
end

return scene
