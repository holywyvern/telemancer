return {
  version = "1.2",
  luaversion = "5.1",
  tiledversion = "1.2.4",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 19,
  height = 13,
  tilewidth = 16,
  tileheight = 16,
  nextlayerid = 4,
  nextobjectid = 1,
  properties = {},
  tilesets = {
    {
      name = "telemancer",
      firstgid = 1,
      filename = "../tilesets/telemancer.tsx",
      tilewidth = 16,
      tileheight = 16,
      spacing = 0,
      margin = 0,
      columns = 10,
      image = "../../images/tilesets/all.png",
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
      id = 2,
      name = "Tile Layer 1",
      x = 0,
      y = 0,
      width = 19,
      height = 13,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      data = {
        13, 13, 13, 13, 13, 13, 13, 13, 61, 62, 63, 13, 13, 13, 13, 13, 13, 13, 13,
        13, 13, 13, 13, 13, 13, 13, 13, 61, 62, 63, 13, 13, 13, 13, 13, 13, 13, 13,
        13, 13, 13, 13, 13, 57, 57, 13, 61, 62, 63, 13, 13, 13, 13, 13, 13, 13, 13,
        13, 13, 13, 13, 13, 67, 67, 13, 61, 62, 63, 13, 13, 13, 13, 13, 13, 13, 13,
        13, 13, 13, 13, 13, 13, 13, 13, 61, 62, 63, 13, 13, 13, 13, 13, 13, 13, 13,
        71, 71, 71, 71, 71, 71, 71, 71, 42, 62, 43, 71, 71, 71, 71, 71, 71, 71, 71,
        72, 72, 72, 72, 72, 72, 72, 72, 72, 41, 72, 72, 72, 72, 72, 72, 72, 72, 72,
        73, 73, 73, 73, 73, 73, 73, 73, 52, 62, 53, 73, 73, 73, 73, 73, 73, 73, 73,
        13, 13, 13, 13, 13, 13, 13, 13, 61, 62, 63, 13, 13, 13, 13, 13, 13, 13, 13,
        13, 13, 13, 13, 13, 13, 13, 13, 61, 62, 63, 13, 13, 13, 13, 13, 13, 13, 13,
        13, 13, 13, 13, 11, 11, 13, 13, 61, 62, 63, 13, 13, 13, 13, 13, 13, 13, 13,
        13, 11, 13, 13, 13, 11, 13, 13, 61, 62, 63, 13, 13, 13, 13, 13, 13, 13, 13,
        13, 13, 13, 13, 13, 13, 13, 13, 61, 62, 63, 13, 13, 13, 13, 13, 13, 13, 13
      }
    },
    {
      type = "tilelayer",
      id = 3,
      name = "Tile Layer 2",
      x = 0,
      y = 0,
      width = 19,
      height = 13,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      data = {
        57, 39, 59, 49, 57, 57, 39, 59, 0, 0, 0, 46, 48, 56, 39, 58, 56, 39, 57,
        57, 29, 58, 56, 39, 29, 29, 58, 0, 0, 0, 56, 59, 49, 57, 59, 49, 57, 57,
        39, 57, 59, 49, 29, 44, 45, 59, 0, 0, 0, 49, 58, 56, 39, 58, 56, 29, 57,
        57, 39, 58, 66, 67, 54, 55, 68, 0, 0, 0, 49, 59, 66, 67, 68, 49, 57, 29,
        67, 67, 68, 0, 0, 64, 65, 0, 0, 0, 45, 66, 68, 0, 0, 0, 66, 67, 67,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        26, 27, 28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 26, 27, 27, 28, 0,
        36, 37, 38, 26, 27, 27, 28, 0, 0, 0, 0, 0, 0, 0, 36, 37, 37, 38, 26,
        46, 47, 48, 36, 37, 37, 38, 0, 0, 0, 0, 0, 0, 0, 36, 37, 37, 38, 36,
        49, 57, 59, 46, 47, 47, 48, 0, 0, 0, 0, 26, 27, 28, 46, 47, 47, 48, 46,
        56, 39, 59, 56, 39, 57, 59, 0, 0, 0, 0, 36, 37, 38, 56, 39, 57, 59, 56,
        49, 57, 59, 49, 57, 57, 59, 0, 0, 0, 0, 46, 47, 48, 49, 29, 29, 58, 56
      }
    }
  }
}
