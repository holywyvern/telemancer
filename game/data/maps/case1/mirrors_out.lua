return {
  version = "1.2",
  luaversion = "5.1",
  tiledversion = "1.2.4",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 16,
  height = 20,
  tilewidth = 16,
  tileheight = 16,
  nextlayerid = 7,
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
      height = 20,
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
        11, 11, 11, 12, 11, 12, 12, 11, 11, 11, 11, 11, 11, 11, 11, 11,
        11, 11, 30, 12, 12, 12, 12, 130, 129, 129, 50, 11, 11, 11, 11, 11,
        11, 11, 30, 12, 12, 12, 12, 12, 12, 12, 130, 50, 11, 11, 11, 11,
        11, 20, 138, 12, 12, 12, 12, 12, 12, 12, 12, 130, 50, 11, 11, 11,
        11, 30, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 130, 50, 11, 11,
        11, 30, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 60, 11, 11,
        11, 30, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 60, 11, 11,
        11, 40, 139, 137, 12, 12, 12, 12, 12, 12, 12, 12, 12, 60, 11, 11,
        11, 11, 11, 40, 137, 12, 12, 140, 137, 12, 12, 12, 140, 70, 11, 11,
        11, 11, 11, 11, 30, 12, 12, 60, 30, 12, 12, 12, 60, 11, 11, 11,
        11, 11, 11, 11, 40, 139, 139, 11, 40, 30, 12, 140, 70, 11, 11, 11,
        11, 11, 11, 11, 11, 11, 11, 11, 11, 40, 139, 70, 11, 11, 11, 11,
        11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11,
        11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11
      }
    },
    {
      type = "tilelayer",
      id = 2,
      name = "Tile Layer 2",
      x = 0,
      y = 0,
      width = 16,
      height = 20,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      data = {
        213, 214, 214, 214, 214, 214, 214, 214, 214, 214, 214, 215, 0, 0, 223, 0,
        223, 0, 0, 0, 0, 0, 0, 0, 0, 281, 0, 225, 0, 0, 213, 214,
        223, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 224, 0, 0, 223, 0,
        223, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 204, 0, 0, 223, 281,
        223, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 223, 0,
        223, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 291, 0, 223, 0,
        223, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 225, 291,
        223, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 281, 0, 0, 225, 0,
        223, 281, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 225, 281,
        223, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 225, 0,
        223, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 225, 0,
        223, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 225, 291,
        223, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 225, 0,
        223, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 225, 0,
        223, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 225, 0,
        223, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 225, 0,
        223, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 225, 0,
        223, 0, 0, 0, 0, 0, 0, 281, 0, 0, 0, 0, 0, 0, 225, 281,
        223, 281, 0, 291, 0, 0, 0, 0, 0, 0, 0, 0, 0, 291, 225, 0,
        233, 214, 214, 214, 214, 214, 214, 214, 214, 214, 214, 214, 214, 214, 235, 0
      }
    },
    {
      type = "tilelayer",
      id = 3,
      name = "Tile Layer 3",
      x = 0,
      y = 0,
      width = 16,
      height = 20,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      data = {
        541, 542, 543, 544, 545, 546, 547, 548, 549, 621, 622, 0, 0, 0, 0, 0,
        551, 552, 553, 554, 555, 556, 557, 558, 559, 631, 632, 0, 0, 0, 0, 0,
        561, 562, 563, 564, 565, 566, 567, 568, 569, 641, 642, 0, 0, 0, 0, 0,
        571, 572, 573, 574, 575, 576, 577, 578, 579, 651, 652, 0, 0, 0, 0, 0,
        581, 582, 583, 584, 585, 586, 587, 588, 589, 661, 662, 0, 0, 0, 0, 0,
        591, 592, 593, 594, 595, 596, 597, 598, 599, 671, 672, 0, 0, 0, 0, 0,
        601, 602, 603, 604, 605, 606, 607, 608, 609, 681, 682, 0, 0, 0, 0, 0,
        611, 612, 613, 614, 615, 616, 617, 618, 619, 691, 692, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 273, 274, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 283, 284, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 438, 439, 440, 0, 438, 439, 440, 0, 0, 0, 0, 0,
        0, 0, 273, 274, 0, 0, 0, 0, 0, 0, 0, 273, 274, 0, 0, 0,
        0, 0, 283, 284, 0, 0, 0, 0, 0, 0, 0, 283, 284, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
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
      name = "over",
      x = 0,
      y = 0,
      width = 16,
      height = 20,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      data = {
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 632, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 642, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 652, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 662, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 242, 243, 244, 245, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 252, 253, 254, 255, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 262, 263, 264, 265, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 272, 0, 0, 275, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 242, 243, 244, 245, 0, 0, 0, 0, 0, 242, 243, 244, 245, 0, 0,
        0, 252, 253, 254, 255, 0, 0, 0, 0, 0, 252, 253, 254, 255, 0, 0,
        0, 262, 263, 264, 265, 0, 0, 0, 0, 0, 262, 263, 264, 265, 0, 0,
        0, 272, 0, 0, 275, 0, 0, 0, 0, 0, 272, 0, 0, 275, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
      }
    },
    {
      type = "tilelayer",
      id = 6,
      name = "collitions",
      x = 0,
      y = 0,
      width = 16,
      height = 20,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      data = {
        10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 0, 0, 10, 10,
        10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 0, 0, 10, 10,
        10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 0, 0, 10, 10,
        10, 10, 10, 10, 10, 10, 10, 10, 0, 10, 0, 0, 0, 0, 10, 10,
        10, 10, 10, 10, 0, 10, 10, 10, 10, 10, 0, 0, 0, 0, 10, 10,
        10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 0, 0, 0, 0, 10, 10,
        10, 10, 10, 10, 10, 0, 10, 10, 10, 10, 0, 0, 0, 0, 10, 10,
        10, 10, 10, 10, 10, 0, 10, 10, 10, 10, 0, 0, 0, 0, 10, 10,
        10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 10,
        10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 10,
        10, 0, 0, 0, 0, 0, 0, 0, 10, 10, 0, 0, 0, 0, 10, 10,
        10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 10,
        10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 10,
        10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 10,
        10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 10,
        10, 0, 0, 0, 10, 10, 10, 0, 10, 10, 10, 0, 0, 0, 10, 10,
        10, 0, 10, 10, 0, 0, 0, 0, 0, 0, 0, 10, 10, 0, 10, 10,
        10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 10,
        10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 10,
        10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10
      }
    }
  }
}
