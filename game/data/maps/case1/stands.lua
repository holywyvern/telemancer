return {
  version = "1.2",
  luaversion = "5.1",
  tiledversion = "1.2.4",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 16,
  height = 32,
  tilewidth = 16,
  tileheight = 16,
  nextlayerid = 6,
  nextobjectid = 1,
  properties = {
    ["tvWorld"] = true
  },
  tilesets = {
    {
      name = "telemancer",
      firstgid = 1,
      filename = "../../tilesets/telemancer.tsx",
      tilewidth = 16,
      tileheight = 16,
      spacing = 0,
      margin = 0,
      columns = 10,
      image = "../../../images/tilesets/all.png",
      imagewidth = 160,
      imageheight = 1120,
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
      tilecount = 700,
      tiles = {
        {
          id = 2,
          properties = {
            ["stepName"] = "stone"
          }
        },
        {
          id = 10,
          properties = {
            ["stepName"] = "dirt"
          }
        },
        {
          id = 11,
          properties = {
            ["stepName"] = "sand"
          }
        },
        {
          id = 12,
          properties = {
            ["stepName"] = "stone"
          }
        },
        {
          id = 19,
          properties = {
            ["stepName"] = "dirt"
          }
        },
        {
          id = 29,
          properties = {
            ["stepName"] = "dirt"
          }
        },
        {
          id = 39,
          properties = {
            ["stepName"] = "dirt"
          }
        },
        {
          id = 49,
          properties = {
            ["stepName"] = "dirt"
          }
        },
        {
          id = 59,
          properties = {
            ["stepName"] = "dirt"
          }
        },
        {
          id = 69,
          properties = {
            ["stepName"] = "dirt"
          }
        },
        {
          id = 128,
          properties = {
            ["stepName"] = "dirt"
          }
        },
        {
          id = 129,
          properties = {
            ["stepName"] = "sand"
          }
        },
        {
          id = 136,
          properties = {
            ["stepName"] = "sand"
          }
        },
        {
          id = 137,
          properties = {
            ["stepName"] = "sand"
          }
        },
        {
          id = 138,
          properties = {
            ["stepName"] = "dirt"
          }
        },
        {
          id = 139,
          properties = {
            ["stepName"] = "sand"
          }
        },
        {
          id = 167,
          properties = {
            ["stepName"] = "stone"
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
      height = 32,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      data = {
        11, 11, 11, 30, 12, 12, 12, 12, 12, 12, 12, 12, 60, 11, 11, 11,
        11, 11, 11, 30, 12, 12, 12, 12, 12, 12, 12, 12, 60, 11, 11, 11,
        11, 11, 11, 30, 12, 12, 12, 12, 12, 12, 12, 12, 60, 11, 11, 11,
        11, 11, 11, 30, 12, 12, 12, 12, 12, 12, 12, 12, 60, 11, 11, 11,
        11, 11, 11, 30, 12, 12, 12, 12, 12, 12, 12, 12, 60, 11, 11, 11,
        11, 11, 11, 30, 12, 12, 12, 12, 12, 12, 12, 12, 60, 11, 11, 11,
        11, 11, 11, 30, 12, 12, 12, 12, 12, 12, 12, 12, 60, 11, 11, 11,
        11, 11, 11, 30, 12, 12, 12, 12, 12, 12, 12, 12, 60, 11, 11, 11,
        11, 11, 11, 30, 12, 12, 12, 12, 12, 12, 12, 12, 60, 11, 11, 11,
        11, 11, 11, 30, 12, 12, 12, 12, 12, 12, 12, 12, 60, 11, 11, 11,
        11, 11, 11, 30, 12, 12, 12, 12, 12, 12, 12, 12, 60, 11, 11, 11,
        11, 11, 11, 30, 12, 12, 12, 12, 12, 12, 12, 12, 60, 11, 11, 11,
        11, 11, 11, 30, 12, 12, 12, 12, 12, 12, 12, 12, 60, 11, 11, 11,
        11, 11, 11, 30, 12, 12, 12, 12, 12, 12, 12, 12, 60, 11, 11, 11,
        11, 11, 11, 30, 12, 12, 12, 12, 12, 12, 12, 12, 60, 11, 11, 11,
        11, 11, 11, 30, 12, 12, 12, 12, 12, 12, 12, 12, 60, 11, 11, 11,
        11, 11, 11, 30, 12, 12, 12, 12, 12, 12, 12, 12, 60, 11, 11, 11,
        11, 11, 11, 30, 12, 12, 12, 12, 12, 12, 12, 12, 60, 11, 11, 11,
        11, 11, 11, 30, 12, 12, 12, 12, 12, 12, 12, 12, 60, 11, 11, 11,
        11, 11, 11, 30, 12, 12, 12, 12, 12, 12, 12, 12, 60, 11, 11, 11,
        11, 11, 11, 30, 12, 12, 12, 12, 12, 12, 12, 12, 60, 11, 11, 11,
        11, 11, 11, 30, 12, 12, 12, 12, 12, 12, 12, 12, 60, 11, 11, 11,
        11, 11, 11, 30, 12, 12, 12, 12, 12, 12, 12, 12, 60, 11, 11, 11,
        11, 11, 11, 30, 12, 12, 12, 12, 12, 12, 12, 12, 60, 11, 11, 11,
        11, 11, 11, 30, 12, 12, 12, 12, 12, 12, 12, 12, 60, 11, 11, 11,
        11, 11, 11, 30, 12, 12, 12, 12, 12, 12, 12, 12, 60, 11, 11, 11,
        11, 11, 11, 30, 12, 12, 12, 12, 12, 12, 12, 12, 60, 11, 11, 11,
        11, 11, 11, 30, 12, 12, 12, 12, 12, 12, 12, 12, 60, 11, 11, 11,
        11, 11, 11, 30, 12, 12, 12, 12, 12, 12, 12, 12, 60, 11, 11, 11,
        11, 11, 11, 30, 12, 12, 12, 12, 12, 12, 12, 12, 60, 11, 11, 11,
        11, 11, 11, 30, 12, 12, 12, 12, 12, 12, 12, 12, 60, 11, 11, 11,
        11, 11, 11, 30, 12, 12, 12, 12, 12, 12, 12, 12, 60, 11, 11, 11
      }
    },
    {
      type = "tilelayer",
      id = 2,
      name = "Tile Layer 2",
      x = 0,
      y = 0,
      width = 16,
      height = 32,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      data = {
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        213, 214, 214, 214, 214, 214, 215, 0, 0, 213, 214, 214, 214, 214, 214, 215,
        223, 0, 304, 305, 0, 0, 0, 0, 0, 0, 0, 0, 304, 305, 0, 225,
        223, 0, 304, 305, 0, 0, 0, 0, 0, 0, 0, 0, 304, 305, 0, 225,
        223, 0, 304, 305, 0, 0, 0, 0, 0, 0, 0, 0, 304, 305, 0, 225,
        223, 0, 304, 305, 0, 0, 0, 0, 0, 0, 0, 0, 304, 305, 0, 225,
        223, 0, 304, 305, 0, 0, 0, 0, 0, 0, 0, 0, 304, 305, 0, 225,
        223, 0, 304, 305, 0, 0, 0, 0, 0, 0, 0, 0, 304, 305, 0, 225,
        223, 0, 304, 305, 0, 0, 0, 0, 0, 0, 0, 0, 304, 305, 0, 225,
        223, 0, 304, 305, 0, 0, 0, 0, 0, 0, 0, 0, 304, 305, 0, 225,
        223, 0, 304, 305, 0, 0, 0, 0, 0, 0, 0, 0, 304, 305, 0, 225,
        223, 0, 304, 305, 0, 0, 0, 0, 0, 0, 0, 0, 304, 305, 0, 225,
        223, 0, 304, 305, 0, 0, 0, 0, 0, 0, 0, 0, 304, 305, 0, 225,
        223, 0, 304, 305, 0, 0, 0, 0, 0, 0, 0, 0, 304, 305, 0, 225,
        223, 0, 304, 305, 0, 0, 0, 0, 0, 0, 0, 0, 304, 305, 0, 225,
        223, 0, 304, 305, 0, 0, 0, 0, 0, 0, 0, 0, 304, 305, 0, 225,
        223, 0, 304, 305, 0, 0, 0, 0, 0, 0, 0, 0, 304, 305, 0, 225,
        223, 0, 304, 305, 0, 0, 0, 0, 0, 0, 0, 0, 304, 305, 0, 225,
        223, 0, 304, 305, 0, 0, 0, 0, 0, 0, 0, 0, 304, 305, 0, 225,
        223, 0, 304, 305, 0, 0, 0, 0, 0, 0, 0, 0, 304, 305, 0, 225,
        223, 0, 304, 305, 0, 0, 0, 0, 0, 0, 0, 0, 304, 305, 0, 225,
        223, 0, 304, 305, 0, 0, 0, 0, 0, 0, 0, 0, 304, 305, 0, 225,
        223, 0, 304, 305, 0, 0, 0, 0, 0, 0, 0, 0, 304, 305, 0, 225,
        223, 0, 304, 305, 0, 0, 0, 0, 0, 0, 0, 0, 304, 305, 0, 225,
        223, 0, 304, 305, 0, 0, 0, 0, 0, 0, 0, 0, 304, 305, 0, 225,
        223, 0, 314, 315, 0, 0, 0, 0, 0, 0, 0, 0, 314, 315, 0, 225,
        223, 0, 324, 325, 0, 0, 0, 0, 0, 0, 0, 0, 324, 325, 0, 225,
        223, 0, 292, 293, 0, 0, 0, 0, 0, 0, 0, 0, 292, 293, 0, 225,
        223, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 225,
        223, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 225,
        233, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 235,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
      }
    },
    {
      type = "tilelayer",
      id = 3,
      name = "Tile Layer 3",
      x = 0,
      y = 0,
      width = 16,
      height = 32,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      data = {
        0, 281, 0, 0, 0, 0, 223, 0, 0, 223, 0, 0, 0, 0, 0, 0,
        214, 0, 294, 295, 0, 0, 0, 0, 0, 0, 0, 0, 294, 295, 0, 214,
        0, 281, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 291, 0,
        0, 291, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 291, 0,
        0, 291, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 291, 0,
        0, 291, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 281, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 281, 0,
        214, 214, 214, 214, 214, 214, 215, 0, 0, 213, 214, 214, 214, 214, 214, 214,
        0, 0, 0, 0, 0, 0, 223, 0, 0, 225, 0, 0, 0, 0, 0, 0
      }
    },
    {
      type = "tilelayer",
      id = 4,
      name = "collitions",
      x = 0,
      y = 0,
      width = 16,
      height = 32,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      data = {
        10, 10, 10, 10, 10, 10, 10, 0, 0, 10, 10, 10, 10, 10, 10, 10,
        10, 10, 10, 10, 10, 10, 10, 0, 0, 10, 10, 10, 10, 10, 10, 10,
        10, 0, 10, 10, 0, 0, 0, 0, 0, 0, 0, 0, 10, 10, 0, 10,
        10, 0, 10, 10, 0, 0, 0, 0, 0, 0, 0, 0, 10, 10, 0, 10,
        10, 0, 10, 10, 0, 0, 0, 0, 0, 0, 0, 0, 10, 10, 0, 10,
        10, 0, 10, 10, 0, 0, 0, 0, 0, 0, 0, 0, 10, 10, 0, 10,
        10, 0, 10, 10, 0, 0, 0, 0, 0, 0, 0, 0, 10, 10, 0, 10,
        10, 0, 10, 10, 0, 0, 0, 0, 0, 0, 0, 0, 10, 10, 0, 10,
        10, 0, 10, 10, 0, 0, 0, 0, 0, 0, 0, 0, 10, 10, 0, 10,
        10, 0, 10, 10, 0, 0, 0, 0, 0, 0, 0, 0, 10, 10, 0, 10,
        10, 0, 10, 10, 0, 0, 0, 0, 0, 0, 0, 0, 10, 10, 0, 10,
        10, 0, 10, 10, 0, 0, 0, 0, 0, 0, 0, 0, 10, 10, 0, 10,
        10, 0, 10, 10, 0, 0, 0, 0, 0, 0, 0, 0, 10, 10, 0, 10,
        10, 0, 10, 10, 0, 0, 0, 0, 0, 0, 0, 0, 10, 10, 0, 10,
        10, 0, 10, 10, 0, 0, 0, 0, 0, 0, 0, 0, 10, 10, 0, 10,
        10, 0, 10, 10, 0, 0, 0, 0, 0, 0, 0, 0, 10, 10, 0, 10,
        10, 0, 10, 10, 0, 0, 0, 0, 0, 0, 0, 0, 10, 10, 0, 10,
        10, 0, 10, 10, 0, 0, 0, 0, 0, 0, 0, 0, 10, 10, 0, 10,
        10, 0, 10, 10, 0, 0, 0, 0, 0, 0, 0, 0, 10, 10, 0, 10,
        10, 0, 10, 10, 0, 0, 0, 0, 0, 0, 0, 0, 10, 10, 0, 10,
        10, 0, 10, 10, 0, 0, 0, 0, 0, 0, 0, 0, 10, 10, 0, 10,
        10, 0, 10, 10, 0, 0, 0, 0, 0, 0, 0, 0, 10, 10, 0, 10,
        10, 0, 10, 10, 0, 0, 0, 0, 0, 0, 0, 0, 10, 10, 0, 10,
        10, 0, 10, 10, 0, 0, 0, 0, 0, 0, 0, 0, 10, 10, 0, 10,
        10, 0, 10, 10, 0, 0, 0, 0, 0, 0, 0, 0, 10, 10, 0, 10,
        10, 0, 10, 10, 0, 0, 0, 0, 0, 0, 0, 0, 10, 10, 0, 10,
        10, 0, 10, 10, 0, 0, 0, 0, 0, 0, 0, 0, 10, 10, 0, 10,
        10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10,
        10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10,
        10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10,
        10, 10, 10, 10, 10, 10, 10, 0, 0, 10, 10, 10, 10, 10, 10, 10,
        10, 10, 10, 10, 10, 10, 10, 0, 0, 10, 10, 10, 10, 10, 10, 10
      }
    },
    {
      type = "objectgroup",
      id = 5,
      name = "characters",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      draworder = "topdown",
      properties = {},
      objects = {}
    }
  }
}
