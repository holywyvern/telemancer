local map = require("game.map")
local interpreter = require("game.interpreter")
local player = require("game.player")

local engine = require("config.engine")

local base = require("prototypes.scene")

local scene = base:extend()

function scene:start()
	map:playBgm()
end

function scene:update(dt)
	map:update(dt)
	map._cam:follow(player._realX, player._realY)
	map._cam:update(dt)
	interpreter:update(dt)
end

function scene:leave(next, ...)
	-- destroy entities and cleanup resources
end

function scene:draw()
	map._cam:attach()
		love.graphics.setColor(1, 1, 1, 1)
		map:draw()
	map._cam:detach()
	map._cam:draw()
	interpreter:draw()
end

return scene
