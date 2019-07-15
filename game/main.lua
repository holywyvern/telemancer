local screen = require("lib.screen")

local scene = require("managers.scene")

function love.load()
  screen.init(16 * 16, 16 * 9, true)
  scene:switch("splash")
end

function love.update(dt)
  scene:apply()
  scene:emit('update', dt)
end

function love.draw()
  screen.apply()
  scene:emit('draw')
  screen.cease()
end

function love.resize(width, height)
	screen.update(width, height)
end
