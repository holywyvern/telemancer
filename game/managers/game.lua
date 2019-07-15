local data = {}

local game = {}

function game:clear()
  data = {
    switches = {},
    variables = {}
  }
end

function game:switch(id, value)
  if value ~= nil then
    data.switches[id] = value and true
  end
  return data.switches[id]
end

function game:variable(id, value)
  if value ~= nil then
    data.variables[id] = value
  end
  return data.variables[id]
end

function game:data(value)
  if value then
    data = value
  end
  return data
end

return game
