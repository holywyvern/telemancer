local scene = {}

function scene:enter(previous, ...)
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
