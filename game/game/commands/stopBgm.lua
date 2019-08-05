local Command = require("prototypes.command")

local audio = require("managers.audio")

local command = Command:extend()

function command:create()
  local bgm = self:extend()
  return bgm
end

function command:start()
  audio:stopBgm()
end

return command