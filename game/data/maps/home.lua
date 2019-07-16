return {
  version = "1.2",
  luaversion = "5.1",
  tiledversion = "1.2.4",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 16,
  height = 9,
  tilewidth = 16,
  tileheight = 16,
  nextlayerid = 5,
  nextobjectid = 1,
  properties = {},
  tilesets = {
    {
      name = "telemancer",
      firstgid = 1,
      filename = "../tilesets/telemancer.tsx",
      tilewidth = 16,
      tileheight = 16,
      spacing = 1,
      margin = 0,
      columns = 10,
      image = "../../images/tilesets/all.png",
      imagewidth = 169,
      imageheight = 356,
      tileoffset = {
        x = 0,
        y = 0
      },
      grid = {
        orientation = "orthogonal",
        width = 16,
        height = 16
      },
      properties = {},
      terrains = {},
      tilecount = 210,
      tiles = {}
    }
  },
  layers = {
    {
      type = "tilelayer",
      id = 1,
      name = "Tile Layer 1",
      x = 0,
      y = 0,
      width = 16,
      height = 9,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      data = {
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 21, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 23, 0,
        0, 31, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 33, 0,
        0, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 0,
        0, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 0,
        0, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 0,
        0, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 0,
        0, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
      }
    },
    {
      type = "tilelayer",
      id = 2,
      name = "Tile Layer 2",
      x = 0,
      y = 0,
      width = 16,
      height = 9,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      data = {
        78, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 79, 80,
        88, 0, 104, 44, 74, 76, 77, 127, 1, 0, 0, 0, 0, 104, 0, 90,
        88, 0, 114, 54, 55, 86, 87, 125, 126, 121, 122, 124, 123, 114, 0, 90,
        88, 0, 0, 64, 65, 96, 97, 135, 136, 131, 132, 134, 133, 0, 0, 90,
        88, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 90,
        88, 0, 81, 25, 83, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 90,
        88, 0, 91, 92, 93, 0, 0, 141, 157, 0, 0, 0, 0, 0, 108, 90,
        88, 0, 101, 102, 103, 0, 0, 151, 152, 0, 0, 0, 0, 0, 118, 90,
        98, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 99, 100
      }
    },
    {
      type = "objectgroup",
      id = 4,
      name = "characters",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      draworder = "topdown",
      properties = {},
      objects = {}
    },
    {
      type = "tilelayer",
      id = 3,
      name = "Tile Layer 3",
      x = 0,
      y = 0,
      width = 16,
      height = 9,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      data = {
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 121, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 131, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 81, 82, 83, 0, 0, 0, 147, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 91, 92, 93, 0, 0, 0, 142, 143, 0, 0, 0, 0, 108, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 153, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
      }
    }
  }
}
