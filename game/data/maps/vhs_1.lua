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
  nextlayerid = 6,
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
      imageheight = 369,
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
      tiles = {
        {
          id = 10,
          properties = {
            ["stepName"] = "dirt"
          }
        }
      }
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
      opacity = 0.65,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      data = {
        89, 89, 89, 89, 89, 89, 89, 89, 89, 89, 89, 89, 89, 89, 89, 89,
        89, 89, 89, 89, 89, 89, 89, 78, 79, 79, 79, 79, 79, 79, 80, 89,
        89, 89, 89, 89, 89, 89, 89, 88, 148, 149, 149, 149, 149, 150, 90, 90,
        89, 89, 89, 89, 89, 89, 89, 88, 158, 159, 159, 159, 159, 160, 90, 90,
        89, 89, 89, 89, 89, 89, 89, 88, 168, 168, 168, 168, 168, 168, 90, 90,
        89, 89, 89, 89, 89, 89, 89, 88, 168, 168, 168, 168, 168, 90, 90, 90,
        89, 89, 89, 89, 89, 89, 89, 98, 99, 99, 99, 99, 109, 168, 90, 90,
        89, 89, 89, 89, 89, 89, 89, 89, 89, 89, 89, 89, 98, 99, 100, 90,
        89, 89, 89, 89, 89, 89, 89, 89, 89, 89, 89, 89, 89, 89, 89, 90
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
      opacity = 0.44,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      data = {
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 0,
        0, 21, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 21, 0,
        0, 21, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 21, 0,
        0, 21, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 21, 0,
        0, 21, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 21, 0,
        0, 21, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 21, 0,
        0, 21, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 21, 0,
        0, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 0
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
      id = 5,
      name = "collitions",
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
        0, 0, 0, 0, 0, 0, 4, 4, 4, 4, 4, 4, 4, 4, 10, 0,
        0, 0, 0, 0, 0, 0, 0, 4, 4, 4, 4, 4, 4, 4, 10, 0,
        0, 0, 0, 0, 0, 0, 0, 4, 0, 4, 0, 0, 4, 0, 10, 0,
        0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 4, 0, 4, 4, 10, 0,
        0, 0, 0, 0, 0, 0, 0, 4, 4, 4, 4, 4, 4, 4, 10, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 4, 10, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
      }
    }
  }
}
