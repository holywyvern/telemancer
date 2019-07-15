local baton = require "lib.baton"

local controls = baton.new {
  controls = {
    left = {'key:left', 'key:a', 'axis:leftx-', 'button:dpleft'},
    right = {'key:right', 'key:d', 'axis:leftx+', 'button:dpright'},
    up = {'key:up', 'key:w', 'axis:lefty-', 'button:dpup'},
    down = {'key:down', 'key:s', 'axis:lefty+', 'button:dpdown'},
    interact = {'key:x', 'button:a'},
    accept = {'key:x', 'button:a'},
    cancel = {'key:z', 'button:b'},
    menu = {'key:escape', 'key:return', 'button:start', 'button:y'},
  },
  pairs = {
    move = {'left', 'right', 'up', 'down'}
  },
  joystick = love.joystick.getJoysticks()[1],
}

return controls
