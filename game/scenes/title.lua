local game = require("managers.game")

local scene = {}

function scene:enter(previous, ...)
	game:clear()
end

function scene:update(dt)
	-- update entities
end

function scene:leave(next, ...)
	-- destroy entities and cleanup resources
end

function scene:draw()
	-- draw the level
end

return scene
