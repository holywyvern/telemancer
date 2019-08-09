local map = require("game.map")
local interpreter = require("game.interpreter")
local player = require("game.player")

local engine = require("config.engine")

local base = require("prototypes.scene")

local cache = require("managers.cache")
local game = require("managers.game")

local scene = base:extend()

function scene:enter()
	self._net = cache:image("characters/case1/net_icon")
	self._font = love.graphics.newFont("fonts/game.ttf", 16)
end

function scene:start()
	map:playBgm()
	map:enableShaders()
end

function scene:update(dt)
	map:update(dt)
	map._cam:follow(math.ceil(player._realX), math.ceil(player._realY))
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

function scene:drawHud()
	if not game:switch('hasNet') then return end
	love.graphics.setColor(122 / 255, 9 / 255, 250 / 255, 1)
	love.graphics.rectangle("fill", 0, 9, 74, 6)
	love.graphics.circle("fill", 74, 12, 3)		
	love.graphics.setColor(52 / 255, 2 / 255, 106 / 255, 1)
	love.graphics.rectangle("fill", 0, 8, 74, 6)
	love.graphics.circle("fill", 74, 11, 3)
	love.graphics.setColor(1, 1, 1, 0.8)
	love.graphics.draw(self._net, 2, 2)
	love.graphics.setFont(self._font)
	love.graphics.setColor(0, 0, 0, 0.3)
	local formatted = string.format("X (%02d/%02d)", game:variable("clowns"), 30)
	love.graphics.print(formatted, 21, 0.8)
	love.graphics.setColor(1, 1, 1, 1)
	love.graphics.print(formatted, 20, 0)
end

return scene
