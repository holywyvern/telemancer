local engine = require("config.engine")

function love.conf(t)
  t.identity = "holywyvern_telemancer"

  t.console = true
  t.window.title = "Telemancer"
  t.window.width  = engine.game.width * engine.screen.initialScale
  t.window.height = engine.game.height * engine.screen.initialScale
  t.window.resizable = true
  t.window.minwidth = engine.game.width
  t.window.minheight = engine.game.height
end
