local cache = {}

local images = {}

function cache:image(name)
  if not images[name] then
    images[name] = love.graphics.newImage("images/" .. name .. ".png")
  end
  return images[name]
end

function cache:clear()
  for _, img in pairs(images) do
    img:release()
  end
  images = {}
end

return cache
