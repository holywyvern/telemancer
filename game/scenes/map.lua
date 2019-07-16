local map = require("game.map")
local Camera = require("lib.stalkerx")
local player = require("game.player")

local scene = {}

function scene:enter(previous, ...)
	self._cam = Camera(nil, nil, 16 * 16, 16 * 9)
	self._cam:setBounds(0, 0, map:getDimensions())
end

function scene:update(dt)
	map:update(dt)
	self._cam:follow(player._realX, player._realY)
	self._cam:update(dt)
end

function scene:leave(next, ...)
	-- destroy entities and cleanup resources
end

function scene:draw()
	self._cam:attach()
		love.graphics.setColor(1, 1, 1, 1)
		map:draw()
		self._cam:detach()
		self._cam:draw()
end

return scene
