local interpreter = require("game.interpreter")
local player = require("game.player")
local game = require("managers.game")

local door = require("prototypes.events.door")
local tvGate = require("prototypes.events.tvGate")
local event = require("prototypes.event")
local kid = require("prototypes.events.endingKid")
local fade = require("prototypes.transitions.fade")

local momPosition = {3, 5, 2}
local off = true

if game:switch("bossStart") then
  momPosition = {14, 4, 2}
  off = false
end

local tv = tvGate:create('tv', {15, 3}, { map="case1/entrance", pos={14, 12, 2} }, { off = off })
local mom = event:create('mom', 'case1/mom.png', momPosition, { _clearsAnimation = true })
local boy = kid:create({13, 4, 2})

tv:addCommand("bgm", "case1/entrance.mp3")

local events = {
  door:create('nowhere', 'basic', {2, 3}),
  tv,
  mom,
  boy,
}

local function bowMom()
  interpreter:addCommand("props", mom, { _i = 0, _j = 1, _directFrame = true })
  interpreter:addCommand("wait", 0.4)
  interpreter:addCommand("prop", mom, "_i", 1)
  interpreter:addCommand("wait", 0.4)
  interpreter:addCommand("prop", mom, "_i", 0)
  interpreter:addCommand("prop", mom, "_directFrame", false)  
end

local function playEnding()
  interpreter:startWork()
  interpreter:addCommand("move", player, 2, true)
  interpreter:addCommand("move", player, 4, true)
  interpreter:addCommand("face", player, 8)
  interpreter:addCommand("wait", 1)
  bowMom()
  interpreter:addCommand("wait", 1)
  interpreter:addCommand("stop")
  interpreter:addCommand("move", player, 4, true)
  interpreter:addCommand("move", player, 8, true)
  interpreter:addCommand("face", player, 2)
  interpreter:addCommand("prop", boy, "_opacity", 1)
  interpreter:addCommand("prop", player, "_opacity", 0)
  interpreter:addCommand("setImage", player, "hero")
  interpreter:addCommand("moveTo", player, {13,5,8})
  interpreter:addCommand("prop", boy, "_i", 4)
  interpreter:addCommand("wait", 0.2)
  interpreter:addCommand("prop", boy, "_i", 3)
  interpreter:addCommand("wait", 0.2)
  interpreter:addCommand("props", player, { _directFrame = true, _i = 2, _j = 5 })
  interpreter:addCommand("wait", 0.2)
  for i=1,5,1 do
    interpreter:addCommand("prop", player, "_opacity", i/5)
    interpreter:addCommand("wait", 0.2)
  end
  interpreter:addCommand("prop", boy, "_i", 3)
  interpreter:addCommand("prop", player, "_i", 1)
  interpreter:addCommand("wait", 0.2)
  interpreter:addCommand("prop", boy, "_i", 2)
  interpreter:addCommand("prop", player, "_i", 0)
  interpreter:addCommand("wait", 0.2)
  interpreter:addCommand("props", player, { _i = 1, _j = 4, _d = 8})
  interpreter:addCommand("wait", 0.2)
  interpreter:addCommand("props", player, { _directFrame = false })
  bowMom()
  interpreter:addCommand("wait", 0.2)
  interpreter:addCommand("move", player, 2, true)
  interpreter:addCommand("move", player, 2, true)
  for _ = 1, 10, 1 do
    interpreter:addCommand("move", player, 4, true)
  end
  interpreter:addCommand("move", player, 2, true)
  interpreter:addCommand("se", "doors/basic/open.wav")
  interpreter:addCommand("wait", 1)
  for i=4,0,-1 do
    interpreter:addCommand("prop", player, "_opacity", i/5)
    interpreter:addCommand("wait", 0.2)
  end
  interpreter:addCommand("se", "doors/basic/close.wav")
  interpreter:addCommand("wait", 0.5)
  interpreter:addCommand("scene", "credits", { transition = fade:create(0.3) })
end

function events.onEnter()
  if game:switch("bossStart") then
    game:switch("hasNet", false)
    playEnding()
    return
  end   
  player._opacity = 0
  interpreter:startWork() 
  for _ = 1, 3, 1 do
    interpreter:addCommand("se", "knock.wav")
    interpreter:addCommand("wait", 0.2)
  end
  for _ = 1, 3, 1 do
    interpreter:addCommand("move", mom, 2, true)
  end
  interpreter:addCommand("se", "doors/basic/open.wav")
  interpreter:addCommand("wait", 1)
  interpreter:addCommand("move", mom, 8, true)
  interpreter:addCommand("face", mom, 2)
  interpreter:addCommand("wait", 0.3)
  for i = 1, 4, 1 do
    interpreter:addCommand("prop", player, "_opacity", i / 4)
    interpreter:addCommand("wait", 0.1)
  end
  interpreter:addCommand("se", "doors/basic/close.wav")
  interpreter:addCommand("wait", 0.5)
  bowMom()

  interpreter:addCommand("move", mom, 6, false)
  interpreter:addCommand("move", player, 8, true)

  for _= 1, 9, 1 do
    interpreter:addCommand("move", mom, 6, false)
    interpreter:addCommand("move", player, 6, true)
  end

  interpreter:addCommand("move", mom, 8, false)
  interpreter:addCommand("move", player, 6, true)
  interpreter:addCommand("move", mom, 8, false)
  interpreter:addCommand("move", player, 8, true)
  interpreter:addCommand("move", mom, 8, false)
  interpreter:addCommand("move", player, 8, true)
  interpreter:addCommand("wait", 0.5)

  interpreter:addCommand("face", mom, 2)
  interpreter:addCommand("wait", 0.1)
  interpreter:addCommand("props", mom, { _i = 2, _j = 1, _directFrame = true })
  interpreter:addCommand("props", player, { _i = 0, _j = 4, _directFrame = true })
  interpreter:addCommand("wait", 0.5)
  interpreter:addCommand("props", mom, { _i = 0, _j = 1, _solid=true })
  interpreter:addCommand("prop", player, "_directFrame", false)
  interpreter:addCommand("wait", 0.1)
  interpreter:addCommand("move", player, 6, true)
  interpreter:addCommand("move", player, 6, true)
  interpreter:addCommand("move", player, 8, true)
  interpreter:addCommand("props", tv, { _i = 0, _j = 0, _directFrame=true })
  interpreter:addCommand("wait", 0.1)
  interpreter:addCommand("prop", tv, "_i", 1)
  interpreter:addCommand("wait", 0.1)
  interpreter:addCommand("prop", tv, "_i", 2)
  interpreter:addCommand("wait", 0.1)
  interpreter:addCommand("props", tv, { _d=6, _opts={ fuzzy=true }, _directFrame=false })
  interpreter:addCommand("prop", tv, "_standingAnimation", true)
  interpreter:addCommand("move", player, 6, true)
  interpreter:addCommand("face", player, 8)
  interpreter:addCommand("props", player, { _i = 0, _j = 4, _directFrame = true })
  interpreter:addCommand("wait", 0.5)
  interpreter:addCommand("se", "vhs_in.wav")
  interpreter:addCommand("wait", 1)
  interpreter:addCommand("prop", player, "_directFrame", false)
  interpreter:addCommand("wait", 3)
  interpreter:addCommand("props", tv, { _d=4, _opts={} })
  interpreter:addCommand("wait", 0.1)
  interpreter:addCommand("move", player, 4, true)
  interpreter:addCommand("face", player, 8)
  interpreter:addCommand("call", tv)
  
end

return events