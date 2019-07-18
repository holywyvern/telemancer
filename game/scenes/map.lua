local map = require("game.map")

local player = require("game.player")
local engine = require("config.engine")

local scene = {}

function scene:update(dt)
	map:update(dt)
	map._cam:follow(player._realX, player._realY)
	map._cam:update(dt)
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
end

return scene
