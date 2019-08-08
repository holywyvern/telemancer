local screen = require("lib.screen")

local scene = require("managers.scene")

local controls = require("config.controls")
local engine = require("config.engine")

local fade = require("prototypes.transitions.fade")

local map = require("game.map")

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

local function drawChain()
  love.graphics.clear(0, 0, 0)
  screen.apply()
    scene:drawScene()
  screen.cease()
end

function love.draw()
  if map._chain then
    map._chain(drawChain)
    screen.apply()
      scene:emit("drawHud")
    screen.cease()      
  else
    drawChain()
  end
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
