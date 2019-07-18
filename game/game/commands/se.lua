local Command = require("prototypes.command")

local audio = require("managers.audio")

local command = Command:extend()

function command:create(filename)
  local se = self:extend()
  se._se = filename
  return se
end

function command:start()
  audio:playSe(self._se)
end

return command
