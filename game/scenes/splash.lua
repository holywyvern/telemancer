local save = require("managers.save")
local game = require("managers.game")
local audio = require("managers.audio")

local map = require("game.map")

local fade = require("prototypes.transitions.fade")

local manager = require("managers.scene")

local base = require("prototypes.scene")

local scene = base:extend()

function scene:enter(previous, ...)
  self.state = 'enter'
  self.timing = 0
  self.splash = love.graphics.newImage("images/system/splash.png")
end

function scene:start()
  map:disableShaders()
end

function scene:update(dt)
  if self.state == 'enter' then
    self:updateEntering(dt)
  elseif self.state == 'stay' then
    self:updateStaying(dt)
  else
    self:updateExit(dt)
  end
end

function scene:updateEntering(dt)
  if self.timing >= 1 then
    self.state = 'stay'
    self.timing = 2
    self:playSe()
  else
    self.timing = self.timing + dt * 2
  end  
end

function scene:playSe()
  audio:playSe("natalios.mp3", { volume = 0.9 })
  audio:playSe("natalias.mp3", { volume = 0.9 })
  audio:playSe("natalies.mp3", { volume = 0.6 })
  audio:playSe("natalies2.mp3", { volume = 0.6 })
end

function scene:updateStaying(dt)
  if self.timing <= 0 then
    self.timing = 1
    self.state = 'exit'
  else
    self.timing = self.timing - dt
  end
end

function scene:updateExit(dt)  
  if self.timing <= 0 then
    self.timing = 0
    self.state = 'finish'
    manager:switch(self:nextScene(), { transition = fade:create(0.5) })
  else
    self.timing = self.timing - dt * 2
  end
end

function scene:nextScene()
  if save:exists() then
    return 'title'
  else
    game:clear()
    return 'map'
  end
end

function scene:leave(next, ...)
	self.splash:release()
end

function scene:draw()
  if self.state == 'exit' then
    return
  end
  love.graphics.push()
  love.graphics.setColor(1, 1, 1, self.timing)
  love.graphics.draw(self.splash)
  love.graphics.pop()
end

return scene
