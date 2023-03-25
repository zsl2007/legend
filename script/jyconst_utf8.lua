function SetGlobalConst()
  VK_ESCAPE = 27
  VK_Y = 121
  VK_N = 110
  VK_H = 104
  VK_S = 115
  VK_SPACE = 32
  VK_RETURN = 13
  VK_UP = 1073741906
  VK_DOWN = 1073741905
  VK_LEFT = 1073741904
  VK_RIGHT = 1073741903
  if CONFIG.Operation == 1 then
    VK_SPACE = VK_RETURN
  end
  C_STARTMENU = RGB(132, 0, 4)
  C_RED = RGB(216, 20, 24)
  C_WHITE = RGB(236, 236, 236)
  C_ORANGE = RGB(252, 148, 16)
  C_GOLD = RGB(236, 200, 40)
  C_BLACK = RGB(0, 0, 0)
  C_STARTMENU = RGB(132, 0, 4)
  C_RED = RGB(216, 20, 24)
  C_WHITE = RGB(236, 236, 236)
  C_ORANGE = RGB(252, 148, 16)
  C_GOLD = RGB(236, 200, 40)
  C_BLACK = RGB(0, 0, 0)
  M_Black = RGB(0, 0, 0)
  M_Sienna = RGB(160, 82, 45)
  M_DarkOliveGreen = RGB(85, 107, 47)
  M_DarkGreen = RGB(0, 100, 0)
  M_DarkSlateBlue = RGB(72, 61, 139)
  M_Navy = RGB(0, 0, 128)
  M_Indigo = RGB(75, 0, 130)
  M_DarkSlateGray = RGB(47, 79, 79)
  M_DarkRed = RGB(139, 0, 0)
  M_DarkOrange = RGB(255, 140, 0)
  M_Olive = RGB(128, 128, 0)
  M_Green = RGB(0, 128, 0)
  M_Teal = RGB(0, 128, 128)
  M_Blue = RGB(0, 0, 255)
  M_SlateGray = RGB(112, 128, 144)
  M_DimGray = RGB(105, 105, 105)
  M_Red = RGB(255, 0, 0)
  M_SandyBrown = RGB(244, 164, 96)
  M_YellowGreen = RGB(154, 205, 50)
  M_SeaGreen = RGB(46, 139, 87)
  M_MediumTurquoise = RGB(72, 209, 204)
  M_RoyalBlue = RGB(65, 105, 225)
  M_Purple = RGB(128, 0, 128)
  M_Gray = RGB(128, 128, 128)
  M_Magenta = RGB(255, 0, 255)
  M_Orange = RGB(255, 165, 0)
  M_Yellow = RGB(255, 255, 0)
  M_Lime = RGB(0, 255, 0)
  M_Cyan = RGB(0, 255, 255)
  M_DeepSkyBlue = RGB(0, 191, 255)
  M_DarkOrchid = RGB(153, 50, 204)
  M_Silver = RGB(192, 192, 192)
  M_Pink = RGB(255, 192, 203)
  M_Wheat = RGB(245, 222, 179)
  M_LemonChiffon = RGB(255, 250, 205)
  M_PaleGreen = RGB(152, 251, 152)
  M_PaleTurquoise = RGB(175, 238, 238)
  M_LightBlue = RGB(173, 216, 230)
  M_Plum = RGB(221, 160, 221)
  M_White = RGB(255, 255, 255)
  C_SHOUSHANG1 = RGB(236, 200, 40)
  C_SHOUSHANG2 = RGB(255, 192, 203)
  C_SHOUSHANG3 = RGB(255, 192, 203)
  GAME_START = 0
  GAME_FIRSTMMAP = 1
  GAME_MMAP = 2
  GAME_FIRSTSMAP = 3
  GAME_SMAP = 4
  GAME_WMAP = 5
  GAME_DEAD = 6
  GAME_END = 7
  CONFIG.ZCOPEN = 0
  CONFIG.JS = 0
  CC = {}
  CC.SrcCharSet = 0
  CC.OSCharSet = CONFIG.OSCharSet
  CC.FontName = CONFIG.FontName
  CC.ScreenW = CONFIG.Width
  CC.ScreenH = CONFIG.Height
  CC.ScreenW = lib.GetScreenW()
  CC.ScreenH = lib.GetScreenH()
  CC.BoxLine = CC.ScreenH / 360
  CC.Zoom = CONFIG.Zoom / 100
  if CONFIG.Zoom ~= math.modf(CONFIG.Height / 360 * 10) * 10 then
    CC.Zoom = math.modf(CONFIG.Height / 360 * 10) * 10 / 100
  end
  CC.Zoom = math.modf(CONFIG.Height / 360 * 10) * 10 / 100
  CC.TempS_Filename = CONFIG.DataPath .. "allsinbk.grp"
  CC.D_Filename = {
    [0] = CONFIG.DataPath .. "alldef.grp"
  }
  CC.R_IDXFilename = {
    [0] = CONFIG.DataPath .. "ranger.idx"
  }
  CC.R_GRPFilename = {
    [0] = CONFIG.DataPath .. "ranger.grp"
  }
  CC.S_Filename = {
    [0] = CONFIG.DataPath .. "allsin.grp"
  }
  CC.T_Filename = {
    [0] = CONFIG.DataPath .. "save/t0.grp"
  }
  for i = 1, 11 do
    CC.R_IDXFilename[i] = CONFIG.DataPath .. string.format("save/r%d.idx", i)
    CC.R_GRPFilename[i] = CONFIG.DataPath .. string.format("save/r%d.grp", i)
    CC.S_Filename[i] = CONFIG.DataPath .. string.format("save/s%d.grp", i)
    CC.D_Filename[i] = CONFIG.DataPath .. string.format("save/d%d.grp", i)
    CC.T_Filename[i] = CONFIG.DataPath .. string.format("save/t%d.grp", i)
  end
  CC.PaletteFile = CONFIG.DataPath .. "mmap.col"
  CC.FirstFile = CONFIG.PicturePath .. "title.png"
  CC.DeadFile = CONFIG.PicturePath .. "dead.png"
  CC.MMapFile = {
    CONFIG.DataPath .. "earth.002",
    CONFIG.DataPath .. "surface.002",
    CONFIG.DataPath .. "building.002",
    CONFIG.DataPath .. "buildx.002",
    CONFIG.DataPath .. "buildy.002"
  }
  CC.MMAPPicFile = {
    CONFIG.DataPath .. "mmap.idx",
    CONFIG.DataPath .. "mmap.grp"
  }
  CC.SMAPPicFile = {
    CONFIG.DataPath .. "smap.idx",
    CONFIG.DataPath .. "smap.grp"
  }
  CC.WMAPPicFile = {
    CONFIG.DataPath .. "wmap.idx",
    CONFIG.DataPath .. "wmap.grp"
  }
  CC.EffectFile = {
    CONFIG.DataPath .. "eft.idx",
    CONFIG.DataPath .. "eft.grp"
  }
  CC.FightPicFile = {
    CONFIG.DataPath .. "fight/fight%03d.idx",
    CONFIG.DataPath .. "fight/fight%03d.grp"
  }
  CC.HeadPicFile = {
    CONFIG.DataPath .. "hdgrp.idx",
    CONFIG.DataPath .. "hdgrp.grp"
  }
  CC.ThingPicFile = {
    CONFIG.DataPath .. "thing.idx",
    CONFIG.DataPath .. "thing.grp"
  }
  CC.MIDIFile = CONFIG.SoundPath .. "game%02d.mid"
  CC.ATKFile = CONFIG.SoundPath .. "atk%02d.wav"
  CC.EFile = CONFIG.SoundPath .. "e%02d.wav"
  if CONFIG.MP3 == 1 then
    CC.MIDIFile = CONFIG.SoundPath .. "game%02d.mp3"
  else
    CC.MIDIFile = CONFIG.SoundPath .. "game%02d.mid"
  end
  CC.WarFile = CONFIG.DataPath .. "war.sta"
  CC.WarMapFile = {
    CONFIG.DataPath .. "warfld.idx",
    CONFIG.DataPath .. "warfld.grp"
  }
  CC.TalkIdxFile = CONFIG.DataPath .. "oldtalk.idx"
  CC.TalkGrpFile = CONFIG.DataPath .. "oldtalk.grp"
  CC.KRP = CONFIG.DataPath .. "kdef.grp"
  CC.KDX = CONFIG.DataPath .. "kdef.idx"
  CC.TRP = CONFIG.DataPath .. "talk.grp"
  CC.TDX = CONFIG.DataPath .. "talk.idx"
  CC.HeadPath = CONFIG.HeadPath
  CC.HeadNum = 40000
  CC.TeamNum = 12
  CC.MyThingNum = 1000
  CC.Base_S = {}
  CC.Base_S["乘船"] = {
    0,
    0,
    2
  }
  CC.Base_S["无用"] = {
    2,
    0,
    2
  }
  CC.Base_S["人X"] = {
    4,
    0,
    2
  }
  CC.Base_S["人Y"] = {
    6,
    0,
    2
  }
  CC.Base_S["人X1"] = {
    8,
    0,
    2
  }
  CC.Base_S["人Y1"] = {
    10,
    0,
    2
  }
  CC.Base_S["人方向"] = {
    12,
    0,
    2
  }
  CC.Base_S["船X"] = {
    14,
    0,
    2
  }
  CC.Base_S["船Y"] = {
    16,
    0,
    2
  }
  CC.Base_S["船X1"] = {
    18,
    0,
    2
  }
  CC.Base_S["船Y1"] = {
    20,
    0,
    2
  }
  CC.Base_S["船方向"] = {
    22,
    0,
    2
  }
  for i = 1, CC.TeamNum do
    CC.Base_S["队伍" .. i] = {
      24 + 2 * (i - 1),
      0,
      2
    }
  end
  for i = 1, CC.MyThingNum do
    CC.Base_S["物品" .. i] = {
      36 + 4 * (i - 1) + 2 * (CC.TeamNum - 6),
      0,
      2
    }
    CC.Base_S["物品数量" .. i] = {
      36 + 4 * (i - 1) + 2 + 2 * (CC.TeamNum - 6),
      0,
      2
    }
  end
  CC.Timer = {
    stime = 0,
    status = 0,
    str = "",
    len = 0,
    fun = demostr
  }
  CC.RUNSTR = {
    "请尽可能多培养一些队友",
    "设置文件名为“set.ini”  可以在里面更改主角姓名和一些常用的设置",
    "飞雪连天射白鹿  笑书神侠倚碧鸳  莫问君子爱哪般  倾情专注群侠传",
    "练功点推荐 初期各门派守门人 中期金花婆婆/金轮寺 后期就找老顽童吧",
    "游戏里按S键为传送功能，H键为自动存档",
    ""
  }
  CC.NUMBER = 6
  if CONFIG.Remind == nil then
    CONFIG.Remind = 0
  end
  if CONFIG.Remind == 0 then
    CC.OpenTimmerRemind = 0
  elseif CONFIG.Remind == 1 then
    CC.OpenTimmerRemind = 1
  end
  CC.AutoMoveEvent = {
    [0] = 0
  }
  CC.MMapAdress = {}
  CC.PersonSize = 182
  CC.Person_S = {}
  CC.Person_S["代号"] = {
    0,
    0,
    2
  }
  CC.Person_S["头像代号"] = {
    2,
    0,
    2
  }
  CC.Person_S["生命增长"] = {
    4,
    0,
    2
  }
  CC.Person_S["无用"] = {
    6,
    0,
    2
  }
  CC.Person_S["姓名"] = {
    8,
    2,
    10
  }
  CC.Person_S["外号"] = {
    18,
    2,
    10
  }
  CC.Person_S["性别"] = {
    28,
    0,
    2
  }
  CC.Person_S["等级"] = {
    30,
    0,
    2
  }
  CC.Person_S["经验"] = {
    32,
    1,
    2
  }
  CC.Person_S["生命"] = {
    34,
    0,
    2
  }
  CC.Person_S["生命最大值"] = {
    36,
    0,
    2
  }
  CC.Person_S["受伤程度"] = {
    38,
    0,
    2
  }
  CC.Person_S["中毒程度"] = {
    40,
    0,
    2
  }
  CC.Person_S["体力"] = {
    42,
    0,
    2
  }
  CC.Person_S["物品修炼点数"] = {
    44,
    0,
    2
  }
  CC.Person_S["武器"] = {
    46,
    0,
    2
  }
  CC.Person_S["防具"] = {
    48,
    0,
    2
  }
  for i = 1, 5 do
    CC.Person_S["出招动画帧数" .. i] = {
      50 + 2 * (i - 1),
      0,
      2
    }
    CC.Person_S["出招动画延迟" .. i] = {
      60 + 2 * (i - 1),
      0,
      2
    }
    CC.Person_S["武功音效延迟" .. i] = {
      70 + 2 * (i - 1),
      0,
      2
    }
  end
  CC.Person_S["内力性质"] = {
    80,
    0,
    2
  }
  CC.Person_S["内力"] = {
    82,
    0,
    2
  }
  CC.Person_S["内力最大值"] = {
    84,
    0,
    2
  }
  CC.Person_S["攻击力"] = {
    86,
    0,
    2
  }
  CC.Person_S["轻功"] = {
    88,
    0,
    2
  }
  CC.Person_S["防御力"] = {
    90,
    0,
    2
  }
  CC.Person_S["医疗能力"] = {
    92,
    0,
    2
  }
  CC.Person_S["用毒能力"] = {
    94,
    0,
    2
  }
  CC.Person_S["解毒能力"] = {
    96,
    0,
    2
  }
  CC.Person_S["抗毒能力"] = {
    98,
    0,
    2
  }
  CC.Person_S["拳掌功夫"] = {
    100,
    0,
    2
  }
  CC.Person_S["御剑能力"] = {
    102,
    0,
    2
  }
  CC.Person_S["耍刀技巧"] = {
    104,
    0,
    2
  }
  CC.Person_S["特殊兵器"] = {
    106,
    0,
    2
  }
  CC.Person_S["暗器技巧"] = {
    108,
    0,
    2
  }
  CC.Person_S["武学常识"] = {
    110,
    0,
    2
  }
  CC.Person_S["品德"] = {
    112,
    0,
    2
  }
  CC.Person_S["攻击带毒"] = {
    114,
    0,
    2
  }
  CC.Person_S["左右互搏"] = {
    116,
    0,
    2
  }
  CC.Person_S["声望"] = {
    118,
    0,
    2
  }
  CC.Person_S["资质"] = {
    120,
    0,
    2
  }
  CC.Person_S["修炼物品"] = {
    122,
    0,
    2
  }
  CC.Person_S["修炼点数"] = {
    124,
    0,
    2
  }
  for i = 1, 10 do
    CC.Person_S["武功" .. i] = {
      126 + 2 * (i - 1),
      0,
      2
    }
    CC.Person_S["武功等级" .. i] = {
      146 + 2 * (i - 1),
      0,
      2
    }
  end
  for i = 1, 4 do
    CC.Person_S["携带物品" .. i] = {
      166 + 2 * (i - 1),
      0,
      2
    }
    CC.Person_S["携带物品数量" .. i] = {
      174 + 2 * (i - 1),
      0,
      2
    }
  end
  CC.ThingSize = 190
  CC.Thing_S = {}
  CC.Thing_S["代号"] = {
    0,
    0,
    2
  }
  CC.Thing_S["名称"] = {
    2,
    2,
    20
  }
  CC.Thing_S["名称2"] = {
    22,
    2,
    20
  }
  CC.Thing_S["物品说明"] = {
    42,
    2,
    30
  }
  CC.Thing_S["练出武功"] = {
    72,
    0,
    2
  }
  CC.Thing_S["暗器动画编号"] = {
    74,
    0,
    2
  }
  CC.Thing_S["使用人"] = {
    76,
    0,
    2
  }
  CC.Thing_S["装备类型"] = {
    78,
    0,
    2
  }
  CC.Thing_S["显示物品说明"] = {
    80,
    0,
    2
  }
  CC.Thing_S["类型"] = {
    82,
    0,
    2
  }
  CC.Thing_S["未知5"] = {
    84,
    0,
    2
  }
  CC.Thing_S["未知6"] = {
    86,
    0,
    2
  }
  CC.Thing_S["未知7"] = {
    88,
    0,
    2
  }
  CC.Thing_S["加生命"] = {
    90,
    0,
    2
  }
  CC.Thing_S["加生命最大值"] = {
    92,
    0,
    2
  }
  CC.Thing_S["加中毒解毒"] = {
    94,
    0,
    2
  }
  CC.Thing_S["加体力"] = {
    96,
    0,
    2
  }
  CC.Thing_S["改变内力性质"] = {
    98,
    0,
    2
  }
  CC.Thing_S["加内力"] = {
    100,
    0,
    2
  }
  CC.Thing_S["加内力最大值"] = {
    102,
    0,
    2
  }
  CC.Thing_S["加攻击力"] = {
    104,
    0,
    2
  }
  CC.Thing_S["加轻功"] = {
    106,
    0,
    2
  }
  CC.Thing_S["加防御力"] = {
    108,
    0,
    2
  }
  CC.Thing_S["加医疗能力"] = {
    110,
    0,
    2
  }
  CC.Thing_S["加用毒能力"] = {
    112,
    0,
    2
  }
  CC.Thing_S["加解毒能力"] = {
    114,
    0,
    2
  }
  CC.Thing_S["加抗毒能力"] = {
    116,
    0,
    2
  }
  CC.Thing_S["加拳掌功夫"] = {
    118,
    0,
    2
  }
  CC.Thing_S["加御剑能力"] = {
    120,
    0,
    2
  }
  CC.Thing_S["加耍刀技巧"] = {
    122,
    0,
    2
  }
  CC.Thing_S["加特殊兵器"] = {
    124,
    0,
    2
  }
  CC.Thing_S["加暗器技巧"] = {
    126,
    0,
    2
  }
  CC.Thing_S["加武学常识"] = {
    128,
    0,
    2
  }
  CC.Thing_S["加品德"] = {
    130,
    0,
    2
  }
  CC.Thing_S["加攻击次数"] = {
    132,
    0,
    2
  }
  CC.Thing_S["加攻击带毒"] = {
    134,
    0,
    2
  }
  CC.Thing_S["仅修炼人物"] = {
    136,
    0,
    2
  }
  CC.Thing_S["需内力性质"] = {
    138,
    0,
    2
  }
  CC.Thing_S["需内力"] = {
    140,
    0,
    2
  }
  CC.Thing_S["需攻击力"] = {
    142,
    0,
    2
  }
  CC.Thing_S["需轻功"] = {
    144,
    0,
    2
  }
  CC.Thing_S["需用毒能力"] = {
    146,
    0,
    2
  }
  CC.Thing_S["需医疗能力"] = {
    148,
    0,
    2
  }
  CC.Thing_S["需解毒能力"] = {
    150,
    0,
    2
  }
  CC.Thing_S["需拳掌功夫"] = {
    152,
    0,
    2
  }
  CC.Thing_S["需御剑能力"] = {
    154,
    0,
    2
  }
  CC.Thing_S["需耍刀技巧"] = {
    156,
    0,
    2
  }
  CC.Thing_S["需特殊兵器"] = {
    158,
    0,
    2
  }
  CC.Thing_S["需暗器技巧"] = {
    160,
    0,
    2
  }
  CC.Thing_S["需资质"] = {
    162,
    0,
    2
  }
  CC.Thing_S["需经验"] = {
    164,
    0,
    2
  }
  CC.Thing_S["练出物品需经验"] = {
    166,
    0,
    2
  }
  CC.Thing_S["需材料"] = {
    168,
    0,
    2
  }
  for i = 1, 5 do
    CC.Thing_S["练出物品" .. i] = {
      170 + 2 * (i - 1),
      0,
      2
    }
    CC.Thing_S["需要物品数量" .. i] = {
      180 + 2 * (i - 1),
      0,
      2
    }
  end
  CC.SceneSize = 52
  CC.Scene_S = {}
  CC.Scene_S["代号"] = {
    0,
    0,
    2
  }
  CC.Scene_S["名称"] = {
    2,
    2,
    10
  }
  CC.Scene_S["出门音乐"] = {
    12,
    0,
    2
  }
  CC.Scene_S["进门音乐"] = {
    14,
    0,
    2
  }
  CC.Scene_S["跳转场景"] = {
    16,
    0,
    2
  }
  CC.Scene_S["进入条件"] = {
    18,
    0,
    2
  }
  CC.Scene_S["外景入口X1"] = {
    20,
    0,
    2
  }
  CC.Scene_S["外景入口Y1"] = {
    22,
    0,
    2
  }
  CC.Scene_S["外景入口X2"] = {
    24,
    0,
    2
  }
  CC.Scene_S["外景入口Y2"] = {
    26,
    0,
    2
  }
  CC.Scene_S["入口X"] = {
    28,
    0,
    2
  }
  CC.Scene_S["入口Y"] = {
    30,
    0,
    2
  }
  CC.Scene_S["出口X1"] = {
    32,
    0,
    2
  }
  CC.Scene_S["出口X2"] = {
    34,
    0,
    2
  }
  CC.Scene_S["出口X3"] = {
    36,
    0,
    2
  }
  CC.Scene_S["出口Y1"] = {
    38,
    0,
    2
  }
  CC.Scene_S["出口Y2"] = {
    40,
    0,
    2
  }
  CC.Scene_S["出口Y3"] = {
    42,
    0,
    2
  }
  CC.Scene_S["跳转口X1"] = {
    44,
    0,
    2
  }
  CC.Scene_S["跳转口Y1"] = {
    46,
    0,
    2
  }
  CC.Scene_S["跳转口X2"] = {
    48,
    0,
    2
  }
  CC.Scene_S["跳转口Y2"] = {
    50,
    0,
    2
  }
  CC.WugongSize = 156
  CC.Wugong_S = {}
  CC.Wugong_S["代号"] = {
    0,
    0,
    2
  }
  CC.Wugong_S["名称"] = {
    2,
    2,
    10
  }
  CC.Wugong_S["未知1"] = {
    12,
    0,
    2
  }
  CC.Wugong_S["未知2"] = {
    14,
    0,
    2
  }
  CC.Wugong_S["未知3"] = {
    16,
    0,
    2
  }
  CC.Wugong_S["未知4"] = {
    18,
    0,
    2
  }
  CC.Wugong_S["未知5"] = {
    20,
    0,
    2
  }
  CC.Wugong_S["出招音效"] = {
    22,
    0,
    2
  }
  CC.Wugong_S["武功类型"] = {
    24,
    0,
    2
  }
  CC.Wugong_S["武功动画&音效"] = {
    26,
    0,
    2
  }
  CC.Wugong_S["伤害类型"] = {
    28,
    0,
    2
  }
  CC.Wugong_S["攻击范围"] = {
    30,
    0,
    2
  }
  CC.Wugong_S["消耗内力点数"] = {
    32,
    0,
    2
  }
  CC.Wugong_S["敌人中毒点数"] = {
    34,
    0,
    2
  }
  for i = 1, 10 do
    CC.Wugong_S["攻击力" .. i] = {
      36 + 2 * (i - 1),
      0,
      2
    }
    CC.Wugong_S["移动范围" .. i] = {
      56 + 2 * (i - 1),
      0,
      2
    }
    CC.Wugong_S["杀伤范围" .. i] = {
      76 + 2 * (i - 1),
      0,
      2
    }
    CC.Wugong_S["加内力" .. i] = {
      96 + 2 * (i - 1),
      0,
      2
    }
    CC.Wugong_S["杀内力" .. i] = {
      116 + 2 * (i - 1),
      0,
      2
    }
   CC.Wugong_S["杀体力" .. i] = {
      136 + 2 * (i - 1),
      0,
      2
    }
  end
  CC.ShopSize = 30
  CC.Shop_S = {}
  for i = 1, 5 do
    CC.Shop_S["物品" .. i] = {
      0 + 2 * (i - 1),
      0,
      2
    }
    CC.Shop_S["物品数量" .. i] = {
      10 + 2 * (i - 1),
      0,
      2
    }
    CC.Shop_S["物品价格" .. i] = {
      20 + 2 * (i - 1),
      0,
      2
    }
  end
  CC.ShopScene = {}
  CC.ShopScene[0] = {
    sceneid = 1,
    d_shop = 16,
    d_leave = {17, 18}
  }
  CC.ShopScene[1] = {
    sceneid = 3,
    d_shop = 14,
    d_leave = {15, 16}
  }
  CC.ShopScene[2] = {
    sceneid = 40,
    d_shop = 20,
    d_leave = {21, 22}
  }
  CC.ShopScene[3] = {
    sceneid = 60,
    d_shop = 16,
    d_leave = {17, 18}
  }
  CC.ShopScene[4] = {
    sceneid = 61,
    d_shop = 9,
    d_leave = {
      10,
      11,
      12
    }
  }
  CC.MWidth = 480
  CC.MHeight = 480
  CC.SWidth = 64
  CC.SHeight = 64
  CC.DNum = 200
  CC.XScale = CONFIG.XScale
  CC.YScale = CONFIG.YScale
  if CONFIG.Frame == nil or CONFIG.Frame > 60 or 20 > CONFIG.Frame then
    CC.Frame = 40
  else
    CC.Frame = CONFIG.Frame
  end
  CC.SceneMoveFrame = CC.Frame * 2
  CC.PersonMoveFrame = CC.Frame * 2
  CC.AnimationFrame = CC.Frame * 3
  CC.WarAutoDelay = 300
  CC.DirectX = {
    0,
    1,
    -1,
    0
  }
  CC.DirectY = {
    -1,
    0,
    0,
    1
  }
  CC.MyStartPic = 2501
  CC.BoatStartPic = 3715
  CC.Level = 30
  CC.Exp = {
    50,
    150,
    300,
    500,
    750,
    1050,
    1400,
    1800,
    2250,
    2750,
    3850,
    5050,
    6350,
    7750,
    9250,
    10850,
    12550,
    14350,
    16750,
    18250,
    21400,
    24700,
    28150,
    31750,
    35500,
    39400,
    43450,
    47650,
    52000,
    60000
  }
  CC.MMapBoat = {}
  local tmpBoat = {
    {358, 362},
    {374, 380},
    {458, 464},
    {506, 610},
    {1016, 1022}
  }
  for i, v in ipairs(tmpBoat) do
    for j = v[1], v[2], 2 do
      CC.MMapBoat[j] = 1
    end
  end
  CC.SceneWater = {}
  local tmpWater = {
    {358, 362},
    {374, 380},
    {458, 464},
    {506, 610},
    {818, 824},
    {838, 838},
    {934, 936},
    {1016, 1022},
    {1324, 1348}
  }
  for i, v in ipairs(tmpWater) do
    for j = v[1], v[2], 2 do
      CC.SceneWater[j] = 1
    end
  end
  CC.WarWater = {}
  local tmpWater = {
    {358, 362},
    {374, 380},
    {458, 464},
    {506, 610},
    {818, 824},
    {838, 838},
    {934, 936},
    {1016, 1022},
    {1324, 1348}
  }
  for i, v in ipairs(tmpWater) do
    for j = v[1], v[2], 2 do
      CC.WarWater[j] = 1
    end
  end
  CC.PersonExit = {
    {1, 950},
    {2, 952},
    {9, 954},
    {16, 956},
    {17, 958},
    {25, 960},
    {28, 962},
    {29, 964},
    {35, 966},
    {36, 968},
    {37, 970},
    {38, 972},
    {44, 974},
    {45, 976},
    {47, 978},
    {48, 980},
    {49, 982},
    {51, 984},
    {53, 986},
    {54, 988},
    {58, 990},
    {59, 992},
    {61, 994},
    {63, 996},
    {76, 998}
  }
  CC.AllPersonExit = {
    {0, 0},
    {49, 2},
    {4, 1},
    {44, 0},
    {44, 1},
    {37, 5},
    {30, 0},
    {59, 0},
    {40, 3},
    {56, 1},
    {1, 7},
    {1, 8},
    {1, 10},
    {40, 7},
    {40, 8},
    {77, 0},
    {54, 0},
    {62, 3},
    {62, 4},
    {60, 2},
    {60, 15},
    {52, 1},
    {61, 0},
    {61, 8},
    {78, 0},
    {18, 0},
    {18, 1},
    {69, 0},
    {69, 1},
    {45, 0},
    {52, 2},
    {42, 6},
    {42, 7},
    {8, 8},
    {7, 6},
    {80, 1}
  }
  CC.BookNum = 14
  CC.BookStart = 144
  CC.MoneyID = 174
  CC.Shemale = {
    [78] = 1,
    [93] = 1
  }
  CC.Effect = {
    [0] = 9,
    14,
    17,
    9,
    13,
    17,
    17,
    17,
    18,
    19,
    19,
    15,
    13,
    10,
    10,
    15,
    21,
    16,
    9,
    11,
    8,
    9,
    8,
    8,
    7,
    8,
    8,
    9,
    12,
    19,
    11,
    14,
    12,
    17,
    8,
    11,
    9,
    13,
    10,
    19,
    14,
    17,
    19,
    14,
    21,
    16,
    13,
    18,
    14,
    17,
    17,
    16,
    7
  }
  CC.ExtraOffense = {
    {
      106,
      57,
      100
    },
    {
      107,
      49,
      50
    },
    {
      108,
      49,
      50
    },
    {
      110,
      54,
      80
    },
    {
      115,
      63,
      50
    },
    {
      116,
      67,
      70
    },
    {
      119,
      68,
      100
    }
  }
  CC.EONum = 7
  CC.NewPersonName = "徐小侠"
  if CONFIG.PlayName ~= nil then
    CC.NewPersonName = CONFIG.PlayName
  end
  CC.NewGameSceneID = 70
  CC.NewGameSceneX = 19
  CC.NewGameSceneY = 20
  CC.NewGameEvent = 691
  CC.NewPersonPic = 3445
  CC.PersonAttribMax = {}
  CC.PersonAttribMax["经验"] = 60000
  CC.PersonAttribMax["物品修炼点数"] = 60000
  CC.PersonAttribMax["修炼点数"] = 60000
  CC.PersonAttribMax["生命最大值"] = 999
  CC.PersonAttribMax["受伤程度"] = 100
  CC.PersonAttribMax["中毒程度"] = 100
  CC.PersonAttribMax["内力最大值"] = 999
  CC.PersonAttribMax["体力"] = 100
  CC.PersonAttribMax["攻击力"] = 100
  CC.PersonAttribMax["防御力"] = 100
  CC.PersonAttribMax["轻功"] = 100
  CC.PersonAttribMax["医疗能力"] = 100
  CC.PersonAttribMax["用毒能力"] = 100
  CC.PersonAttribMax["解毒能力"] = 100
  CC.PersonAttribMax["抗毒能力"] = 100
  CC.PersonAttribMax["拳掌功夫"] = 100
  CC.PersonAttribMax["御剑能力"] = 100
  CC.PersonAttribMax["耍刀技巧"] = 100
  CC.PersonAttribMax["特殊兵器"] = 100
  CC.PersonAttribMax["暗器技巧"] = 100
  CC.PersonAttribMax["武学常识"] = 100
  CC.PersonAttribMax["品德"] = 100
  CC.PersonAttribMax["资质"] = 100
  CC.PersonAttribMax["攻击带毒"] = 100
  CC.WarDataSize = 186
  CC.WarData_S = {}
  CC.WarData_S["代号"] = {
    0,
    0,
    2
  }
  CC.WarData_S["名称"] = {
    2,
    2,
    10
  }
  CC.WarData_S["地图"] = {
    12,
    0,
    2
  }
  CC.WarData_S["经验"] = {
    14,
    0,
    2
  }
  CC.WarData_S["音乐"] = {
    16,
    0,
    2
  }
  for i = 1, 6 do
    CC.WarData_S["手动选择参战人" .. i] = {
      18 + (i - 1) * 2,
      0,
      2
    }
    CC.WarData_S["自动选择参战人" .. i] = {
      30 + (i - 1) * 2,
      0,
      2
    }
    CC.WarData_S["我方X" .. i] = {
      42 + (i - 1) * 2,
      0,
      2
    }
    CC.WarData_S["我方Y" .. i] = {
      54 + (i - 1) * 2,
      0,
      2
    }
  end
  for i = 1, 20 do
    CC.WarData_S["敌人" .. i] = {
      66 + (i - 1) * 2,
      0,
      2
    }
    CC.WarData_S["敌方X" .. i] = {
      106 + (i - 1) * 2,
      0,
      2
    }
    CC.WarData_S["敌方Y" .. i] = {
      146 + (i - 1) * 2,
      0,
      2
    }
  end
  CC.WarWidth = 64
  CC.WarHeight = 64
  CC.ShowXY = 1
  CC.RowPixel = 3 * math.modf(CC.ScreenH / 720)
  CC.MenuBorderPixel = 2 * math.modf(CC.ScreenH / 720)
  if CONFIG.Type == 0 then
    CC.DefaultFont = 16
    CC.StartMenuFontSize = 16
    CC.NewGameFontSize = 16
    CC.MainMenuX = 10
    CC.MainMenuY = 10
    CC.GameOverX = 90
    CC.GameOverY = 65
    CC.PersonStateRowPixel = 1
  elseif CONFIG.Type == 1 then
    if CONFIG.Height * 1.6 > CONFIG.Width then
      CC.DefaultFont = math.modf(CC.ScreenH / 24)
      CC.StartMenuFontSize = math.modf(CC.ScreenH / 20)
      CC.NewGameFontSize = math.modf(CC.ScreenH / 24)
      CC.MainMenuX = 10
      CC.MainMenuY = 10
      CC.GameOverX = 255
      CC.GameOverY = 165
      CC.PersonStateRowPixel = math.modf(CC.ScreenH / 120)
    else
      CC.DefaultFont = math.modf(CC.ScreenH / 20)
      CC.StartMenuFontSize = math.modf(CC.ScreenH / 15)
      CC.NewGameFontSize = math.modf(CC.ScreenH / 20)
      CC.MainMenuX = 10
      CC.MainMenuY = 10
      CC.GameOverX = 255
      CC.GameOverY = 165
      CC.PersonStateRowPixel = math.modf(CC.ScreenH / 120)
    end
    if CONFIG.Width == 480 then
      CC.DefaultFont = math.modf(CC.ScreenH / 21)
      CC.StartMenuFontSize = math.modf(CC.ScreenH / 18)
      CC.NewGameFontSize = math.modf(CC.ScreenH / 21)
      CC.MainMenuX = 10
      CC.MainMenuY = 10
      CC.GameOverX = 255
      CC.GameOverY = 165
      CC.PersonStateRowPixel = math.modf(CC.ScreenH / 120)
    end
  end
  CC.StartMenuY = CC.ScreenH - 3 * (CC.StartMenuFontSize + CC.RowPixel) - CC.DefaultFont
  CC.NewGameY = CC.ScreenH - 4 * (CC.NewGameFontSize + CC.RowPixel) - CC.DefaultFont / 2
  CC.MainSubMenuX = CC.MainMenuX + 2 * CC.MenuBorderPixel + 2 * CC.StartMenuFontSize + 5
  CC.MainSubMenuY = CC.MainMenuY
  CC.MainSubMenuX2 = CC.MainSubMenuX + 2 * CC.MenuBorderPixel + 4 * CC.StartMenuFontSize + 5
  CC.SingleLineHeight = CC.StartMenuFontSize + 2 * CC.MenuBorderPixel + 5
  if CONFIG.Type == 0 then
    CC.ThingFontSize = 16
    CC.ThingPicWidth = math.modf(40 * (CONFIG.Zoom / 100))
    CC.ThingPicHeight = math.modf(40 * (CONFIG.Zoom / 100))
    CC.MenuThingXnum = math.modf(5 / (CONFIG.Zoom / 100))
    CC.MenuThingYnum = math.modf(3 / (CONFIG.Zoom / 100))
    CC.ThingGapOut = 10
    CC.ThingGapIn = 5
  elseif CONFIG.Type == 1 then
    local picmax = 40
    if CONFIG.Height * 1.6 > CONFIG.Width then
      CC.ThingFontSize = math.modf(CC.ScreenH / 24)
      CC.ThingPicWidth = math.modf(picmax * (CONFIG.Zoom / 100))
      CC.ThingPicHeight = math.modf(picmax * (CONFIG.Zoom / 100))
      CC.MenuThingXnum = math.modf(CC.ScreenW / 60 / (CONFIG.Zoom / 100))
      CC.MenuThingYnum = math.modf(CC.ScreenH / 120 / (CONFIG.Zoom / 100))
      CC.ThingGapOut = 10
      CC.ThingGapIn = 10
    else
      CC.ThingFontSize = math.modf(CC.ScreenH / 20)
      CC.ThingPicWidth = math.modf(picmax * (CONFIG.Zoom / 100))
      CC.ThingPicHeight = math.modf(picmax * (CONFIG.Zoom / 100))
      CC.MenuThingXnum = math.modf(CC.ScreenW / 60 / (CONFIG.Zoom / 100))
      CC.MenuThingYnum = math.modf(CC.ScreenH / 120 / (CONFIG.Zoom / 100))
      CC.ThingGapOut = 10
      CC.ThingGapIn = 10
    end
    if CONFIG.Width == 480 then
      CC.ThingFontSize = math.modf(CC.ScreenH / 20)
      CC.ThingPicWidth = math.modf(picmax * (CONFIG.Zoom / 100))
      CC.ThingPicHeight = math.modf(picmax * (CONFIG.Zoom / 100))
      CC.MenuThingXnum = math.modf(CC.ScreenW / 60 / (CONFIG.Zoom / 100))
      CC.MenuThingYnum = math.modf(CC.ScreenH / 120 / (CONFIG.Zoom / 100))
      CC.ThingGapOut = 5
      CC.ThingGapIn = 5
    end
  end
  if CONFIG.Type == 0 then
    CC.SceneXMin = 12
    CC.SceneYMin = 12
    CC.SceneXMax = 45
    CC.SceneYMax = 45
  elseif CONFIG.Type == 1 then
    CC.SceneXMin = 7
    CC.SceneYMin = 7
    CC.SceneXMax = 50
    CC.SceneYMax = 50
  end
  CC.SceneFlagPic = {2749, 2846}
  if CONFIG.FastShowScreen == 0 then
    CC.ShowFlag = 1
    if CONFIG.Type == 1 then
      CC.AutoWarShowHead = 1
    else
      CC.AutoWarShowHead = 0
    end
  else
    CC.ShowFlag = 0
    CC.AutoWarShowHead = 0
  end
  CC.LoadThingPic = 0
  CC.StartThingPic = 3501
  CC.SceneNameRen = 0
  CC.SceneName = ""
  CC.ExpLevel = 1
  CC.TP = 1
  CC.WXCS = 80
  CC.ZCOPEN = 0
  CC.JS = 0
  CONFIG.ZCWG = "天地无用"
  CC.ZCWG = CONFIG.ZCWG
  CC.X50OPEN = 0
  CC.FK = 1
  CC.FKUP = 1
  CC.RB = 1
  CC.SHGS = 0
  CC.SXYQ = 20
  CC.GLTSSize = 200
  CC.GLTS_S = {}
  for j = 0, 99 do
    CC.GLTS_S[j] = {
      j * 2,
      0,
      2
    }
  end
  CC.GLTS = {}
  for i = 0, 14 do
    CC.GLTS[i] = {}
    for j = 0, 99 do
      CC.GLTS[i][j] = 0
    end
  end
  if CONFIG.ExpLevel ~= nil then
    CC.ExpCS = CONFIG.ExpLevel + 1
  end
  if 2 < CC.ExpCS or 1 > CC.ExpCS then
    CC.ExpCS = 1
  end
  if CONFIG.TP ~= nil then
    CC.TP = CONFIG.TP
  end
  if CONFIG.NGHT == nil then
    CONFIG.NGHT = 0
  end
  CONFIG.NGHT = 0
  if CONFIG.MHTX == nil then
    CONFIG.MHTX = 0
  end
  CC.TSJSSX = {}
  CC.TSJSSX["代号"] = 0
  CC.TSJSSX["头像代号"] = 0
  CC.TSJSSX["生命增长"] = 7
  CC.TSJSSX["外号"] = "超神"
  CC.TSJSSX["性别"] = 1
  CC.TSJSSX["等级"] = 1
  CC.TSJSSX["经验"] = 0
  CC.TSJSSX["生命"] = 50
  CC.TSJSSX["生命最大值"] = 50
  CC.TSJSSX["受伤程度"] = 0
  CC.TSJSSX["中毒程度"] = 0
  CC.TSJSSX["体力"] = 100
  CC.TSJSSX["物品修炼点数"] = 0
  CC.TSJSSX["武器"] = -1
  CC.TSJSSX["防具"] = -1
  CC.TSJSSX["内力性质"] = 2
  CC.TSJSSX["内力"] = 40
  CC.TSJSSX["内力最大值"] = 40
  CC.TSJSSX["攻击力"] = 30
  CC.TSJSSX["轻功"] = 30
  CC.TSJSSX["防御力"] = 30
  CC.TSJSSX["医疗能力"] = 30
  CC.TSJSSX["用毒能力"] = 30
  CC.TSJSSX["解毒能力"] = 30
  CC.TSJSSX["抗毒能力"] = 10
  CC.TSJSSX["拳掌功夫"] = 30
  CC.TSJSSX["御剑能力"] = 30
  CC.TSJSSX["耍刀技巧"] = 30
  CC.TSJSSX["特殊兵器"] = 30
  CC.TSJSSX["暗器技巧"] = 30
  CC.TSJSSX["武学常识"] = 0
  CC.TSJSSX["品德"] = 50
  CC.TSJSSX["攻击带毒"] = 0
  CC.TSJSSX["左右互搏"] = 0
  CC.TSJSSX["声望"] = 0
  CC.TSJSSX["修炼物品"] = -1
  CC.TSJSSX["修炼点数"] = 0
  CC.BUGFIX = 1
  CC.BUGYB = 0
  CC.BUGCL = 0
  CC.BUGZZ = 0
  CC.BUGPTT = 0
  CC.BUGTSJ = 0
  CC.BUG1028 = 0
  CC.UPADD = {}
  CC.HanhuaKG = 1
  CC.Hanhua = {
    {
      0,
      0,
      0,
      "本教招收新弟子",
      "明教拜师处"
    }
  }
  CC.MSKG = 0
  CC.YXMS = 0
  CC.MSSX = 80
  CC.MAXSX = {}
  CC.TSJZS = 0
  CC.YXNDA = 1
  CC.YXBQZ = 20
  CC.DUDX = 1
  CC.ZZADD = {
    2,
    2,
    3,
    4,
    5,
    6,
    7
  }
  CC.QGADD = {
    3,
    3,
    3,
    3,
    3,
    3,
    3
  }
  CC.UPADD = {
    2,
    2,
    2,
    2,
    2,
    2,
    2,
    2
  }
  CC.TSZZADD = {
    2,
    2,
    3,
    4,
    5,
    6,
    7
  }
  CC.TSQGADD = {
    3,
    3,
    3,
    3,
    3,
    3,
    3
  }
  CC.TSUPADD = {
    2,
    2,
    2,
    2,
    2,
    2,
    2,
    2
  }
  
end
