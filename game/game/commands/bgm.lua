local Command = require("prototypes.command")

local audio = require("managers.audio")

local command = Command:extend()

function command:create(filename, options)
  local bgm = self:extend()
  bgm._bgm = filename
  bgm._opts = options
  return bgm
end

function command:start()
  audio:playBgm(self._bgm, self._opts)
end

return command
