local Command = require("prototypes.command")

local audio = require("managers.audio")

local command = Command:extend()

function command:create(filename, options)
  local se = self:extend()
  se._se = filename
  se._opts = options
  return se
end

function command:start()
  audio:playSe(self._se, self._opts)
end

return command
