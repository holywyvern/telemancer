local map = require("game.map")

local scene = {}

function scene:enter(previous, ...)
end

function scene:update(dt)
	map:update(dt)
end

function scene:leave(next, ...)
	-- destroy entities and cleanup resources
end

function scene:draw()
	love.graphics.setColor(1, 1, 1, 1)
	map:draw()
end

return scene
