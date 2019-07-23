local screen = require("lib.screen")

local scene = require("managers.scene")

local controls = require("config.controls")
local engine = require("config.engine")

function love.load()
  love.graphics.setDefaultFilter('linear','nearest')
  screen.init(engine.game.width, engine.game.height, true)
  scene:switch("splash")
end

function love.update(dt)
  controls:update(dt)
  scene:apply()
  scene:updateScene(dt)
end

function love.draw()
  screen.apply()
  scene:drawScene()
  screen.cease()
end

function love.resize(width, height)
	screen.update(width, height)
end

function love.keypressed(k)
  if k == 'escape' then
    love.event.quit()
  elseif k == 'f12' then
    love.event.quit( "restart" )
  end
end
