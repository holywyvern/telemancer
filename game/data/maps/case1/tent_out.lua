return {
  version = "1.2",
  luaversion = "5.1",
  tiledversion = "1.2.4",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 16,
  height = 18,
  tilewidth = 16,
  tileheight = 16,
  nextlayerid = 9,
  nextobjectid = 1,
  properties = {},
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
      imageheight = 1888,
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
      tilecount = 1180,
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
      height = 18,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      data = {
        11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11,
        11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11,
        11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11,
        11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11,
        11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11,
        11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11,
        11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11,
        11, 11, 11, 11, 30, 12, 12, 11, 11, 11, 11, 11, 11, 11, 11, 11,
        11, 11, 11, 11, 30, 12, 12, 11, 11, 11, 11, 11, 11, 11, 11, 11,
        11, 11, 11, 11, 30, 12, 12, 12, 11, 11, 11, 11, 11, 11, 11, 11,
        11, 11, 11, 30, 12, 12, 12, 12, 11, 11, 11, 11, 11, 11, 11, 11,
        11, 11, 11, 30, 12, 12, 12, 11, 11, 11, 11, 11, 11, 11, 11, 11,
        11, 11, 11, 30, 12, 12, 12, 11, 11, 11, 11, 11, 11, 11, 11, 11,
        11, 11, 11, 11, 30, 12, 12, 12, 12, 11, 11, 12, 12, 11, 11, 11,
        11, 11, 11, 11, 30, 12, 12, 12, 12, 12, 12, 12, 12, 60, 11, 11,
        11, 11, 11, 11, 30, 12, 12, 12, 12, 12, 12, 12, 12, 60, 11, 11,
        11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 12, 12, 137, 60, 11, 11,
        11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 30, 60, 11, 11
      }
    },
    {
      type = "tilelayer",
      id = 2,
      name = "Tile Layer 2",
      x = 0,
      y = 0,
      width = 16,
      height = 18,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      data = {
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        213, 214, 214, 214, 214, 214, 214, 214, 214, 214, 214, 214, 214, 214, 214, 215,
        223, 281, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 223,
        223, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 281, 0, 223,
        223, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 223,
        223, 0, 0, 0, 0, 0, 0, 12, 60, 0, 0, 0, 0, 0, 0, 223,
        223, 0, 0, 0, 0, 0, 0, 12, 60, 0, 291, 0, 0, 0, 0, 223,
        223, 0, 291, 20, 138, 0, 0, 12, 60, 0, 0, 0, 0, 0, 0, 223,
        223, 0, 0, 0, 0, 0, 140, 139, 70, 0, 0, 0, 0, 281, 0, 223,
        223, 0, 0, 0, 0, 0, 60, 0, 0, 0, 0, 0, 0, 0, 0, 223,
        223, 0, 20, 138, 12, 0, 60, 0, 0, 0, 20, 129, 50, 291, 0, 223,
        223, 0, 40, 139, 137, 0, 130, 129, 50, 0, 30, 12, 130, 50, 0, 223,
        223, 0, 0, 0, 0, 0, 0, 0, 130, 129, 138, 12, 0, 0, 0, 223,
        223, 291, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12, 0, 0, 0, 223,
        223, 0, 0, 0, 0, 139, 139, 139, 139, 139, 139, 139, 137, 0, 0, 223,
        233, 214, 214, 214, 214, 214, 214, 214, 214, 214, 214, 214, 30, 0, 203, 214
      }
    },
    {
      type = "tilelayer",
      id = 3,
      name = "Tile Layer 3",
      x = 0,
      y = 0,
      width = 16,
      height = 18,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      data = {
        0, 176, 177, 178, 179, 180, 256, 257, 258, 259, 260, 0, 0, 0, 0, 0,
        0, 186, 187, 188, 189, 190, 266, 267, 268, 269, 270, 0, 0, 0, 0, 0,
        0, 196, 197, 198, 199, 200, 276, 277, 278, 279, 280, 0, 0, 0, 0, 0,
        0, 206, 207, 208, 209, 210, 286, 287, 288, 289, 273, 274, 0, 0, 0, 0,
        0, 216, 217, 218, 219, 220, 296, 297, 298, 299, 283, 284, 0, 0, 0, 0,
        0, 226, 227, 228, 229, 230, 306, 307, 308, 309, 310, 0, 0, 0, 0, 0,
        0, 236, 237, 238, 239, 240, 316, 317, 318, 319, 320, 0, 0, 0, 0, 0,
        0, 246, 247, 248, 249, 250, 326, 327, 328, 329, 330, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 273, 274, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 283, 284, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 273, 274, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 283, 284, 0, 0, 0, 0, 0, 0,
        0, 0, 273, 274, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 283, 284, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
      }
    },
    {
      type = "tilelayer",
      id = 6,
      name = "Tile Layer 5",
      x = 0,
      y = 0,
      width = 16,
      height = 18,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      data = {
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
      }
    },
    {
      type = "objectgroup",
      id = 7,
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
      id = 8,
      name = "over",
      x = 0,
      y = 0,
      width = 16,
      height = 18,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      data = {
        0, 0, 0, 0, 0, 0, 0, 0, 0, 242, 243, 244, 245, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 252, 253, 254, 255, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 262, 263, 264, 265, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 272, 0, 0, 275, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 242, 243, 244, 245, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 252, 253, 254, 255, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 262, 263, 264, 265, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 272, 0, 0, 275, 0,
        0, 0, 0, 0, 0, 0, 0, 242, 243, 244, 245, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 252, 253, 254, 255, 0, 0, 0, 0, 0,
        0, 242, 243, 244, 245, 0, 0, 262, 263, 264, 265, 0, 0, 0, 0, 0,
        0, 252, 253, 254, 255, 0, 0, 272, 0, 0, 275, 0, 0, 0, 0, 0,
        0, 262, 263, 264, 265, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 272, 0, 0, 275, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
      }
    },
    {
      type = "tilelayer",
      id = 5,
      name = "collitions",
      x = 0,
      y = 0,
      width = 16,
      height = 18,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      data = {
        10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
        0, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
        10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
        10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10,
        10, 0, 10, 10, 10, 10, 10, 10, 10, 10, 0, 0, 0, 0, 0, 10,
        10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 0, 0, 0, 0, 0, 10,
        10, 10, 10, 10, 10, 10, 10, 10, 10, 0, 0, 0, 0, 0, 0, 10,
        10, 0, 10, 10, 10, 10, 0, 10, 10, 0, 0, 0, 0, 0, 0, 10,
        10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 10, 0, 10,
        10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10,
        10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10,
        10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10,
        10, 0, 0, 0, 0, 0, 0, 0, 10, 10, 0, 0, 0, 0, 0, 10,
        10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10,
        10, 0, 10, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10,
        10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10,
        10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10,
        10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 0, 0, 10, 10
      }
    }
  }
}
