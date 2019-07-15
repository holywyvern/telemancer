local engine = {}

local character = require("prototypes.character")

function engine:newCharacter()
  return setmetatable({}, { __index = character })
end

return engine
