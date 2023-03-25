function IncludeFile()
  package.path = CONFIG.ScriptLuaPath
  szlzw = {}
  szlzw.MOD = 1
  require("jyconst")
  dofile(CONFIG.ScriptPath .. "event.lua")
  require("newconst")
end
function SetGlobal()
  CC.Exp1 = {}
  JY = {}
  JY.Status = GAME_INIT
  JY.Base = {}
  JY.PersonNum = 0
  JY.Person = {}
  JY.ThingNum = 0
  JY.Thing = {}
  JY.SceneNum = 0
  JY.Scene = {}
  JY.WugongNum = 0
  JY.Wugong = {}
  JY.ShopNum = 0
  JY.Shop = {}
  JY.Data_Base = nil
  JY.Data_Person = nil
  JY.Data_Thing = nil
  JY.Data_Scene = nil
  JY.Data_Wugong = nil
  JY.Data_Shop = nil
  JY.Data_GLTS = nil
  JY.MyCurrentPic = 0
  JY.MyPic = 0
  JY.MyTick = 0
  JY.MyTick2 = 0
  JY.EnterSceneXY = nil
  JY.oldMMapX = -1
  JY.oldMMapY = -1
  JY.oldMMapPic = -1
  JY.exitX = -1
  JY.exitY = -1
  JY.exitPic = -1
  JY.SubScene = -1
  JY.SubSceneX = 0
  JY.SubSceneY = 0
  JY.Darkness = 0
  JY.CurrentD = -1
  JY.OldDPass = -1
  JY.CurrentEventType = -1
  JY.oldSMapX = -1
  JY.oldSMapY = -1
  JY.oldSMapXoff = -1
  JY.oldSMapYoff = -1
  JY.oldSMapPic = -1
  JY.D_Valid = nil
  JY_D_Valld_Num = 0
  JY.D_PicChange = {}
  JY.NumD_PicChange = 0
  JY.CurrentThing = -1
  JY.MmapMusic = -1
  JY.CurrentMIDI = -1
  JY.EnableMusic = 1
  JY.EnableSound = 1
  JY.ThingUseFunction = {}
  JY.SceneNewEventFunction = {}
  WAR = {}
  xzqbpd = 3
  zdyx = {}
  for i = 1, CC.TeamNum do
    zdyx[i] = {}
    zdyx[i][1] = 0
    zdyx[i][2] = -1
  end
  Movex = 0
  Movey = 0
  oldcur_line = 0
  oldcur_x = 0
  oldcur_y = 0
  JY.SaveTime = 10
  JY.AtTime = lib.GetTime()
  JY.DiyTime = JY.AtTime + JY.SaveTime * 60000
  JY.SBZ = 0
  JY.DHSJ = lib.GetTime() + 5000
  JY.DHBZ = 0
  JY.ZLX = nil
  JY.ZLY = nil
  JY.ZLBZ = 0
  JY.ZLBZ1 = 0
  JY.ZLT = lib.GetTime()
  JY.ZLT1 = lib.GetTime()
  JY.ZLSHBZ = 0
  JY.ZUOBI = 0
  JY.ZBJK = 0
  JY.ZBJKSJ = lib.GetTime()
  JY.JSEXP = 0
  JY.MoveZTime = lib.GetTime()
  JY.WGXZWZ = {}
  JY.ZCWGCS = 0
  X50 = {}
  if CC.X50OPEN == 1 then
    for i = 0, 20000 do
      X50[i] = 0
    end
  end
  XB50 = {}
  X50STR = {}
  X50JMP = 0
  X50BL32 = {}
  BL32PD = 0
  JY.AQ = {}
  JY.AQNUM = 0
  JY.Selpstr = {}
  JY.YXND = 0
  JY.Huhuolq = 5
  JY.Huhuocs = 2
  JY.SETPD = 1
  AutoMoveTab = {
    [0] = 0
  }
  JY.AI = 0
  JY.GLTS = {}
  JY.Book = 0
  JY.MiniMap = 0
  JY.ATAI = {}
  for i = 1, 20 do
    JY.ATAI[i] = {}
    JY.ATAI[i][2] = 2
  end
  JY.AISET = 1
  JY.KT = 0
  JY.WGMC = ""
  JY.XTKG = 1
  JY.TXKG = 1
  JY.JZKG = 1
  JY.SCKG = 1
  JY.DEADKG = 1
  JY.MENUMSG = 0
  JY.SCTMP = 0
  JY.WD = 0
  JY.DEADPD = {}
  JY.WARWF = 0
  JY.WARDF = 0
  JY.OLDRKX = -1
  JY.OLDRKY = -1
  JY.WN = 0
  JY.YXNDXZ = 0
  JY.WFWC = ""
  JY.DFWC = ""
  JY.NDXS = 0
  JY.NDXS1 = 0
  JY.XTMAX = 0
  JY.NEWGAME = 0
  JY.SHOWWG = ""
  JY.SWGT = lib.GetTime()
  JY.NDYX = 0.5
  JY.NDBS = 0.5
  JY.NDPER = 100
  JY.BJS = {}
  JY.BJSTIME = lib.GetTime()
end
function JY_Main()
  os.remove("debug.txt")
  xpcall(JY_Main_sub, myErrFun)
end
function myErrFun(err)
  lib.Debug(err)
  lib.Debug(debug.traceback())
end
function CleanMemory()
  if CONFIG.CleanMemory == 1 then
    collectgarbage("collect")
  end
end
function JY_Main_sub()
  IncludeFile()
  SetGlobalConst()
  NewSetGlobalConst()
  if CC.SHGS == 0 then
    CC.BanBen = 0
  else
    CC.BanBen = 4
  end
  CCFZB()
  SetGlobal()
  GenTalkIdx()
  setmetatable(_G, {
    __newindex = function(_, n)
      error("attempt read write to undeclared variable " .. n, 2)
    end,
    __index = function(_, n)
      error("attempt read read to undeclared variable " .. n, 2)
    end
  })
  lib.Debug("JY_Main start.")
  ReadBin()
  Game_Start()
  Game_Cycle()
end
function Game_Start()
  math.randomseed(os.time())
  lib.EnableKeyRepeat(CONFIG.KeyRepeatDelay, CONFIG.KeyRePeatInterval)
  JY.Status = GAME_START
  lib.PicInit(CC.PaletteFile)
  lib.FillColor(0, 0, 0, 0, 0)
  lib.LoadPNGPath(CC.HeadPath, 1, CC.HeadNum, 10, "png")
  Cls()
  PlayMIDI(16)
  lib.ShowSlow(50, 0)
  while true do
    Cls()
    WhoAmI()
    local menu = {
      {
        "重新开始",
        nil,
        1
      },
      {
        "载入进度",
        nil,
        1
      },
      {
        "系统设置",
        nil,
        1
      },
      {
        "切换版本",
        nil,
        0
      },
      {
        "离开游戏",
        nil,
        1
      }
    }
    local menux = (CC.ScreenW - 5 * CC.StartMenuFontSize - 2 * CC.MenuBorderPixel) / 2
    local menuy = CC.StartMenuY - CC.StartMenuFontSize
    local menuReturn = ShowMenu(menu, #menu, 0, menux, menuy - CC.StartMenuFontSize * 0.6, 0, 0, 0, 0, CC.StartMenuFontSize * 1, C_STARTMENU, C_RED)
    if menuReturn == 1 then
      JY.NEWGAME = 1
      NewGame()
      Cls()
      DrawString(menux, menuy, "请稍候...", C_RED, CC.StartMenuFontSize * 1.3)
      ShowScreen()
      JY.SubScene = CC.NewGameSceneID
      JY.Scene[JY.SubScene]["名称"] = JY.Person[0]["姓名"] .. "居"
      if CC.SceneNameRen == 1 then
        JY.Scene[JY.SubScene]["名称"] = CC.SceneName
      end
      JY.Base["人X1"] = CC.NewGameSceneX
      JY.Base["人Y1"] = CC.NewGameSceneY
      JY.MyPic = CC.NewPersonPic
      lib.ShowSlow(50, 1)
      JY.Status = GAME_SMAP
      JY.MmapMusic = -1
      CleanMemory()
      Init_SMap(0)
      TSGL(CONFIG.DataPath .. "list/start.txt", 1)
      Cls()
      if CC.SHGS ~= 100 then
        local title = "请选择游戏模式"
        local str = "  休闲：新手适用的模式  *" .. "  经典：标准的游戏模式  *" .. "  挑战：挑战高难度模式  "
        local btn = {
          "休闲",
          "经典",
          "挑战"
        }
        local num = #btn
        local r = JYMsgBox(title, str, btn, num, CC.DXKTX, 1)
        if r == 1 or r < 0 then
          CC.YXMS = 1
          CC.YXNDA = 0
        elseif r == 2 then
          CC.YXMS = 0
          CC.YXNDA = 1
        elseif r == 3 then
          CC.YXMS = 0
          CC.YXNDA = 2
        end
      else
        CC.YXMS = 0
        CC.YXNDA = 1
      end
      local menu = {}
      for i = 1, #CC.YXNDXZ do
local ndsum = math.modf((CC.YXND[i][3] + CC.YXND[i][4]) / (CC.YXND[i][1] + CC.YXND[i][2]) * 100)
        menu[i] = {
     CC.YXNDXZ[i] .. " " .. ndsum .. "%",
          nil,
          1
        }
      end
      local size = CC.StartMenuFontSize
      local menux = CC.ScreenW / 2 - CC.StartMenuFontSize * 3
      local tsy = CC.ScreenH / 2 - size * 5
      DrawStrBox(menux - size, tsy, "选择游戏难度", C_GOLD, size)
      local r = ShowMenu(menu, #menu, 0, menux - size, CC.ScreenH / 2 - CC.StartMenuFontSize * 3, 0, 0, 1, 1, CC.StartMenuFontSize, C_GOLD, C_WHITE)
      if r == 0 then
        JY.YXNDXZ = 1
      else
        JY.YXNDXZ = r
      end
      Cls()
      local ndsum = math.modf((CC.YXND[JY.YXNDXZ][3] + CC.YXND[JY.YXNDXZ][4]) / (CC.YXND[JY.YXNDXZ][1] + CC.YXND[JY.YXNDXZ][2]) * 100)
      local title = "请选择内力性质"
      local str = "*" .. "内力性质影响武功修炼的路线" .. "*"
      local btn = {"阴性", "阳性"}
      if JY.Person[0]["姓名"] == CC.TSJSName or JY.Person[0]["姓名"] == "szlzw" then
        btn = {
          "阴性",
          "阳性",
          "调和"
        }
      end
      local num = #btn
      local nlxz = JYMsgBox(title, str, btn, num, CC.DXKTX, 1)
      if nlxz < 0 then
        nlxz = 1
      end
      JY.Person[0]["内力性质"] = nlxz - 1
      Cls()
      if DrawStrBoxYesNo(-1, -1, "是否观看开始动画？", C_WHITE, CC.DefaultFont) == true then
        oldCallEvent(CC.NewGameEvent)
      else
        oldCallEvent(CC.SwapEvent)
      end
      if CC.TSJZS == 1 and DrawStrBoxYesNo(-1, -1, "是否使用开局助手？", C_WHITE, CC.DefaultFont) == true then
        menu_kgzs()
      end
      JY.NEWGAME = 0
      break
    elseif menuReturn == 2 then
      local r = SaveList()
      if 0 < r and existFile(CC.S_Filename[r]) and existFile(CC.D_Filename[r]) then
        DrawString(CC.ScreenW / 2 - CC.StartMenuFontSize * 2, CC.StartMenuY, "请稍候...", C_RED, CC.StartMenuFontSize * 1.3)
        ShowScreen()
        LoadRecord(r)
        if 0 < JY.Base["无用"] then
          if JY.Status == GAME_MMAP then
            lib.UnloadMMap()
            lib.PicInit()
          end
          lib.ShowSlow(50, 1)
          JY.Status = GAME_SMAP
          JY.SubScene = JY.Base["无用"]
          JY.MmapMusic = -1
          JY.MyPic = GetMyPic()
          Init_SMap(1)
          break
        end
        if JY.Base["无用"] == 0 then
          if JY.Base["人X"] == JY.Scene[0]["外景入口X1"] - 1 and JY.Base["人Y"] == JY.Scene[0]["外景入口Y1"] or JY.Base["人X"] == JY.Scene[0]["外景入口X2"] and JY.Base["人Y"] == JY.Scene[0]["外景入口Y2"] + 1 then
            if JY.Status == GAME_MMAP then
              lib.UnloadMMap()
              lib.PicInit()
            end
            lib.ShowSlow(50, 1)
            JY.Status = GAME_SMAP
            JY.SubScene = JY.Base["无用"]
            JY.MmapMusic = -1
            JY.MyPic = GetMyPic()
            Init_SMap(1)
            break
          end
          JY.SubScene = -1
          JY.Status = GAME_FIRSTMMAP
          break
        end
        JY.SubScene = -1
        JY.Status = GAME_FIRSTMMAP
        break
      end
    elseif menuReturn == 3 then
      JY.SETPD = 0
      System_Set()
    elseif menuReturn == 4 then
      JY.SETPD = 0
      YXQH()
    elseif menuReturn == 5 then
      os.exit()
    end
  end
  JY.SETPD = 1
  return 1
end
function NewGame()
  LoadRecord(0)
  if #CC.NewPersonName > 8 then
    CC.NewPersonName = "徐小侠"
  end
  JY.Person[0]["姓名"] = CC.NewPersonName
  JY.Person[0]["资质"] = InputNum("请输入资质", 1, 100)
  Cls()
  while true do
    JY.Person[0]["内力性质"] = Rnd(2)
    JY.Person[0]["内力最大值"] = Rnd(20) + 21
    JY.Person[0]["攻击力"] = Rnd(10) + 21
    JY.Person[0]["防御力"] = Rnd(10) + 21
    JY.Person[0]["轻功"] = Rnd(10) + 21
    JY.Person[0]["医疗能力"] = Rnd(10) + 21
    JY.Person[0]["用毒能力"] = Rnd(10) + 21
    JY.Person[0]["解毒能力"] = Rnd(10) + 21
    JY.Person[0]["抗毒能力"] = Rnd(10) + 21
    JY.Person[0]["拳掌功夫"] = Rnd(10) + 21
    JY.Person[0]["御剑能力"] = Rnd(10) + 21
    JY.Person[0]["耍刀技巧"] = Rnd(10) + 21
    JY.Person[0]["特殊兵器"] = Rnd(10) + 21
    JY.Person[0]["暗器技巧"] = Rnd(10) + 21
    JY.Person[0]["生命增长"] = Rnd(5) + 3
    JY.Person[0]["生命最大值"] = JY.Person[0]["生命增长"] * 3 + 29
    JY.Person[0]["生命"] = JY.Person[0]["生命最大值"]
    JY.Person[0]["内力"] = JY.Person[0]["内力最大值"]
    if CC.SHGS == 3 then
      JY.Person[0]["生命增长"] = math.modf(JY.Person[0]["生命增长"] / 2)
    end
    Cls()
    local fontsize = 1.5 * CC.NewGameFontSize
    local h = fontsize + 1 * CC.RowPixel
    local w = fontsize * 4
    local x1 = (CC.ScreenW - w * 5) / 2
    local y1 = 1 * CC.NewGameY + -100
    local i = 0
    local DrawAttrib = function(str1, str2)
      if str2 == "内力" then
        if JY.Person[0]["内力"] == 40 then
          lib.FillColor(x1 + i * w, y1, x1 + i * w + fontsize * 3.5, y1 + fontsize, C_ORANGE)
          DrawString(x1 + i * w, y1, str1, C_RED, fontsize)
          DrawString(x1 + i * w + fontsize * 2, y1, string.format("%3d ", JY.Person[0][str2]), C_WHITE, fontsize)
        else
          DrawString(x1 + i * w, y1, str1, C_RED, fontsize)
          DrawString(x1 + i * w + fontsize * 2, y1, string.format("%3d ", JY.Person[0][str2]), C_WHITE, fontsize)
        end
      elseif str2 == "生命" then
        if JY.Person[0][str2] == 50 then
          lib.FillColor(x1 + i * w, y1, x1 + i * w + fontsize * 3.5, y1 + fontsize, C_ORANGE)
          DrawString(x1 + i * w, y1, str1, C_RED, fontsize)
          DrawString(x1 + i * w + fontsize * 2, y1, string.format("%3d ", JY.Person[0][str2]), C_WHITE, fontsize)
        else
          DrawString(x1 + i * w, y1, str1, C_RED, fontsize)
          DrawString(x1 + i * w + fontsize * 2, y1, string.format("%3d ", JY.Person[0][str2]), C_WHITE, fontsize)
        end
      elseif JY.Person[0][str2] == 30 then
        lib.FillColor(x1 + i * w, y1, x1 + i * w + fontsize * 3.5, y1 + fontsize, C_ORANGE)
        DrawString(x1 + i * w, y1, str1, C_RED, fontsize)
        DrawString(x1 + i * w + fontsize * 2, y1, string.format("%3d ", JY.Person[0][str2]), C_WHITE, fontsize)
      else
        DrawString(x1 + i * w, y1, str1, C_RED, fontsize)
        DrawString(x1 + i * w + fontsize * 2, y1, string.format("%3d ", JY.Person[0][str2]), C_WHITE, fontsize)
      end
      i = i + 1
    end
    local DrawAttrib1 = function(str1, str2)
      DrawString(x1 + i * w, y1, str1, C_RED, fontsize)
      local ns = JY.Person[0][str2]
      if ns == 0 then
        DrawString(x1 + i * w + fontsize * 2, y1, " 阴", RGB(208, 152, 208), fontsize)
      else
        DrawString(x1 + i * w + fontsize * 2, y1, " 阳", C_GOLD, fontsize)
      end
      i = i + 1
    end
    if JY.Person[0]["姓名"] == CC.TSJSName or JY.Person[0]["姓名"] == "szlzw" then
      DrawString(CC.ScreenW / 2 - fontsize * 5, CC.ScreenH / 2 + fontsize * 2, JY.Person[0]["姓名"] .. "，你已经超神了！", C_GOLD, CC.StartMenuFontSize, 1)
      ShowScreen()
      WaitKey()
      JY.Person[0]["内力最大值"] = CC.TSJSSX["内力最大值"]
      JY.Person[0]["攻击力"] = CC.TSJSSX["攻击力"]
      JY.Person[0]["防御力"] = CC.TSJSSX["防御力"]
      JY.Person[0]["轻功"] = CC.TSJSSX["轻功"]
      JY.Person[0]["医疗能力"] = CC.TSJSSX["医疗能力"]
      JY.Person[0]["用毒能力"] = CC.TSJSSX["用毒能力"]
      JY.Person[0]["解毒能力"] = CC.TSJSSX["解毒能力"]
      JY.Person[0]["抗毒能力"] = CC.TSJSSX["抗毒能力"]
      JY.Person[0]["拳掌功夫"] = CC.TSJSSX["拳掌功夫"]
      JY.Person[0]["御剑能力"] = CC.TSJSSX["御剑能力"]
      JY.Person[0]["耍刀技巧"] = CC.TSJSSX["耍刀技巧"]
      JY.Person[0]["特殊兵器"] = CC.TSJSSX["特殊兵器"]
      JY.Person[0]["暗器技巧"] = CC.TSJSSX["暗器技巧"]
      JY.Person[0]["生命增长"] = CC.TSJSSX["生命增长"]
      JY.Person[0]["生命最大值"] = CC.TSJSSX["生命最大值"]
      JY.Person[0]["生命"] = JY.Person[0]["生命最大值"]
      JY.Person[0]["内力"] = JY.Person[0]["内力最大值"]
      JY.Person[0]["外号"] = CC.TSJSSX["外号"]
      JY.Person[0]["内力性质"] = CC.TSJSSX["内力性质"]
      if CC.JS == 1 then
        JY.Wugong[30]["未知1"] = 8
      end
      if 10 < JY.Person[0]["生命增长"] then
        JY.Person[0]["生命增长"] = 10
      end
      if CC.SHGS == 3 and JY.Person[0]["生命增长"] > 4 then
        JY.Person[0]["生命增长"] = 4
      end
      break
    else
      Cls()
      WhoAmI()
      DrawString(x1, y1, JY.Person[0]["姓名"] .. ",属性满意吗?", C_GOLD, fontsize)
      i = 0
      y1 = y1 + h
      DrawAttrib("内力", "内力")
      DrawAttrib("攻击", "攻击力")
      DrawAttrib("轻功", "轻功")
      DrawAttrib("防御", "防御力")
      DrawAttrib1("内功", "内力性质")
      i = 0
      y1 = y1 + h
      DrawAttrib("生命", "生命")
      DrawAttrib("医疗", "医疗能力")
      DrawAttrib("用毒", "用毒能力")
      DrawAttrib("解毒", "解毒能力")
      DrawAttrib("资质", "资质")
      i = 0
      y1 = y1 + h
      DrawAttrib("拳掌", "拳掌功夫")
      DrawAttrib("御剑", "御剑能力")
      DrawAttrib("耍刀", "耍刀技巧")
      DrawAttrib("特殊", "特殊兵器")
      DrawAttrib("暗器", "暗器技巧")
      ShowScreen()
      do
        local menu = {
          {
            "是 ",
            nil,
            1
          },
          {
            "否 ",
            nil,
            2
          }
        }
        local ok = ShowMenu2(menu, 2, 0, x1 + 10 * fontsize, CC.NewGameY + -110 + CC.MenuBorderPixel, 0, 0, 0, 0, fontsize, C_RED, C_WHITE)
        if ok == 1 then
          break
        end
      end
    end
  end
  if CC.BanBen == 1 and CC.JS == 1 and JY.Person[0]["姓名"] ~= "szlzw" then
    SelPerson()
  end
end
function ZCset()
  local zcsetnb = {}
  local zcsetstr = {}
  for i = 1, 2 do
    zcsetstr[i] = {}
  end
  if JY.ZCKG == 1 then
    zcsetnb[1] = 1
  else
    zcsetnb[1] = 0
  end
  if JY.JSKG == 1 then
    zcsetnb[2] = 1
  else
    zcsetnb[2] = 0
  end
  local rr = 1
  while true do
    if zcsetnb[1] == 0 then
      zcsetstr[1][1] = "关闭 自创武功"
    else
      zcsetstr[1][1] = "开启 自创武功"
    end
    if zcsetnb[2] == 0 then
      zcsetstr[2][1] = "关闭 特殊角色"
    else
      zcsetstr[2][1] = "开启 特殊角色"
    end
    local menu = {
      {
        zcsetstr[1][1],
        nil,
        1
      },
      {
        zcsetstr[2][1],
        nil,
        1
      }
    }
    local r = ShowMenu2_new(menu, #menu, 2, 12, -1, -1, 0, 0, 1, 1, CC.DefaultFont, C_ORANGE, C_WHITE, "苍龙设置", rr)
    rr = r
    if r == 0 then
      break
    end
    if r == 1 then
      if fksetnb[1] == 1 then
        fksetnb[1] = 0
        JY.ZCKG = 0
      else
        fksetnb[1] = 1
        JY.ZCKG = 1
      end
    elseif r == 2 then
      if fksetnb[2] == 1 then
        fksetnb[2] = 0
        JY.JSKG = 0
      else
        fksetnb[2] = 1
        JY.JSKG = 1
      end
    end
  end
end
function SelPerson()
  JY.Selpstr = {}
  local title = "选择特殊角色"
  local str = "拳霸：拳头硬才是道理。特技：破防" .. "*剑魔：剑不沾血不入鞘。特技：嗜血" .. "*刀痴：问世间情为何物。特技：必杀" .. "*特狂：跟我冲不要畏惧。特技：暴击" .. "*神助：天神赐予我力量。特技：护体" .. "*巫妖：烈火中永生不灭。特技：复活" .. "*毒王：无毒非丈夫所为。特技：啐毒" .. "*幻影：幻之影如影随形。特技：影杀"
  local btn = {
    "拳",
    "剑",
    "刀",
    "特",
    "助",
    "巫",
    "毒",
    "影"
  }
  local num = #btn
  local r = JYMsgBox(title, str, btn, num, nil, 1)
  if r == 0 or r == 1 then
    JY.Selpstr[1] = {"拳掌功夫", 1}
    JY.Selpstr[2] = {"攻击力", -1}
    JY.Selpstr[3] = {"防御力", 2}
    JY.Selpstr[4] = {"轻功", 2}
    JY.Person[0]["外号"] = "拳霸"
    JY.Wugong[30]["未知1"] = 1
    DrawStrBoxWaitKey("拳霸→破防伤害开启", C_WHITE, CC.DefaultFont)
  elseif r == 2 then
    JY.Selpstr[1] = {"御剑能力", 1}
    JY.Selpstr[2] = {"攻击力", 2}
    JY.Selpstr[3] = {"防御力", -2}
    JY.Person[0]["外号"] = "剑魔"
    JY.Wugong[30]["未知1"] = 2
    DrawStrBoxWaitKey("剑魔→嗜血伤害开启", C_WHITE, CC.DefaultFont)
  elseif r == 3 then
    JY.Selpstr[1] = {"耍刀技巧", 1}
    JY.Selpstr[2] = {"攻击力", -1}
    JY.Selpstr[3] = {"防御力", 2}
    JY.Selpstr[4] = {"轻功", 2}
    JY.Person[0]["外号"] = "刀痴"
    JY.Wugong[30]["未知1"] = 3
    DrawStrBoxWaitKey("刀痴→一击必杀开启", C_WHITE, CC.DefaultFont)
  elseif r == 4 then
    JY.Selpstr[1] = {"特殊兵器", 1}
    JY.Selpstr[2] = {"防御力", 4}
    JY.Selpstr[3] = {"轻功", -2}
    JY.Person[0]["外号"] = "特狂"
    JY.Wugong[30]["未知1"] = 4
    DrawStrBoxWaitKey("特狂→暴击伤害开启", C_WHITE, CC.DefaultFont)
  elseif r == 5 then
    JY.Selpstr[1] = {"攻击力", 3}
    JY.Selpstr[2] = {"防御力", -2}
    JY.Selpstr[3] = {"轻功", -2}
    JY.Selpstr[4] = {"内力最大值", 50}
    JY.Person[0]["外号"] = "神助"
    JY.Wugong[30]["未知1"] = 5
    DrawStrBoxWaitKey("神助→天神护体开启", C_WHITE, CC.DefaultFont)
  elseif r == 6 then
    JY.Selpstr[1] = {"医疗能力", 3}
    JY.Selpstr[2] = {"用毒能力", 1}
    JY.Selpstr[3] = {"抗毒能力", 2}
    JY.Selpstr[4] = {"攻击力", -1}
    JY.Selpstr[5] = {"轻功", 2}
    JY.Person[0]["外号"] = "巫妖"
    JY.Wugong[30]["未知1"] = 6
    DrawStrBoxWaitKey("巫妖→重生技能开启", C_WHITE, CC.DefaultFont)
  elseif r == 7 then
    JY.Selpstr[1] = {"用毒能力", 3}
    JY.Selpstr[2] = {"抗毒能力", 3}
    JY.Selpstr[3] = {"攻击力", -1}
    JY.Selpstr[4] = {"防御力", 2}
    JY.Person[0]["外号"] = "毒王"
    JY.Wugong[30]["未知1"] = 7
    DrawStrBoxWaitKey("毒王→淬毒伤害开启", C_WHITE, CC.DefaultFont)
  elseif r == 8 then
    JY.Selpstr[1] = {"攻击力", -1}
    JY.Selpstr[2] = {"防御力", 2}
    JY.Selpstr[3] = {"轻功", 2}
    JY.Person[0]["外号"] = "幻影"
    JY.Wugong[30]["未知1"] = 9
    DrawStrBoxWaitKey("幻影→影杀技能开启", C_WHITE, CC.DefaultFont)
  end
end
function Game_Cycle()
  lib.Debug("Start game cycle")
  while JY.Status ~= GAME_END do
    local t1 = lib.GetTime()
    JY.MyTick = JY.MyTick + 1
    if JY.MyTick % 20 == 0 then
      JY.MyCurrentPic = 0
    end
    if JY.MyTick % 1000 == 0 then
      JY.MyTick = 0
    end
    if JY.Status == GAME_FIRSTMMAP then
      CleanMemory()
      lib.ShowSlow(50, 1)
      JY.MmapMusic = 16
      JY.Status = GAME_MMAP
      local t1 = lib.GetTime()
      Init_MMap()
      local t2 = lib.GetTime()
      lib.Debug(string.format("first init map cost %d",t2 - t1))
      lib.DrawMMap(JY.Base["人X"], JY.Base["人Y"], GetMyPic())
      t2 = lib.GetTime()
      lib.Debug(string.format("first draw mainmap cost %d",t2 - t1))
      lib.ShowSlow(50, 0)
    elseif JY.Status == GAME_MMAP then
      Game_MMap()
    elseif JY.Status == GAME_SMAP then
      Game_SMap()
    end
    collectgarbage("step", 0)
    local t2 = lib.GetTime()
    if t2 - t1 < CC.Frame then
      lib.Delay(CC.Frame - (t2 - t1))
    end
  end
end
function YXQH()
  if JY.SETPD == 1 and DrawStrBoxYesNo(-1, -1, "切换版本会结束游戏！是否切换？", C_WHITE, CC.DefaultFont) == false then
    return
  end
  local menux = (CC.ScreenW - 5 * CC.StartMenuFontSize - 2 * CC.MenuBorderPixel) / 2
  local menuy = CC.StartMenuY - CC.StartMenuFontSize
  local menu3 = {
    {
      "原    版",
      nil,
      1
    },
    {
      "苍龙逐日",
      nil,
      1
    },
    {
      "再战江湖",
      nil,
      1
    },
    {
      "台湾乡民",
      nil,
      1
    },
    {
      "天 书 劫",
      nil,
      1
    },
    {
      "苍龙1028",
      nil,
      1
    }
  }
  local r11 = ShowMenu(menu3, #menu3, 0, menux, CC.ScreenH / 2 - CC.StartMenuFontSize * 3, 0, 0, 1, 1, CC.StartMenuFontSize, C_GOLD, C_WHITE)
  if 0 < r11 then
    local filecp = CONFIG.CurrentPath .. "set.ini"
    if existFile(filecp) then
      local file = io.open(filecp, "r")
      local str = {}
      local k = 1
      local ja
      for line in file:lines() do
        str[k] = line
        if str[k] ~= nil then
          if string.find(str[k], "CONFIG.MOD") then
            str[k] = "CONFIG.MOD = " .. r11 - 1
          end
          k = k + 1
        end
      end
      file = io.open(filecp, "w")
      for i = 1, k - 2 do
        file:write(str[i] .. "\n")
      end
      file:write(str[k - 1])
      file:close()
      DrawStrBoxWaitKey("版本切换成功，游戏即将关闭！请重新进入", C_WHITE, CC.StartMenuFontSize)
    else
      DrawStrBoxWaitKey("切换失败，文件缺失！请重新下载配置文件", C_WHITE, CC.StartMenuFontSize)
    end
    os.exit()
  end
end
function Init_MMap()
  lib.PicInit()
  lib.LoadMMap(CC.MMapFile[1], CC.MMapFile[2], CC.MMapFile[3], CC.MMapFile[4], CC.MMapFile[5], CC.MWidth, CC.MHeight, JY.Base["人X"], JY.Base["人Y"])
  lib.PicLoadFile(CC.MMAPPicFile[1], CC.MMAPPicFile[2], 0)
  lib.PicLoadFile(CC.HeadPicFile[1], CC.HeadPicFile[2], 1)
  if CC.LoadThingPic == 1 then
    lib.PicLoadFile(CC.ThingPicFile[1], CC.ThingPicFile[2], 2)
  end
  if CC.FK == 1 then
    lib.PicLoadFile(CC.MMAPPicFile[1], CC.MMAPPicFile[2], 2)
  end
  JY.EnterSceneXY = nil
  JY.oldMMapX = -1
  JY.oldMMapY = -1
  PlayMIDI(JY.MmapMusic)
end
function Game_MMap()
  local direct = -1
  local keypress, ktype, mx, my = WaitKey(1)
  if keypress ~= -1 or ktype ~= nil and ktype ~= -1 then
    JY.MyTick = 0
    if keypress == VK_ESCAPE or ktype == 4 then
      MMenu()
      if JY.Status == GAME_FIRSTMMAP then
        return
      end
      JY.oldMMapX = -1
      JY.oldMMapY = -1
    elseif keypress == VK_UP then
      direct = 0
    elseif keypress == VK_DOWN then
      direct = 3
    elseif keypress == VK_LEFT then
      direct = 2
    elseif keypress == VK_RIGHT then
      direct = 1
    elseif keypress == VK_S then
      if CC.TP == 1 then
    
      else
    
      end
      My_ChuangSong_Ex()
    elseif keypress == VK_H then
      SaveRecord(11)
      JY.AtTime = lib.GetTime()
      JY.SBZ = 1
    elseif keypress == VK_RETURN then
      if JY.Base["人X"] == 138 and JY.Base["人Y"] == 138 and JY.Person[0]["姓名"] == "szlzw" then
        JY.WD = JY.WD + 1
      else
        JY.WD = 0
      end
      if JY.WD == 10 then
      end
    elseif ktype == 2 or ktype == 3 then
      local tmpx, tmpy = mx, my
      mx = mx - CC.ScreenW / 2
      my = my - CC.ScreenH / 2
      mx = mx / CC.XScale
      my = my / CC.YScale
      mx, my = (mx + my) / 2, (my - mx) / 2
      if 0 < mx then
        mx = mx + 0.99
      else
        mx = mx - 0.01
      end
      if 0 < my then
        my = my + 0.99
      else
        mx = mx - 0.01
      end
      mx = math.modf(mx) + JY.Base["人X"]
      my = math.modf(my) + JY.Base["人Y"]
      if ktype == 2 then
        if 0 < lib.GetMMap(mx, my, 3) then
          for i = 0, 4 do
            for j = 0, 4 do
              local xx, yy = mx - i, my - j
              local sid = CanEnterScene(xx, xx)
              if sid < 0 then
                xx, yy = mx + i, my + j
                sid = CanEnterScene(xx, yy)
              end
              if 0 <= sid then
                CC.MMapAdress[0] = sid
                CC.MMapAdress[1] = tmpx
                CC.MMapAdress[2] = tmpy
                CC.MMapAdress[3] = xx
                CC.MMapAdress[4] = yy
                i = 5
                break
              end
            end
          end
        else
          CC.MMapAdress[0] = nil
        end
      end
      if ktype == 3 or ktype == 2 and JY.KT == 1 then
        if CC.MMapAdress[0] ~= nil then
          mx = CC.MMapAdress[3] - JY.Base["人X"]
          my = CC.MMapAdress[4] - JY.Base["人Y"]
          CC.MMapAdress[0] = nil
        else
          AutoMoveTab = {
            [0] = 0
          }
          mx = mx - JY.Base["人X"]
          my = my - JY.Base["人Y"]
        end
        walkto(mx, my)
      end
    elseif ktype == 5 then
      if JY.KT == 0 then
        JY.KT = 1
      else
        JY.KT = 0
      end
    end
  end
  if AutoMoveTab[0] ~= 0 then
    if direct == -1 then
      direct = AutoMoveTab[AutoMoveTab[0]]
      AutoMoveTab[AutoMoveTab[0]] = nil
      AutoMoveTab[0] = AutoMoveTab[0] - 1
    end
  else
    AutoMoveTab = {
      [0] = 0
    }
  end
  local x, y
  local CanMove = function(nd, nnd)
    local nx, ny = JY.Base["人X"] + CC.DirectX[nd + 1], JY.Base["人Y"] + CC.DirectY[nd + 1]
    if nnd ~= nil then
      nx, ny = nx + CC.DirectX[nnd + 1], ny + CC.DirectY[nnd + 1]
    end
    if CC.hx == nil and (lib.GetMMap(nx, ny, 3) == 0 and lib.GetMMap(nx, ny, 4) == 0 or CanEnterScene(nx, ny) ~= -1) then
      return true
    else
      return false
    end
  end
  local x, y
  if direct ~= -1 then
    AddMyCurrentPic()
    x = JY.Base["人X"] + CC.DirectX[direct + 1]
    y = JY.Base["人Y"] + CC.DirectY[direct + 1]
    JY.Base["人方向"] = direct
  else
    x = JY.Base["人X"]
    y = JY.Base["人Y"]
  end
  JY.SubScene = CanEnterScene(x, y)
  if lib.GetMMap(x, y, 3) == 0 and lib.GetMMap(x, y, 4) == 0 then
    JY.Base["人X"] = x
    JY.Base["人Y"] = y
  end
  JY.Base["人X"] = limitX(JY.Base["人X"], 10, CC.MWidth - 10)
  JY.Base["人Y"] = limitX(JY.Base["人Y"], 10, CC.MHeight - 10)
  if CC.MMapBoat[lib.GetMMap(JY.Base["人X"], JY.Base["人Y"], 0)] == 1 then
    JY.Base["乘船"] = 1
  else
    JY.Base["乘船"] = 0
  end
  local pic = GetMyPic()
  if CONFIG.FastShowScreen == 1 then
    if JY.oldMMapX == JY.Base["人X"] and JY.oldMMapY == JY.Base["人Y"] then
      if 0 <= JY.oldMMapPic and JY.oldMMapPic ~= pic then
        local rr = ClipRect(Cal_PicClip(0, 0, JY.oldMMapPic, 0, 0, 0, pic, 0))
        if rr ~= nil then
          lib.SetClip(0, 0, CC.ScreenW, CC.ScreenH)
          lib.DrawMMap(JY.Base["人X"], JY.Base["人Y"], pic)
        end
      end
    else
      lib.SetClip(0, 0, CC.ScreenW, CC.ScreenH)
      lib.DrawMMap(JY.Base["人X"], JY.Base["人Y"], pic)
    end
  else
    lib.DrawMMap(JY.Base["人X"], JY.Base["人Y"], pic)
  end
  MSG()
  if CC.OpenTimmerRemind == 1 then
    DrawTimer()
  end
  AutoSave()
  ShowScreen(CONFIG.FastShowScreen)
  lib.SetClip(0, 0, 0, 0)
  JY.oldMMapX = JY.Base["人X"]
  JY.oldMMapY = JY.Base["人Y"]
  JY.oldMMapPic = pic
  if JY.OLDRKX ~= JY.Base["人X"] or JY.OLDRKY ~= JY.Base["人Y"] then
    JY.OLDRKX = -1
    JY.OLDRKY = -1
  end
  if 0 <= JY.SubScene and (JY.OLDRKX == -1 and JY.OLDRKY == -1 or keypress ~= -1 or ktype ~= nil and ktype ~= -1) then
    CleanMemory()
    lib.UnloadMMap()
    lib.PicInit()
    JY.Status = GAME_SMAP
    JY.MmapMusic = -1
    JY.MyPic = GetMyPic()
    JY.Base["人X1"] = JY.Scene[JY.SubScene]["入口X"]
    JY.Base["人Y1"] = JY.Scene[JY.SubScene]["入口Y"]
    JY.OLDRKX = JY.Base["人X"]
    JY.OLDRKY = JY.Base["人Y"]
    Init_SMap(1)
  end
end
function Init_SMap(showname)
  lib.PicInit()
  lib.PicLoadFile(CC.SMAPPicFile[1], CC.SMAPPicFile[2], 0)
  lib.PicLoadFile(CC.HeadPicFile[1], CC.HeadPicFile[2], 1)
  if CC.LoadThingPic == 1 then
    lib.PicLoadFile(CC.ThingPicFile[1], CC.ThingPicFile[2], 2)
  end
  if CC.FK == 1 then
    lib.PicLoadFile(CC.MMAPPicFile[1], CC.MMAPPicFile[2], 2)
  end
  PlayMIDI(JY.Scene[JY.SubScene]["进门音乐"])
  JY.oldSMapX = -1
  JY.oldSMapY = -1
  JY.SubSceneX = 0
  JY.SubSceneY = 0
  JY.OldDPass = -1
  JY.D_Valid = nil
  DrawSMap()
  lib.ShowSlow(50, 0)
  Cls()
  ShowScreen()
  if showname == 1 then
    DrawStrBox(-1, 10, JY.Scene[JY.SubScene]["名称"], C_WHITE, CC.DefaultFont)
    ShowScreen()
    lib.Delay(500)
    Cls()
  end
end
function Game_SMap()
  DrawSMap(CONFIG.FastShowScreen)
  MSG()
  if CC.OpenTimmerRemind == 1 then
    DrawTimer()
  end
  AutoSave()
  ShowScreen(CONFIG.FastShowScreen)
  lib.SetClip(0, 0, 0, 0)
  local d_pass = GetS(JY.SubScene, JY.Base["人X1"], JY.Base["人Y1"], 3)
  if 0 <= d_pass then
    if d_pass ~= JY.OldDPass then
      EventExecute(d_pass, 3)
      JY.OldDPass = d_pass
      JY.oldSMapX = -1
      JY.oldSMapY = -1
      JY.D_Valid = nil
    end
  else
    JY.OldDPass = -1
  end
  local isout = 0
  if JY.Scene[JY.SubScene]["出口X1"] == JY.Base["人X1"] and JY.Scene[JY.SubScene]["出口Y1"] == JY.Base["人Y1"] or JY.Scene[JY.SubScene]["出口X2"] == JY.Base["人X1"] and JY.Scene[JY.SubScene]["出口Y2"] == JY.Base["人Y1"] or JY.Scene[JY.SubScene]["出口X3"] == JY.Base["人X1"] and JY.Scene[JY.SubScene]["出口Y3"] == JY.Base["人Y1"] then
    isout = 1
  end
  if isout == 1 then
    JY.Status = GAME_MMAP
    lib.PicInit()
    CleanMemory()
    if 0 > JY.MmapMusic then
      JY.MmapMusic = JY.Scene[JY.SubScene]["出门音乐"]
    end
    Init_MMap()
    JY.SubScene = -1
    JY.oldSMapX = -1
    JY.oldSMapY = -1
    lib.DrawMMap(JY.Base["人X"], JY.Base["人Y"], GetMyPic())
    lib.ShowSlow(50, 0)
    return
  end
  if 0 <= JY.Scene[JY.SubScene]["跳转场景"] and JY.Base["人X1"] == JY.Scene[JY.SubScene]["跳转口X1"] and JY.Base["人Y1"] == JY.Scene[JY.SubScene]["跳转口Y1"] then
    JY.SubScene = JY.Scene[JY.SubScene]["跳转场景"]
    lib.ShowSlow(50, 1)
    if JY.Scene[JY.SubScene]["外景入口X1"] == 0 and JY.Scene[JY.SubScene]["外景入口Y1"] == 0 then
      JY.Base["人X1"] = JY.Scene[JY.SubScene]["入口X"]
      JY.Base["人Y1"] = JY.Scene[JY.SubScene]["入口Y"]
    else
      JY.Base["人X1"] = JY.Scene[JY.SubScene]["跳转口X2"]
      JY.Base["人Y1"] = JY.Scene[JY.SubScene]["跳转口Y2"]
    end
    Init_SMap(1)
    return
  end
  local x, y
  local keypress, ktype, mx, my = WaitKey(1)
  local direct = -1
  if keypress ~= -1 or ktype ~= nil and ktype ~= -1 then
    JY.MyTick = 0
    if keypress == VK_ESCAPE or ktype == 4 then
      MMenu()
      JY.oldSMapX = -1
      JY.oldSMapY = -1
    elseif keypress == VK_UP then
      direct = 0
    elseif keypress == VK_DOWN then
      direct = 3
    elseif keypress == VK_LEFT then
      direct = 2
    elseif keypress == VK_RIGHT then
      direct = 1
    elseif keypress == VK_H then
      SaveRecord(11)
      JY.AtTime = lib.GetTime()
      JY.SBZ = 1
    elseif keypress == VK_S then
      TSInstruce()
    elseif keypress == VK_SPACE or keypress == VK_RETURN then
      if 0 <= JY.Base["人方向"] then
        local d_num = GetS(JY.SubScene, JY.Base["人X1"] + CC.DirectX[JY.Base["人方向"] + 1], JY.Base["人Y1"] + CC.DirectY[JY.Base["人方向"] + 1], 3)
        if 0 <= d_num then
          EventExecute(d_num, 1)
          JY.oldSMapX = -1
          JY.oldSMapY = -1
          JY.D_Valid = nil
        end
      end
    elseif ktype == 3 or ktype == 2 and JY.KT == 1 then
      AutoMoveTab = {
        [0] = 0
      }
      local x0 = JY.Base["人X1"]
      local y0 = JY.Base["人Y1"]
      mx = mx + (x0 - y0) * CC.XScale - CC.ScreenW / 2
      my = my + (x0 + y0) * CC.YScale - CC.ScreenH / 2
      local xx = (mx / CC.XScale + my / CC.YScale) / 2
      local yy = (my / CC.YScale - mx / CC.XScale) / 2
      if 0 < xx - math.modf(xx) then
        xx = math.modf(xx + 1)
      end
      if 0 < yy - math.modf(yy) then
        yy = math.modf(yy + 1)
      end
      if 0 <= xx and xx < CC.SWidth and 0 <= yy and yy < CC.SHeight then
        walkto(xx - x0, yy - y0)
      end
    elseif ktype == 5 then
      if JY.KT == 0 then
        JY.KT = 1
      else
        JY.KT = 0
      end
    end
  end
  if JY.Status ~= GAME_SMAP then
    return
  end
  if AutoMoveTab[0] ~= 0 then
    if direct == -1 then
      direct = AutoMoveTab[AutoMoveTab[0]]
      AutoMoveTab[AutoMoveTab[0]] = nil
      AutoMoveTab[0] = AutoMoveTab[0] - 1
    end
  else
    AutoMoveTab = {
      [0] = 0
    }
    if CC.AutoMoveEvent[0] == 1 and 2 >= math.abs(CC.AutoMoveEvent[1] - JY.Base["人X1"]) and 2 >= math.abs(CC.AutoMoveEvent[2] - JY.Base["人Y1"]) then
      EventExecute(GetS(JY.SubScene, CC.AutoMoveEvent[1], CC.AutoMoveEvent[2], 3), 1)
      CC.AutoMoveEvent[0] = 0
    end
  end
  if direct ~= -1 then
    AddMyCurrentPic()
    x = JY.Base["人X1"] + CC.DirectX[direct + 1]
    y = JY.Base["人Y1"] + CC.DirectY[direct + 1]
    JY.Base["人方向"] = direct
  else
    x = JY.Base["人X1"]
    y = JY.Base["人Y1"]
  end
  JY.MyPic = GetMyPic()
  DtoSMap()
  if SceneCanPass(x, y) == true then
    JY.Base["人X1"] = x
    JY.Base["人Y1"] = y
  end
  JY.Base["人X1"] = limitX(JY.Base["人X1"], 1, CC.SWidth - 2)
  JY.Base["人Y1"] = limitX(JY.Base["人Y1"], 1, CC.SHeight - 2)
end
function Cal_PicClip(dx1, dy1, pic1, id1, dx2, dy2, pic2, id2)
  local w1, h1, x1_off, y1_off = lib.PicGetXY(id1, pic1 * 2)
  local old_r = {}
  old_r.x1 = CC.XScale * (dx1 - dy1) + CC.ScreenW / 2 - x1_off
  old_r.y1 = CC.YScale * (dx1 + dy1) + CC.ScreenH / 2 - y1_off
  old_r.x2 = old_r.x1 + w1
  old_r.y2 = old_r.y1 + h1
  local w2, h2, x2_off, y2_off = lib.PicGetXY(id2, pic2 * 2)
  local new_r = {}
  new_r.x1 = CC.XScale * (dx2 - dy2) + CC.ScreenW / 2 - x2_off
  new_r.y1 = CC.YScale * (dx2 + dy2) + CC.ScreenH / 2 - y2_off
  new_r.x2 = new_r.x1 + w2
  new_r.y2 = new_r.y1 + h2
  return MergeRect(old_r, new_r)
end
function MergeRect(r1, r2)
  local res = {}
  res.x1 = math.min(r1.x1, r2.x1)
  res.y1 = math.min(r1.y1, r2.y1)
  res.x2 = math.max(r1.x2, r2.x2)
  res.y2 = math.max(r1.y2, r2.y2)
  return res
end
function ClipRect(r)
  if r.x1 >= CC.ScreenW or r.x2 <= 0 or r.y1 >= CC.ScreenH or 0 >= r.y2 then
    return nil
  else
    local res = {}
    res.x1 = limitX(r.x1, 0, CC.ScreenW)
    res.x2 = limitX(r.x2, 0, CC.ScreenW)
    res.y1 = limitX(r.y1, 0, CC.ScreenH)
    res.y2 = limitX(r.y2, 0, CC.ScreenH)
    return res
  end
end
function GetMyPic()
  local n
  if JY.Status == GAME_MMAP and JY.Base["乘船"] == 1 then
    if JY.MyCurrentPic >= 4 then
      JY.MyCurrentPic = 0
    end
  elseif JY.MyCurrentPic > 6 then
    JY.MyCurrentPic = 1
  end
  if JY.Base["乘船"] == 0 then
    n = CC.MyStartPic + JY.Base["人方向"] * 7 + JY.MyCurrentPic
  else
    n = CC.BoatStartPic + JY.Base["人方向"] * 4 + JY.MyCurrentPic
  end
  return n
end
function AddMyCurrentPic()
  JY.MyCurrentPic = JY.MyCurrentPic + 1
end
function CanEnterScene(x, y)
  if JY.EnterSceneXY == nil then
    Cal_EnterSceneXY()
  end
  local id = JY.EnterSceneXY[y * CC.MWidth + x]
  if id ~= nil then
    local e = JY.Scene[id]["进入条件"]
    if e == 0 then
      return id
    elseif e == 1 then
      return -1
    elseif e == 2 then
      for i = 1, CC.TeamNum do
        local pid = JY.Base["队伍" .. i]
        if 0 <= pid and JY.Person[pid]["轻功"] >= 70 then
          return id
        end
      end
    end
  end
  return -1
end
function Cal_EnterSceneXY()
  JY.EnterSceneXY = {}
  for id = 0, JY.SceneNum - 1 do
    local scene = JY.Scene[id]
    if 0 < scene["外景入口X1"] and scene["外景入口Y1"] then
      JY.EnterSceneXY[scene["外景入口Y1"] * CC.MWidth + scene["外景入口X1"]] = id
    end
    if 0 < scene["外景入口X2"] and scene["外景入口Y2"] then
      JY.EnterSceneXY[scene["外景入口Y2"] * CC.MWidth + scene["外景入口X2"]] = id
    end
  end
end
function MMenu()
  if JY.SCKG == 0 then
    JY.MENUMSG = 1
  end
  SCMSG()
  if JY.SCKG == 1 then
  end
  local menu = {
  {
      "回家",
      GoHome,
      0
    },
    {
      "医疗",
      Menu_Doctor,
      1
    },
    {
      "解毒",
      Menu_DecPoison,
      1
    },
    {
      "物品",
      Menu_Thing,
      1
    },
    {
      "定位",
      Menu_Map,
      0
    },
    {
      "进阶",
      ZYMS,
      0
    },
    {
      "状态",
      Menu_Status,
      1
    },
    {
      "离队",
      Menu_PersonExit,
      1
    },
    {
      "系统",
      Menu_System,
      1
    }
  }
  if JY.Status == GAME_MMAP then
    menu[5][3] = 1
    menu[1][3] = 1
    if JY.JZKG == 0 then
      menu[5][3] = 0
    end
  end
  Cls()
  local ndsum = math.modf((CC.YXND[JY.YXNDXZ][3] + CC.YXND[JY.YXNDXZ][4]) / (CC.YXND[JY.YXNDXZ][1] + CC.YXND[JY.YXNDXZ][2]) * 100)
  local str
  if CC.YXNDA == 0 then
    str = "休闲模式"
  elseif CC.YXNDA == 1 then
    str = "经典模式"
  elseif CC.YXNDA == 2 then
    str = "挑战模式"
  end
  local str1 = str .. " (" .. CC.YXNDXZ[JY.YXNDXZ] .. " " .. ndsum .. "%)"
  DrawString(CC.ScreenW / 2 - CC.StartMenuFontSize * #str1 / 4, CC.DefaultFont * 0.5, str1, C_RED, CC.StartMenuFontSize)
  if CC.YXMS == 1 and ndsum >= CC.MSSX then
    menu[6][3] = 1
  end
  local r = ShowMenu(menu, #menu, 0, CC.MainMenuX, CC.MainMenuY, 0, 0, 1, 1, CC.StartMenuFontSize, C_ORANGE, C_WHITE)
  if r == 0 or JY.SCKG == 1 then
    JY.MENUMSG = 0
  end
end
function GoHome()
  New_Enter_SubScene(CC.NewGameSceneID)
  return 1
end
function Menu_Map()
  if JY.MiniMap == 0 then
    if CONFIG.Operation == 1 then
      JY.SCTMP = JY.SCKG
      JY.SCKG = 0
    end
    JY.MiniMap = 1
  else
    if CONFIG.Operation == 1 then
      JY.SCKG = JY.SCTMP
    end
    JY.MiniMap = 0
  end
  JY.MENUMSG = 0
  return 1
end
function Menu_System()
  local menu = {
    {
      "读取进度",
      Menu_ReadRecord,
      1
    },
    {
      "保存进度",
      Menu_SaveRecord,
      1
    },
    {
      "关闭音乐",
      Menu_SetMusic,
      1
    },
    {
      "关闭音效",
      Menu_SetSound,
      1
    },
    {
      "全屏切换",
      Menu_FullScreen,
      0
    },
    {
      "系统攻略",
      TSInstruce,
      1
    },
    {
      "马车传送",
      My_ChuangSong_List,
      1
    },
    {
      "功能加强",
      Menu_App,
      1
    },
    {
      "系统设置",
      System_Set,
      1
    },
    {
      "离开游戏",
      Menu_Exit,
      1
    }
  }
  if JY.EnableMusic == 0 then
    menu[3][1] = "打开音乐"
  end
  if JY.EnableSound == 0 then
    menu[4][1] = "打开音效"
  end
  if JY.Status == GAME_SMAP then
    menu[7][3] = 0
  end
  local r = ShowMenu(menu, #menu, 0, CC.MainSubMenuX, CC.MainSubMenuY, 0, 0, 1, 1, CC.StartMenuFontSize, C_ORANGE, C_WHITE)
  if r == 0 then
    return 0
  elseif r < 0 then
    return 1
  end
end
function Menu_CS()
  local menu = {
    {
      "列表传送",
      My_ChuangSong_List,
      1
    },
    {
      "附近传送",
      Menu_Scene,
      1
    },
    {
      "数字传送",
      My_ChuangSong_Ex,
      1
    }
  }
  if JY.Status == GAME_SMAP then
  end
  local r = ShowMenu(menu, #menu, 0, CC.MainSubMenuX, CC.MainSubMenuY, 0, 0, 1, 1, CC.StartMenuFontSize, C_ORANGE, C_WHITE)
  if r == 0 then
    return 0
  elseif r < 0 then
    return 1
  end
end
function System_Set()
  local setstr = {}
  local setnb = {}
  local filecp = CONFIG.CurrentPath .. "set.ini"
  for i = 1, 8 do
    setstr[i] = {}
  end
  if existFile(filecp) then
    local file = io.open(filecp, "r")
    local str = {}
    local ss
    local k = 1
    local ja, ii, jj
    for line in file:lines() do
      str[k] = line
      if str[k] ~= nil then
        if string.find(str[k], "CONFIG.ZCOPEN") then
          for i = 0, 1 do
            if string.find(str[k], tostring(i)) then
              ii, jj = string.find(str[k], tostring(i))
            end
          end
          setstr[1][2] = str[k]
          setnb[1] = tonumber(string.sub(str[k], ii, jj))
        end
        if string.find(str[k], "CONFIG.JS") then
          for i = 0, 1 do
            if string.find(str[k], tostring(i)) then
              ii, jj = string.find(str[k], tostring(i))
            end
          end
          setstr[2][2] = str[k]
          setnb[2] = tonumber(string.sub(str[k], ii, jj))
        end
        if string.find(str[k], "CONFIG.Remind") then
          for i = 0, 1 do
            if string.find(str[k], tostring(i)) then
              ii, jj = string.find(str[k], tostring(i))
            end
          end
          setstr[3][2] = str[k]
          setnb[3] = tonumber(string.sub(str[k], ii, jj))
        end
        if string.find(str[k], "CONFIG.SaveTime") then
          for i = 1, 90 do
            if string.find(str[k], tostring(i)) then
              ii, jj = string.find(str[k], tostring(i))
            end
          end
          setstr[4][2] = str[k]
          if ii == nil then
            setnb[4] = 20
          else
            setnb[4] = tonumber(string.sub(str[k], ii, jj))
          end
        end
        if string.find(str[k], "CONFIG.ExpLevel") then
          for i = 0, 1 do
            if string.find(str[k], tostring(i)) then
              ii, jj = string.find(str[k], tostring(i))
            end
          end
          if ii == nil then
            setnb[5] = 0
          else
            setnb[5] = tonumber(string.sub(str[k], ii, jj))
          end
        end
        if string.find(str[k], "CONFIG.TP") then
          for i = 0, 1 do
            if string.find(str[k], tostring(i)) then
              ii, jj = string.find(str[k], tostring(i))
            end
          end
          if ii == nil then
            setnb[6] = 0
          else
            setnb[6] = tonumber(string.sub(str[k], ii, jj))
          end
        end
        if string.find(str[k], "CONFIG.MP3") then
          for i = 0, 1 do
            if string.find(str[k], tostring(i)) then
              ii, jj = string.find(str[k], tostring(i))
            end
          end
          if ii == nil then
            setnb[7] = 0
          else
            setnb[7] = tonumber(string.sub(str[k], ii, jj))
          end
        end
        if string.find(str[k], "CONFIG.Frame") then
          for i = 20, 60 do
            if string.find(str[k], tostring(i)) then
              ii, jj = string.find(str[k], tostring(i))
            end
          end
          setstr[8][2] = str[k]
          if ii == nil then
            setnb[8] = 20
          else
            setnb[8] = tonumber(string.sub(str[k], ii, jj))
          end
        end
        k = k + 1
      end
    end
    file:close()
  else
    return
  end
  local rr = 1
  while true do
    if setnb[1] == 0 then
      setstr[1][1] = "自创武功已关闭"
    else
      setstr[1][1] = "自创武功已开启"
    end
    if setnb[2] == 0 then
      setstr[2][1] = "特殊角色已关闭"
    else
      setstr[2][1] = "特殊角色已开启"
    end
    if setnb[3] == 0 then
      setstr[3][1] = "滚动信息已关闭"
    else
      setstr[3][1] = "滚动信息已开启"
    end
    setstr[4][1] = "自动存档" .. string.format("%2d分钟", setnb[4])
    if setnb[5] == 0 then
      setstr[5][1] = "双倍经验已关闭"
    elseif setnb[5] == 1 then
      setstr[5][1] = "双倍经验已开启"
    else
      setstr[5][1] = "双倍经验已关闭"
    end
    if setnb[6] == 0 then
      setstr[6][1] = "传送切换：编号"
    else
      setstr[6][1] = "传送切换：附近"
    end
    if setnb[7] == 0 then
      setstr[7][1] = "MP3音乐 已关闭"
    else
      setstr[7][1] = "MP3音乐 已开启"
    end
    setstr[8][1] = "游戏延迟：" .. string.format("%2d", setnb[8]) .. "ms"
    local menu = {
      {
        setstr[1][1],
        nil,
        1
      },
      {
        setstr[2][1],
        nil,
        1
      },
      {
        setstr[3][1],
        nil,
        1
      },
      {
        setstr[4][1],
        nil,
        1
      },
      {
        setstr[5][1],
        nil,
        1
      },
      {
        setstr[6][1],
        nil,
        1
      },
      {
        setstr[7][1],
        nil,
        1
      },
      {
        setstr[8][1],
        nil,
        1
      }
    }
    if CC.BanBen ~= 1 then
      menu[1] = nil
      menu[2] = nil
    end
    local r = ShowMenu2_new(menu, #menu, 2, 12, -1, -1, 0, 0, 1, 1, CC.DefaultFont, C_ORANGE, C_WHITE, "系统设置", rr)
    rr = r
    if r == 0 then
      if DrawStrBoxYesNo(-1, -1, "是否保存设置？", C_WHITE, CC.StartMenuFontSize) ~= false then
        if existFile(filecp) then
          local file = io.open(filecp, "r")
          local str = {}
          local k = 1
          local ja
          for line in file:lines() do
            str[k] = line
            if str[k] ~= nil then
              if string.find(str[k], "CONFIG.ZCOPEN") then
                str[k] = "CONFIG.ZCOPEN = " .. tostring(setnb[1])
              end
              if string.find(str[k], "CONFIG.JS") then
                str[k] = "CONFIG.JS = " .. tostring(setnb[2])
              end
              if string.find(str[k], "CONFIG.Remind") then
                str[k] = "CONFIG.Remind = " .. tostring(setnb[3])
              end
              if string.find(str[k], "CONFIG.SaveTime") then
                str[k] = "CONFIG.SaveTime = " .. tostring(setnb[4])
              end
              if string.find(str[k], "CONFIG.ExpLevel") then
                str[k] = "CONFIG.ExpLevel = " .. tostring(setnb[5])
              end
              if string.find(str[k], "CONFIG.TP") then
                str[k] = "CONFIG.TP = " .. tostring(setnb[6])
              end
              if string.find(str[k], "CONFIG.MP3") then
                str[k] = "CONFIG.MP3 = " .. tostring(setnb[7])
              end
              if string.find(str[k], "CONFIG.Frame") then
                str[k] = "CONFIG.Frame = " .. tostring(setnb[8])
              end
              k = k + 1
            end
          end
          file = io.open(filecp, "w")
          for i = 1, k - 2 do
            file:write(str[i] .. "\n")
          end
          file:write(str[k - 1])
          file:close()
        end
        if CC.BanBen == 1 then
          if setnb[1] == 0 then
            CC.ZCOPEN = 0
          else
            CC.ZCOPEN = 1
            if JY.SETPD == 1 then
              Cls()
              DrawStrBoxWaitKey("自创武功→开启成功", C_WHITE, CC.DefaultFont)
            end
          end
          if JY.SETPD == 1 then
            ZCKG()
          end
          if setnb[2] == 0 then
            CC.JS = 0
          else
            CC.JS = 1
            if JY.SETPD == 1 then
              Cls()
              if JY.Person[0]["外号"] == "拳霸" then
                DrawStrBoxWaitKey("拳霸→破防伤害开启", C_WHITE, CC.DefaultFont)
              elseif JY.Person[0]["外号"] == "剑魔" then
                DrawStrBoxWaitKey("剑魔→嗜血伤害开启", C_WHITE, CC.DefaultFont)
              elseif JY.Person[0]["外号"] == "刀痴" then
                DrawStrBoxWaitKey("刀痴→一击必杀开启", C_WHITE, CC.DefaultFont)
              elseif JY.Person[0]["外号"] == "特狂" then
                DrawStrBoxWaitKey("特狂→暴击伤害开启", C_WHITE, CC.DefaultFont)
              elseif JY.Person[0]["外号"] == "神助" then
                DrawStrBoxWaitKey("神助→天神护体开启", C_WHITE, CC.DefaultFont)
              elseif JY.Person[0]["外号"] == "巫妖" then
                DrawStrBoxWaitKey("巫妖→重生技能开启", C_WHITE, CC.DefaultFont)
              elseif JY.Person[0]["外号"] == "毒王" then
                DrawStrBoxWaitKey("毒王→淬毒伤害开启", C_WHITE, CC.DefaultFont)
              elseif JY.Person[0]["外号"] == "幻影" then
                DrawStrBoxWaitKey("幻影→影杀技能开启", C_WHITE, CC.DefaultFont)
              elseif JY.Person[0]["外号"] == "超神" then
                DrawStrBoxWaitKey("超神→变身技能开启", C_WHITE, CC.DefaultFont)
              else
                DrawStrBoxWaitKey("特殊角色→开启失败", C_RED, CC.DefaultFont)
                CC.JS = 0
              end
            end
          end
        end
        if setnb[3] == 0 then
          CC.OpenTimmerRemind = 0
        else
          CC.OpenTimmerRemind = 1
        end
        if 0 < setnb[5] then
          CC.ExpCS = setnb[5]
        else
          CC.ExpCS = 1
        end
        if setnb[6] == 1 then
          CC.TP = 1
        else
          CC.TP = 0
        end
        if setnb[7] == 1 then
        else
        end
        CC.Frame = setnb[8]
      end
      break
    end
    if r == 1 then
      if setnb[1] == 0 then
        setnb[1] = 1
      else
        setnb[1] = 0
      end
    elseif r == 2 then
      if setnb[2] == 0 then
        setnb[2] = 1
      else
        setnb[2] = 0
      end
    elseif r == 3 then
      if setnb[3] == 0 then
        setnb[3] = 1
      else
        setnb[3] = 0
      end
    elseif r == 4 then
      Cls()
      local fontsize = CC.NewGameFontSize
      if JY.SETPD == 1 then
        DrawString(CC.ScreenW / 2 - fontsize * 6, CC.ScreenH - fontsize * 2, string.format("当前自动存档间隔为%d分钟", JY.SaveTime), C_GOLD, CC.NewGameFontSize, 1)
        ShowScreen()
      end
      JY.SaveTime = InputNum("自动存档间隔（分钟）", 1, 90)
      JY.AtTime = lib.GetTime()
      JY.DiyTime = JY.AtTime + JY.SaveTime * 60000
      if CC.BanBen == 1 then
        CC.RUNSTR[CC.NUMBER] = string.format("当前自动存档间隔时间设定为%d分钟 可在“功能加强”->“存档设定”里更改", JY.SaveTime)
      else
        CC.RUNSTR[CC.NUMBER] = string.format("当前自动存档间隔时间设定为%d分钟 可在“功能加强”->“存档设定”里更改", JY.SaveTime)
      end
      Cls()
      setnb[4] = JY.SaveTime
    elseif r == 5 then
      if 0 < setnb[5] then
        setnb[5] = 0
      else
        setnb[5] = CONFIG.ExpLevel
      end
    elseif r == 6 then
      if setnb[6] == 1 then
        setnb[6] = 0
      else
        setnb[6] = 1
      end
    elseif r == 7 then
      if setnb[7] == 1 then
        setnb[7] = 0
      else
        setnb[7] = 1
      end
    elseif r == 8 then
      Cls()
      setnb[8] = InputNum("游戏延迟时间（毫秒）", 20, 60)
    end
  end
end
function Menu_FullScreen()
end
function Menu_SetMusic()
  if JY.EnableMusic == 0 then
    JY.EnableMusic = 1
    PlayMIDI(JY.CurrentMIDI)
  else
    JY.EnableMusic = 0
    lib.PlayMIDI("")
  end
  return 1
end
function Menu_SetSound()
  if JY.EnableSound == 0 then
    JY.EnableSound = 1
  else
    JY.EnableSound = 0
  end
  return 1
end
function Menu_ReadRecord()
  Cls()
  DrawStrBox(CC.ScreenW / 2 - CC.DefaultFont * 3, CC.DefaultFont * 2, "读取进度列表", C_ORANGE, CC.DefaultFont)
  local r = SaveList()
  if r == 0 then
    return 0
  elseif 0 < r and (true == existFile(CC.S_Filename[r]) or true == existFile(CC.D_Filename[r])) then
    DrawStrBox(CC.MainSubMenuX2, CC.MainSubMenuY, "读取中......", C_WHITE, CC.StartMenuFontSize)
    ShowScreen()
    CleanMemory()
    LoadRecord(r)
    if 0 < JY.Base["无用"] then
      local re = 0
      if JY.Status == GAME_MMAP then
        lib.UnloadMMap()
        lib.PicInit()
        re = 1
      end
      lib.ShowSlow(50, 1)
      JY.Status = GAME_SMAP
      JY.SubScene = JY.Base["无用"]
      JY.MmapMusic = -1
      JY.MyPic = GetMyPic()
      Init_SMap(1)
      if re == 1 then
        return 1, Game_Cycle()
      else
        return 1
      end
    elseif JY.Base["无用"] == 0 then
      if JY.Base["人X"] == JY.Scene[0]["外景入口X1"] - 1 and JY.Base["人Y"] == JY.Scene[0]["外景入口Y1"] or JY.Base["人X"] == JY.Scene[0]["外景入口X2"] and JY.Base["人Y"] == JY.Scene[0]["外景入口Y2"] + 1 then
        local re = 0
        if JY.Status == GAME_MMAP then
          lib.UnloadMMap()
          lib.PicInit()
          re = 1
        end
        lib.ShowSlow(50, 1)
        JY.Status = GAME_SMAP
        JY.SubScene = JY.Base["无用"]
        JY.MmapMusic = -1
        JY.MyPic = GetMyPic()
        Init_SMap(1)
        if re == 1 then
          return 1, Game_Cycle()
        else
          return 1
        end
      else
        JY.SubScene = -1
        JY.Status = GAME_FIRSTMMAP
      end
    else
      JY.SubScene = -1
      JY.Status = GAME_FIRSTMMAP
    end
    return 1
  elseif false == existFile(CC.S_Filename[r]) or false == existFile(CC.D_Filename[r]) then
    DrawStrBox(-1, -1, "空存档!", C_WHITE, CC.StartMenuFontSize)
    ShowScreen()
    WaitKey()
    Cls()
  end
end
function Menu_Start()
  if DrawStrBoxYesNo(-1, -1, "是否真的返回主菜单？", C_WHITE, CC.StartMenuFontSize) == false then
    return 1
  end
  return Game_Start()
end
function Menu_Exit()
  if DrawStrBoxYesNo(-1, -1, "是否真的要离开游戏？", C_WHITE, CC.StartMenuFontSize) == true then
    os.exit()
  end
  return 1
end
function Menu_SaveRecord()
  Cls()
  DrawStrBox(CC.ScreenW / 2 - CC.DefaultFont * 3, CC.DefaultFont * 2, "保存进度列表", C_ORANGE, CC.DefaultFont)
  local r = SaveList(1)
  if 0 < r then
    DrawStrBox(CC.MainSubMenuX2, CC.MainSubMenuY, "请稍候......", C_WHITE, CC.DefaultFont)
    ShowScreen()
    SaveRecord(r)
    Cls(CC.MainSubMenuX2, CC.MainSubMenuY, CC.ScreenW, CC.ScreenH)
  elseif r == 0 then
    return 0
  end
  return 1
end
function Menu_App()
  local menu = {}
  menu = {
    {
      "附近场景",
      Menu_Scene,
      1
    },
    {
      "马车驿站",
      Menu_Fly,
      1
    },
    {
      "排兵布阵",
      Menu_PBBZ,
      1
    },
    {
      "武功重排",
      Menu_WGCP,
      0
    },
    {
      "存档清理",
      Menu_CDQL,
      1
    },
    {
      "存档设置",
      Menu_CDSZ,
      1
    },
    {
      "开局助手",
      SeachItem,
      0
    },
    {
      "防卡设置",
      Menu_FKSet,
      1
    },
    {
      "切换版本",
      YXQH,
      0
    }
  }
  if CC.BanBen == 1 then
    menu[7][3] = 0
  end
  if CC.BanBen == 0 then
    menu[4][3] = 0
  end
  if JY.Status == GAME_MMAP then
  elseif JY.Status == GAME_SMAP then
    menu[1][3] = 0
    menu[2][3] = 0
  end
  local r = ShowMenu(menu, #menu, 0, CC.MainSubMenuX2, CC.MainSubMenuY, 0, 0, 1, 1, CC.StartMenuFontSize, C_ORANGE, C_WHITE)
  if r == 0 then
    return 0
  end
  return 1
end
function Menu_Fly()
  Cls()
  if JY.Status ~= GAME_MMAP then
    DrawStrBoxWaitKey("无法在场景内使用！", C_WHITE, CC.StartMenuFontSize, 1)
    Cls()
    return 1
  end
  DrawStrBox(CC.MainSubMenuX2 + CC.StartMenuFontSize * 2 + CC.MenuBorderPixel * 3, CC.MainSubMenuY, "请选择要去的驿站", C_WHITE, CC.StartMenuFontSize)
  local Address = {
    {
      1,
      23,
      53
    },
    {
      3,
      21,
      50
    },
    {
      40,
      26,
      43
    },
    {
      60,
      26,
      42
    },
    {
      61,
      23,
      49
    }
  }
  local menu = {}
  for i = 1, 5 do
    menu[i] = {
      JY.Scene[Address[i][1]]["名称"],
      nil,
      1
    }
  end
  local r = ShowMenu(menu, 5, 0, CC.MainSubMenuX2 + CC.StartMenuFontSize * 4 + CC.MenuBorderPixel * 3, CC.MainSubMenuY + CC.StartMenuFontSize * 2, 0, 0, 1, 1, CC.StartMenuFontSize, C_ORANGE, C_WHITE)
  if 0 < r then
    lib.ShowSlow(50, 1)
    ChangeSMap(Address[r][1], Address[r][2], Address[r][3], 0)
    ChangeMMap(JY.Scene[JY.SubScene]["外景入口X1"], JY.Scene[JY.SubScene]["外景入口Y1"] + 1, 0)
    Cls()
    lib.ShowSlow(50, 0)
    Cls()
  elseif r == 0 then
    return 0
  end
  return 1
end
function Menu_Scene()
  Cls()
  if JY.Status ~= GAME_MMAP then
    DrawStrBoxWaitKey("无法在场景内使用！", C_WHITE, CC.StartMenuFontSize, 1)
    Cls()
    return 1
  end
  local x = JY.Base["人X"]
  local y = JY.Base["人Y"]
  local x1 = x
  local y1 = y
  local menu = {}
  local menu1 = {}
  local menuxy = {}
  local oldscene = {}
  local scene
  local newscene = -1
  local scenenum = 1
  local snum = 16
  for i = 0, JY.SceneNum - 1 do
    if JY.Scene[i]["进入条件"] == 0 or JY.Scene[i]["进入条件"] == 2 then
      if JY.Scene[i]["外景入口X1"] ~= 0 or JY.Scene[i]["外景入口Y1"] ~= 0 then
        menuxy[i] = {
          JY.Scene[i]["名称"],
          JY.Scene[i]["外景入口X1"],
          JY.Scene[i]["外景入口Y1"]
        }
      elseif JY.Scene[i]["外景入口X2"] ~= 0 or JY.Scene[i]["外景入口Y2"] ~= 0 then
        menuxy[i] = {
          JY.Scene[i]["名称"],
          JY.Scene[i]["外景入口X2"],
          JY.Scene[i]["外景入口Y2"]
        }
      end
    end
  end
  for i = 0, 200 do
    for j = 0, JY.SceneNum - 1 do
      if menuxy[j] ~= nil and i >= math.abs(menuxy[j][2] - x) and i >= math.abs(menuxy[j][3] - y) then
        menu[scenenum] = {
          string.format("%-3d%-10s", j, menuxy[j][1]),
          nil,
          1
        }
        menu1[scenenum] = {
          menuxy[j][2],
          menuxy[j][3]
        }
        scenenum = scenenum + 1
        menuxy[j] = nil
      end
    end
  end
  local r = ShowMenu2_new(menu, scenenum, 4, 12, -1, -1, 0, 0, 1, 1, CC.DefaultFont, C_ORANGE, C_WHITE, "请选择附近场景")
  if 0 < r then
    local x1 = menu1[r][1]
    local y1 = menu1[r][2]
    lib.ShowSlow(50, 1)
    local i = 1
    if lib.GetMMap(x1, y1 + i, 3) == 0 and lib.GetMMap(x1, y1 + i, 4) == 0 then
      JY.Base["人X"] = x1
      JY.Base["人Y"] = y1 + i
      JY.Base["人方向"] = 0
    elseif lib.GetMMap(x1, y1 - i, 3) == 0 and lib.GetMMap(x1, y1 - i, 4) == 0 then
      JY.Base["人X"] = x1
      JY.Base["人Y"] = y1 - i
      JY.Base["人方向"] = 3
    elseif lib.GetMMap(x1 + i, y1, 3) == 0 and lib.GetMMap(x1 + i, y1, 4) == 0 then
      JY.Base["人X"] = x1 + i
      JY.Base["人Y"] = y1
      JY.Base["人方向"] = 2
    elseif lib.GetMMap(x1 - i, y1, 3) == 0 and lib.GetMMap(x1 - i, y1, 4) == 0 then
      JY.Base["人X"] = x1 - i
      JY.Base["人Y"] = y1
      JY.Base["人方向"] = 1
    end
    Cls()
    lib.ShowSlow(50, 0)
    Cls()
    return 1
  elseif r == 0 then
    return 0
  end
end
function Menu_PBBZ()
  local menu = {}
  local maxnum = 0
  local perid = {}
  local newperid = {}
  for i = 1, CC.TeamNum - 1 do
    menu[i] = {}
    perid[i] = {}
    newperid[i] = {}
    if 0 > JY.Base["队伍" .. i + 1] then
      break
    end
    menu[i][1] = JY.Person[JY.Base["队伍" .. i + 1]]["姓名"]
    menu[i][2] = nil
    menu[i][3] = 1
    perid[i] = JY.Base["队伍" .. i + 1]
    maxnum = maxnum + 1
  end
  if maxnum == 0 then
    DrawStrBoxWaitKey("只剩下你一个人了！", C_WHITE, CC.StartMenuFontSize)
    Cls()
    return 1
  end
  local size = CC.StartMenuFontSize
  local h = CC.StartMenuFontSize + CC.RowPixel
  DrawStrBox(CC.MainSubMenuX2 + size * 4 + CC.RowPixel * 4, CC.MainSubMenuY, "请重新布阵", C_WHITE, CC.StartMenuFontSize)
  local pb = 0
  while true do
    local r = ShowMenu(menu, maxnum, 0, CC.MainSubMenuX2 + size * 4 + CC.RowPixel * 4, h * 2, 0, 0, 1, 1, CC.StartMenuFontSize, C_ORANGE, C_WHITE)
    if 0 < r then
      pb = pb + 1
      newperid[pb] = perid[r]
      menu[r][3] = 0
      if maxnum <= pb then
        for i = 1, maxnum do
          JY.Base["队伍" .. i + 1] = newperid[i]
        end
        break
      end
    elseif r == 0 then
      break
    end
  end
  Cls(CC.MainSubMenuX2 + size * 4 + CC.RowPixel * 4, CC.MainSubMenuY, CC.ScreenW, CC.ScreenH)
end
function Menu_WGCP()
  local size = CC.StartMenuFontSize
  local h = CC.StartMenuFontSize + CC.RowPixel
  local r = SelectTeamMenu(CC.MainSubMenuX2 + size * 4 + CC.RowPixel * 4, CC.MainSubMenuY)
  if 0 < r then
    DrawStrBox(CC.MainSubMenuX2 + size * 4 + CC.RowPixel * 4, CC.MainSubMenuY, "请重排武功", C_WHITE, CC.StartMenuFontSize)
    local menu = {}
    local newwgid = {}
    local wgnum = 0
    local id = JY.Base["队伍" .. r]
    for i = 1, 10 do
      menu[i] = {}
      newwgid[i] = {}
      if 0 < JY.Person[id]["武功" .. i] then
        local wgname = JY.Wugong[JY.Person[id]["武功" .. i]]["名称"]
        menu[i] = {
          wgname,
          nil,
          1,
          JY.Person[id]["武功" .. i],
          JY.Person[id]["武功等级" .. i]
        }
        wgnum = i
      else
        break
      end
    end
    local new = 0
    while true do
      if wgnum == 0 then
        DrawStrBoxWaitKey("没学任何武功！", C_WHITE, CC.StartMenuFontSize)
        break
      end
      local rr = ShowMenu(menu, wgnum, 0, CC.MainSubMenuX2 + size * 4 + CC.RowPixel * 4, h * 2, 0, 0, 1, 1, CC.StartMenuFontSize, C_ORANGE, C_WHITE)
      if 0 < rr then
        new = new + 1
        newwgid[new] = {
          menu[rr][4],
          menu[rr][5]
        }
        menu[rr][3] = 0
        if wgnum <= new then
          for i = 1, wgnum do
            JY.Person[id]["武功" .. i] = newwgid[i][1]
            JY.Person[id]["武功等级" .. i] = newwgid[i][2]
          end
          break
        end
      elseif rr == 0 then
        break
      end
    end
  end
  Cls(CC.MainSubMenuX2 + CC.RowPixel * 4, CC.MainSubMenuY, CC.ScreenW, CC.ScreenH)
end
function Menu_Help()
  local title = "系统攻略"
  local str = "装备说明：查看各种装备的说明。" .. "*武功说明：查看各种武功的说明。" .. "*天书攻略：各种天书的拿法，以及游戏技攻略。"
  local btn = {
    "装备说明",
    "武功说明",
    "天书攻略"
  }
  local num = #btn
  local r = JYMsgBox(title, str, btn, num, nil, 1)
  if r == 1 then
    ZBInstruce()
  elseif r == 2 then
    WuGongIntruce()
  elseif r == 3 then
    TSInstruce()
  end
  return 1
end
function Menu_CDSZ()
  Cls()
  local fontsize = CC.NewGameFontSize
  DrawString(CC.ScreenW / 2 - fontsize * 6, CC.ScreenH - fontsize * 2, string.format("当前自动存档间隔为%d分钟", JY.SaveTime), C_GOLD, CC.NewGameFontSize, 1)
  ShowScreen()
  JY.SaveTime = InputNum("自动存档间隔（分钟）", 1, 120)
  JY.AtTime = lib.GetTime()
  JY.DiyTime = JY.AtTime + JY.SaveTime * 60000
  if CC.BanBen == 1 then
    CC.RUNSTR[CC.NUMBER] = string.format("当前自动存档间隔时间设定为%d分钟 可在“功能加强”->“存档设定”里更改", JY.SaveTime)
  else
    CC.RUNSTR[CC.NUMBER] = string.format("当前自动存档间隔时间设定为%d分钟 可在“功能加强”->“存档设定”里更改", JY.SaveTime)
  end
  Cls()
end
function Menu_CDQL()
  Cls()
  while true do
    DrawStrBox(CC.ScreenW / 2 - CC.DefaultFont * 3, CC.DefaultFont * 2, "清除进度列表", C_ORANGE, CC.DefaultFont)
    local r = SaveList()
    if r == 0 then
      break
    end
    if DrawStrBoxYesNo(-1, -1, "是否清除存档？", C_WHITE, CC.DefaultFont) then
      os.remove(CC.R_GRPFilename[r])
      os.remove(CC.S_Filename[r])
      os.remove(CC.D_Filename[r])
      os.remove(CC.T_Filename[r])
    end
    Cls()
  end
end
function Menu_FKSet()
  local fksetnb = {}
  local fksetstr = {}
  for i = 1, 8 do
    fksetstr[i] = {}
  end
  if JY.XTKG == 1 then
    fksetnb[1] = 1
  else
    fksetnb[1] = 0
  end
  if JY.TXKG == 1 then
    fksetnb[2] = 1
  else
    fksetnb[2] = 0
  end
  if JY.JZKG == 1 then
    fksetnb[3] = 1
  else
    fksetnb[3] = 0
  end
  if JY.SCKG == 1 then
    fksetnb[4] = 1
  else
    fksetnb[4] = 0
  end
  if JY.DEADKG == 1 then
    fksetnb[5] = 1
  else
    fksetnb[5] = 0
  end
  local rr = 1
  while true do
    if fksetnb[1] == 0 then
      fksetstr[1][1] = "关闭 血条显示"
    else
      fksetstr[1][1] = "开启 血条显示"
    end
    if fksetnb[2] == 0 then
      fksetstr[2][1] = "关闭 重要提醒"
    else
      fksetstr[2][1] = "开启 重要提醒"
    end
    if fksetnb[3] == 0 then
      fksetstr[3][1] = "关闭 建筑名称"
    else
      fksetstr[3][1] = "开启 建筑名称"
    end
    if fksetnb[4] == 0 then
      fksetstr[4][1] = "关闭 视窗信息"
    else
      fksetstr[4][1] = "开启 视窗信息"
    end
    if fksetnb[5] == 0 then
      fksetstr[5][1] = "关闭 败退信息"
    else
      fksetstr[5][1] = "开启 败退信息"
    end
    local menu = {
      {
        fksetstr[1][1],
        nil,
        1
      },
      {
        fksetstr[2][1],
        nil,
        1
      },
      {
        fksetstr[3][1],
        nil,
        1
      },
      {
        fksetstr[4][1],
        nil,
        1
      },
      {
        fksetstr[5][1],
        nil,
        1
      }
    }
    local r = ShowMenu2_new(menu, #menu, 2, 12, -1, -1, 0, 0, 1, 1, CC.DefaultFont, C_ORANGE, C_WHITE, "防卡设置", rr)
    rr = r
    if r == 0 then
      break
    end
    if r == 1 then
      if fksetnb[1] == 1 then
        fksetnb[1] = 0
        JY.XTKG = 0
      else
        fksetnb[1] = 1
        JY.XTKG = 1
      end
    elseif r == 2 then
      if fksetnb[2] == 1 then
        fksetnb[2] = 0
        JY.TXKG = 0
      else
        fksetnb[2] = 1
        JY.TXKG = 1
      end
    elseif r == 3 then
      if fksetnb[3] == 1 then
        fksetnb[3] = 0
        JY.JZKG = 0
      else
        fksetnb[3] = 1
        JY.JZKG = 1
      end
    elseif r == 4 then
      if fksetnb[4] == 1 then
        fksetnb[4] = 0
        JY.SCKG = 0
      else
        fksetnb[4] = 1
        JY.SCKG = 1
      end
    elseif r == 5 then
      if fksetnb[5] == 1 then
        fksetnb[5] = 0
        JY.DEADKG = 0
      else
        fksetnb[5] = 1
        JY.DEADKG = 1
      end
    end
  end
end
function Show_Position()
  if JY.Status ~= GAME_MMAP then
    return 0
  end
  DrawStrBoxWaitKey(string.format("当前位置(%d,%d)", JY.Base["人X"], JY.Base["人Y"]), C_ORANGE, CC.StartMenuFontSize)
  DrawStrBoxWaitKey(string.format("你现在的品德指数为: %d", JY.Person[0]["品德"]), C_ORANGE, CC.StartMenuFontSize)
  DrawStrBoxWaitKey(string.format("你现在的声望指数为: %d", JY.Person[0]["声望"]), C_ORANGE, CC.StartMenuFontSize)
  return 1
end
function Menu_Status()
  local flag = 1
  local teamnum = GetTeamNum()
  local x = CC.MainMenuX
  local y = CC.MainMenuY
  local size = CC.DefaultFont
  local teamid = 1
  local menu = {}
  if JY.Status == GAME_WMAP then
    teamnum = 0
    for i = 0, WAR.PersonNum - 1 do
      if WAR.Person[i]["我方"] == true and WAR.Person[i]["死亡"] == false then
        local id = WAR.Person[i]["人物编号"]
        teamnum = teamnum + 1
        menu[teamnum] = {
          string.format("%-8s %2d级 %4d/%d", JY.Person[id]["姓名"], JY.Person[id]["等级"], JY.Person[id]["生命"], JY.Person[id]["生命最大值"]),
          nil,
          1,
          id
        }
      end
    end
  else
    for i = 1, CC.TeamNum do
      local id = JY.Base["队伍" .. i]
      if id < 0 then
        break
      end
      menu[i] = {
        string.format("%-8s %2d级 %4d/%d", JY.Person[id]["姓名"], JY.Person[id]["等级"], JY.Person[id]["生命"], JY.Person[id]["生命最大值"]),
        nil,
        1,
        id
      }
    end
  end
  local size = CC.DefaultFont
  local menux = size * 3
  local menuy = CC.ScreenH / 2 - #menu * size / 2
  local r1 = ShowMenu(menu, #menu, 0, CC.MainSubMenuX, CC.MainSubMenuY, 0, 0, 1, 1, size, C_GOLD, C_WHITE)
  if r1 == 0 then
    return
  end
  teamid = r1
  while true do
    local id
    if JY.Status == GAME_WMAP then
      id = menu[teamid][4]
    else
      id = JY.Base["队伍" .. teamid]
    end
    Cls()
    ShowPersonStatus_sub(id, flag)
    ShowScreen()
    local keypress, ktype, mx, my = WaitKey(1)
    if keypress ~= -1 or ktype ~= nil and ktype ~= -1 then
      if keypress == VK_ESCAPE or ktype == 4 then
        Cls()
        break
      elseif keypress == VK_UP then
        teamid = teamid - 1
      elseif keypress == VK_DOWN then
        teamid = teamid + 1
      elseif keypress == VK_LEFT then
        teamid = teamid - 1
      elseif keypress == VK_RIGHT or ktype == 3 then
        teamid = teamid + 1
      end
      if teamnum < teamid then
        teamid = 1
      end
      if teamid < 1 then
        teamid = teamnum
      end
    end
  end
end
function Menu_EmyStatus()
  local teamid = 1
  local teamnum = 0
  for i = 0, WAR.PersonNum - 1 do
    if WAR.Person[i]["我方"] == false then
      teamnum = teamnum + 1
    end
  end
  local emenu = {}
  local teamnum = 0
  for i = 0, WAR.PersonNum - 1 do
    if WAR.Person[i]["我方"] == false and WAR.Person[i]["死亡"] == false then
      local eid = WAR.Person[i]["人物编号"]
      teamnum = teamnum + 1
      emenu[teamnum] = {
        string.format("%-8s %2d级 %4d/%d", JY.Person[eid]["姓名"], JY.Person[eid]["等级"], JY.Person[eid]["生命"], JY.Person[eid]["生命最大值"]),
        nil,
        1,
        eid
      }
    end
  end
  local size = CC.DefaultFont
  local menux = size * 3
  local menuy = CC.ScreenH / 2 - #emenu * size / 2
  local r1 = ShowMenu(emenu, #emenu, 0, CC.MainSubMenuX, CC.MainSubMenuY, 0, 0, 1, 1, size, C_GOLD, C_WHITE)
  if r1 == 0 then
    return
  end
  teamid = r1
  while true do
    Cls()
    ShowPersonStatus_sub(emenu[teamid][4], 2)
    ShowScreen()
    local keypress, ktype, mx, my = WaitKey(1)
    if keypress ~= -1 or ktype ~= nil and ktype ~= -1 then
      if keypress == VK_ESCAPE or ktype == 4 then
        Cls()
        break
      elseif keypress == VK_UP then
        teamid = teamid - 1
      elseif keypress == VK_DOWN then
        teamid = teamid + 1
      elseif keypress == VK_LEFT then
        teamid = teamid - 1
      elseif keypress == VK_RIGHT or ktype == 3 then
        teamid = teamid + 1
      end
      if teamnum < teamid then
        teamid = 1
      end
      if teamid < 1 then
        teamid = teamnum
      end
    end
  end
end
function Menu_PersonExit()
  DrawStrBox(CC.MainSubMenuX, CC.MainSubMenuY, "要求谁离队", C_WHITE, CC.StartMenuFontSize)
  local nexty = CC.MainSubMenuY + CC.SingleLineHeight
  local r = SelectTeamMenu(CC.MainSubMenuX, nexty)
  if r == 1 then
    DrawStrBoxWaitKey("抱歉！没有你游戏进行不下去", C_WHITE, CC.StartMenuFontSize, 1)
    Cls()
  elseif 1 < r then
    local personid = JY.Base["队伍" .. r]
    for i, v in ipairs(CC.PersonExit) do
      if personid == v[1] then
        oldCallEvent(v[2])
      end
    end
  end
  return 0
end
function SelectTeamMenu(x, y)
  local menu = {}
  for i = 1, CC.TeamNum do
    menu[i] = {
      "",
      nil,
      0
    }
    local id = JY.Base["队伍" .. i]
    if 0 <= id then
      if 0 <= JY.Person[id]["生命"] then
        menu[i][1] = JY.Person[id]["姓名"]
        menu[i][3] = 1
      end
      if JY.Status == GAME_WMAP and 0 >= JY.Person[id]["生命"] then
        menu[i][3] = 0
      end
    end
  end
  if JY.Status == GAME_WMAP then
    return ShowMenu(menu, CC.TeamNum, 0, x, y, 0, 0, 1, 1, CC.DefaultFont, C_ORANGE, C_WHITE)
  else
    return ShowMenu(menu, CC.TeamNum, 0, x, y, 0, 0, 1, 1, CC.StartMenuFontSize, C_ORANGE, C_WHITE)
  end
end
function GetTeamNum()
  local r = CC.TeamNum
  for i = 1, CC.TeamNum do
    if JY.Base["队伍" .. i] < 0 then
      r = i - 1
      break
    end
  end
  return r
end
function ShowPersonStatus(teamid)
  local flag = 1
  local teamnum = GetTeamNum()
  if JY.Status == GAME_WMAP then
    teamnum = 0
    flag = 2
    for i = 0, WAR.PersonNum - 1 do
      if WAR.Person[i]["我方"] == true and WAR.Person[i]["死亡"] == false then
        teamnum = teamnum + 1
        wid[teamnum] = WAR.Person[i]["人物编号"]
      end
    end
  end
  while true do
    Cls()
    local id
    if JY.Status == GAME_WMAP then
      id = wid[teamid]
    else
      id = JY.Base["队伍" .. teamid]
    end
    ShowPersonStatus_sub(id, flag)
    ShowScreen()
    local keypress, ktype, mx, my = WaitKey(1)
    if keypress ~= -1 or ktype ~= nil and ktype ~= -1 then
      if keypress == VK_ESCAPE or ktype == 4 then
        break
      end
      if keypress == VK_UP then
        teamid = teamid - 1
      elseif keypress == VK_DOWN then
        teamid = teamid + 1
      elseif keypress == VK_LEFT then
        teamid = teamid - 1
      elseif keypress == VK_RIGHT then
        teamid = teamid + 1
      end
      teamid = limitX(teamid, 1, teamnum)
    end
  end
end
function ShowEmyPersonStatus(eid)
  local flag = 2
  local teamnum = 0
  for i = 0, WAR.PersonNum - 1 do
    if WAR.Person[i]["我方"] == false then
      teamnum = teamnum + 1
    end
  end
  while true do
    Cls()
    ShowPersonStatus_sub(eid, flag)
    ShowScreen()
    local keypress, ktype, mx, my = WaitKey(1)
    if keypress ~= -1 or ktype ~= nil and ktype ~= -1 then
      if keypress == VK_ESCAPE or ktype == 4 then
        break
      end
      if keypress == VK_UP then
        teamid = teamid - 1
      elseif keypress == VK_DOWN then
        teamid = teamid + 1
      elseif keypress == VK_LEFT then
        teamid = teamid - 1
      elseif keypress == VK_RIGHT then
        teamid = teamid + 1
      end
      teamid = limitX(teamid, 1, teamnum)
    end
  end
end
function ShowPersonStatus_sub(id, flag)
  if flag == nil then
    flag = 1
  end
  local size = CC.DefaultFont
  local p = JY.Person[id]
  local width = 18 * size + 15
  local h = size + CC.PersonStateRowPixel
  local height = 13 * h + 10
  local dx = CC.ScreenW
  local dy = CC.ScreenH
  local headmax = 40 * CC.Zoom
  local i = 0
  local x1, y1, x2
  DrawBox(0, 0, CC.ScreenW, math.modf(h * 1.5), C_WHITE)
  DrawBox(0, math.modf(h * 1.5) + CC.PersonStateRowPixel, CC.ScreenW, h * 17, C_WHITE)
  local size1 = size * 0.75
  x1 = CC.PersonStateRowPixel * 2
  y1 = CC.PersonStateRowPixel * 2
  local strll = 0
  local current_wofang = false
  if flag == 1 then
    current_wofang = true
    local teamnum = GetTeamNum()
    if JY.Status == GAME_WMAP then
      for j = 0, WAR.PersonNum - 1 do
        if WAR.Person[j]["我方"] == true and WAR.Person[j]["死亡"] == false then
          local id1 = WAR.Person[j]["人物编号"]
          local name = JY.Person[id1]["姓名"]
          if id == id1 then
            DrawString(x1 + size1 * strll / 2, y1 + h * i, string.format("%s", name), C_WHITE, size1)
          else
            DrawString(x1 + size1 * strll / 2, y1 + h * i, string.format("%s", name), C_GOLD, size1)
          end
          strll = strll + #name + 2
        end
      end
    else
      for j = 1, teamnum do
        local id1 = JY.Base["队伍" .. j]
        local name = JY.Person[id1]["姓名"]
        if id == id1 then
          DrawString(x1 + size1 * strll / 2, y1 + h * i, string.format("%s", name), C_WHITE, size1)
        else
          DrawString(x1 + size1 * strll / 2, y1 + h * i, string.format("%s", name), C_GOLD, size1)
        end
        strll = strll + #name + 2
      end
    end
  elseif flag == 2 then
    current_wofang = false
    for j = 0, WAR.PersonNum - 1 do
      if WAR.Person[j]["我方"] == false and WAR.Person[j]["死亡"] == false then
        local id1 = WAR.Person[j]["人物编号"]
        local name = JY.Person[id1]["姓名"]
        if id == id1 then
          DrawString(x1 + size1 * strll / 2, y1 + h * i, string.format("%s", name), C_WHITE, size1)
        else
          DrawString(x1 + size1 * strll / 2, y1 + h * i, string.format("%s", name), C_GOLD, size1)
        end
        strll = strll + #name + 2
      end
    end
  end
  i = i + 2
  y1 = CC.PersonStateRowPixel * 2 + math.modf(h * 1.5)
  local y0 = math.modf(h * 1.5)
  if JY.Person[0]["姓名"] == "szlzw" or JY.Person[0]["姓名"] == CC.TSJSName then
    if existFile(CC.HeadPath .. CC.JSHead .. ".png") then
      JY.Person[0]["头像代号"] = CC.JSHead
    else
      JY.Person[0]["头像代号"] = 0
    end
  end
  if existFile(CC.HeadPath .. p["头像代号"] .. ".png") then
    local hid = p["头像代号"]
    local headw, headh = lib.GetPNGXY(1, hid * 2)
    local headx = CC.PersonStateRowPixel * 2 + size * 1.5
    local heady = CC.PersonStateRowPixel * 2 + size
    local hdmax = 0
    if headw > hdmax then
      hdmax = headw
    end
    if headh > hdmax then
      hdmax = headh
    end
    local zoom = math.modf(140 / hdmax * 100 * (CONFIG.Zoom / 100) * CC.Zoom / 2)
    lib.LoadPicture(CC.HeadPath .. p["头像代号"] .. ".png", x1 + headx, y0 + heady, zoom)
    JY.Person[0]["头像代号"] = 0
  else
    local headw, headh = lib.PicGetXY(1, p["头像代号"] * 2)
    local headx = ((11 * size - headw) / 2 + CC.PersonStateRowPixel) / (CONFIG.Zoom / 100)
    local heady = ((7 * h - headh) / 2 + CC.PersonStateRowPixel) / (CONFIG.Zoom / 100)
    lib.PicLoadCache(1, p["头像代号"] * 2, x1 + headx, y0 + heady, 1)
  end
  DrawString(x1 + size * 2, y1 + h * 5, p["姓名"], C_WHITE, size)
  DrawString(x1, y1 + h * 6, string.format("%s", p["外号"]), C_GOLD, size)
  DrawString(x1 + 10 * size / 2, y1 + h * 6, string.format("%3d", p["等级"]), C_GOLD, size)
  DrawString(x1 + 13 * size / 2, y1 + h * 6, "级", C_ORANGE, size)
  if p["性别"] == 0 then
    DrawString(x1 + 6.5 * size, y1 + h * 5, "男", C_GOLD, size)
  elseif p["性别"] == 1 then
    DrawString(x1 + 6.5 * size, y1 + h * 5, "女", C_GOLD, size)
  elseif p["性别"] == 2 then
    DrawString(x1 + 6.5 * size - size, y1 + h * 5, "自宫", C_RED, size)
  end
  i = 6
  x2 = 4 * size
  local DrawAttrib = function(str, color1, color2, v)
    v = v or 0
    DrawString(x1, y1 + h * i, str, color1, size)
    DrawString(x1 + x2, y1 + h * i, string.format("%10d", p[str] + v), color2, size)
    i = i + 1
  end
  local DrawAttrib1 = function(str, color1, color2, v)
    v = v or 0
    DrawString(x1, y1 + h * i, str, color1, size)
    if 0 < v then
      DrawString(x1 + x2, y1 + h * i, string.format("+%2d", v), C_ORANGE, size)
      DrawString(x1 + x2, y1 + h * i, string.format("    ↑%4d", p[str] + v), C_ORANGE, size)
    elseif v < 0 then
      DrawString(x1 + x2, y1 + h * i, string.format("%2d", v), C_RED, size)
      DrawString(x1 + x2, y1 + h * i, string.format("    ↓%4d", p[str] + v), C_RED, size)
    else
      DrawString(x1 + x2, y1 + h * i, string.format("      %4d", p[str] + v), color2, size)
    end
    i = i + 1
  end
  local DrawAttrib2 = function(str, color1, color2, v)
    v = v or 0
    DrawString(x1, y1 + h * i, str, color1, size)
    DrawString(x1 + x2 + size, y1 + h * i, string.format("%5d", p[str] + v), color2, size)
    i = i + 1
  end
  local color
  if p["受伤程度"] < 33 then
    color = RGB(236, 200, 40)
  elseif p["受伤程度"] < 66 then
    color = RGB(255, 192, 203)
  else
    color = RGB(232, 32, 44)
  end
  i = i + 1
  DrawString(x1, y1 + h * i, "生命", C_ORANGE, size)
  DrawString(x1 + 2 * size, y1 + h * i, string.format("%5d", p["生命"]), color, size)
  DrawString(x1 + 9 * size / 2, y1 + h * i, "/", C_GOLD, size)
  if p["中毒程度"] == 0 then
    color = C_GOLD
  elseif p["中毒程度"] < 50 then
    color = RGB(120, 208, 88)
  else
    color = RGB(56, 136, 36)
  end
  DrawString(x1 + 5 * size, y1 + h * i, string.format("%5s", p["生命最大值"]), color, size)
  i = i + 1
  if p["内力性质"] == 0 then
    color = RGB(208, 152, 208)
  elseif p["内力性质"] == 1 then
    color = RGB(236, 200, 40)
  else
    color = RGB(236, 236, 236)
  end
  DrawString(x1, y1 + h * i, "内力", C_ORANGE, size)
  DrawString(x1 + 2 * size, y1 + h * i, string.format("%5d/%5d", p["内力"], p["内力最大值"]), color, size)
  i = i + 1
  DrawAttrib2("体力", C_ORANGE, C_GOLD)
  DrawAttrib2("经验", C_ORANGE, C_GOLD)
  local tmp
  if p["等级"] >= CC.Level then
    tmp = "  ="
  else
    tmp = string.format("%5d", CC.Exp[p["等级"]])
  end
  DrawString(x1, y1 + h * i, "升级", C_ORANGE, size)
  DrawString(x1 + x2 + size, y1 + h * i, tmp, C_GOLD, size)
  local tmp1, tmp2, tmp3 = 0, 0, 0
  if p["武器"] > -1 then
    tmp1 = tmp1 + JY.Thing[p["武器"]]["加攻击力"]
    tmp2 = tmp2 + JY.Thing[p["武器"]]["加防御力"]
    tmp3 = tmp3 + JY.Thing[p["武器"]]["加轻功"]
  end
  if -1 < p["防具"] then
    tmp1 = tmp1 + JY.Thing[p["防具"]]["加攻击力"]
    tmp2 = tmp2 + JY.Thing[p["防具"]]["加防御力"]
    tmp3 = tmp3 + JY.Thing[p["防具"]]["加轻功"]
  end
  i = i + 1
  DrawString(x1, y1 + h * i, string.format("毒：%3d", p["中毒程度"]), RGB(120, 208, 88), size)
  DrawString(x1 + size * 4, y1 + h * i, string.format("伤：%3d", p["受伤程度"]), RGB(255, 192, 203), size)
  i = i + 1
  DrawString(x1, y1 + h * i, string.format("抗：%3d", p["抗毒能力"]), RGB(120, 208, 88), size)
  DrawString(x1 + size * 4, y1 + h * i, "搏：", C_GOLD, size)
  if p["左右互搏"] == 1 then
    DrawString(x1 + size * 6.5, y1 + h * i, "◎", C_RED, size)
  else
    DrawString(x1 + size * 6.5, y1 + h * i, "×", C_GOLD, size)
  end
  local tmpsx = 0
  if tmpsx < p["拳掌功夫"] then
    tmpsx = p["拳掌功夫"]
  elseif tmpsx < p["御剑能力"] then
    tmpsx = p["御剑能力"]
  elseif tmpsx < p["耍刀技巧"] then
    tmpsx = p["耍刀技巧"]
  elseif tmpsx < p["特殊兵器"] then
    tmpsx = p["特殊兵器"]
  end
  local rwzdl1 = p["生命"] / CC.PersonAttribMax["生命最大值"] * 1 + p["内力"] / CC.PersonAttribMax["内力最大值"] * 8 + p["体力"] / CC.PersonAttribMax["体力"] * 1
  local rwzdl2 = (p["攻击力"] + tmp1) / CC.PersonAttribMax["攻击力"] * 9 + (p["轻功"] + tmp3) / CC.PersonAttribMax["轻功"] * 1
  local rwzdl3 = tmpsx / ((CC.PersonAttribMax["拳掌功夫"] + CC.PersonAttribMax["御剑能力"] + CC.PersonAttribMax["特殊兵器"] + CC.PersonAttribMax["耍刀技巧"]) / 4) * 10
  local rwzdl4 = 1 - p["受伤程度"] / CC.PersonAttribMax["受伤程度"]
  local rwfyl1 = p["生命"] / CC.PersonAttribMax["生命最大值"] * 1 + p["内力"] / CC.PersonAttribMax["内力最大值"] * 8 + p["体力"] / CC.PersonAttribMax["体力"] * 1
  local rwfyl2 = (p["防御力"] + tmp2) / CC.PersonAttribMax["防御力"] * 9 + (p["轻功"] + tmp3) / CC.PersonAttribMax["轻功"] * 1
  local rwfyl3 = (p["拳掌功夫"] + p["御剑能力"] + p["耍刀技巧"] + p["特殊兵器"]) / (CC.PersonAttribMax["拳掌功夫"] + CC.PersonAttribMax["御剑能力"] + CC.PersonAttribMax["特殊兵器"] + CC.PersonAttribMax["耍刀技巧"]) * 10
  local rwfyl4 = 1 - p["受伤程度"] / CC.PersonAttribMax["受伤程度"]
  local gjltmp = 0
  for j = 1, 10 do
    local wugong = p["武功" .. j]
    if 0 < wugong then
      local level = math.modf(p["武功等级" .. j] / 100) + 1
      local wgsh = 0
      local gjfw = 0
      local gjstr = ""
      local wgshlx = JY.Wugong[wugong]["伤害类型"]
      local nlxh = JY.Wugong[wugong]["消耗内力点数"] * math.modf((level + 1) / 2)
      if wgshlx == 0 or wgshlx == 2 then
        wgsh = JY.Wugong[wugong]["攻击力" .. level]
        gjfw = JY.Wugong[wugong]["攻击范围"]
      end
      if gjltmp < wgsh then
        gjltmp = wgsh
      end
    end
  end
  local wxcxgj = 0
  local wxcxfy = 0
  if JY.Status == GAME_WMAP and p["武学常识"] >= CC.WXCS then
    wxcxgj = CC.WXCS
    wxcxfy = CC.WXCS
  end
  local wgmax = gjltmp / 1000 * 10
  local rwzdl = (rwzdl1 * 5 + rwzdl2 * 80 + rwzdl3 * 10 + rwzdl4 * 5 + wgmax * 30 + wxcxgj * 3) * 2 / 3
  local rwfyl = rwfyl1 * 5 + rwfyl2 * 80 + rwfyl3 * 10 + rwfyl4 * 5 + wxcxfy * 3
  if gjltmp == 0 then
    rwzdl = 0
  end
  if p["左右互搏"] == 0 then
  else
  end
  i = 0
  x1 = x1 + size * 17 / 2
  DrawAttrib1("攻击力", C_WHITE, C_GOLD, tmp1)
  DrawAttrib1("防御力", C_WHITE, C_GOLD, tmp2)
  DrawAttrib1("轻功", C_WHITE, C_GOLD, tmp3)
  DrawAttrib("医疗能力", C_WHITE, C_GOLD)
  DrawAttrib("用毒能力", C_WHITE, C_GOLD)
  DrawAttrib("解毒能力", C_WHITE, C_GOLD)
  DrawAttrib("拳掌功夫", C_WHITE, C_GOLD)
  DrawAttrib("御剑能力", C_WHITE, C_GOLD)
  DrawAttrib("耍刀技巧", C_WHITE, C_GOLD)
  DrawAttrib("特殊兵器", C_WHITE, C_GOLD)
  DrawAttrib("暗器技巧", C_WHITE, C_GOLD)
  DrawAttrib("资质", C_WHITE, C_GOLD)
  local zzdc, zzstr
  zzdc = math.modf(p["资质"] / 15)
  if zzdc == 6 then
    zzstr = "一档"
  elseif zzdc == 5 then
    zzstr = "二档"
  elseif zzdc == 4 then
    zzstr = "三档"
  elseif zzdc == 3 then
    zzstr = "四档"
  elseif zzdc == 2 then
    zzstr = "五档"
  elseif zzdc == 1 then
    zzstr = "六档"
  else
    zzstr = "七档"
  end
  DrawString(x1 + size * 5, y1 + h * (i - 1), zzstr, RGB(255, (7 - zzdc) * 30, (7 - zzdc) * 30), size)
  DrawString(x1, y1 + h * i, "武器:", C_ORANGE, size)
  if p["武器"] > -1 then
    DrawString(x1 + size * 3, y1 + h * i, JY.Thing[p["武器"]]["名称"], C_GOLD, size)
  end
  i = i + 1
  DrawString(x1, y1 + h * i, "防具:", C_ORANGE, size)
  if -1 < p["防具"] then
    DrawString(x1 + size * 3, y1 + h * i, JY.Thing[p["防具"]]["名称"], C_GOLD, size)
  end
  i = 0
  x1 = x1 + size * 10
  DrawString(x1, y1 + h * i, "所会武功   级  类  内 威力 增强", C_ORANGE, size)
  for j = 1, 10 do
    i = i + 1
    local wugong = p["武功" .. j]
    if 0 < wugong then
      local level = math.modf(p["武功等级" .. j] / 100) + 1
      local wgsh = 0
      local gjfw = 0
      local gjstr = ""
      local wgshlx = JY.Wugong[wugong]["伤害类型"]
      local snl = 0
      local nlxh = JY.Wugong[wugong]["消耗内力点数"] * math.modf((level + 1) / 2)
      wgsh = JY.Wugong[wugong]["攻击力" .. level]
      gjfw = JY.Wugong[wugong]["攻击范围"]
      if wgshlx == 1 or wgshlx == 3 then
        snl = JY.Wugong[wugong]["杀内力" .. level]
      end
      if gjfw == 0 then
        gjstr = "●"
      elseif gjfw == 1 then
        gjstr = "━"
      elseif gjfw == 2 then
        gjstr = "╋"
      elseif gjfw == 3 then
        gjstr = "■"
      end
      DrawString(x1, y1 + h * i, string.format("%s", JY.Wugong[wugong]["名称"]), C_GOLD, size)
      DrawString(x1 + size * 11 / 2, y1 + h * i, string.format("%2d", level), C_WHITE, size)
      if wgshlx == 0 or wgshlx == 2 then
        DrawString(x1 + size * 7, y1 + h * i, string.format("%3s", gjstr), C_WHITE, size)
        local ngwggjl = 0
        local wgjcxs, nglevel
        for iwgng = 1, #CC.WUGONGNEIGONG do
          if wugong == CC.WUGONGNEIGONG[iwgng][2] then
            for ing = 1, 10 do
              if p["武功" .. ing] == CC.WUGONGNEIGONG[iwgng][1] then
                wgjcxs = CC.WUGONGNEIGONG[iwgng][3]
                nglevel = math.modf(p["武功等级" .. ing] / 100) + 1
                ngwggjl = ngwggjl + ngwgzjwl(nglevel, wgsh, wgjcxs, current_wofang)
                break
              end
            end
          end
        end
        DrawString(x1 + size * 11, y1 + h * i, string.format("%4d", wgsh), C_RED, size)
        DrawString(x1 + size * 13.5, y1 + h * i, string.format("%4d", ngwggjl), C_RED, size)
      elseif wgshlx == 1 or wgshlx == 3 then
        gjstr = "●"
        DrawString(x1 + size * 7, y1 + h * i, string.format("%3s", gjstr), C_WHITE, size)
        DrawString(x1 + size * 11, y1 + h * i, string.format("%4d", snl), RGB(208, 152, 208), size)
      end
      DrawString(x1 + size * 9, y1 + h * i, string.format("%3d", nlxh), RGB(208, 152, 208), size)
    end
  end
  i = i + 1
  DrawString(x1, y1 + h * i, "修炼物品", C_ORANGE, size)
  DrawString(x1 + size * 7, y1 + h * i, "生命增长" .. string.format("%4d", p["生命增长"]), C_ORANGE, size)
  DrawString(x1 + size * 7, y1 + h * (i + 1), "武学常识" .. string.format("%4d", p["武学常识"]), C_ORANGE, size)
  DrawString(x1 + size * 7, y1 + h * (i + 2), "武功带毒" .. string.format("%4d", p["攻击带毒"]), M_Green, size)
  local thingid = p["修炼物品"]
  if 0 < thingid then
    i = i + 1
    DrawString(x1 + size, y1 + h * i, JY.Thing[thingid]["名称"], C_GOLD, size)
    i = i + 1
    local n = TrainNeedExp(id)
    if n < math.huge then
      DrawString(x1 + size, y1 + h * i, string.format("%5d/%5d", p["修炼点数"], n), C_GOLD, size)
    else
      DrawString(x1 + size, y1 + h * i, string.format("%5d/===", p["修炼点数"]), C_GOLD, size)
    end
  else
    i = i + 2
  end
end
function TrainNeedExp(id)
  local thingid = JY.Person[id]["修炼物品"]
  local r = 0
  if 0 <= thingid then
    if 0 <= JY.Thing[thingid]["练出武功"] then
      local level = 0
      for i = 1, 10 do
        if JY.Person[id]["武功" .. i] == JY.Thing[thingid]["练出武功"] then
          level = math.modf(JY.Person[id]["武功等级" .. i] / 100)
          break
        end
      end
      if level < 9 then
        r = (7 - math.modf(JY.Person[id]["资质"] / 15)) * JY.Thing[thingid]["需经验"] * (level + 1)
      else
        r = math.huge
      end
    else
      r = (7 - math.modf(JY.Person[id]["资质"] / 15)) * JY.Thing[thingid]["需经验"] * 2
    end
  end
  return r
end
function Menu_Doctor()
  DrawStrBox(CC.MainSubMenuX, CC.MainSubMenuY, "谁要使用医术", C_WHITE, CC.StartMenuFontSize)
  local nexty = CC.MainSubMenuY + CC.SingleLineHeight
  DrawStrBox(CC.MainSubMenuX, nexty, "医疗能力", C_ORANGE, CC.StartMenuFontSize)
  local menu1 = {}
  for i = 1, CC.TeamNum do
    menu1[i] = {
      "",
      nil,
      0
    }
    local id = JY.Base["队伍" .. i]
    if 0 <= id and JY.Person[id]["医疗能力"] >= 20 then
      menu1[i][1] = string.format("%-10s%4d  体力：%3d", JY.Person[id]["姓名"], JY.Person[id]["医疗能力"], JY.Person[id]["体力"])
      menu1[i][3] = 1
    end
  end
  local id1, id2
  nexty = nexty + CC.SingleLineHeight
  local r = ShowMenu(menu1, CC.TeamNum, 0, CC.MainSubMenuX, nexty, 0, 0, 1, 1, CC.StartMenuFontSize, C_ORANGE, C_WHITE)
  if 0 < r then
    id1 = JY.Base["队伍" .. r]
    Cls(CC.MainSubMenuX, CC.MainSubMenuY, CC.ScreenW, CC.ScreenH)
    DrawStrBox(CC.MainSubMenuX, CC.MainSubMenuY, "要医治谁", C_WHITE, CC.StartMenuFontSize)
    nexty = CC.MainSubMenuY + CC.SingleLineHeight
    local menu2 = {}
    for i = 1, CC.TeamNum do
      menu2[i] = {
        "",
        nil,
        0
      }
      local id = JY.Base["队伍" .. i]
      if 0 <= id then
        menu2[i][1] = string.format("%-10s %3d %4d/%4d", JY.Person[id]["姓名"], JY.Person[id]["受伤程度"], JY.Person[id]["生命"], JY.Person[id]["生命最大值"])
        menu2[i][3] = 1
      end
    end
    local r2 = ShowMenu(menu2, CC.TeamNum, 0, CC.MainSubMenuX, nexty, 0, 0, 1, 1, CC.StartMenuFontSize, C_ORANGE, C_WHITE)
    if 0 < r2 then
      id2 = JY.Base["队伍" .. r2]
      local shoushang = JY.Person[id2]["受伤程度"]
      local num = ExecDoctor(id1, id2)
      if 0 < num or shoushang > JY.Person[id2]["受伤程度"] then
        AddPersonAttrib(id1, "体力", -2)
      end
      DrawStrBoxWaitKey(string.format("%s 受伤程度减少 %d 生命增加 %d", JY.Person[id2]["姓名"], shoushang - JY.Person[id2]["受伤程度"], num), C_ORANGE, CC.StartMenuFontSize)
    end
  end
  Cls()
  return 0
end
function ExecDoctor(id1, id2)
  if JY.Person[id1]["体力"] < 50 then
    return 0
  end
  local add = JY.Person[id1]["医疗能力"]
  local value = JY.Person[id2]["受伤程度"]
  if value > add / (CC.PersonAttribMax["医疗能力"] / 100) * 2 then
    return 0
  end
  if value < 25 then
    add = add * 4 / 5
  elseif value < 50 then
    add = add * 3 / 4
  elseif value < 75 then
    add = add * 2 / 3
  else
    add = add / 2
  end
  local ylsx = math.modf(CC.PersonAttribMax["生命最大值"] / 999)
  if 5 < ylsx then
    ylsx = 5
  end
  AddPersonAttrib(id2, "受伤程度", math.modf(-add / ylsx))
  return AddPersonAttrib(id2, "生命", add * ylsx)
end
function Menu_DecPoison()
  DrawStrBox(CC.MainSubMenuX, CC.MainSubMenuY, "谁要帮人解毒", C_WHITE, CC.StartMenuFontSize)
  local nexty = CC.MainSubMenuY + CC.SingleLineHeight
  DrawStrBox(CC.MainSubMenuX, nexty, "解毒能力", C_ORANGE, CC.StartMenuFontSize)
  local menu1 = {}
  for i = 1, CC.TeamNum do
    menu1[i] = {
      "",
      nil,
      0
    }
    local id = JY.Base["队伍" .. i]
    if 0 <= id and JY.Person[id]["解毒能力"] >= 20 then
      menu1[i][1] = string.format("%-10s%4d  体力：%3d", JY.Person[id]["姓名"], JY.Person[id]["解毒能力"], JY.Person[id]["体力"])
      menu1[i][3] = 1
    end
  end
  local id1, id2
  nexty = nexty + CC.SingleLineHeight
  local r = ShowMenu(menu1, CC.TeamNum, 0, CC.MainSubMenuX, nexty, 0, 0, 1, 1, CC.StartMenuFontSize, C_ORANGE, C_WHITE)
  if 0 < r then
    id1 = JY.Base["队伍" .. r]
    Cls(CC.MainSubMenuX, CC.MainSubMenuY, CC.ScreenW, CC.ScreenH)
    DrawStrBox(CC.MainSubMenuX, CC.MainSubMenuY, "替谁解毒", C_WHITE, CC.StartMenuFontSize)
    nexty = CC.MainSubMenuY + CC.SingleLineHeight
    DrawStrBox(CC.MainSubMenuX, nexty, "中毒程度", C_WHITE, CC.StartMenuFontSize)
    nexty = nexty + CC.SingleLineHeight
    local menu2 = {}
    for i = 1, CC.TeamNum do
      menu2[i] = {
        "",
        nil,
        0
      }
      local id = JY.Base["队伍" .. i]
      if 0 <= id then
        menu2[i][1] = string.format("%-10s%5d", JY.Person[id]["姓名"], JY.Person[id]["中毒程度"])
        menu2[i][3] = 1
      end
    end
    local r2 = ShowMenu(menu2, CC.TeamNum, 0, CC.MainSubMenuX, nexty, 0, 0, 1, 1, CC.StartMenuFontSize, C_ORANGE, C_WHITE)
    if 0 < r2 then
      id2 = JY.Base["队伍" .. r2]
      local num = ExecDecPoison(id1, id2)
      DrawStrBoxWaitKey(string.format("%s 中毒程度减少 %d", JY.Person[id2]["姓名"], num), C_ORANGE, CC.StartMenuFontSize)
    end
  end
  Cls()
  return 0
end
function ExecDecPoison(id1, id2)
  local add = JY.Person[id1]["解毒能力"]
  local value = JY.Person[id2]["中毒程度"]
  if value > math.modf(add / (CC.PersonAttribMax["解毒能力"] / 100)) * 2 then
    return 0
  end
  add = limitX(math.modf(add / (CC.PersonAttribMax["解毒能力"] / 100) / 3) + Rnd(10) - Rnd(10), 0, value)
  return -AddPersonAttrib(id2, "中毒程度", -add)
end
function Menu_Thing()
  local menu = {
    {
      "全部物品",
      nil,
      1
    },
    {
      "剧情物品",
      nil,
      1
    },
    {
      "神兵宝甲",
      nil,
      1
    },
    {
      "武功秘笈",
      nil,
      1
    },
    {
      "灵丹妙药",
      nil,
      1
    },
    {
      "伤人暗器",
      nil,
      1
    },
    {
      "整理物品",
      nil,
      1
    }
  }
  local r = ShowMenu(menu, #menu, 0, CC.MainSubMenuX, CC.MainSubMenuY, 0, 0, 1, 1, CC.StartMenuFontSize, C_ORANGE, C_WHITE)
  local r1 = 1
  local r2 = 1
  local wlnum = 0
  if r == 3 then
    local menu1 = {
      {
        "全部",
        nil,
        1
      },
      {
        "攻击",
        nil,
        1
      },
      {
        "防御",
        nil,
        1
      },
      {
        "轻功",
        nil,
        1
      },
      {
        "配合",
        nil,
        1
      }
    }
    r1 = ShowMenu(menu1, #menu1, 0, CC.MainSubMenuX, CC.MainSubMenuY, 0, 0, 1, 1, CC.StartMenuFontSize, C_ORANGE, C_WHITE)
    if r1 == 0 then
      return 0
    end
  elseif r == 4 then
    local menu2 = {
      {
        "全部",
        nil,
        1
      },
      {
        "拳掌",
        nil,
        1
      },
      {
        "剑法",
        nil,
        1
      },
      {
        "刀法",
        nil,
        1
      },
      {
        "特殊",
        nil,
        1
      },
      {
        "心法",
        nil,
        1
      },
      {
        "威力",
        nil,
        1
      }
    }
    r2 = ShowMenu(menu2, #menu2, 0, CC.MainSubMenuX, CC.MainSubMenuY, 0, 0, 1, 1, CC.StartMenuFontSize, C_ORANGE, C_WHITE)
    if r2 == 0 then
      return 0
    end
    if r2 == 7 then
      wlnum = InputNum("输入最小威力", 0, 5000)
    end
  elseif r == 7 then
    local newthing = {}
    local i, j
    local thnum = 0
    for i = 0, CC.MyThingNum - 1 do
      if 0 > JY.Base["物品" .. i + 1] then
        thnum = i
        break
      end
    end
    local newnum = 0
    for i = 0, CC.MyThingNum do
      newthing[i] = {}
      for j = 0, CC.MyThingNum do
        if 0 > JY.Base["物品" .. j + 1] then
          break
        end
        if JY.Base["物品" .. j + 1] == i then
          newthing[newnum][1] = JY.Base["物品" .. j + 1]
          newthing[newnum][2] = JY.Base["物品数量" .. j + 1]
          newnum = newnum + 1
          break
        end
      end
      if newnum == thnum then
        break
      end
    end
    for newnum = 0, thnum - 1 do
      JY.Base["物品" .. newnum + 1] = newthing[newnum][1]
      JY.Base["物品数量" .. newnum + 1] = newthing[newnum][2]
    end
    DrawStrBoxWaitKey("物品整理完毕", C_WHITE, CC.StartMenuFontSize)
    ShowScreen()
    Cls()
    return 0
  end
  local oldr = r
  if 0 < oldr then
    while true do
      local thing = {}
      local thingnum = {}
      for i = 0, CC.MyThingNum - 1 do
        thing[i] = -1
        thingnum[i] = 0
      end
      local num = 0
      for i = 0, CC.MyThingNum - 1 do
        local id = JY.Base["物品" .. i + 1]
        if 0 <= id then
          if r == 1 then
            thing[i] = id
            thingnum[i] = JY.Base["物品数量" .. i + 1]
          elseif r1 == 2 then
            if JY.Thing[id]["类型"] == r - 2 and 0 < JY.Thing[id]["加攻击力"] then
              thing[num] = id
              thingnum[num] = JY.Base["物品数量" .. i + 1]
              num = num + 1
            end
          elseif r1 == 3 then
            if JY.Thing[id]["类型"] == r - 2 and 0 < JY.Thing[id]["加防御力"] then
              thing[num] = id
              thingnum[num] = JY.Base["物品数量" .. i + 1]
              num = num + 1
            end
          elseif r1 == 4 then
            if JY.Thing[id]["类型"] == r - 2 and 0 < JY.Thing[id]["加轻功"] then
              thing[num] = id
              thingnum[num] = JY.Base["物品数量" .. i + 1]
              num = num + 1
            end
          elseif r1 == 5 then
            for k = 1, math.huge do
              if CC.ExtraOffense[k] == nil then
                break
              end
              if JY.Thing[id]["类型"] == r - 2 and id == CC.ExtraOffense[k][1] and 0 < CC.ExtraOffense[k][3] then
                thing[num] = id
                thingnum[num] = JY.Base["物品数量" .. i + 1]
                num = num + 1
                break
              end
            end
          elseif r2 == 2 then
            if JY.Thing[id]["类型"] == r - 2 and 0 < JY.Thing[id]["练出武功"] then
              for k = 1, math.huge do
                if JY.Wugong[k] == nil then
                  break
                end
                if JY.Wugong[JY.Thing[id]["练出武功"]]["武功类型"] == 1 and 0 < JY.Wugong[JY.Thing[id]["练出武功"]]["攻击力10"] then
                  thing[num] = id
                  thingnum[num] = JY.Base["物品数量" .. i + 1]
                  num = num + 1
                  break
                end
              end
            end
          elseif r2 == 3 then
            if JY.Thing[id]["类型"] == r - 2 and 0 < JY.Thing[id]["练出武功"] then
              for k = 1, math.huge do
                if JY.Wugong[k] == nil then
                  break
                end
                if JY.Wugong[JY.Thing[id]["练出武功"]]["武功类型"] == 2 and 0 < JY.Wugong[JY.Thing[id]["练出武功"]]["攻击力10"] then
                  thing[num] = id
                  thingnum[num] = JY.Base["物品数量" .. i + 1]
                  num = num + 1
                  break
                end
              end
            end
          elseif r2 == 4 then
            if JY.Thing[id]["类型"] == r - 2 and 0 < JY.Thing[id]["练出武功"] then
              for k = 1, math.huge do
                if JY.Wugong[k] == nil then
                  break
                end
                if JY.Wugong[JY.Thing[id]["练出武功"]]["武功类型"] == 3 and 0 < JY.Wugong[JY.Thing[id]["练出武功"]]["攻击力10"] then
                  thing[num] = id
                  thingnum[num] = JY.Base["物品数量" .. i + 1]
                  num = num + 1
                  break
                end
              end
            end
          elseif r2 == 5 then
            if JY.Thing[id]["类型"] == r - 2 and 0 < JY.Thing[id]["练出武功"] then
              for k = 1, math.huge do
                if JY.Wugong[k] == nil then
                  break
                end
                if JY.Wugong[JY.Thing[id]["练出武功"]]["武功类型"] == 4 and 0 < JY.Wugong[JY.Thing[id]["练出武功"]]["攻击力10"] then
                  thing[num] = id
                  thingnum[num] = JY.Base["物品数量" .. i + 1]
                  num = num + 1
                  break
                end
              end
            end
          elseif r2 == 6 then
            if JY.Thing[id]["类型"] == r - 2 and 0 < JY.Thing[id]["练出武功"] then
              for k = 1, math.huge do
                if JY.Wugong[k] == nil then
                  break
                end
                if JY.Wugong[JY.Thing[id]["练出武功"]]["攻击力10"] == 0 then
                  thing[num] = id
                  thingnum[num] = JY.Base["物品数量" .. i + 1]
                  num = num + 1
                  break
                end
              end
            end
          elseif r2 == 7 then
            if JY.Thing[id]["类型"] == r - 2 and 0 < JY.Thing[id]["练出武功"] then
              for k = 1, math.huge do
                if JY.Wugong[k] == nil then
                  break
                end
                if wlnum <= JY.Wugong[JY.Thing[id]["练出武功"]]["攻击力10"] then
                  thing[num] = id
                  thingnum[num] = JY.Base["物品数量" .. i + 1]
                  num = num + 1
                  break
                end
              end
            end
          elseif JY.Thing[id]["类型"] == r - 2 then
            thing[num] = id
            thingnum[num] = JY.Base["物品数量" .. i + 1]
            num = num + 1
          end
        end
      end
      if 0 < oldr then
        local r = SelectThing(thing, thingnum)
        if r == -1 then
          break
        end
        if 0 <= r then
          UseThing(r)
          if JY.Thing[r]["类型"] == 0 or JY.Thing[r]["类型"] == 4 then
            return 1
          end
        end
      end
    end
  end
  return 0
end
function SelectThing(thing, thingnum)
  local xnum = CC.MenuThingXnum
  local ynum = CC.MenuThingYnum
  local w = CC.ThingPicWidth * xnum + (xnum - 1) * CC.ThingGapIn + 2 * CC.ThingGapOut
  local h = CC.ThingPicHeight * ynum + (ynum - 1) * CC.ThingGapIn + 2 * CC.ThingGapOut
  local dx = (CC.ScreenW - w) /2
  local dy = (CC.ScreenH - h - 2 * (CC.ThingFontSize + 2 * CC.MenuBorderPixel + 8)) / 2 - CC.ThingFontSize * 4
  local y1_1, y1_2, y2_1, y2_2, y3_1, y3_2
  local ndnd = JY.NDPER / 100
  if ndnd < 1 then
    ndnd = 1
  end
  local cur_line = oldcur_line
  local cur_x = oldcur_x
  local cur_y = oldcur_y
  local cur_thing = -1
  local thnum = 0
  for i = 0, CC.MyThingNum - 1 do
    if 0 > JY.Base["物品" .. i + 1] then
      thnum = i
      break
    end
  end
  while true do
    Cls()
    y1_1 = dy
    y1_2 = y1_1 + CC.ThingFontSize + 2 * CC.MenuBorderPixel
    DrawBox(dx, y1_1, dx + w, y1_2, C_WHITE)
    y2_1 = y1_2 + CC.RowPixel
    y2_2 = y2_1 + CC.ThingFontSize + 2 * CC.MenuBorderPixel
    DrawBox(dx, y2_1, dx + w, y2_2, C_WHITE)
    y3_1 = y2_2 + CC.RowPixel
    y3_2 = y3_1 + h
    DrawBox(dx, y3_1, dx + w, y3_2, C_WHITE)
    for y = 0, ynum - 1 do
      for x = 0, xnum - 1 do
        local id = y * xnum + x + xnum * cur_line
        local boxcolor
        if x == cur_x and y == cur_y then
          boxcolor = C_WHITE
          if thing[id] ~= nil and 0 <= thing[id] then
            cur_thing = thing[id]
            local str = JY.Thing[thing[id]]["名称"]
            if (JY.Thing[thing[id]]["类型"] == 1 or JY.Thing[thing[id]]["类型"] == 2) and 0 <= JY.Thing[thing[id]]["使用人"] then
              str = str .. "(" .. JY.Person[JY.Thing[thing[id]]["使用人"]]["姓名"] .. ")"
            end
            str = string.format("%s X %d", str, thingnum[id])
            local str2 = JY.Thing[thing[id]]["物品说明"]
            if thing[id] == 182 then
              str2 = str2 .. string.format("(人%3d,%3d)", JY.Base["人X"], JY.Base["人Y"])
            end
            DrawString(dx + CC.ThingGapOut, y1_1 + CC.MenuBorderPixel, str, C_GOLD, CC.ThingFontSize)
            DrawString(dx + CC.ThingGapOut, y2_1 + CC.MenuBorderPixel, str2, C_ORANGE, CC.ThingFontSize)
            DrawString(dx + CC.ThingGapOut + CC.ThingFontSize * 20, y1_1 + CC.MenuBorderPixel, string.format("空间 %d/1000", thnum), C_GOLD, CC.ThingFontSize)
            local myfont = CC.DefaultFont * 0.9
            local mx, my = dx + 4 * myfont, y3_2 + CC.RowPixel
            local myflag = 0
            local myThing = JY.Thing[thing[id]]
            local drawitem = function(ss, str, news)
              local mys
              if str == nil then
                mys = ss
              elseif myThing[ss] ~= 0 then
                if news == nil then
                  if myflag == 0 then
                    mys = string.format(str .. ":%+d", myThing[ss])
                  elseif myflag == 1 then
                    mys = string.format(str .. ":%d", myThing[ss])
                  end
                else
                  if myThing[ss] < 0 then
                    return
                  end
                  if myThing[ss] == 1 and ss == "需内力性质" then
                    mys = string.format(str .. "%s", news[myThing[ss]])
                  else
                    mys = string.format(str .. ":%s", news[myThing[ss]])
                  end
                end
              elseif myThing[ss] == 0 and ss == "需内力性质" then
                mys = string.format(str .. "%s", news[myThing[ss]])
              else
                return
              end
              local ccc = C_ORANGE
              if ss == "需内力性质" then
                if myThing[ss] == 0 then
                  ccc = RGB(208, 152, 208)
                elseif myThing[ss] == 1 then
                  ccc = C_GOLD
                elseif myThing[ss] == 2 then
                  ccc = C_WHITE
                end
              end
              local mylen = myfont * string.len(mys) / 2 + 12
              if CC.ScreenW - dx < mx + mylen then
                my = my + myfont * 1.5
                mx = dx + 4 * myfont
              end
              if ss == "需内力性质" and myThing[ss] == 2 then
              else
                DrawStrBox(mx, my, mys, ccc, myfont)
                mx = mx + mylen
              end
            end
            if 0 < myThing["类型"] then
              drawitem("加生命", "生命")
              drawitem("加生命最大值", "生命最大值")
              drawitem("加中毒解毒", "中毒")
              drawitem("加体力", "体力")
              if myThing["改变内力性质"] == 2 then
                drawitem("阴阳调和")
              end
              drawitem("加内力", "内力")
              drawitem("加内力最大值", "内力最大值")
              drawitem("加攻击力", "攻击")
              drawitem("加轻功", "轻功")
              drawitem("加防御力", "防御")
              drawitem("加医疗能力", "医疗")
              drawitem("加用毒能力", "用毒")
              drawitem("加解毒能力", "解毒")
              drawitem("加抗毒能力", "抗毒")
              drawitem("加拳掌功夫", "拳掌")
              drawitem("加御剑能力", "御剑")
              drawitem("加耍刀技巧", "耍刀")
              drawitem("加特殊兵器", "特殊")
              drawitem("加暗器技巧", "暗器")
              drawitem("加武学常识", "武常")
              drawitem("加品德", "品德")
              drawitem("加攻击次数", "左右", {
                [0] = "否",
                "是"
              })
              drawitem("加攻击带毒", "带毒")
              if mx ~= dx or my ~= y3_2 + CC.RowPixel then
                DrawStrBox(dx, y3_2 + 2, " 效果:", C_RED, myfont)
              end
            end
            if myThing["类型"] == 1 or myThing["类型"] == 2 then
              if mx ~= dx then
                mx = dx + 4 * myfont
                my = my + myfont * 1.5
              end
              myflag = 1
              local my2 = my
              if -1 < myThing["仅修炼人物"] then
                drawitem("仅限:" .. JY.Person[myThing["仅修炼人物"]]["姓名"])
              end
              drawitem("需内力性质", "", {
                [0] = "阴性",
                "阳性"
              })
              drawitem("需内力", "内力")
              drawitem("需攻击力", "攻击")
              drawitem("需轻功", "轻功")
              drawitem("需用毒能力", "用毒")
              drawitem("需医疗能力", "医疗")
              drawitem("需解毒能力", "解毒")
              drawitem("需拳掌功夫", "拳掌")
              drawitem("需御剑能力", "御剑")
              drawitem("需耍刀技巧", "耍刀")
              drawitem("需特殊兵器", "特殊")
              drawitem("需暗器技巧", "暗器")
              drawitem("需资质", "资质")
              drawitem("需经验", "修炼经验")
              if mx ~= dx or my ~= my2 then
                DrawStrBox(dx, my2, " 需求:", C_RED, myfont)
              end
            end
            local col = C_ORANGE
            if myThing["类型"] == 1 then
              local ia
              local zqbz = 0
              for ia = 1, math.huge do
                if CC.ExtraOffense[ia] == nil then
                  break
                end
                if CC.ExtraOffense[ia][1] == thing[id] then
                  if zqbz == 0 then
                    my = my + myfont * 1.5
                    mx = dx + 4 * myfont
                    DrawStrBox(dx, my, " 增强:", C_RED, myfont)
                    zqbz = 1
                  end
                  local wpid1 = thing[id]
                  local wgid1 = CC.ExtraOffense[ia][2]
                  local gjl1 = CC.ExtraOffense[ia][3]
                  local wgzq = JY.Wugong[wgid1]["名称"] .. "：↑" .. gjl1
                  DrawStrBox(mx, my, wgzq, col, myfont)
                  local mylen = myfont * string.len(wgzq) / 2 + 12
                  mx = mx + mylen
                  if mx > CC.ScreenW - dx then
                    my = my + myfont * 1.5
                    mx = dx + 4 * myfont
                  end
                end
              end
            end
            if JY.Thing[thing[id]]["类型"] == 2 and 0 < JY.Thing[thing[id]]["练出武功"] then
              do
                local wgid = JY.Thing[thing[id]]["练出武功"]
                local wgmc = JY.Wugong[wgid]["名称"]
                local wgshlx = JY.Wugong[wgid]["伤害类型"]
                local wggjfw = JY.Wugong[wgid]["攻击范围"]
                local wggjl = JY.Wugong[wgid]["攻击力10"]
                local wgydfw = JY.Wugong[wgid]["移动范围10"]
                local wgssfw = JY.Wugong[wgid]["杀伤范围10"]
                local wgjnl = JY.Wugong[wgid]["加内力10"]
                local wgsnl = JY.Wugong[wgid]["杀内力10"]
                local gjstr = ""
                local nlxh = JY.Wugong[wgid]["消耗内力点数"] * 5
                local wgmx
                if wggjfw == 0 then
                  gjstr = "●"
                elseif wggjfw == 1 then
                  gjstr = "━"
                elseif wggjfw == 2 then
                  gjstr = "╋"
                elseif wggjfw == 3 then
                  gjstr = "■"
                end
                mx = dx + 4 * myfont
                my = my + myfont * 1.5
                DrawStrBox(dx, my, " 武功:", C_RED, myfont)
                if wgshlx == 0 or wgshlx == 2 then
                  if wggjfw == 0 then
                    wgmx = string.format("%s %s 移%d格 消耗内力：%d 威力：%d", wgmc, gjstr, wgydfw, nlxh, wggjl)
                    DrawStrBox(mx, my, wgmx, col, myfont)
                  elseif wggjfw == 1 then
                    wgmx = string.format("%s %s %d格 消耗内力：%d 威力：%d", wgmc, gjstr, wgydfw, nlxh, wggjl)
                    DrawStrBox(mx, my, wgmx, col, myfont)
                  elseif wggjfw == 2 then
                    wgmx = string.format("%s %s %d格 消耗内力：%d 威力：%d", wgmc, gjstr, wgydfw, nlxh, wggjl)
                    DrawStrBox(mx, my, wgmx, col, myfont)
                  else
                    wgmx = string.format("%s %s 移%d格 %dX%d 消耗内力：%d 威力：%d", wgmc, gjstr, wgydfw, wgssfw + 1 + wgssfw, wgssfw + 1 + wgssfw, nlxh, wggjl)
                    DrawStrBox(mx, my, wgmx, col, myfont)
                  end
                else
                  wgmx = string.format("%s 吸内力：%d 杀内力：%d", wgmc, wgjnl, wgsnl)
                  DrawStrBox(mx, my, wgmx, RGB(208, 152, 208), myfont)
                end
                local iwg
                my = my + myfont * 1.5
                mx = dx + 4 * myfont
                for iwg = 1, #CC.WUGONGNEIGONG do
                  if CC.WUGONGNEIGONG[iwg][1] == wgid then
                    DrawStrBox(dx, my, " 威力:", C_RED, myfont)
                    local wgjcxs = CC.WUGONGNEIGONG[iwg][3]
                   -- local wgmx = JY.Wugong[CC.WUGONGNEIGONG[iwg][2]]["名称"] .. "：↑" .. ngwggjl
                    drawitem(JY.Wugong[CC.WUGONGNEIGONG[iwg][2]]["名称"] .. "：↑" .. wgjcxs)
                  end
				  	
                end
              end

            end
          else
            cur_thing = -1
          end
        else
          boxcolor = C_BLACK
        end
        local boxx = dx + CC.ThingGapOut + x * (CC.ThingPicWidth + CC.ThingGapIn)
        local boxy = y3_1 + CC.ThingGapOut + y * (CC.ThingPicHeight + CC.ThingGapIn)
        lib.DrawRect(boxx, boxy, boxx + CC.ThingPicWidth + 1, boxy + CC.ThingPicHeight + 1, boxcolor)
        if 0 <= thing[id] and CC.LoadThingPic == 1 then
          lib.PicLoadCache(2, thing[id] * 2, boxx + 1, boxy + 1, 1)
        elseif 0 <= thing[id] and CC.LoadThingPic == 0 and CC.FK == 0 then
          lib.PicLoadCache(0, (thing[id] + CC.StartThingPic) * 2, boxx + 1, boxy + 1, 1)
        elseif 0 <= thing[id] and CC.LoadThingPic == 0 and CC.FK == 1 then
          lib.PicLoadCache(2, (thing[id] + CC.StartThingPic) * 2, boxx + 1, boxy + 1, 1)
        end
      end
    end
    ShowScreen()
    local keypress, ktype, mx, my = WaitKey(1)
    if keypress == VK_ESCAPE or ktype == 4 then
      cur_thing = -1
      oldcur_line = cur_line
      oldcur_x = cur_x
      oldcur_y = cur_y
      break
    elseif keypress == VK_RETURN or keypress == VK_SPACE then
      oldcur_line = cur_line
      oldcur_x = cur_x
      oldcur_y = cur_y
      break
    elseif keypress == VK_UP or ktype == 6 then
      if cur_y == 0 then
        if 0 < cur_line then
          cur_line = cur_line - 1
        end
      else
        cur_y = cur_y - 1
      end
    elseif keypress == VK_DOWN or ktype == 7 then
      if cur_y == ynum - 1 then
        if cur_line < math.modf(CC.MyThingNum / xnum) - ynum then
          cur_line = cur_line + 1
        end
      else
        cur_y = cur_y + 1
      end
    elseif keypress == VK_LEFT then
      if 0 < cur_x then
        cur_x = cur_x - 1
      else
        cur_x = xnum - 1
      end
    elseif keypress == VK_RIGHT then
      if cur_x == xnum - 1 then
        cur_x = 0
      else
        cur_x = cur_x + 1
      end
    elseif ktype == 2 or ktype == 3 then
      if dx < mx and y3_1 < my and mx < CC.ScreenW - dx and my < CC.ScreenH - y3_1 then
        cur_x = math.modf((mx - dx - CC.ThingGapOut / 2) / (CC.ThingPicWidth + CC.ThingGapIn))
        cur_y = math.modf((my - y3_1 - CC.ThingGapOut / 2) / (CC.ThingPicHeight + CC.ThingGapIn))
        if ktype == 3 then
          break
        end
      end
      if ktype == 2 then
        if my < CC.DefaultFont * 5 then
          if cur_y == 0 then
            if 0 < cur_line then
              cur_line = cur_line - 1
            end
          else
            cur_y = cur_y - 1
          end
          lib.Delay(100)
        elseif my > CC.ScreenH - CC.DefaultFont * 5 then
          if cur_y == ynum - 1 then
            if cur_line < math.modf(CC.MyThingNum / xnum) - ynum then
              cur_line = cur_line + 1
            end
          else
            cur_y = cur_y + 1
          end
          lib.Delay(100)
        end
      end
    end
  end
  Cls()
  return cur_thing
end

function ngwgzjwl(nglevel, wgwl, wgjcxs, wofang)
  if CC.NGWGJC_TYPEC == 1 then
    if wofang == true then
      if nglevel == 10 then
      end
      local ngwggjl = math.ceil(wgjcxs * nglevel / 10)
      return ngwggjl
    else
      return 0
    end
  end
  if wofang == true then
    if nglevel == 10 then
    end
    local wgzzfd = (nglevel + 1) * nglevel * (nglevel + 2) / 903
    --local ngwggjl = math.ceil((wgwl + nglevel + nglevel * nglevel / 3) * wgzzfd * wgjcxs / 100)
	local ngwggjl=wgjcxs * nglevel / 10
    return ngwggjl
  else
    return 0
  end
end
function SceneCanPass(x, y)
  local ispass = true
  if GetS(JY.SubScene, x, y, 1) > 0 then
    ispass = false
  end
  local d_data = GetS(JY.SubScene, x, y, 3)
  if 0 <= d_data and GetD(JY.SubScene, d_data, 0) ~= 0 then
    ispass = false
  end
  if CC.SceneWater[GetS(JY.SubScene, x, y, 0)] ~= nil then
    ispass = false
  end
  return ispass
end
function Cal_D_Valid()
  if JY.D_Valid ~= nil then
    return
  end
  local sceneid = JY.SubScene
  JY.D_Valid = {}
  JY.D_Valid_Num = 0
  for i = 0, CC.DNum - 1 do
    local x = GetD(sceneid, i, 9)
    local y = GetD(sceneid, i, 10)
    local v = GetS(sceneid, x, y, 3)
    if 0 <= v then
      JY.D_Valid[JY.D_Valid_Num] = i
      JY.D_Valid_Num = JY.D_Valid_Num + 1
    end
  end
end
function DtoSMap()
  local sceneid = JY.SubScene
  JY.NumD_PicChange = 0
  JY.D_PicChange = {}
  if JY.D_Valid == nil then
    Cal_D_Valid()
  end
  for k = 0, JY.D_Valid_Num - 1 do
    local i = JY.D_Valid[k]
    local p1 = GetD(sceneid, i, 5)
    if 0 < p1 then
      local p2 = GetD(JY.SubScene, i, 6)
      local p3 = GetD(JY.SubScene, i, 7)
      local delay = GetD(JY.SubScene, i, 8)
      if p1 >= p3 then
        if delay < JY.MyTick % 100 then
          p3 = p3 + 1
        end
      elseif JY.MyTick % 4 == 0 then
        p3 = p3 + 1
      end
      if p2 < p3 then
        p3 = p1
      end
      SetD(JY.SubScene, i, 7, p3)
    end
  end
end
function DrawSMap(fastdraw)
  local x0 = JY.SubSceneX + JY.Base["人X1"] - 1
  local y0 = JY.SubSceneY + JY.Base["人Y1"] - 1
  local x = limitX(x0, CC.SceneXMin, CC.SceneXMax) - JY.Base["人X1"]
  local y = limitX(y0, CC.SceneYMin, CC.SceneYMax) - JY.Base["人Y1"]
  lib.DrawSMap(JY.SubScene, JY.Base["人X1"], JY.Base["人Y1"], x, y, JY.MyPic)
end
function LoadRecord(id)
  local t1 = lib.GetTime()
  local data = Byte.create(24)
  Byte.loadfile(data, CC.R_IDXFilename[0], 0, 24)
  local idx = {}
  idx[0] = 0
  for i = 1, 6 do
    idx[i] = Byte.get32(data, 4 * (i - 1))
  end
  JY.Data_Base = Byte.create(idx[1] - idx[0])
  Byte.loadfile(JY.Data_Base, CC.R_GRPFilename[id], idx[0], idx[1] - idx[0])
  local meta_t = {
    __index = function(t, k)
      return GetDataFromStruct(JY.Data_Base, 0, CC.Base_S, k)
    end,
    __newindex = function(t, k, v)
      SetDataFromStruct(JY.Data_Base, 0, CC.Base_S, k, v)
    end
  }
  setmetatable(JY.Base, meta_t)
  JY.PersonNum = math.floor((idx[2] - idx[1]) / CC.PersonSize)
  JY.Data_Person = Byte.create(CC.PersonSize * JY.PersonNum)
  Byte.loadfile(JY.Data_Person, CC.R_GRPFilename[id], idx[1], CC.PersonSize * JY.PersonNum)
  for i = 0, JY.PersonNum - 1 do
    JY.Person[i] = {}
    local meta_t = {
      __index = function(t, k)
        return GetDataFromStruct(JY.Data_Person, i * CC.PersonSize, CC.Person_S, k)
      end,
      __newindex = function(t, k, v)
        SetDataFromStruct(JY.Data_Person, i * CC.PersonSize, CC.Person_S, k, v)
      end
    }
    setmetatable(JY.Person[i], meta_t)
  end
  JY.ThingNum = math.floor((idx[3] - idx[2]) / CC.ThingSize)
  JY.Data_Thing = Byte.create(CC.ThingSize * JY.ThingNum)
  Byte.loadfile(JY.Data_Thing, CC.R_GRPFilename[id], idx[2], CC.ThingSize * JY.ThingNum)
  for i = 0, JY.ThingNum - 1 do
    JY.Thing[i] = {}
    local meta_t = {
      __index = function(t, k)
        return GetDataFromStruct(JY.Data_Thing, i * CC.ThingSize, CC.Thing_S, k)
      end,
      __newindex = function(t, k, v)
        SetDataFromStruct(JY.Data_Thing, i * CC.ThingSize, CC.Thing_S, k, v)
      end
    }
    setmetatable(JY.Thing[i], meta_t)
  end
  JY.SceneNum = math.floor((idx[4] - idx[3]) / CC.SceneSize)
  JY.Data_Scene = Byte.create(CC.SceneSize * JY.SceneNum)
  Byte.loadfile(JY.Data_Scene, CC.R_GRPFilename[id], idx[3], CC.SceneSize * JY.SceneNum)
  for i = 0, JY.SceneNum - 1 do
    JY.Scene[i] = {}
    local meta_t = {
      __index = function(t, k)
        return GetDataFromStruct(JY.Data_Scene, i * CC.SceneSize, CC.Scene_S, k)
      end,
      __newindex = function(t, k, v)
        SetDataFromStruct(JY.Data_Scene, i * CC.SceneSize, CC.Scene_S, k, v)
      end
    }
    setmetatable(JY.Scene[i], meta_t)
  end
  JY.WugongNum = math.floor((idx[5] - idx[4]) / CC.WugongSize)
  JY.Data_Wugong = Byte.create(CC.WugongSize * JY.WugongNum)
  Byte.loadfile(JY.Data_Wugong, CC.R_GRPFilename[id], idx[4], CC.WugongSize * JY.WugongNum)
  for i = 0, JY.WugongNum - 1 do
    JY.Wugong[i] = {}
    local meta_t = {
      __index = function(t, k)
        return GetDataFromStruct(JY.Data_Wugong, i * CC.WugongSize, CC.Wugong_S, k)
      end,
      __newindex = function(t, k, v)
        SetDataFromStruct(JY.Data_Wugong, i * CC.WugongSize, CC.Wugong_S, k, v)
      end
    }
    setmetatable(JY.Wugong[i], meta_t)
  end
  JY.ShopNum = math.floor((idx[6] - idx[5]) / CC.ShopSize)
  JY.Data_Shop = Byte.create(CC.ShopSize * JY.ShopNum)
  Byte.loadfile(JY.Data_Shop, CC.R_GRPFilename[id], idx[5], CC.ShopSize * JY.ShopNum)
  for i = 0, JY.ShopNum - 1 do
    JY.Shop[i] = {}
    local meta_t = {
      __index = function(t, k)
        return GetDataFromStruct(JY.Data_Shop, i * CC.ShopSize, CC.Shop_S, k)
      end,
      __newindex = function(t, k, v)
        SetDataFromStruct(JY.Data_Shop, i * CC.ShopSize, CC.Shop_S, k, v)
      end
    }
    setmetatable(JY.Shop[i], meta_t)
  end
  loadglts(id)
  lib.LoadSMap(CC.S_Filename[id], CC.TempS_Filename, JY.SceneNum, CC.SWidth, CC.SHeight, CC.D_Filename[id], CC.DNum, 11)
  collectgarbage()
  JubenBugFix()
  lib.Debug(string.format("Loadrecord time=%d", lib.GetTime() - t1))
end
function SaveRecord(id)
  local t1 = lib.GetTime()
  local data = Byte.create(24)
  Byte.loadfile(data, CC.R_IDXFilename[0], 0, 24)
  local idx = {}
  idx[0] = 0
  for i = 1, 6 do
    idx[i] = Byte.get32(data, 4 * (i - 1))
  end
  os.remove(CC.R_GRPFilename[id])
  os.remove(CC.S_Filename[id])
  os.remove(CC.D_Filename[id])
  if JY.Status == GAME_SMAP then
    JY.Base["无用"] = JY.SubScene
  else
    JY.Base["无用"] = -1
  end
  Byte.savefile(JY.Data_Base, CC.R_GRPFilename[id], idx[0], idx[1] - idx[0])
  Byte.savefile(JY.Data_Person, CC.R_GRPFilename[id], idx[1], CC.PersonSize * JY.PersonNum)
  Byte.savefile(JY.Data_Thing, CC.R_GRPFilename[id], idx[2], CC.ThingSize * JY.ThingNum)
  Byte.savefile(JY.Data_Scene, CC.R_GRPFilename[id], idx[3], CC.SceneSize * JY.SceneNum)
  Byte.savefile(JY.Data_Wugong, CC.R_GRPFilename[id], idx[4], CC.WugongSize * JY.WugongNum)
  Byte.savefile(JY.Data_Shop, CC.R_GRPFilename[id], idx[5], CC.ShopSize * JY.ShopNum)
  lib.SaveSMap(CC.S_Filename[id], CC.D_Filename[id])
  saveglts(id)
  lib.Debug(string.format("SaveRecord time=%d", lib.GetTime() - t1))
end

function file_exist(filename)
  local file = io.open(filename, "rb")
  if file then
    file:close()
  end
  return file ~= nil
end

function filelength(filename)
  local inp = io.open(filename, "rb")
  local l = inp:seek("end")
  inp:close()
  return l
end
function GetS(id, x, y, level)
  return lib.GetS(id, x, y, level)
end
function SetS(id, x, y, level, v)
  lib.SetS(id, x, y, level, v)
end
function GetD(Sceneid, id, i)
  return lib.GetD(Sceneid, id, i)
end
function SetD(Sceneid, id, i, v)
  lib.SetD(Sceneid, id, i, v)
end
function GetDataFromStruct(data, offset, t_struct, key)
  local t = t_struct[key]
  local r
  if t[2] == 0 then
    r = Byte.get16(data, t[1] + offset)
  elseif t[2] == 1 then
    r = Byte.getu16(data, t[1] + offset)
  elseif t[2] == 2 then
    if CC.SrcCharSet == 0 then
      r = lib.CharSet(Byte.getstr(data, t[1] + offset, t[3]), 0)
    else
      r = Byte.getstr(data, t[1] + offset, t[3])
    end
  end
  return r
end
function SetDataFromStruct(data, offset, t_struct, key, v)
  local t = t_struct[key]
  if t[2] == 0 then
    Byte.set16(data, t[1] + offset, v)
  elseif t[2] == 1 then
    Byte.setu16(data, t[1] + offset, v)
  elseif t[2] == 2 then
    local s
    if CC.SrcCharSet == 0 then
      s = lib.CharSet(v, 1)
    else
      s = v
    end
    Byte.setstr(data, t[1] + offset, t[3], s)
  end
end
function LoadData(t, t_struct, data)
  for k, v in pairs(t_struct) do
    if v[2] == 0 then
      t[k] = Byte.get16(data, v[1])
    elseif v[2] == 1 then
      t[k] = Byte.getu16(data, v[1])
    elseif v[2] == 2 then
      if CC.SrcCharSet == 0 then
        t[k] = lib.CharSet(Byte.getstr(data, v[1], v[3]), 0)
      else
        t[k] = Byte.getstr(data, v[1], v[3])
      end
    end
  end
end
function SaveData(t, t_struct, data)
  for k, v in pairs(t_struct) do
    if v[2] == 0 then
      Byte.set16(data, v[1], t[k])
    elseif v[2] == 1 then
      Byte.setu16(data, v[1], t[k])
    elseif v[2] == 2 then
      local s
      if CC.SrcCharSet == 0 then
        s = lib.CharSet(t[k], 1)
      else
        s = t[k]
      end
      Byte.setstr(data, v[1], v[3], s)
    end
  end
end
function limitX(x, minv, maxv)
  if x < minv then
    x = minv
  elseif maxv < x then
    x = maxv
  end
  return x
end
function RGB(r, g, b)
  return r * 65536 + g * 256 + b
end
function GetRGB(color)
  color = color % 16777216
  local r = math.floor(color / 65536)
  color = color % 65536
  local g = math.floor(color / 256)
  local b = color % 256
  return r, g, b
end
function WaitKey(flag)
  local key, ktype, mx, my = -1, -1, -1, -1
  if flag == 1 then
    key, ktype, mx, my = lib.GetKey()
    if key == -1 then
      lib.Delay(CC.Frame / 2)
    end
    return key, ktype, mx, my
  end
  while true do
    key, ktype, mx, my = lib.GetKey()
    if ktype == nil then
      ktype, mx, my = -1, -1, -1
    end
    if (ktype ~= -1 or key ~= -1) and ((flag == nil or flag == 0) and ktype ~= 2 or flag ~= nil and flag ~= 0) then
      break
    end
    lib.Delay(CC.Frame / 2)
  end
  return key, ktype, mx, my
end
function DrawBox(x1, y1, x2, y2, color)
  local s = 2 * CC.BoxLine
  lib.Background(x1, y1 + s, x1 + s, y2 - s, 128)
  lib.Background(x1 + s, y1, x2 - s, y2, 128)
  lib.Background(x2 - s, y1 + s, x2, y2 - s, 128)
  local r, g, b = GetRGB(color)
  DrawBox_1(x1 + 1, y1 + 1, x2, y2, RGB(math.modf(r / 2), math.modf(g / 2), math.modf(b / 2)))
  DrawBox_1(x1, y1, x2 - 1, y2 - 1, color)
end
function DrawBox_1(x1, y1, x2, y2, color)
  local s = 2 * CC.BoxLine
  lib.DrawRect(x1 + s, y1, x2 - s, y1, color)
  lib.DrawRect(x2 - s, y1, x2 - s, y1 + s, color)
  lib.DrawRect(x2 - s, y1 + s, x2, y1 + s, color)
  lib.DrawRect(x2, y1 + s, x2, y2 - s, color)
  lib.DrawRect(x2, y2 - s, x2 - s, y2 - s, color)
  lib.DrawRect(x2 - s, y2 - s, x2 - s, y2, color)
  lib.DrawRect(x2 - s, y2, x1 + s, y2, color)
  lib.DrawRect(x1 + s, y2, x1 + s, y2 - s, color)
  lib.DrawRect(x1 + s, y2 - s, x1, y2 - s, color)
  lib.DrawRect(x1, y2 - s, x1, y1 + s, color)
  lib.DrawRect(x1, y1 + s, x1 + s, y1 + s, color)
  lib.DrawRect(x1 + s, y1 + s, x1 + s, y1, color)
end
function DrawString(x, y, str, color, size)
  lib.DrawStr(x, y, str, color, size, CC.FontName, CC.SrcCharSet, CC.OSCharSet)
end
function DrawStrBox(x, y, str, color, size)
  local ll = #str
  local w = size * ll / 2 + 2 * CC.MenuBorderPixel
  local h = size + 2 * CC.MenuBorderPixel
  if x == -1 then
    x = (CC.ScreenW - size / 2 * ll - 2 * CC.MenuBorderPixel) / 2
  end
  if y == -1 then
    y = (CC.ScreenH - size - 2 * CC.MenuBorderPixel) / 2
  end
  DrawBox(x, y, x + w - 1, y + h - 1, C_WHITE)
  DrawString(x + CC.MenuBorderPixel, y + CC.MenuBorderPixel, str, color, size)
end
function DrawStrBoxYesNo(x, y, str, color, size)
  local ll = #str
  local w = size * ll / 2 + 2 * CC.MenuBorderPixel
  local h = size + 2 * CC.MenuBorderPixel
  if x == -1 then
    x = (CC.ScreenW - size / 2 * ll - 2 * CC.MenuBorderPixel) / 2
  end
  if y == -1 then
    y = (CC.ScreenH - size - 2 * CC.MenuBorderPixel) / 2
  end
  DrawStrBox(x, y, str, color, size)
  local menu = {
    {
      "确定/是",
      nil,
      1
    },
    {
      "取消/否",
      nil,
      2
    }
  }
  local r = ShowMenu(menu, 2, 0, x + w - 4 * size - 2 * CC.MenuBorderPixel, y + h + CC.MenuBorderPixel, 0, 0, 1, 0, size, C_ORANGE, C_WHITE)
  if r == 1 then
    return true
  else
    return false
  end
end
function DrawStrBoxWaitKey(s, color, size)
  DrawStrBox(-1, -1, s, color, size)
  ShowScreen()
  WaitKey()
  Cls()
end
function Rnd(i)
  local r = math.random(i)
  return r - 1
end
function AddPersonAttrib(id, str, value)
  local oldvalue = JY.Person[id][str]
  local attribmax = math.huge
  if str == "生命" then
    attribmax = JY.Person[id]["生命最大值"]
  elseif str == "内力" then
    attribmax = JY.Person[id]["内力最大值"]
  elseif CC.PersonAttribMax[str] ~= nil then
    attribmax = CC.PersonAttribMax[str]
  end
  local newvalue = limitX(oldvalue + value, 0, attribmax)
  JY.Person[id][str] = newvalue
  local add = newvalue - oldvalue
  local showstr = ""
  if 0 < add then
    showstr = string.format("%s 增加 %d", str, add)
  elseif add < 0 then
    showstr = string.format("%s 减少 %d", str, -add)
  end
  return add, showstr
end
function PlayMIDI(id)
  JY.CurrentMIDI = id
  if JY.EnableMusic == 0 then
    return
  end
  if 0 <= id then
    lib.PlayMIDI(string.format(CC.MIDIFile, id + 1))
  end
end
function PlayWavAtk(id)
  if JY.EnableSound == 0 then
    return
  end
  if 0 <= id then
    lib.PlayWAV(string.format(CC.ATKFile, id))
  end
end
function PlayWavE(id)
  if JY.EnableSound == 0 then
    return
  end
  if 0 <= id then
    lib.PlayWAV(string.format(CC.EFile, id))
  end
end
function ShowScreen(flag)
  if JY.Darkness == 0 then
    if flag == nil then
      flag = 0
    end
    lib.ShowSurface(flag)
  end
end
function ShowMenu(menuItem, numItem, numShow, x1, y1, x2, y2, isBox, isEsc, size, color, selectColor, selectxm)
  if selectxm == nil then
    selectxm = 1
  end
  local w = 0
  local h = 0
  local i = 0
  local num = 0
  local newNumItem = 0
  local zbx = JY.Base["人X"]
  local zbY = JY.Base["人Y"]
  local newMenu = {}
  for i = 1, numItem do
    if 0 < menuItem[i][3] then
      newNumItem = newNumItem + 1
      newMenu[newNumItem] = {
        menuItem[i][1],
        menuItem[i][2],
        menuItem[i][3],
        i
      }
    end
  end
  if newNumItem == 0 then
    return 0
  end
  if numShow == 0 or numShow > newNumItem then
    num = newNumItem
  else
    num = numShow
  end
  local maxlength = 0
  if x2 == 0 and y2 == 0 then
    for i = 1, newNumItem do
      if maxlength < string.len(newMenu[i][1]) then
        maxlength = string.len(newMenu[i][1])
      end
    end
    w = size * maxlength / 2 + 2 * CC.MenuBorderPixel
    h = (size + CC.RowPixel) * num + CC.MenuBorderPixel
  else
    w = x2 - x1
    h = y2 - y1
  end
  local start = 1
  local current = 1
  for i = 1, newNumItem do
    if newMenu[i][3] == 2 then
      current = i
    end
  end
  if numShow ~= 0 then
    current = 1
  end
  current = current + selectxm - 1
  if newNumItem < current then
    current = 1
  end
  local surid = lib.SaveSur(0, 0, CC.ScreenW, CC.ScreenH)
  local surid2 = lib.SaveSur(x1, y1, x2, y2)
  local returnValue = 0
  if isBox == 1 then
    DrawBox(x1, y1, x1 + w, y1 + h, C_WHITE)
  end
  while true do
    if num ~= 0 then
      if zbx == JY.Base["人X"] and zbY == JY.Base["人Y"] then
        ClsN()
        lib.LoadSur(surid, 0, 0)
      else
        lib.FreeSur(surid)
        Cls()
        surid = lib.SaveSur(0, 0, CC.ScreenW, CC.ScreenH)
      end
      if isBox == 1 then
        DrawBox(x1, y1, x1 + w, y1 + h, C_WHITE)
      end
    end
    for i = start, start + num - 1 do
      local drawColor = color
      if i == current then
        drawColor = selectColor
        lib.Background(x1 + CC.MenuBorderPixel, y1 + CC.MenuBorderPixel + (i - start) * (size + CC.RowPixel), x1 - CC.MenuBorderPixel + w, y1 + CC.MenuBorderPixel + (i - start) * (size + CC.RowPixel) + size, 128, color)
      end
      DrawString(x1 + CC.MenuBorderPixel, y1 + CC.MenuBorderPixel + (i - start) * (size + CC.RowPixel), newMenu[i][1], drawColor, size)
    end
    ShowScreen()
    local keyPress, ktype, mx, my = WaitKey(1)
    if keyPress == VK_ESCAPE or ktype == 4 then
      if isEsc == 1 then
        break
      end
    elseif keyPress == VK_DOWN or ktype == 7 then
      current = current + 1
      if current > start + num - 1 then
        start = start + 1
      end
      if newNumItem < current then
        start = 1
        current = 1
      end
    elseif keyPress == VK_UP or ktype == 6 then
      current = current - 1
      if start > current then
        start = start - 1
      end
      if current < 1 then
        current = newNumItem
        start = current - num + 1
      end
    elseif keyPress == VK_RIGHT then
      current = current + 10
      if current > start + num - 1 then
        start = start + 10
      end
      if newNumItem < current + start then
        current = newNumItem
        start = current - num + 1
      end
    elseif keyPress == VK_LEFT then
      current = current - 10
      if start > current then
        start = start - 10
      end
      if current < 1 then
        start = 1
        current = 1
      elseif num > current then
        start = 1
      end
    else
      local mk = false
      if (ktype == 2 or ktype == 3) and x1 <= mx and mx <= x1 + w and y1 <= my and my <= y1 + h then
        current = start + math.modf((my - y1 - CC.MenuBorderPixel) / (size + CC.RowPixel))
        mk = true
      end
      if keyPress == VK_SPACE or keyPress == VK_RETURN or ktype == 5 or ktype == 3 and mk then
        if newMenu[current][2] == nil then
          returnValue = newMenu[current][4]
          if zbx == JY.Base["人X"] and zbY == JY.Base["人Y"] then
            lib.LoadSur(surid2, x1, y1)
            break
          end
          lib.FreeSur(surid2)
          Cls()
          surid2 = lib.SaveSur(x1, y1, x2, y2)
          lib.LoadSur(surid2, x1, y1)
          break
        else
          local r = newMenu[current][2](newMenu, current)
          if r == 1 then
            returnValue = -newMenu[current][4]
            break
          end
          if zbx == JY.Base["人X"] and zbY == JY.Base["人Y"] then
            ClsN()
            lib.LoadSur(surid, 0, 0)
          else
            lib.FreeSur(surid)
            Cls()
            surid = lib.SaveSur(0, 0, CC.ScreenW, CC.ScreenH)
            lib.LoadSur(surid, 0, 0)
          end
          if isBox == 1 then
            DrawBox(x1, y1, x1 + w, y1 + h, C_WHITE)
          end
        end
      end
    end
  end
  lib.FreeSur(surid)
  lib.FreeSur(surid2)
  return returnValue
end
function ShowMenu2(menuItem, numItem, numShow, x1, y1, x2, y2, isBox, isEsc, size, color, selectColor)
  local w = 0
  local h = 0
  local i = 0
  local num = 0
  local newNumItem = 0
  local newMenu = {}
  for i = 1, numItem do
    if 0 < menuItem[i][3] then
      newNumItem = newNumItem + 1
      newMenu[newNumItem] = {
        menuItem[i][1],
        menuItem[i][2],
        menuItem[i][3],
        i
      }
    end
  end
  if numShow == 0 or numShow > newNumItem then
    num = newNumItem
  else
    num = numShow
  end
  local maxlength = 0
  if x2 == 0 and y2 == 0 then
    for i = 1, newNumItem do
      if maxlength < string.len(newMenu[i][1]) then
        maxlength = string.len(newMenu[i][1])
      end
    end
    w = (size * maxlength / 2 + CC.RowPixel) * num + CC.MenuBorderPixel
    h = size + 2 * CC.MenuBorderPixel
  else
    w = x2 - x1
    h = y2 - y1
  end
  local start = 1
  local current = 1
  for i = 1, newNumItem do
    if newMenu[i][3] == 2 then
      current = i
      break
    end
  end
  if numShow ~= 0 then
    current = 1
  end
  local surid = lib.SaveSur(x1, y1, x1 + w, y1 + h)
  local returnValue = 0
  if isBox == 1 then
    DrawBox(x1, y1, x1 + w, y1 + h, C_WHITE)
  end
  while true do
    if numShow ~= 0 and isBox == 1 then
      DrawBox(x1, y1, x1 + w, y1 + h, C_WHITE)
    end
    for i = start, start + num - 1 do
      local drawColor = color
      if i == current then
        drawColor = selectColor
      end
      DrawString(x1 + CC.MenuBorderPixel + (i - start) * (size * maxlength / 2 + CC.RowPixel), y1 + CC.MenuBorderPixel, newMenu[i][1], drawColor, size)
    end
    ShowScreen()
    local keyPress, ktype, mx, my = WaitKey(1)
    if keyPress == VK_ESCAPE or ktype == 4 then
      if isEsc == 1 then
        break
      end
    elseif keyPress == VK_RIGHT then
      current = current + 1
      if current > start + num - 1 then
        start = start + 1
      end
      if newNumItem < current then
        start = 1
        current = 1
      end
    elseif keyPress == VK_LEFT then
      current = current - 1
      if start > current then
        start = start - 1
      end
      if current < 1 then
        current = newNumItem
        start = current - num + 1
      end
    elseif keyPress == VK_SPACE or keyPress == VK_RETURN then
      if newMenu[current][2] == nil then
        returnValue = newMenu[current][4]
        break
      else
        local r = newMenu[current][2](newMenu, current)
        if r == 1 then
          returnValue = -newMenu[current][4]
          break
        elseif isBox == 1 then
          DrawBox(x1, y1, x1 + w, y1 + h, C_WHITE)
        end
      end
    end
    lib.LoadSur(surid, x1, y1)
  end
  lib.LoadSur(surid, x1, y1)
  lib.FreeSur(surid)
  return returnValue
end
function UseThing(id)
  if JY.ThingUseFunction[id] == nil then
    return DefaultUseThing(id)
  else
    return JY.ThingUseFunction[id](id)
  end
end
function DefaultUseThing(id)
  if JY.Thing[id]["类型"] == 0 then
    return UseThing_Type0(id)
  elseif JY.Thing[id]["类型"] == 1 then
    return UseThing_Type1(id)
  elseif JY.Thing[id]["类型"] == 2 then
    return UseThing_Type2(id)
  elseif JY.Thing[id]["类型"] == 3 then
    return UseThing_Type3(id)
  elseif JY.Thing[id]["类型"] == 4 then
    return UseThing_Type4(id)
  end
end
function UseThing_Type0(id)
  if JY.SubScene >= 0 then
    local x = JY.Base["人X1"] + CC.DirectX[JY.Base["人方向"] + 1]
    local y = JY.Base["人Y1"] + CC.DirectY[JY.Base["人方向"] + 1]
    local d_num = GetS(JY.SubScene, x, y, 3)
    if 0 <= d_num then
      JY.CurrentThing = id
      EventExecute(d_num, 2)
      JY.CurrentThing = -1
      return 1
    else
      return 0
    end
  end
end
function UseThing_Type1(id)
  DrawStrBox(CC.MainSubMenuX, CC.MainSubMenuY, string.format("谁要配备%s?", JY.Thing[id]["名称"]), C_WHITE, CC.DefaultFont)
  local nexty = CC.MainSubMenuY + CC.SingleLineHeight
  local r = SelectTeamMenu(CC.MainSubMenuX, nexty)
  if 0 < r then
    local personid = JY.Base["队伍" .. r]
    if CanUseThing(id, personid) then
      if JY.Thing[id]["装备类型"] == 0 then
        if 0 <= JY.Thing[id]["使用人"] then
          JY.Person[JY.Thing[id]["使用人"]]["武器"] = -1
        end
        if 0 <= JY.Person[personid]["武器"] then
          JY.Thing[JY.Person[personid]["武器"]]["使用人"] = -1
        end
        JY.Person[personid]["武器"] = id
      elseif JY.Thing[id]["装备类型"] == 1 then
        if 0 <= JY.Thing[id]["使用人"] then
          JY.Person[JY.Thing[id]["使用人"]]["防具"] = -1
        end
        if 0 <= JY.Person[personid]["防具"] then
          JY.Thing[JY.Person[personid]["防具"]]["使用人"] = -1
        end
        JY.Person[personid]["防具"] = id
      end
      JY.Thing[id]["使用人"] = personid
    else
      DrawStrBoxWaitKey("此人不适合配备此物品", C_WHITE, CC.DefaultFont)
      return 0
    end
  end
  return 1
end
function CanUseThing(id, personid)
  local str = ""
  if JY.Thing[id]["仅修炼人物"] >= 0 and JY.Thing[id]["仅修炼人物"] ~= personid then
    return false
  end
  if JY.Thing[id]["需内力性质"] ~= 2 and JY.Person[personid]["内力性质"] ~= 2 and JY.Thing[id]["需内力性质"] ~= JY.Person[personid]["内力性质"] then
    return false
  end
  local ndnd = JY.NDPER / 100
  if ndnd < 1 then
    ndnd = 1
  end
  if JY.Thing[id]["需内力"] > JY.Person[personid]["内力最大值"] then
    return false
  end
  if JY.Thing[id]["需攻击力"] > JY.Person[personid]["攻击力"] then
    return false
  end
  if JY.Thing[id]["需轻功"] > JY.Person[personid]["轻功"] then
    return false
  end
  if JY.Thing[id]["需用毒能力"] > JY.Person[personid]["用毒能力"] then
    return false
  end
  if JY.Thing[id]["需医疗能力"] > JY.Person[personid]["医疗能力"] then
    return false
  end
  if JY.Thing[id]["需解毒能力"] > JY.Person[personid]["解毒能力"] then
    return false
  end
  if JY.Thing[id]["需拳掌功夫"] > JY.Person[personid]["拳掌功夫"] then
    return false
  end
  if JY.Thing[id]["需御剑能力"] > JY.Person[personid]["御剑能力"] then
    return false
  end
  if JY.Thing[id]["需耍刀技巧"] > JY.Person[personid]["耍刀技巧"] then
    return false
  end
  if JY.Thing[id]["需特殊兵器"] > JY.Person[personid]["特殊兵器"] then
    return false
  end
  if JY.Thing[id]["需暗器技巧"] > JY.Person[personid]["暗器技巧"] then
    return false
  end
  if 0 <= JY.Thing[id]["需资质"] then
    if JY.Thing[id]["需资质"] > JY.Person[personid]["资质"] then
      return false
    end
  elseif -JY.Thing[id]["需资质"] < JY.Person[personid]["资质"] then
    return false
  end
  return true
end
function UseThing_Type2(id)
  local yes = 0
  if 0 <= JY.Thing[id]["使用人"] and DrawStrBoxYesNo(-1, -1, "此物品已经有人修炼，是否换人修炼?", C_WHITE, CC.DefaultFont) == false then
    Cls(CC.MainSubMenuX, CC.MainSubMenuY, CC.ScreenW, CC.ScreenH)
    ShowScreen()
    return 0
  end
  Cls()
  DrawStrBox(CC.MainSubMenuX, CC.MainSubMenuY, string.format("谁要修炼%s?", JY.Thing[id]["名称"]), C_WHITE, CC.DefaultFont)
  local nexty = CC.MainSubMenuY + CC.SingleLineHeight
  local r = SelectTeamMenu(CC.MainSubMenuX, nexty)
  if 0 < r then
    local personid = JY.Base["队伍" .. r]
    if CC.BanBen == 1 then
      if 0 <= JY.Thing[id]["练出武功"] then
        if JY.Thing[id]["练出武功"] >= 114 and JY.Thing[id]["练出武功"] <= 118 then
          for i = 1, 10 do
            if JY.Person[personid]["武功" .. i] == JY.Thing[id]["练出武功"] - 1 then
              local zzsx = math.modf(JY.Person[personid]["资质"] / 15)
              if zzsx + 114 < JY.Thing[id]["练出武功"] and 0 < personid then
                DrawStrBoxWaitKey("此人无法领会高深武学", C_WHITE, CC.DefaultFont)
                return 0
              end
              if JY.Person[personid]["武功等级" .. i] >= 900 and (CanUseThing(id, personid) or JY.Person[personid]["代号"] == 76) then
                JY.Person[personid]["武功" .. i] = JY.Thing[id]["练出武功"]
                JY.Person[personid]["武功等级" .. i] = 400
                local wgid1 = JY.Thing[id]["练出武功"] - 1
                local wgid2 = JY.Thing[id]["练出武功"]
                local wgmc1 = JY.Wugong[wgid1]["名称"]
                local wgmc2 = JY.Wugong[wgid2]["名称"]
                if JY.Thing[id - 1]["使用人"] == personid then
                  JY.Thing[id - 1]["使用人"] = -1
                end
                if 0 <= JY.Person[personid]["修炼物品"] then
                  local oldid = JY.Person[personid]["修炼物品"]
                  JY.Thing[oldid]["使用人"] = -1
                end
                JY.Person[personid]["修炼物品"] = id
                DrawStrBoxWaitKey(wgmc1 .. " 升至 " .. wgmc2, C_WHITE, CC.DefaultFont)
                return 1
              elseif CanUseThing(id, personid) or JY.Person[personid]["代号"] == 76 then
                DrawStrBoxWaitKey("修炼10级可升至下一重", C_WHITE, CC.DefaultFont)
                return 0
              else
                DrawStrBoxWaitKey("此人不适合修炼此物品", C_WHITE, CC.DefaultFont)
                return 0
              end
            end
          end
          for i = 1, 10 do
            if 114 <= JY.Person[personid]["武功" .. i] then
              if JY.Person[personid]["武功" .. i] < JY.Thing[id]["练出武功"] then
                DrawStrBoxWaitKey("必须从低重开始修炼", C_WHITE, CC.DefaultFont)
                return 0
              elseif JY.Person[personid]["武功" .. i] > JY.Thing[id]["练出武功"] then
                DrawStrBoxWaitKey("自创武功无法降重修炼", C_WHITE, CC.DefaultFont)
                return 0
              end
            end
          end
          local ka = 0
          for i = 1, 10 do
            if ka < JY.Person[personid]["武功" .. i] then
              ka = JY.Person[personid]["武功" .. i]
            end
          end
          if ka < 114 and JY.Thing[id]["练出武功"] ~= 114 then
            DrawStrBoxWaitKey("必须从低重开始修炼", C_WHITE, CC.DefaultFont)
            return 0
          end
        end
        for i = 1, 10 do
          if JY.Person[personid]["武功" .. i] == JY.Thing[id]["练出武功"] then
            yes = 1
            break
          end
        end
        if yes == 0 and 0 < JY.Person[personid]["武功10"] then
          DrawStrBoxWaitKey("一个人只能修炼10种武功", C_WHITE, CC.DefaultFont)
          return 0
        end
      end
      if CanUseThing(id, personid) or yes == 1 or JY.Person[personid]["代号"] == 76 then
        if JY.Thing[id]["使用人"] == personid then
          return 0
        end
      else
        DrawStrBoxWaitKey("此人不适合修炼此物品", C_WHITE, CC.DefaultFont)
        return 0
      end
      if CC.Shemale[id] == 1 then
        if JY.Person[personid]["性别"] == 0 or JY.Person[personid]["代号"] == 76 then
          Cls(CC.MainSubMenuX, CC.MainSubMenuY, CC.ScreenW, CC.ScreenH)
          if DrawStrBoxYesNo(-1, -1, "修炼此书必须先挥刀自宫，是否仍要修炼?", C_WHITE, CC.DefaultFont) == false then
            return 0
          elseif JY.Person[personid]["姓名"] == "szlzw" then
            say("５Ｒ欲练神功　挥刀自宫")
            say("２这太惨了吧！先看看再说....Ｈ（翻到下一页）")
            say("５Ｒ若不自宫　也可练功")
            say("１哈，原来不自宫也能练啊！Ｈ太棒了！！！")
          elseif JY.Person[personid]["代号"] == 76 then
            TalkEx("这秘籍难不倒我！", 76, 0)
            TalkEx("在这里作些修改即可！", 76, 0)
            TalkEx("好了，没什么不适！", 76, 0)
          else
            JY.Person[personid]["性别"] = 2
          end
        elseif JY.Person[personid]["性别"] == 1 then
          DrawStrBoxWaitKey("此人不适合修炼此物品", C_WHITE, CC.DefaultFont)
          return 0
        end
      end
      if 0 <= JY.Person[personid]["修炼物品"] then
        JY.Thing[JY.Person[personid]["修炼物品"]]["使用人"] = -1
      end
      if 0 <= JY.Thing[id]["使用人"] then
        JY.Person[JY.Thing[id]["使用人"]]["修炼物品"] = -1
      end
      JY.Thing[id]["使用人"] = personid
      JY.Person[personid]["修炼物品"] = id
    else
      if 0 <= JY.Thing[id]["练出武功"] then
        for i = 1, 10 do
          if JY.Person[personid]["武功" .. i] == JY.Thing[id]["练出武功"] then
            yes = 1
            break
          end
        end
        if yes == 0 and 0 < JY.Person[personid]["武功10"] then
          DrawStrBoxWaitKey("一个人只能修炼10种武功", C_WHITE, CC.DefaultFont)
          return 0
        end
      end
      if CanUseThing(id, personid) or yes == 1 then
        if JY.Thing[id]["使用人"] == personid then
          return 0
        end
      else
        DrawStrBoxWaitKey("此人不适合修炼此物品", C_WHITE, CC.DefaultFont)
        return 0
      end
      if CC.Shemale[id] == 1 then
        if JY.Person[personid]["性别"] == 0 then
          Cls(CC.MainSubMenuX, CC.MainSubMenuY, CC.ScreenW, CC.ScreenH)
          if DrawStrBoxYesNo(-1, -1, "修炼此书必须先挥刀自宫，是否仍要修炼?", C_WHITE, CC.DefaultFont) == false then
            return 0
          elseif JY.Person[0]["姓名"] == "szlzw" then
            say("５Ｒ欲练神功　挥刀自宫")
            say("２这太惨了吧！先看看再说....Ｈ（翻到下一页）")
            say("５Ｒ若不自宫　也可练功", 0)
            say("１哈，原来不自宫也能练啊！Ｈ太棒了！！！")
          else
            JY.Person[personid]["性别"] = 2
          end
        elseif JY.Person[personid]["性别"] == 1 then
          DrawStrBoxWaitKey("此人不适合修炼此物品", C_WHITE, CC.DefaultFont)
          return 0
        end
      end
      if 0 <= JY.Person[personid]["修炼物品"] then
        JY.Thing[JY.Person[personid]["修炼物品"]]["使用人"] = -1
      end
      if 0 <= JY.Thing[id]["使用人"] then
        JY.Person[JY.Thing[id]["使用人"]]["修炼物品"] = -1
      end
      JY.Thing[id]["使用人"] = personid
      JY.Person[personid]["修炼物品"] = id
    end
  end
  return 1
end
function UseThing_Type3(id)
  local usepersonid = -1
  if JY.Status == GAME_MMAP or JY.Status == GAME_SMAP then
    Cls(CC.MainSubMenuX, CC.MainSubMenuY, CC.ScreenW, CC.ScreenH)
    DrawStrBox(CC.MainSubMenuX, CC.MainSubMenuY, string.format("谁要使用%s?", JY.Thing[id]["名称"]), C_WHITE, CC.DefaultFont)
    local nexty = CC.MainSubMenuY + CC.SingleLineHeight
    local r = SelectTeamMenu(CC.MainSubMenuX, nexty)
    if 0 < r then
      usepersonid = JY.Base["队伍" .. r]
    end
  elseif JY.Status == GAME_WMAP then
    usepersonid = WAR.Person[WAR.CurID]["人物编号"]
  end
  if 0 <= usepersonid then
    if UseThingEffect(id, usepersonid) == 1 then
      instruct_32(id, -1)
      WaitKey()
    else
      return 0
    end
  end
  return 1
end
function UseThingEffect(id, personid)
  local str = {}
  str[0] = string.format("使用 %s", JY.Thing[id]["名称"])
  local strnum = 1
  local addvalue
  local ndnd = JY.NDPER / 100
  if ndnd < 1 then
    ndnd = 1
  end
  if 0 < JY.Thing[id]["加生命"] then
    local add = JY.Thing[id]["加生命"] * ndnd - math.modf(JY.Person[personid]["受伤程度"] / 2) + Rnd(10)
    if add <= 0 then
      add = 5 + Rnd(5)
    end
    local sscd = math.modf(JY.Thing[id]["加生命"] * ndnd / 4)
    local smadd = 0
    if sscd > JY.Person[personid]["受伤程度"] then
      sscd = JY.Person[personid]["受伤程度"]
    end
    if JY.Person[personid]["生命"] + add > JY.Person[personid]["生命最大值"] then
      smadd = JY.Person[personid]["生命最大值"] - JY.Person[personid]["生命"]
    else
      smadd = add
    end
    addvalue, str[strnum] = AddPersonAttrib(personid, "生命", smadd)
    if addvalue ~= 0 then
      strnum = strnum + 1
    end
    addvalue, str[strnum] = AddPersonAttrib(personid, "受伤程度", -sscd)
    if addvalue ~= 0 then
      strnum = strnum + 1
    end
  end
  local ThingAddAttrib = function(s)
    if JY.Thing[id]["加" .. s] ~= 0 then
      addvalue, str[strnum] = AddPersonAttrib(personid, s, JY.Thing[id]["加" .. s])
      if addvalue ~= 0 then
        strnum = strnum + 1
      end
    end
  end
  ThingAddAttrib("生命最大值")
  if 0 > JY.Thing[id]["加中毒解毒"] then
    addvalue, str[strnum] = AddPersonAttrib(personid, "中毒程度", math.modf(JY.Thing[id]["加中毒解毒"] / 2))
    if addvalue ~= 0 then
      strnum = strnum + 1
    end
  end
  ThingAddAttrib("体力")
  if JY.Thing[id]["改变内力性质"] == 2 then
    str[strnum] = "内力门路改为阴阳合一"
    strnum = strnum + 1
  end
  ThingAddAttrib("内力")
  ThingAddAttrib("内力最大值")
  ThingAddAttrib("攻击力")
  ThingAddAttrib("防御力")
  ThingAddAttrib("轻功")
  ThingAddAttrib("医疗能力")
  ThingAddAttrib("用毒能力")
  ThingAddAttrib("解毒能力")
  ThingAddAttrib("抗毒能力")
  ThingAddAttrib("拳掌功夫")
  ThingAddAttrib("御剑能力")
  ThingAddAttrib("耍刀技巧")
  ThingAddAttrib("特殊兵器")
  ThingAddAttrib("暗器技巧")
  ThingAddAttrib("武学常识")
  ThingAddAttrib("攻击带毒")
  if JY.Person[personid]["抗毒能力"] > CC.PersonAttribMax["抗毒能力"] then
    JY.Person[personid]["抗毒能力"] = CC.PersonAttribMax["抗毒能力"]
  end
  if 1 < strnum then
    local maxlength = 0
    for i = 0, strnum - 1 do
      if maxlength < #str[i] then
        maxlength = #str[i]
      end
    end
    Cls()
    local ww = maxlength * CC.DefaultFont / 2 + CC.MenuBorderPixel * 2
    local hh = strnum * CC.DefaultFont + (strnum - 1) * CC.RowPixel + 2 * CC.MenuBorderPixel
    local x = (CC.ScreenW - ww) / 2
    local y = (CC.ScreenH - hh) / 2
    DrawBox(x, y, x + ww, y + hh, C_WHITE)
    DrawString(x + CC.MenuBorderPixel, y + CC.MenuBorderPixel, str[0], C_WHITE, CC.DefaultFont)
    for i = 1, strnum - 1 do
      DrawString(x + CC.MenuBorderPixel, y + CC.MenuBorderPixel + (CC.DefaultFont + CC.RowPixel) * i, str[i], C_ORANGE, CC.DefaultFont)
    end
    ShowScreen()
    return 1
  else
    return 0
  end
end
function UseThing_Type4(id)
  if JY.Status == GAME_WMAP then
    return War_UseAnqi(id)
  end
  return 0
end
function EventExecute(id, flag)
  JY.CurrentD = id
  if JY.SceneNewEventFunction[JY.SubScene] == nil then
    oldEventExecute(flag)
  else
    JY.SceneNewEventFunction[JY.SubScene](flag)
  end
  JY.CurrentD = -1
  JY.Darkness = 0
end
function oldEventExecute(flag)
  local eventnum
  if flag == 1 then
    eventnum = GetD(JY.SubScene, JY.CurrentD, 2)
  elseif flag == 2 then
    eventnum = GetD(JY.SubScene, JY.CurrentD, 3)
  elseif flag == 3 then
    eventnum = GetD(JY.SubScene, JY.CurrentD, 4)
  end
  if 0 < eventnum then
    oldCallEvent(eventnum)
	   local etmp
    if flag == 1 then
      etmp = GetD(JY.SubScene, JY.CurrentD, 2)
    elseif flag == 2 then
      etmp = GetD(JY.SubScene, JY.CurrentD, 3)
    elseif flag == 3 then
      etmp = GetD(JY.SubScene, JY.CurrentD, 4)
    end
    if etmp ~= eventnum then
      for i = 0, 13 do
        for j = 1, 99 do
          if 0 >= CC.GLTS[i][j] then
            break
          end
          if CC.GLTS[i][j] == eventnum then
            JY.GLTS[i][j] = 1
          end
        end
      end
    end
  end
end
function oldCallEvent(eventnum)
  local eventname = string.format("oldevent_%d", eventnum)
  _G[eventname]()
  for i = 0, 13 do
    for j = 0, 99 do
      if 0 >= CC.GLTS[i][j] then
        break
      end
      if CC.GLTS[i][j] == eventnum then
        JY.GLTS[i][j] = 1
      end
    end
  end
end
function ChangeMMap(x, y, direct)
  JY.Base["人X"] = x
  JY.Base["人Y"] = y
  JY.Base["人方向"] = direct
end
function ChangeSMap(sceneid, x, y, direct)
  JY.SubScene = sceneid
  JY.Base["人X1"] = x
  JY.Base["人Y1"] = y
  JY.Base["人方向"] = direct
end
function Cls(x1, y1, x2, y2)
  if x1 == nil then
    x1 = 0
    y1 = 0
    x2 = CC.ScreenW
    y2 = CC.ScreenH
  end
  lib.SetClip(x1, y1, x2, y2)
  if JY.Status == GAME_START then
    lib.FillColor(0, 0, 0, 0, 0)
    local zoom = CC.ScreenW / 1280 * 100
    lib.LoadPicture(CC.FirstFile, 0, 0, zoom)
  elseif JY.Status == GAME_MMAP then
    local t1 = lib.GetTime()
    lib.DrawMMap(JY.Base["人X"], JY.Base["人Y"], GetMyPic())
    local t2 = lib.GetTime()
    lib.Debug(string.format("draw mainmap cost %d",t2 - t1))
  elseif JY.Status == GAME_SMAP then
    local t1 = lib.GetTime()
    DrawSMap()
    local t2 = lib.GetTime()
    lib.Debug(string.format("draw scene map cost %d",t2 - t1))
  elseif JY.Status == GAME_WMAP then
    WarDrawMap(0)
  elseif JY.Status == GAME_DEAD then
    lib.FillColor(0, 0, 0, 0, 0)
    lib.LoadPicture(CC.DeadFile, -1, -1)
  end
  lib.SetClip(0, 0, CC.ScreenW, CC.ScreenH)
end
function GenTalkString(str, n)
  local tmpstr = ""
  for s in string.gmatch(str .. "*", "(.-)%*") do
    tmpstr = tmpstr .. s
  end
  local newstr = ""
  while 0 < #tmpstr do
    local w = 0
    while w < #tmpstr do
      local v = string.byte(tmpstr, w + 1)
      if 128 <= v then
        w = w + 2
      else
        w = w + 1
      end
      if w >= 2 * n - 1 then
        break
      end
    end
    if w < #tmpstr then
      if w == 2 * n - 1 and string.byte(tmpstr, w + 1) < 128 then
        newstr = newstr .. string.sub(tmpstr, 1, w + 1) .. "*"
        tmpstr = string.sub(tmpstr, w + 2, -1)
      else
        newstr = newstr .. string.sub(tmpstr, 1, w) .. "*"
        tmpstr = string.sub(tmpstr, w + 1, -1)
      end
    else
      newstr = newstr .. tmpstr
      break
    end
  end
  return newstr
end
function Talk(s, personid)
  local flag
  if personid == 0 then
    flag = 1
  else
    flag = 0
  end
  TalkEx(s, JY.Person[personid]["头像代号"], flag)
end
function TalkEx(s, headid, flag)
  local picw = 73 * CC.Zoom
  local pich = 73 * CC.Zoom
  local talkxnum = 18
  local talkynum = 3
  local dx = 0
  local dy = 0
  local boxpicw = picw + CC.PersonStateRowPixel
  local boxpich = pich + CC.PersonStateRowPixel
  local boxtalkw = 24 * CC.DefaultFont + CC.PersonStateRowPixel * 2
  local boxtalkh = boxpich
  local talkBorder = (pich - talkynum * CC.DefaultFont) / (talkynum + 1)
  local xy = {
    {
      headx = CC.ScreenW - 1 - dx - boxpicw,
      heady = CC.ScreenH - dy - boxpich,
      talkx = CC.ScreenW - 1 - dx - boxpicw - boxtalkw - 2,
      talky = CC.ScreenH - dy - boxpich,
      showhead = 1
    },
    {
      headx = dx,
      heady = dy,
      talkx = dx + boxpicw + 2,
      talky = dy,
      showhead = 0
    },
    {
      headx = CC.ScreenW - 1 - dx - boxpicw,
      heady = CC.ScreenH - dy - boxpich,
      talkx = CC.ScreenW - 1 - dx - boxpicw - boxtalkw - 2,
      talky = CC.ScreenH - dy - boxpich,
      showhead = 1
    },
    {
      headx = CC.ScreenW - 1 - dx - boxpicw,
      heady = dy,
      talkx = CC.ScreenW - 1 - dx - boxpicw - boxtalkw - 2,
      talky = dy,
      showhead = 1
    },
    {
      headx = dx,
      heady = CC.ScreenH - dy - boxpich,
      talkx = dx + boxpicw + 2,
      talky = CC.ScreenH - dy - boxpich,
      showhead = 1
    },
    [0] = {
      headx = dx,
      heady = dy,
      talkx = dx + boxpicw + 2,
      talky = dy,
      showhead = 1
    }
  }
  if flag < 0 or 5 < flag then
    flag = 0
  end
  if xy[flag].showhead == 0 then
    headid = -1
  end
  s = string.gsub(s, "\r", "")
  s = GenTalkString(s, 24)
  if CONFIG.KeyRepeat == 0 then
    lib.EnableKeyRepeat(0, CONFIG.KeyRepeatInterval)
  end
  local startp = 1
  local endp
  local dy = 0
  local name, namex
  while true do
    if dy == 0 then
      Cls()
      if 0 <= headid then
        DrawBox(xy[flag].headx, xy[flag].heady, xy[flag].headx + boxpicw, xy[flag].heady + boxpich, C_WHITE)
        local personid
        for personid = 0, 999 do
          if JY.Person[personid] ~= nil then
            if JY.Person[personid]["头像代号"] == headid then
              name = JY.Person[personid]["姓名"]
              break
            end
          else
            break
          end
        end
        if (headid == 0 or headid == CC.JSHead) and (JY.Person[0]["姓名"] == "szlzw" or JY.Person[0]["姓名"] == CC.TSJSName) then
          if existFile(CC.HeadPath .. CC.JSHead .. ".png") then
            JY.Person[0]["头像代号"] = CC.JSHead
            headid = CC.JSHead
            name = JY.Person[0]["姓名"]
          else
            JY.Person[0]["头像代号"] = 0
            headid = 0
          end
        end
        if name ~= nil then
          namex = (picw - string.len(name) * CC.DefaultFont / 2) / 2
        end
        if existFile(CC.HeadPath .. headid .. ".png") then
          local w, h = lib.GetPNGXY(1, headid * 2)
          local hdmax = 0
          if w > hdmax then
            hdmax = w
          end
          if h > hdmax then
            hdmax = h
          end
          local zoom = math.modf(70 * CC.Zoom / hdmax * 100 * (CONFIG.Zoom / 100))
          local x = (picw - w * zoom / 100 / (CONFIG.Zoom / 100)) / 2
          local y = (pich - h * zoom / 100 / (CONFIG.Zoom / 100)) / 2
          if picw < w or pich < h then
            x = (picw - 70 * CC.Zoom) / 2
            y = (pich - 70 * CC.Zoom) / 2
          end
          lib.LoadPicture(CC.HeadPath .. headid .. ".png", xy[flag].headx + x + CC.PersonStateRowPixel / 2, xy[flag].heady + y + CC.PersonStateRowPixel / 2, zoom)
          JY.Person[0]["头像代号"] = 0
        else
          local w, h = lib.PicGetXY(1, headid * 2)
          local x = (picw - w) / 2
          local y = (pich - h) / 2
          lib.PicLoadCache(1, headid * 2, xy[flag].headx + x + CC.PersonStateRowPixel / 2, xy[flag].heady + y + CC.PersonStateRowPixel / 2, 1)
        end
      end
      DrawBox(xy[flag].talkx, xy[flag].talky, xy[flag].talkx + boxtalkw, xy[flag].talky + boxtalkh, C_WHITE)
    end
    endp = string.find(s, "*", startp)
    if endp == nil then
      DrawString(xy[flag].talkx + 5, xy[flag].talky + 5 + talkBorder + dy * (CC.DefaultFont + talkBorder), string.sub(s, startp), C_WHITE, CC.DefaultFont)
      if name ~= nil and CC.NAMEKG ~= 0 then
        if flag ~= 0 then
          DrawString(xy[flag].headx + namex, xy[flag].heady - CC.DefaultFont - CC.MenuBorderPixel, name, C_ORANGE, CC.DefaultFont)
        else
          DrawString(xy[flag].headx + namex, pich + CC.DefaultFont / 2, name, C_ORANGE, CC.DefaultFont)
        end
      end
      ShowScreen()
      while true do
        local presskey = WaitKey()
        break
      end
      Cls()
      break
    else
      DrawString(xy[flag].talkx + 5, xy[flag].talky + 5 + talkBorder + dy * (CC.DefaultFont + talkBorder), string.sub(s, startp, endp - 1), C_WHITE, CC.DefaultFont)
      if name ~= nil and CC.NAMEKG ~= 0 then
        if flag ~= 0 then
          DrawString(xy[flag].headx + namex, xy[flag].heady - CC.DefaultFont - CC.MenuBorderPixel, name, C_ORANGE, CC.DefaultFont)
        else
          DrawString(xy[flag].headx + namex, pich + CC.DefaultFont / 2, name, C_ORANGE, CC.DefaultFont)
        end
      end
    end
    dy = dy + 1
    startp = endp + 1
    if talkynum <= dy then
      ShowScreen()
      while true do
        local presskey = WaitKey()
        break
      end
      Cls()
      dy = 0
    end
  end
  if CONFIG.KeyRepeat == 0 then
    lib.EnableKeyRepeat(CONFIG.KeyRepeatDelay, CONFIG.KeyRepeatInterval)
  end
  Cls()
end
function instruct_test(s)
  DrawStrBoxWaitKey(s, C_ORANGE, 24)
end
function instruct_0()
  Cls()
end
function instruct_1(talkid, headid, flag)
  local s = ReadTalk(talkid)
  if s == nil then
    return
  end
  TalkEx(s, headid, flag)
end
function GenTalkIdx()
  os.remove(CC.TalkIdxFile)
  local p = io.open(CC.TalkIdxFile, "w")
  p:close()
  p = io.open(CC.TalkGrpFile, "r")
  local num = 0
  for line in p:lines() do
    num = num + 1
  end
  p:seek("set", 0)
  local data = Byte.create(num * 4)
  for i = 0, num - 1 do
    local talk = p:read("*line")
    local offset = p:seek()
    Byte.set32(data, i * 4, offset)
  end
  p:close()
  Byte.savefile(data, CC.TalkIdxFile, 0, num * 4)
end
function ReadTalk(talkid)
  local idxfile = CC.TalkIdxFile
  local grpfile = CC.TalkGrpFile
  local length = filelength(idxfile)
  if talkid < 0 and talkid >= length / 4 then
    return
  end
  local data = Byte.create(8)
  local id1, id2
  if talkid == 0 then
    Byte.loadfile(data, idxfile, 0, 4)
    id1 = 0
    id2 = Byte.get32(data, 0)
  else
    Byte.loadfile(data, idxfile, (talkid - 1) * 4, 8)
    id1 = Byte.get32(data, 0)
    id2 = Byte.get32(data, 4)
  end
  local p = io.open(grpfile, "r")
  p:seek("set", id1)
  local talk = p:read("*line")
  p:close()
  return talk
end
function instruct_2(thingid, num)
  if BL32PD == 1 then
    if X50BL32[1] == 1 then
      thingid = X50BL32[2]
    elseif X50BL32[1] == 2 then
      num = X50BL32[2]
    end
    BL32PD = 0
  end
  if JY.Thing[thingid] == nil then
    return
  end
  for i = 1, CC.MyThingNum do
    if JY.Base["物品" .. i] == thingid and (JY.Thing[JY.Base["物品" .. i]]["类型"] == 1 or JY.Thing[JY.Base["物品" .. i]]["类型"] == 2) and 0 < num then
      DrawStrBoxWaitKey(string.format("得到物品:%s x %d", JY.Thing[thingid]["名称"], num), C_ORANGE, CC.DefaultFont)
      return
    end
  end
  instruct_32(thingid, num)
  if CC.LoadThingPic == 0 and CC.FK ~= 1 then
    lib.PicLoadCache(0, (thingid + CC.StartThingPic) * 2, CC.ScreenW / 2 - CC.DefaultFont, CC.ScreenH / 2 + CC.DefaultFont, 2, 200)
  elseif CC.LoadThingPic == 1 then
    lib.PicLoadCache(2, thingid * 2, CC.ScreenW / 2 + CC.DefaultFont, CC.ScreenH / 2 + CC.DefaultFont * 3, 2, 200)
  elseif CC.LoadThingPic == 0 and CC.FK == 1 then
    lib.PicLoadCache(2, (thingid + CC.StartThingPic) * 2, CC.ScreenW / 2 - CC.DefaultFont, CC.ScreenH / 2 + CC.DefaultFont, 2, 200)
  end
  if 0 <= num then
    DrawStrBoxWaitKey(string.format("得到物品:%s x %d", JY.Thing[thingid]["名称"], num), C_ORANGE, CC.DefaultFont)
  else
    DrawStrBoxWaitKey(string.format("失去物品:%s x %d", JY.Thing[thingid]["名称"], math.abs(num)), C_ORANGE, CC.DefaultFont)
  end
  instruct_2_sub()
  local booknum = 0
  for i = 1, CC.BookNum do
    if instruct_18(CC.BookStart + i - 1) == true then
      booknum = booknum + 1
    end
  end
  JY.Book = booknum
  if booknum == CC.BookNum then
    CC.ExpLevel = 3
    CC.RUNSTR[CC.NUMBER + 1] = "天书已收集完成，当前经验值已大幅度增加，练功狂不容错过！"
    for i = 1, 100 do
      CC.Exp1[i] = CC.Exp[i]
    end
  else
    CC.RUNSTR[CC.NUMBER + 1] = string.format("天书已收集%d本，收集完14本天书经验值将大幅度增加，练功狂不容错过！", booknum)
    CC.ExpLevel = 1
    for i = 1, 100 do
      CC.Exp1[i] = CC.Exp[i]
    end
  end
end
function instruct_2_sub()
  if JY.Person[0]["声望"] < 200 then
    return
  end
  if instruct_18(189) == true then
    return
  end
  local booknum = 0
  for i = 1, CC.BookNum do
    if instruct_18(CC.BookStart + i - 1) == true then
      booknum = booknum + 1
    end
  end
  if booknum == CC.BookNum then
    instruct_3(70, 11, -1, 1, 932, -1, -1, 7968, 7968, 7968, -2, -2, -2)
  end
end
function instruct_3(sceneid, id, v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10)
  if BL32PD == 1 then
    if X50BL32[1] == 1 then
      sceneid = X50BL32[2]
    elseif X50BL32[1] == 2 then
      id = X50BL32[2]
    elseif X50BL32[1] == 3 then
      v0 = X50BL32[2]
    elseif X50BL32[1] == 4 then
      v1 = X50BL32[2]
    elseif X50BL32[1] == 5 then
      v2 = X50BL32[2]
    elseif X50BL32[1] == 6 then
      v3 = X50BL32[2]
    elseif X50BL32[1] == 7 then
      v4 = X50BL32[2]
    elseif X50BL32[1] == 8 then
      v5 = X50BL32[2]
    elseif X50BL32[1] == 9 then
      v6 = X50BL32[2]
    elseif X50BL32[1] == 10 then
      v7 = X50BL32[2]
    elseif X50BL32[1] == 11 then
      v8 = X50BL32[2]
    elseif X50BL32[1] == 12 then
      v9 = X50BL32[2]
    elseif X50BL32[1] == 13 then
      v10 = X50BL32[2]
    end
    BL32PD = 0
  end
  if sceneid == -2 then
    sceneid = JY.SubScene
  end
  if id == -2 then
    id = JY.CurrentD
  end
  if v0 ~= -2 then
    SetD(sceneid, id, 0, v0)
  end
  if v1 ~= -2 then
    SetD(sceneid, id, 1, v1)
  end
  if v2 ~= -2 then
    SetD(sceneid, id, 2, v2)
  end
  if v3 ~= -2 then
    SetD(sceneid, id, 3, v3)
  end
  if v4 ~= -2 then
    SetD(sceneid, id, 4, v4)
  end
  if v5 ~= -2 then
    SetD(sceneid, id, 5, v5)
  end
  if v6 ~= -2 then
    SetD(sceneid, id, 6, v6)
  end
  if v7 ~= -2 then
    SetD(sceneid, id, 7, v7)
  end
  if v8 ~= -2 then
    SetD(sceneid, id, 8, v8)
  end
  if v9 ~= -2 and v10 ~= -2 and 0 < v9 and 0 < v10 then
    SetS(sceneid, GetD(sceneid, id, 9), GetD(sceneid, id, 10), 3, -1)
    SetD(sceneid, id, 9, v9)
    SetD(sceneid, id, 10, v10)
    SetS(sceneid, GetD(sceneid, id, 9), GetD(sceneid, id, 10), 3, id)
  end
end
function instruct_4(thingid)
  if JY.CurrentThing == thingid then
    return true
  else
    return false
  end
end
function instruct_5()
  return DrawStrBoxYesNo(-1, -1, "是否与之过招(Y/N)?", C_ORANGE, CC.DefaultFont)
end
function instruct_6(warid, tmp, tmp, flag)
  return WarMain(warid, flag)
end
function instruct_7()
  instruct_test("指令7测试")
end
function instruct_8(musicid)
  JY.MmapMusic = musicid
end
function instruct_9()
  Cls()
  return DrawStrBoxYesNo(-1, -1, "是否要求加入(Y/N)?", C_ORANGE, CC.DefaultFont)
end
function instruct_10(personid)
  if JY.Person[personid] == nil then
    lib.Debug("instruct_10 error: person id not exist")
    return
  end
  local add = 0
  for i = 2, CC.TeamNum do
    if 0 > JY.Base["队伍" .. i] then
      JY.Base["队伍" .. i] = personid
      add = 1
      break
    end
  end
  if add == 0 then
    lib.Debug("instruct_10 error: 加入队伍已满")
    return
  end
  for i = 1, 4 do
    local id = JY.Person[personid]["携带物品" .. i]
    local n = JY.Person[personid]["携带物品数量" .. i]
    if 0 <= id and 0 < n then
      instruct_2(id, n)
      JY.Person[personid]["携带物品" .. i] = -1
      JY.Person[personid]["携带物品数量" .. i] = 0
    end
  end
  Cls()
  DrawStrBoxWaitKey(string.format("%s 加入队伍", JY.Person[personid]["姓名"]), C_ORANGE, CC.DefaultFont)
end
function instruct_11()
  Cls()
  if CC.BanBen == 0 then
    return DrawStrBoxYesNo(-1, -1, "是否(Y/N)?", C_ORANGE, CC.DefaultFont)
  else
    return DrawStrBoxYesNo(-1, -1, "是否(Y/N)?", C_ORANGE, CC.DefaultFont)
  end
end
function instruct_12()
  for i = 1, CC.TeamNum do
    local id = JY.Base["队伍" .. i]
    if 0 <= id and JY.Person[id]["受伤程度"] < 33 and 0 >= JY.Person[id]["中毒程度"] then
      JY.Person[id]["受伤程度"] = 0
      AddPersonAttrib(id, "体力", math.huge)
      AddPersonAttrib(id, "生命", math.huge)
      AddPersonAttrib(id, "内力", math.huge)
    end
  end
end
function instruct_13()
  JY.Darkness = 0
  lib.ShowSlow(50, 0)
  Cls()
end
function instruct_14()
  JY.Darkness = 0
  lib.ShowSlow(50, 1)
  Cls()
end
function instruct_15()
  JY.Status = GAME_DEAD
  Cls()
  DrawString(CC.GameOverX, CC.GameOverY, JY.Person[0]["姓名"], RGB(0, 0, 0), CC.DefaultFont)
  local x = CC.ScreenW - 9 * CC.DefaultFont
  DrawString(x, 10, os.date("%Y-%m-%d %H:%M"), RGB(216, 20, 24), CC.DefaultFont)
  DrawString(x, 10 + CC.DefaultFont + CC.RowPixel, "在地球的某处", RGB(216, 20, 24), CC.DefaultFont)
  DrawString(x, 10 + (CC.DefaultFont + CC.RowPixel) * 2, "当地人口的失踪数", RGB(216, 20, 24), CC.DefaultFont)
  DrawString(x, 10 + (CC.DefaultFont + CC.RowPixel) * 3, "又多了一笔。。。", RGB(216, 20, 24), CC.DefaultFont)
  ShowScreen()
  while true do
    DrawStrBox(CC.ScreenW / 2 - CC.DefaultFont * 3, CC.DefaultFont * 2, "读取进度列表", C_ORANGE, CC.DefaultFont)
    local r = SaveList(15)
    if 0 < r and r <= 11 and existFile(CC.S_Filename[r]) and existFile(CC.D_Filename[r]) then
      DrawString(CC.ScreenW / 2 - CC.StartMenuFontSize * 2, CC.StartMenuY, "请稍候...", C_RED, CC.StartMenuFontSize * 1.3)
      ShowScreen()
      LoadRecord(r)
      if 0 < JY.Base["无用"] then
        if JY.Status == GAME_MMAP then
          lib.UnloadMMap()
          lib.PicInit()
        end
        lib.ShowSlow(50, 1)
        JY.Status = GAME_SMAP
        JY.SubScene = JY.Base["无用"]
        JY.MmapMusic = -1
        JY.MyPic = GetMyPic()
        Init_SMap(1)
        Game_Cycle()
        break
      end
      if JY.Base["无用"] == 0 then
        if JY.Base["人X"] == JY.Scene[0]["外景入口X1"] - 1 and JY.Base["人Y"] == JY.Scene[0]["外景入口Y1"] or JY.Base["人X"] == JY.Scene[0]["外景入口X2"] and JY.Base["人Y"] == JY.Scene[0]["外景入口Y2"] + 1 then
          if JY.Status == GAME_MMAP then
            lib.UnloadMMap()
            lib.PicInit()
          end
          lib.ShowSlow(50, 1)
          JY.Status = GAME_SMAP
          JY.SubScene = JY.Base["无用"]
          JY.MmapMusic = -1
          JY.MyPic = GetMyPic()
          Init_SMap(1)
          Game_Cycle()
          break
        end
        JY.SubScene = -1
        JY.Status = GAME_FIRSTMMAP
        Game_Cycle()
        break
      end
      JY.SubScene = -1
      JY.Status = GAME_FIRSTMMAP
      Game_Cycle()
      break
    elseif 11 < r then
      os.exit()
    end
  end
end
function instruct_16(personid)
  local r = false
  for i = 1, CC.TeamNum do
    if personid == JY.Base["队伍" .. i] then
      r = true
      break
    end
  end
  return r
end
function instruct_17(sceneid, level, x, y, v)
  if sceneid == -2 then
    sceneid = JY.SubScene
  end
  SetS(sceneid, x, y, level, v)
end
function instruct_18(thingid)
  for i = 1, CC.MyThingNum do
    if JY.Base["物品" .. i] == thingid then
      return true
    end
  end
  return false
end
function instruct_19(x, y)
  JY.Base["人X1"] = x
  JY.Base["人Y1"] = y
  JY.SubSceneX = 0
  JY.SubSceneY = 0
end
function instruct_20()
  if JY.Base["队伍" .. CC.TeamNum] >= 0 then
    return true
  end
  return false
end
function instruct_21(personid)
  if BL32PD == 1 then
    if X50BL32[1] == 1 then
      personid = X50BL32[2]
    end
    BL32PD = 0
  end
  if JY.Person[personid] == nil then
    lib.Debug("instruct_21 error: personid not exist")
    return
  end
  local j = 0
  for i = 1, CC.TeamNum do
    if personid == JY.Base["队伍" .. i] then
      j = i
      break
    end
  end
  if j == 0 then
    return
  end
  for i = j + 1, CC.TeamNum do
    JY.Base["队伍" .. i - 1] = JY.Base["队伍" .. i]
  end
  JY.Base["队伍" .. CC.TeamNum] = -1
  DrawStrBoxWaitKey(string.format("%s 离开队伍", JY.Person[personid]["姓名"]), C_ORANGE, CC.DefaultFont)
end
function instruct_22()
  for i = 1, CC.TeamNum do
    if JY.Base["队伍" .. i] >= 0 then
      JY.Person[JY.Base["队伍" .. i]]["内力"] = 0
    end
  end
end
function instruct_23(personid, value)
  JY.Person[personid]["用毒能力"] = value
  AddPersonAttrib(personid, "用毒能力", 0)
end
function instruct_24()
  instruct_test("指令24测试")
end
function instruct_25(x1, y1, x2, y2)
  local sign
  if y1 ~= y2 then
    if y2 < y1 then
      sign = -1
    else
      sign = 1
    end
    for i = y1 + sign, y2, sign do
      local t1 = lib.GetTime()
      JY.SubSceneY = JY.SubSceneY + sign
      DrawSMap()
      ShowScreen()
      local t2 = lib.GetTime()
      if t2 - t1 < CC.SceneMoveFrame then
        lib.Delay(CC.SceneMoveFrame - (t2 - t1))
      end
    end
  end
  if x1 ~= x2 then
    if x2 < x1 then
      sign = -1
    else
      sign = 1
    end
    for i = x1 + sign, x2, sign do
      local t1 = lib.GetTime()
      JY.SubSceneX = JY.SubSceneX + sign
      DrawSMap()
      ShowScreen()
      local t2 = lib.GetTime()
      if t2 - t1 < CC.SceneMoveFrame then
        lib.Delay(CC.SceneMoveFrame - (t2 - t1))
      end
    end
  end
end
function instruct_26(sceneid, id, v1, v2, v3)
  if sceneid == -2 then
    sceneid = JY.SubScene
  end
  local v = GetD(sceneid, id, 2)
  SetD(sceneid, id, 2, v + v1)
  v = GetD(sceneid, id, 3)
  SetD(sceneid, id, 3, v + v2)
  v = GetD(sceneid, id, 4)
  SetD(sceneid, id, 4, v + v3)
end
function instruct_27(id, startpic, endpic)
  local old1, old2, old3
  if id ~= -1 then
    old1 = GetD(JY.SubScene, id, 5)
    old2 = GetD(JY.SubScene, id, 6)
    old3 = GetD(JY.SubScene, id, 7)
  end
  Cls()
  ShowScreen()
  for i = startpic, endpic, 2 do
    local t1 = lib.GetTime()
    if id == -1 then
      JY.MyPic = i / 2
    else
      SetD(JY.SubScene, id, 5, i)
      SetD(JY.SubScene, id, 6, i)
      SetD(JY.SubScene, id, 7, i)
    end
    DtoSMap()
    DrawSMap()
    ShowScreen()
    local t2 = lib.GetTime()
    if t2 - t1 < CC.AnimationFrame then
      lib.Delay(CC.AnimationFrame - (t2 - t1))
    end
  end
  if id ~= -1 then
    SetD(JY.SubScene, id, 5, old1)
    SetD(JY.SubScene, id, 6, old2)
    SetD(JY.SubScene, id, 7, old3)
  end
end
function instruct_28(personid, vmin, vmax)
  local v = JY.Person[personid]["品德"]
  if vmin <= v and vmax >= v then
    return true
  else
    return false
  end
end
function instruct_29(personid, vmin, vmax)
  if 999 <= vmax then
    vmax = CC.PersonAttribMax["攻击力"]
  end
  local v = JY.Person[personid]["攻击力"]
  if vmin <= v and vmax >= v then
    return true
  else
    return false
  end
end
function instruct_30(x1, y1, x2, y2)
  if x1 < x2 then
    for i = x1 + 1, x2 do
      local t1 = lib.GetTime()
      instruct_30_sub(1)
      local t2 = lib.GetTime()
      if t2 - t1 < CC.PersonMoveFrame then
        lib.Delay(CC.PersonMoveFrame - (t2 - t1))
      end
    end
  elseif x2 < x1 then
    for i = x2 + 1, x1 do
      local t1 = lib.GetTime()
      instruct_30_sub(2)
      local t2 = lib.GetTime()
      if t2 - t1 < CC.PersonMoveFrame then
        lib.Delay(CC.PersonMoveFrame - (t2 - t1))
      end
    end
  end
  if y1 < y2 then
    for i = y1 + 1, y2 do
      local t1 = lib.GetTime()
      instruct_30_sub(3)
      local t2 = lib.GetTime()
      if t2 - t1 < CC.PersonMoveFrame then
        lib.Delay(CC.PersonMoveFrame - (t2 - t1))
      end
    end
  elseif y2 < y1 then
    for i = y2 + 1, y1 do
      local t1 = lib.GetTime()
      instruct_30_sub(0)
      local t2 = lib.GetTime()
      if t2 - t1 < CC.PersonMoveFrame then
        lib.Delay(CC.PersonMoveFrame - (t2 - t1))
      end
    end
  end
end
function instruct_30_sub(direct)
  local x, y
  AddMyCurrentPic()
  x = JY.Base["人X1"] + CC.DirectX[direct + 1]
  y = JY.Base["人Y1"] + CC.DirectY[direct + 1]
  JY.Base["人方向"] = direct
  JY.MyPic = GetMyPic()
  DtoSMap()
  if SceneCanPass(x, y) == true then
    JY.Base["人X1"] = x
    JY.Base["人Y1"] = y
  end
  JY.Base["人X1"] = limitX(JY.Base["人X1"], 1, CC.SWidth - 2)
  JY.Base["人Y1"] = limitX(JY.Base["人Y1"], 1, CC.SHeight - 2)
  DrawSMap()
  Cls()
  ShowScreen()
end
function instruct_31(num)
  if BL32PD == 1 then
    if X50BL32[1] == 1 then
      num = X50BL32[2]
    end
    BL32PD = 0
  end
  local r = false
  for i = 1, CC.MyThingNum do
    if JY.Base["物品" .. i] == CC.MoneyID then
      if num <= JY.Base["物品数量" .. i] then
        r = true
      end
      break
    end
  end
  return r
end
function instruct_32(thingid, num)
  if BL32PD == 1 then
    if X50BL32[1] == 1 then
      thingid = X50BL32[2]
    elseif X50BL32[1] == 2 then
      num = X50BL32[2]
    end
    BL32PD = 0
  end
  local p = 1
  for i = 1, CC.MyThingNum do
    if JY.Base["物品" .. i] == thingid then
      JY.Base["物品数量" .. i] = JY.Base["物品数量" .. i] + num
      p = i
      break
    elseif JY.Base["物品" .. i] == -1 then
      JY.Base["物品" .. i] = thingid
      JY.Base["物品数量" .. i] = num
      p = 1
      break
    end
  end
  if 0 >= JY.Base["物品数量" .. p] then
    for i = p + 1, CC.MyThingNum do
      JY.Base["物品" .. i - 1] = JY.Base["物品" .. i]
      JY.Base["物品数量" .. i - 1] = JY.Base["物品数量" .. i]
    end
    JY.Base["物品" .. CC.MyThingNum] = -1
    JY.Base["物品数量" .. CC.MyThingNum] = 0
  end
end
function instruct_33(personid, wugongid, flag)
  local add = 0
  for i = 1, 10 do
    if JY.Person[personid]["武功" .. i] == 0 then
      JY.Person[personid]["武功" .. i] = wugongid
      JY.Person[personid]["武功等级" .. i] = 0
      add = 1
      break
    end
  end
  if add == 0 then
    JY.Person[personid]["武功10"] = wugongid
    JY.Person[personid]["武功等级10"] = 0
  end
  if flag == 0 then
    DrawStrBoxWaitKey(string.format("%s 学会武功 %s", JY.Person[personid]["姓名"], JY.Wugong[wugongid]["名称"]), C_ORANGE, CC.DefaultFont)
  end
end
function instruct_34(id, value)
  local add, str = AddPersonAttrib(id, "资质", value)
  DrawStrBoxWaitKey(JY.Person[id]["姓名"] .. str, C_ORANGE, CC.DefaultFont)
end
function instruct_35(personid, id, wugongid, wugonglevel)
  if 0 <= id then
    JY.Person[personid]["武功" .. id + 1] = wugongid
    JY.Person[personid]["武功等级" .. id + 1] = wugonglevel
    local wglev = math.modf(wugonglevel / 100) + 1
    DrawStrBoxWaitKey(string.format("%s第%d项武功变更为%s%d级", JY.Person[personid]["姓名"], id + 1, JY.Wugong[wugongid]["名称"], wglev), C_ORANGE, CC.DefaultFont)
  else
    local flag = 0
    for i = 1, 10 do
      if JY.Person[personid]["武功" .. i] == 0 then
        flag = 1
        JY.Person[personid]["武功" .. i] = wugongid
        JY.Person[personid]["武功等级" .. i] = wugonglevel
        return
      end
    end
    if flag == 0 then
      JY.Person[personid]["武功" .. 1] = wugongid
      JY.Person[personid]["武功等级" .. 1] = wugonglevel
      DrawStrBoxWaitKey(string.format("%s 学会武功 %s", JY.Person[personid]["姓名"], JY.Wugong[wugongid]["名称"]), C_ORANGE, CC.DefaultFont)
    end
  end
end
function instruct_36(sex, id1, id2)
  if id1 == nil or id2 == nil then
    if JY.Person[0]["性别"] == sex then
      return true
    else
      return false
    end
  elseif 256 <= sex then
    if id1 == 0 and id2 < 0 or id1 == 0 and 0 < id2 then
      if X50JMP == 0 then
        return true
      else
        return false
      end
    elseif id1 < 0 and id2 == 0 or 0 < id1 and id2 == 0 then
      if X50JMP == 0 then
        return true
      else
        return false
      end
    end
  end
end
function instruct_37(v)
  AddPersonAttrib(0, "品德", v)
  if 0 < v then
    DrawStrBox(-1, 10, string.format("品德 +%d", v), C_GOLD, CC.DefaultFont)
    ShowScreen()
    lib.Delay(500)
  else
    DrawStrBox(-1, 10, string.format("品德 %d", v), C_RED, CC.DefaultFont)
    ShowScreen()
    lib.Delay(500)
  end
end
function instruct_38(sceneid, level, oldpic, newpic)
  if sceneid == -2 then
    sceneid = JY.SubScene
  end
  for i = 0, CC.SWidth - 1 do
    for j = 1, CC.SHeight - 1 do
      if GetS(sceneid, i, j, level) == oldpic then
        SetS(sceneid, i, j, level, newpic)
      end
    end
  end
end
function instruct_39(sceneid)
  JY.Scene[sceneid]["进入条件"] = 0
end
function instruct_40(v)
  JY.Base["人方向"] = v
  JY.MyPic = GetMyPic()
end
function instruct_41(personid, thingid, num)
  local k = 0
  for i = 1, 4 do
    if JY.Person[personid]["携带物品" .. i] == thingid then
      JY.Person[personid]["携带物品数量" .. i] = JY.Person[personid]["携带物品数量" .. i] + num
      k = i
      break
    end
  end
  if 0 < k and 0 >= JY.Person[personid]["携带物品数量" .. k] then
    for i = k + 1, 4 do
      JY.Person[personid]["携带物品" .. i - 1] = JY.Person[personid]["携带物品" .. i]
      JY.Person[personid]["携带物品数量" .. i - 1] = JY.Person[personid]["携带物品数量" .. i]
    end
    JY.Person[personid]["携带物品" .. 4] = -1
    JY.Person[personid]["携带物品数量" .. 4] = 0
  end
  if k == 0 then
    for i = 1, 4 do
      if JY.Person[personid]["携带物品" .. i] == -1 then
        JY.Person[personid]["携带物品" .. i] = thingid
        JY.Person[personid]["携带物品数量" .. i] = num
        break
      end
    end
  end
end
function instruct_42()
  local r = false
  for i = 1, CC.TeamNum do
    if JY.Base["队伍" .. i] >= 0 and JY.Person[JY.Base["队伍" .. i]]["性别"] == 1 then
      r = true
    end
  end
  return r
end
function instruct_43(thingid)
  return instruct_18(thingid)
end
function instruct_44(id1, startpic1, endpic1, id2, startpic2, endpic2)
  local old1 = GetD(JY.SubScene, id1, 5)
  local old2 = GetD(JY.SubScene, id1, 6)
  local old3 = GetD(JY.SubScene, id1, 7)
  local old4 = GetD(JY.SubScene, id2, 5)
  local old5 = GetD(JY.SubScene, id2, 6)
  local old6 = GetD(JY.SubScene, id2, 7)
  for i = startpic1, endpic1, 2 do
    local t1 = lib.GetTime()
    if id1 == -1 then
      JY.MyPic = i / 2
    else
      SetD(JY.SubScene, id1, 5, i)
      SetD(JY.SubScene, id1, 6, i)
      SetD(JY.SubScene, id1, 7, i)
    end
    if id2 == -1 then
      JY.MyPic = i / 2
    else
      SetD(JY.SubScene, id2, 5, i - startpic1 + startpic2)
      SetD(JY.SubScene, id2, 6, i - startpic1 + startpic2)
      SetD(JY.SubScene, id2, 7, i - startpic1 + startpic2)
    end
    DtoSMap()
    DrawSMap()
    ShowScreen()
    local t2 = lib.GetTime()
    if t2 - t1 < CC.AnimationFrame then
      lib.Delay(CC.AnimationFrame - (t2 - t1))
    end
  end
  SetD(JY.SubScene, id1, 5, old1)
  SetD(JY.SubScene, id1, 6, old2)
  SetD(JY.SubScene, id1, 7, old3)
  SetD(JY.SubScene, id2, 5, old4)
  SetD(JY.SubScene, id2, 6, old5)
  SetD(JY.SubScene, id2, 7, old6)
end
function instruct_45(id, value)
  local add, str = AddPersonAttrib(id, "轻功", value)
  DrawStrBoxWaitKey(JY.Person[id]["姓名"] .. str, C_ORANGE, CC.DefaultFont)
end
function instruct_46(id, value)
  local add, str = AddPersonAttrib(id, "内力最大值", value)
  AddPersonAttrib(id, "内力", value)
  DrawStrBoxWaitKey(JY.Person[id]["姓名"] .. str, C_ORANGE, CC.DefaultFont)
end
function instruct_47(id, value)
  local add, str = AddPersonAttrib(id, "攻击力", value)
  DrawStrBoxWaitKey(JY.Person[id]["姓名"] .. str, C_ORANGE, CC.DefaultFont)
end
function instruct_48(id, value)
  local add, str = AddPersonAttrib(id, "生命最大值", value)
  AddPersonAttrib(id, "生命", value)
  if instruct_16(id) == true then
    DrawStrBoxWaitKey(JY.Person[id]["姓名"] .. str, C_ORANGE, CC.DefaultFont)
  end
end
function instruct_49(personid, value)
  JY.Person[personid]["内力性质"] = value
end
function instruct_50(id1, id2, id3, id4, id5, id6, id7)
  if CC.BanBen ~= 2 then
    local num = 0
    if instruct_18(id1) == true then
      num = num + 1
    end
    if instruct_18(id2) == true then
      num = num + 1
    end
    if instruct_18(id3) == true then
      num = num + 1
    end
    if instruct_18(id4) == true then
      num = num + 1
    end
    if instruct_18(id5) == true then
      num = num + 1
    end
    if num == 5 then
      return true
    else
      return false
    end
  elseif CC.BanBen == 2 then
    if BL32PD == 1 then
      if X50BL32[1] == 1 then
        id1 = X50BL32[2]
      elseif X50BL32[1] == 2 then
        id2 = X50BL32[2]
      elseif X50BL32[1] == 3 then
        id3 = X50BL32[2]
      elseif X50BL32[1] == 4 then
        id4 = X50BL32[2]
      elseif X50BL32[1] == 5 then
        id5 = X50BL32[2]
      elseif X50BL32[1] == 6 then
        id6 = X50BL32[2]
      elseif X50BL32[1] == 7 then
        id7 = X50BL32[2]
      end
      BL32PD = 0
    end
    if id1 == 0 then
      X50[id2] = id3
    elseif id1 == 1 then
      id2 = id2 % 256
      id2 = id2 % 16
      id2 = id2 % 8
      id2 = id2 % 4
      local idbl
      idbl = id4
      if XB50[idbl] == nil then
        XB50[idbl] = {}
      end
      if id2 == 0 then
        XB50[idbl][id5] = math.modf(id6)
      elseif id2 == 1 then
        XB50[idbl][X50[id5]] = math.modf(id6)
      elseif id2 == 2 then
        XB50[idbl][id5] = math.modf(X50[id6])
      elseif id2 == 3 then
        XB50[idbl][X50[id5]] = math.modf(X50[id6])
      end
    elseif id1 == 2 then
      id2 = id2 % 256
      id2 = id2 % 16
      id2 = id2 % 8
      id2 = id2 % 4
      id2 = id2 % 2
      if id2 == 0 then
        X50[id6] = XB50[id4][id5]
      elseif id2 == 1 then
        X50[id6] = XB50[id4][X50[id5]]
      end
    elseif id1 == 3 then
      id2 = id2 % 256
      id2 = id2 % 16
      id2 = id2 % 8
      id2 = id2 % 4
      id2 = id2 % 2
      local idbl
      if id2 == 0 then
        idbl = id6
      elseif id2 == 1 then
        idbl = X50[id6]
      end
      if id3 == 0 then
        X50[id4] = X50[id5] + idbl
      elseif id3 == 1 then
        X50[id4] = X50[id5] - idbl
      elseif id3 == 2 then
        X50[id4] = X50[id5] * idbl
      elseif id3 == 3 then
        X50[id4] = X50[id5] / idbl
      elseif id3 == 4 then
        X50[id4] = X50[id5] % idbl
      end
    elseif id1 == 4 then
      id2 = id2 % 256
      id2 = id2 % 16
      id2 = id2 % 8
      id2 = id2 % 4
      if id2 == 0 then
        if id3 == 0 then
          if id5 > X50[id4] then
            X50JMP = 0
          else
            X50JMP = 1
          end
        elseif id3 == 1 then
          if id5 >= X50[id4] then
            X50JMP = 0
          else
            X50JMP = 1
          end
        elseif id3 == 2 then
          if X50[id4] == id5 then
            X50JMP = 0
          else
            X50JMP = 1
          end
        elseif id3 == 3 then
          if X50[id4] ~= id5 then
            X50JMP = 0
          else
            X50JMP = 1
          end
        elseif id3 == 4 then
          if id5 <= X50[id4] then
            X50JMP = 0
          else
            X50JMP = 1
          end
        elseif id3 == 5 then
          if id5 < X50[id4] then
            X50JMP = 0
          else
            X50JMP = 1
          end
        elseif id3 == 6 then
          X50JMP = 0
        elseif id3 == 7 then
          X50JMP = 1
        end
      elseif id2 == 1 then
        if id3 == 0 then
          if X50[id4] < X50[id5] then
            X50JMP = 0
          else
            X50JMP = 1
          end
        elseif id3 == 1 then
          if X50[id4] <= X50[id5] then
            X50JMP = 0
          else
            X50JMP = 1
          end
        elseif id3 == 2 then
          if X50[id4] == X50[id5] then
            X50JMP = 0
          else
            X50JMP = 1
          end
        elseif id3 == 3 then
          if X50[id4] ~= X50[id5] then
            X50JMP = 0
          else
            X50JMP = 1
          end
        elseif id3 == 4 then
          if X50[id4] >= X50[id5] then
            X50JMP = 0
          else
            X50JMP = 1
          end
        elseif id3 == 5 then
          if X50[id4] > X50[id5] then
            X50JMP = 0
          else
            X50JMP = 1
          end
        elseif id3 == 6 then
          X50JMP = 0
        elseif id3 == 7 then
          X50JMP = 1
        end
      end
    elseif id1 == 5 then
      X50 = {}
      XB50 = {}
      X50STR = {}
    elseif id1 == 6 then
      X50[id2] = 0
    elseif id1 == 7 then
    elseif id1 == 8 then
      id2 = id2 % 256
      id2 = id2 % 16
      id2 = id2 % 8
      id2 = id2 % 4
      if id2 == 0 then
        X50STR[id4] = ReadTalk(id3)
        X50STR[id4] = string.gsub(X50STR[id4], "\r", "")
        X50STR[id4] = string.gsub(X50STR[id4], "*", "")
      elseif id2 == 1 then
        X50STR[id4] = ReadTalk(X50[id3])
        X50STR[id4] = string.gsub(X50STR[id4], "\r", "")
        X50STR[id4] = string.gsub(X50STR[id4], "*", "")
      end
    elseif id1 == 9 then
      if X50STR[id4] == "%d" then
        X50STR[id3] = tostring(X50[id5])
      end
    elseif id1 == 10 then
      X50[id3] = #X50STR[id2]
    elseif id1 == 11 then
      X50STR[id2] = X50STR[id3] .. X50STR[id4]
    elseif id1 == 12 then
      id2 = id2 % 256
      id2 = id2 % 16
      id2 = id2 % 8
      id2 = id2 % 4
      local idbl
      if id2 == 0 then
        idbl = id4
      elseif id2 == 1 then
        idbl = X50[id4]
      end
      X50STR[id3] = ""
      for i = 0, idbl do
        X50STR[id3] = X50STR[id3] .. " "
      end
    elseif id1 == 16 then
      X50ZL16(id1, id2, id3, id4, id5, id6, id7)
    elseif id1 == 17 then
      X50ZL17(id1, id2, id3, id4, id5, id6, id7)
    elseif id1 == 18 then
      id2 = id2 % 256
      id2 = id2 % 16
      id2 = id2 % 8
      id2 = id2 % 4
      if id2 == 0 then
        JY.Base["队伍" .. id3 + 1] = id4
      elseif id2 == 1 then
        JY.Base["队伍" .. X50[id3] + 1] = id4
      elseif id2 == 2 then
        JY.Base["队伍" .. id3 + 1] = X50[id4]
      elseif id2 == 3 then
        JY.Base["队伍" .. X50[id3] + 1] = X50[id4]
      end
    elseif id1 == 19 then
      id2 = id2 % 256
      id2 = id2 % 16
      id2 = id2 % 8
      id2 = id2 % 4
      if id2 == 0 then
        X50[id4] = JY.Base["队伍" .. id3 + 1]
      elseif id2 == 1 then
        X50[id4] = JY.Base["队伍" .. X50[id3] + 1]
      end
    elseif id1 == 20 then
      id2 = id2 % 256
      id2 = id2 % 16
      id2 = id2 % 8
      id2 = id2 % 4
      local idbl
      if id2 == 0 then
        idbl = id3
      elseif id2 == 1 then
        idbl = X50[id3]
      end
      if instruct_18(idbl) then
        for i = 1, CC.MyThingNum do
          if JY.Base["物品" .. i] == idbl then
            X50[id4] = JY.Base["物品数量" .. i]
            break
          end
        end
      else
        X50[id4] = 0
      end
    elseif id1 == 27 then
      id2 = id2 % 256
      id2 = id2 % 16
      id2 = id2 % 8
      id2 = id2 % 4
      if id2 == 0 then
        if id3 == 0 then
          X50STR[id5] = JY.Person[id4]["姓名"]
        elseif id3 == 1 then
          X50STR[id5] = JY.Thing[id4]["名称"]
        elseif id3 == 2 then
          X50STR[id5] = JY.Scene[id4]["名称"]
        elseif id3 == 3 then
          X50STR[id5] = JY.Wugong[id4]["名称"]
        end
      elseif id2 == 1 then
        if id3 == 0 then
          X50STR[id5] = JY.Person[X50[id4]]["姓名"]
        elseif id3 == 1 then
          X50STR[id5] = JY.Thing[X50[id4]]["名称"]
        elseif id3 == 2 then
          X50STR[id5] = JY.Scene[X50[id4]]["名称"]
        elseif id3 == 3 then
          X50STR[id5] = JY.Wugong[X50[id4]]["名称"]
        end
      end
    elseif id1 == 32 then
      id2 = id2 % 256
      id2 = id2 % 16
      id2 = id2 % 8
      id2 = id2 % 4
      id2 = id2 % 2
      if id2 == 0 then
        X50BL32[1] = id4
        X50BL32[2] = X50[id3]
        BL32PD = 1
      elseif id2 == 1 then
        X50BL32[1] = X50[id4]
        X50BL32[2] = X50[id3]
        BL32PD = 1
      end
    elseif id1 == 33 then
      local strlen = #X50STR[id3] / 4 * CC.DefaultFont
      DrawStrBox(CC.ScreenW / 2 - strlen, CC.ScreenH / 2 - CC.DefaultFont * 4, X50STR[id3], C_GOLD, CC.DefaultFont)
    elseif id1 == 36 then
      if string.find(X50STR[id3], "Ｙ／Ｎ") ~= nil then
        if DrawStrBoxYesNo(-1, -1, string.gsub(X50STR[id3], "\r", ""), C_WHITE, CC.DefaultFont) then
          X50JMP = 0
        else
          X50JMP = 1
        end
      else
        DrawStrBoxWaitKey(string.gsub(X50STR[id3], "\r", ""), C_WHITE, CC.DefaultFont)
      end
    elseif id1 == 38 then
      if id2 == 0 then
        X50[id4] = Rnd(id3)
      elseif id2 == 1 then
        X50[id4] = Rnd(X50[id3])
      end
    elseif id1 == 39 then
      id2 = id2 % 256
      id2 = id2 % 16
      id2 = id2 % 8
      local idbl1, idbl2, idbl3
      if id2 == 0 then
        idbl1 = id3
        idbl2 = id6
        idbl3 = id7
      elseif id2 == 1 then
        idbl1 = X50[id3]
        idbl2 = id6
        idbl3 = id7
      elseif id2 == 2 then
        idbl1 = id3
        idbl2 = X50[id6]
        idbl3 = id7
      elseif id2 == 3 then
        idbl1 = X50[id3]
        idbl2 = X50[id6]
        idbl3 = id7
      elseif id2 == 4 then
        idbl1 = id3
        idbl2 = id6
        idbl3 = X50[id7]
      elseif id2 == 5 then
        idbl1 = X50[id3]
        idbl2 = id6
        idbl3 = X50[id7]
      elseif id2 == 6 then
        idbl1 = id3
        idbl2 = X50[id6]
        idbl3 = X50[id7]
      elseif id2 == 7 then
        idbl1 = X50[id3]
        idbl2 = X50[id6]
        idbl3 = X50[id7]
      end
      local menu = {}
      local maxl = 0
      for i = 1, idbl1 do
        menu[i] = {
          string.gsub(X50STR[XB50[id4][i - 1]], "\r", ""),
          nil,
          1
        }
        if maxl < #X50STR[XB50[id4][i - 1]] then
          maxl = #X50STR[XB50[id4][i - 1]]
        end
      end
      local size = CC.DefaultFont
      local mx = CC.ScreenW / 2 - maxl / 4 * size
      local my = CC.ScreenH / 2 - size * 2
      local r = ShowMenu(menu, idbl1, 0, mx, my, 0, 0, 1, 1, size, C_ORANGE, C_WHITE)
      X50[id5] = r
      if r == 0 then
        Cls()
      end
    elseif id1 == 40 then
      id2 = id2 % 256
      id2 = id2 % 16
      id2 = id2 % 8
      local idbl1, idbl2, idbl3
      if id2 == 0 then
        idbl1 = id3
        idbl2 = id6
        idbl3 = id7
      elseif id2 == 1 then
        idbl1 = X50[id3]
        idbl2 = id6
        idbl3 = id7
      elseif id2 == 2 then
        idbl1 = id3
        idbl2 = X50[id6]
        idbl3 = id7
      elseif id2 == 3 then
        idbl1 = X50[id3]
        idbl2 = X50[id6]
        idbl3 = id7
      elseif id2 == 4 then
        idbl1 = id3
        idbl2 = id6
        idbl3 = X50[id7]
      elseif id2 == 5 then
        idbl1 = X50[id3]
        idbl2 = id6
        idbl3 = X50[id7]
      elseif id2 == 6 then
        idbl1 = id3
        idbl2 = X50[id6]
        idbl3 = X50[id7]
      elseif id2 == 7 then
        idbl1 = X50[id3]
        idbl2 = X50[id6]
        idbl3 = X50[id7]
      end
      local menu = {}
      local maxl = 0
      for i = 1, idbl1 do
        menu[i] = {
          string.gsub(X50STR[XB50[id4][i - 1]], "\r", ""),
          nil,
          1
        }
        if maxl < #X50STR[XB50[id4][i - 1]] then
          maxl = #X50STR[XB50[id4][i - 1]]
        end
      end
      local size = CC.DefaultFont
      local mx = CC.ScreenW / 2 - maxl / 4 * size
      local my = CC.ScreenH / 2 - size * 2
      local r = ShowMenu(menu, idbl1, 0, mx, my, 0, 0, 1, 1, size, C_ORANGE, C_WHITE)
      X50[id5] = r
      if r == 0 then
        Cls()
      end
    end
  end
end
function instruct_51()
  instruct_1(2547 + Rnd(18), 114, 0)
end
function instruct_52()
  DrawStrBoxWaitKey(string.format("你现在的品德指数为: %d", JY.Person[0]["品德"]), C_ORANGE, CC.DefaultFont)
end
function instruct_53()
  DrawStrBoxWaitKey(string.format("你现在的声望指数为: %d", JY.Person[0]["声望"]), C_ORANGE, CC.DefaultFont)
end
function instruct_54()
  for i = 0, JY.SceneNum - 1 do
    JY.Scene[i]["进入条件"] = 0
  end
  JY.Scene[2]["进入条件"] = 2
  JY.Scene[38]["进入条件"] = 2
  JY.Scene[75]["进入条件"] = 1
  JY.Scene[80]["进入条件"] = 1
end
function instruct_55(id, num)
  if GetD(JY.SubScene, id, 2) == num then
    return true
  else
    return false
  end
end
function instruct_56(v)
  JY.Person[0]["声望"] = JY.Person[0]["声望"] + v
  instruct_2_sub()
end
function instruct_57()
  instruct_27(-1, 7664, 7674)
  for i = 0, 56, 2 do
    local t1 = lib.GetTime()
    if JY.MyPic < 3844 then
      JY.MyPic = (7676 + i) / 2
    end
    SetD(JY.SubScene, 2, 5, i + 7690)
    SetD(JY.SubScene, 2, 6, i + 7690)
    SetD(JY.SubScene, 2, 7, i + 7690)
    SetD(JY.SubScene, 3, 5, i + 7748)
    SetD(JY.SubScene, 3, 6, i + 7748)
    SetD(JY.SubScene, 3, 7, i + 7748)
    SetD(JY.SubScene, 4, 5, i + 7806)
    SetD(JY.SubScene, 4, 6, i + 7806)
    SetD(JY.SubScene, 4, 7, i + 7806)
    DtoSMap()
    DrawSMap()
    ShowScreen()
    local t2 = lib.GetTime()
    if t2 - t1 < CC.AnimationFrame then
      lib.Delay(CC.AnimationFrame - (t2 - t1))
    end
  end
end
function instruct_58()
  local group = 5
  local num1 = 6
  local num2 = 3
  local startwar = 102
  local flag = {}
  for i = 0, group - 1 do
    for j = 0, num1 - 1 do
      flag[j] = 0
    end
    for j = 1, num2 do
      local r
      while true do
        r = Rnd(num1)
        if flag[r] == 0 then
          flag[r] = 1
          break
        end
      end
      local warnum = r + i * num1
      WarLoad(warnum + startwar)
      instruct_1(2854 + warnum, JY.Person[WAR.Data["敌人1"]]["头像代号"], 0)
      instruct_0()
      if WarMain(warnum + startwar, 0) == true then
        instruct_0()
        instruct_13()
        TalkEx("还有那位前辈肯赐教？", 0, 1)
        instruct_0()
      else
        instruct_15()
        return
      end
    end
    if i < group - 1 then
      TalkEx("少侠已连战三场，*可先休息再战．", 70, 0)
      instruct_0()
      instruct_14()
      lib.Delay(300)
      if JY.Person[0]["受伤程度"] < 50 and 0 >= JY.Person[0]["中毒程度"] then
        JY.Person[0]["受伤程度"] = 0
        AddPersonAttrib(0, "体力", math.huge)
        AddPersonAttrib(0, "内力", math.huge)
        AddPersonAttrib(0, "生命", math.huge)
      end
      instruct_13()
      TalkEx("我已经休息够了，*有谁要再上？", 0, 1)
      instruct_0()
    end
  end
  TalkEx("接下来换谁？**．．．．*．．．．***没有人了吗？", 0, 1)
  instruct_0()
  TalkEx("如果还没有人要出来向这位*少侠挑战，那麽这武功天下*第一之名，武林盟主之位，*就由这位少侠夺得．***．．．．．．*．．．．．．*．．．．．．*好，恭喜少侠，这武林盟主*之位就由少侠获得，而这把*”武林神杖”也由你保管．", 70, 0)
  instruct_0()
  TalkEx("恭喜少侠！", 12, 0)
  instruct_0()
  TalkEx("小兄弟，恭喜你！", 64, 4)
  instruct_0()
  TalkEx("好，今年的武林大会到此已*圆满结束，希望明年各位武*林同道能再到我华山一游．", 19, 0)
  instruct_0()
  instruct_14()
  for i = 24, 72 do
    instruct_3(-2, i, 0, 0, -1, -1, -1, -1, -1, -1, -2, -2, -2)
  end
  instruct_0()
  instruct_13()
  TalkEx("历经千辛万苦，我终於打败*群雄，得到这武林盟主之位*及神杖．*但是”圣堂”在那呢？*为什麽没人告诉我，难道大*家都不知道．*这会儿又有的找了．", 0, 1)
  instruct_0()
  instruct_2(143, 1)
end
function instruct_59()
  for i = CC.TeamNum, 2, -1 do
    if JY.Base["队伍" .. i] >= 0 then
      instruct_21(JY.Base["队伍" .. i])
    end
  end
  for i, v in ipairs(CC.AllPersonExit) do
    instruct_3(v[1], v[2], 0, 0, -1, -1, -1, -1, -1, -1, 0, -2, -2)
  end
end
function instruct_60(sceneid, id, num)
  if sceneid == -2 then
    sceneid = JY.SubScene
  end
  if id == -2 then
    id = JY.CurrentD
  end
  if GetD(sceneid, id, 5) == num then
    return true
  else
    return false
  end
end
function instruct_61()
  for i = 11, 24 do
    if GetD(JY.SubScene, i, 5) ~= 4664 then
      return false
    end
  end
  return true
end
function instruct_62(id1, startnum1, endnum1, id2, startnum2, endnum2)
  JY.MyPic = -1
  TSGL(CONFIG.DataPath .. "list/end.txt", 1)
  Cls()
  lib.LoadPicture(CONFIG.PicturePath .. "end.png", -1, -1)
  ShowScreen()
  PlayMIDI(24)
  lib.Delay(5000)
  WaitKey()
  os.exit()
end
function instruct_63(personid, sex)
  JY.Person[personid]["性别"] = sex
end
function instruct_64()
  local headid = 111
  local id = -1
  for i = 0, JY.ShopNum - 1 do
    if CC.ShopScene[i].sceneid == JY.SubScene then
      id = i
      break
    end
  end
  if id < 0 then
    return
  end
  TalkEx("这位小哥，看看有什麽需要*的，本店卖的东西价钱绝*对公道．", headid, 0)
  local menu = {}
  for i = 1, 5 do
    menu[i] = {}
    local thingid = JY.Shop[id]["物品" .. i]
    menu[i][1] = string.format("%-12s %5d", JY.Thing[thingid]["名称"], JY.Shop[id]["物品价格" .. i])
    menu[i][2] = nil
    if 0 < JY.Shop[id]["物品数量" .. i] then
      menu[i][3] = 1
    else
      menu[i][3] = 0
    end
  end
  local x1 = (CC.ScreenW - 9 * CC.DefaultFont - 2 * CC.MenuBorderPixel) / 2
  local y1 = (CC.ScreenH - 5 * CC.DefaultFont - 4 * CC.RowPixel - 2 * CC.MenuBorderPixel) / 2
  local r = ShowMenu(menu, 5, 0, x1, y1, 0, 0, 1, 1, CC.DefaultFont, C_ORANGE, C_WHITE)
  if 0 < r then
    if instruct_31(JY.Shop[id]["物品价格" .. r]) == false then
      TalkEx("非常抱歉，*你身上的钱似乎不够．", headid, 0)
    else
      JY.Shop[id]["物品数量" .. r] = JY.Shop[id]["物品数量" .. r] - 1
      instruct_32(CC.MoneyID, -JY.Shop[id]["物品价格" .. r])
      instruct_32(JY.Shop[id]["物品" .. r], 1)
      TalkEx("大爷买了本店的东西，*保证绝不後悔．", headid, 0)
    end
  end
  for i, v in ipairs(CC.ShopScene[id].d_leave) do
    instruct_3(-2, v, 0, -2, -1, -1, 939, -1, -1, -1, -2, -2, -2)
  end
end
function instruct_65()
  local id = -1
  for i = 0, JY.ShopNum - 1 do
    if CC.ShopScene[i].sceneid == JY.SubScene then
      id = i
      break
    end
  end
  if id < 0 then
    return
  end
  instruct_3(-2, CC.ShopScene[id].d_shop, 0, -2, -1, -1, -1, -1, -1, -1, -2, -2, -2)
  for i, v in ipairs(CC.ShopScene[id].d_leave) do
    instruct_3(-2, v, 0, -2, -1, -1, -1, -1, -1, -1, -2, -2, -2)
  end
  local newid = id + 1
  if 5 <= newid then
    newid = 0
  end
  instruct_3(CC.ShopScene[newid].sceneid, CC.ShopScene[newid].d_shop, 1, -2, 938, -1, -1, 8256, 8256, 8256, -2, -2, -2)
end
function instruct_66(id)
  PlayMIDI(id)
end
function instruct_67(id)
  PlayWavAtk(id)
end
function WarSetGlobal()
  WAR = {}
  WAR.Data = {}
  WAR.SelectPerson = {}
  WAR.Person = {}
  for i = 0, 25 + (CC.TeamNum - 6) do
    WAR.Person[i] = {}
    WAR.Person[i]["人物编号"] = -1
    WAR.Person[i]["我方"] = true
    WAR.Person[i]["坐标X"] = -1
    WAR.Person[i]["坐标Y"] = -1
    WAR.Person[i]["死亡"] = true
    WAR.Person[i]["人方向"] = -1
    WAR.Person[i]["贴图"] = -1
    WAR.Person[i]["贴图类型"] = 0
    WAR.Person[i]["轻功"] = 0
    WAR.Person[i]["移动步数"] = 0
    WAR.Person[i]["点数"] = 0
    WAR.Person[i]["经验"] = 0
    WAR.Person[i]["自动选择对手"] = -1
  end
  WAR.PersonNum = 0
  WAR.AutoFight = 0
  WAR.CurID = -1
  WAR.ShowHead = 0
  WAR.Effect = 0
  WAR.EffectColor = {}
  WAR.EffectColor[2] = C_RED
  WAR.EffectColor[3] = RGB(112, 12, 112)
  WAR.EffectColor[4] = RGB(236, 200, 40)
  WAR.EffectColor[5] = RGB(96, 176, 64)
  WAR.EffectColor[6] = RGB(104, 192, 232)
  WAR.EffectXY = nil
  WAR.EffectXYNum = 0
end
function WarLoad(warid)
  WarSetGlobal()
  local data = Byte.create(CC.WarDataSize)
  Byte.loadfile(data, CC.WarFile, warid * CC.WarDataSize, CC.WarDataSize)
  LoadData(WAR.Data, CC.WarData_S, data)
end
function wcbuff(wid)
  local mywuxue = 0
  local emenywuxue = 0
  for i = 0, WAR.PersonNum - 1 do
    local id = WAR.Person[i]["人物编号"]
    if WAR.Person[i]["死亡"] == false and JY.Person[id]["武学常识"] >= CC.WXCS then
      if WAR.Person[i]["我方"] then
        if CC.SHGS == 3 then
          if mywuxue < JY.Person[id]["武学常识"] then
            mywuxue = JY.Person[id]["武学常识"]
          end
        else
          mywuxue = mywuxue + JY.Person[id]["武学常识"]
        end
      elseif CC.SHGS == 3 then
        if emenywuxue < JY.Person[id]["武学常识"] then
          emenywuxue = JY.Person[id]["武学常识"]
        end
      else
        emenywuxue = emenywuxue + JY.Person[id]["武学常识"]
      end
    end
  end
  if mywuxue >= CC.WXCS then
    if mywuxue > JY.WARWF * (CC.PersonAttribMax["武学常识"] / 1) then
      mywuxue = JY.WARWF * (CC.PersonAttribMax["武学常识"] / 1)
    end
    local wxp = mywuxue / CC.PersonAttribMax["武学常识"]
    if wxp < 0.4 then
      JY.WFWC = "★"
    elseif wxp < 0.6 then
      JY.WFWC = "★★"
    elseif wxp < 0.8 then
      JY.WFWC = "★★★"
    elseif wxp < 1 then
      JY.WFWC = "★★★★"
    else
      JY.WFWC = "★★★★★"
    end
  else
    JY.WFWC = ""
  end
  if emenywuxue >= CC.WXCS then
    if emenywuxue > JY.WARDF * (CC.PersonAttribMax["武学常识"] / 1) then
      emenywuxue = JY.WARDF * (CC.PersonAttribMax["武学常识"] / 1)
    end
    local wxp = emenywuxue / CC.PersonAttribMax["武学常识"]
    if wxp < 0.4 then
      JY.DFWC = "★"
    elseif wxp < 0.6 then
      JY.DFWC = "★★"
    elseif wxp < 0.8 then
      JY.DFWC = "★★★"
    elseif wxp < 1 then
      JY.DFWC = "★★★★"
    else
      JY.DFWC = "★★★★★"
    end
  else
    JY.DFWC = ""
  end
end
function WarMain(warid, isexp)
  lib.Debug(string.format("war start. warid=%d", warid))
  WarLoad(warid)
  WarSelectTeam()
  WarSelectEnemy()
  CleanMemory()
  lib.PicInit()
  lib.ShowSlow(50, 1)
  WarLoadMap(WAR.Data["地图"])
  local haiba = {}
  for i = 0, CC.WarWidth - 1 do
    haiba[i] = {}
    for j = 0, CC.WarHeight - 1 do
      haiba[i][j] = lib.GetS(JY.SubScene, i, j, 4)
      lib.SetS(JY.SubScene, i, j, 4, 0)
    end
  end
  JY.Status = GAME_WMAP
  lib.PicLoadFile(CC.WMAPPicFile[1], CC.WMAPPicFile[2], 0)
  lib.PicLoadFile(CC.HeadPicFile[1], CC.HeadPicFile[2], 1)
  if CC.LoadThingPic == 1 then
    lib.PicLoadFile(CC.ThingPicFile[1], CC.ThingPicFile[2], 2)
  end
  lib.PicLoadFile(CC.EffectFile[1], CC.EffectFile[2], 3)
  if CC.FK == 1 then
    lib.PicLoadFile(CC.MMAPPicFile[1], CC.MMAPPicFile[2], 2)
  end
  PlayMIDI(WAR.Data["音乐"])
  local first = 0
  local warStatus
  JY.ZDHH = 0
  JY.Huhuolq = 5
  JY.Huhuocs = 2
  if 0 < JY.YXND then
    JY.Huhuolq = 10
  end
  local bshh = 1
  if JY.Wugong[30]["未知1"] == 8 and JY.Wugong[30]["未知2"] == 6 then
    bshh = 2
  end
  local lev = JY.Person[0]["等级"]
  JY.Huhuocs = math.floor(lev / 15)
  if JY.YXND == 0 and JY.Person[0]["姓名"] == "szlzw" then
    JY.Huhuocs = 0
  end
  JY.WARWF = 0
  JY.WARDF = 0
  JY.NDXS = 0
  JY.NDXS1 = 0
  JY.XTMAX = 0
  for i = 0, WAR.PersonNum - 1 do
    JY.DEADPD[i] = {}
    if WAR.Person[i]["死亡"] == false then
      if WAR.Person[i]["我方"] then
        JY.WARWF = JY.WARWF + 1
        local id = WAR.Person[i]["人物编号"]
    
        if JY.NDXS < JY.Person[id]["生命最大值"] / CC.PersonAttribMax["生命最大值"] - 1 then
          JY.NDXS = JY.Person[id]["生命最大值"] / CC.PersonAttribMax["生命最大值"] - 1
        end
        if JY.NDXS < JY.Person[id]["内力最大值"] / CC.PersonAttribMax["内力最大值"] - 1 then
          JY.NDXS = JY.Person[id]["内力最大值"] / CC.PersonAttribMax["内力最大值"] - 1
        end
        if JY.NDXS < JY.Person[id]["攻击力"] / CC.PersonAttribMax["攻击力"] - 1 then
          JY.NDXS = JY.Person[id]["攻击力"] / CC.PersonAttribMax["攻击力"] - 1
        end
        if JY.NDXS < JY.Person[id]["防御力"] / CC.PersonAttribMax["防御力"] - 1 then
          JY.NDXS = JY.Person[id]["防御力"] / CC.PersonAttribMax["防御力"] - 1
        end
        if JY.NDXS < JY.Person[id]["拳掌功夫"] / CC.PersonAttribMax["拳掌功夫"] - 1 then
          JY.NDXS = JY.Person[id]["拳掌功夫"] / CC.PersonAttribMax["拳掌功夫"] - 1
        end
        if JY.NDXS < JY.Person[id]["御剑能力"] / CC.PersonAttribMax["御剑能力"] - 1 then
          JY.NDXS = JY.Person[id]["御剑能力"] / CC.PersonAttribMax["御剑能力"] - 1
        end
        if JY.NDXS < JY.Person[id]["耍刀技巧"] / CC.PersonAttribMax["耍刀技巧"] - 1 then
          JY.NDXS = JY.Person[id]["耍刀技巧"] / CC.PersonAttribMax["耍刀技巧"] - 1
        end
        if JY.NDXS < JY.Person[id]["特殊兵器"] / CC.PersonAttribMax["特殊兵器"] - 1 then
          JY.NDXS = JY.Person[id]["特殊兵器"] / CC.PersonAttribMax["特殊兵器"] - 1
        end
        if JY.NDXS1 < JY.Person[id]["攻击力"] / CC.PersonAttribMax["攻击力"] / 5 then
          if CC.YXNDA == 2 then
            JY.NDXS1 = JY.Person[id]["攻击力"] / CC.PersonAttribMax["攻击力"] / 5 - 0.2
          else
            JY.NDXS1 = JY.Person[id]["攻击力"] / CC.PersonAttribMax["攻击力"]
            if 1 < JY.NDXS1 then
              JY.NDXS1 = JY.NDXS1 - 1
            else
              JY.NDXS1 = 0
            end
          end
        end
      else
        JY.WARDF = JY.WARDF + 1
      end
      local id = WAR.Person[i]["人物编号"]
      if JY.XTMAX < JY.Person[id]["生命最大值"] then
        JY.XTMAX = JY.Person[id]["生命最大值"]
      end
    end
  end
  while true do
    for i = 0, WAR.PersonNum - 1 do
      WAR.Person[i]["贴图"] = WarCalPersonPic(i)
      if WAR.Person[i]["死亡"] == false then
        JY.DEADPD[i][1] = WAR.Person[i]["人物编号"]
        JY.DEADPD[i][2] = 0
      end
    end
    JY.ZDHH = JY.ZDHH + 1
    WarPersonSort()
    CleanWarMap(2, -1)
    CleanWarMap(6, -2)
    WarSetPerson()
    local p = 0
    while p < WAR.PersonNum do
      WAR.Effect = 0
      if WAR.AutoFight == 1 then
        local keypress, ktype, mx, my = lib.GetKey()
        if keypress == VK_SPACE or keypress == VK_RETURN or keypress == VK_ESCAPE or ktype == 4 or ktype == 3 then
          WAR.AutoFight = 0
        end
      end
      if WAR.Person[p]["死亡"] == false then
        WAR.CurID = p
        wcbuff(WAR.CurID)
        if first == 0 then
          WarDrawMap(0)
          lib.ShowSlow(50, 0)
          ShowScreen()
          first = 1
        else
          WarDrawMap(0)
          WarShowHead()
          ShowScreen()
        end
        local r
        if WAR.Person[p]["我方"] == true then
          if WAR.AutoFight == 0 then
            r = War_Manual()
            if r == 0 then
              p = p - 1
            end
          else
            r = War_Auto()
          end
        else
          r = War_Auto()
        end
        warStatus = War_isEnd()
        for j = 0, WAR.PersonNum - 1 do
          if WAR.Person[j]["人物编号"] == 0 and 0 < JY.Huhuocs and 15 <= lev * bshh then
            if JY.Person[0]["外号"] == "巫妖" and 0 >= JY.Huhuolq and WAR.Person[j]["死亡"] == true and CC.JS == 1 then
              WAR.Person[j]["死亡"] = false
              JY.Person[0]["生命"] = math.modf(JY.Person[0]["生命最大值"] / 2)
              JY.Huhuolq = JY.Huhuolq * bshh
              warStatus = 0
              local xgstr = "巫妖→发动重生特技，复活了自己！"
              local xglen = #xgstr
              DrawString(CC.ScreenW / 2 - CC.StartMenuFontSize * xglen / 4, CC.ScreenH / 2, xgstr, C_WHITE, CC.StartMenuFontSize)
              ShowScreen()
              lib.Delay(1500)
              WarSetPerson()
              JY.Huhuocs = JY.Huhuocs - 1
              JY.Huhuolq = JY.Huhuolq * bshh
            end
            if WAR.Person[j]["外号"] ~= "巫妖" then
              JY.Huhuolq = JY.Huhuolq * bshh
            end
          end
        end
        if math.abs(r) == 7 then
          p = p - 1
        end
        if 0 < warStatus then
          break
        end
      end
      p = p + 1
    end
    if 0 < warStatus then
      break
    end
    War_PersonLostLife()
    JY.Huhuolq = JY.Huhuolq - 1
    if 0 > JY.Huhuolq then
      JY.Huhuolq = 0
    end
  end
  local r
  WAR.ShowHead = 0
  if warStatus == 1 then
    DrawStrBoxWaitKey("战斗胜利", C_WHITE, CC.DefaultFont)
    r = true
  elseif warStatus == 2 then
    DrawStrBoxWaitKey("战斗失败", C_WHITE, CC.DefaultFont)
    r = false
  end
  War_EndPersonData(isexp, warStatus)
  for i = 0, CC.WarWidth - 1 do
    for j = 0, CC.WarHeight - 1 do
      lib.SetS(JY.SubScene, i, j, 4, haiba[i][j])
    end
  end
  lib.ShowSlow(50, 1)
  if 0 <= JY.Scene[JY.SubScene]["进门音乐"] then
    PlayMIDI(JY.Scene[JY.SubScene]["进门音乐"])
  else
    PlayMIDI(0)
  end
  CleanMemory()
  lib.PicInit()
  lib.PicLoadFile(CC.SMAPPicFile[1], CC.SMAPPicFile[2], 0)
  lib.PicLoadFile(CC.HeadPicFile[1], CC.HeadPicFile[2], 1)
  if CC.LoadThingPic == 1 then
    lib.PicLoadFile(CC.ThingPicFile[1], CC.ThingPicFile[2], 2)
  end
  if CC.FK == 1 then
    lib.PicLoadFile(CC.MMAPPicFile[1], CC.MMAPPicFile[2], 2)
  end
  JY.Status = GAME_SMAP
  return r
end
function War_PersonLostLife()
  if CC.SHGS == 0 then
    for i = 0, WAR.PersonNum - 1 do
      local pid = WAR.Person[i]["人物编号"]
      if WAR.Person[i]["死亡"] == false then
        if 0 < JY.Person[pid]["受伤程度"] then
          local dec = math.modf(JY.Person[pid]["受伤程度"] / 10)
          AddPersonAttrib(pid, "生命", -dec)
        end
        if 0 < JY.Person[pid]["中毒程度"] then
          local dec = math.modf(JY.Person[pid]["中毒程度"] / 10)
          AddPersonAttrib(pid, "生命", -dec)
        end
        if 0 >= JY.Person[pid]["生命"] then
          JY.Person[pid]["生命"] = 1
        end
      end
    end
  else
    for i = 0, WAR.PersonNum - 1 do
      local pid = WAR.Person[i]["人物编号"]
      if WAR.Person[i]["死亡"] == false then
        if 0 < JY.Person[pid]["受伤程度"] then
          local dec = math.modf(JY.Person[pid]["受伤程度"] / 10)
          AddPersonAttrib(pid, "生命", math.modf(-dec * (CC.PersonAttribMax["生命最大值"] / 999)))
        end
        if 0 < JY.Person[pid]["中毒程度"] then
          local dec = math.modf(JY.Person[pid]["中毒程度"] / 10 * CC.DUDX)
          local duyz = math.modf(CC.PersonAttribMax["生命最大值"] / 2000)
          if 5 < duyz then
            duyz = 5
          end
          AddPersonAttrib(pid, "生命", -dec * duyz)
        end
        if 0 >= JY.Person[pid]["生命"] then
          JY.Person[pid]["生命"] = 1
        end
      end
    end
  end
end
function War_EndPersonData(isexp, warStatus)
  for i = 0, WAR.PersonNum - 1 do
    local pid = WAR.Person[i]["人物编号"]
    if WAR.Person[i]["我方"] == false then
      JY.Person[pid]["生命"] = JY.Person[pid]["生命最大值"]
      JY.Person[pid]["内力"] = JY.Person[pid]["内力最大值"]
      JY.Person[pid]["体力"] = CC.PersonAttribMax["体力"]
      JY.Person[pid]["受伤程度"] = 0
      JY.Person[pid]["中毒程度"] = 0
    end
  end
  for i = 0, WAR.PersonNum - 1 do
    local pid = WAR.Person[i]["人物编号"]
    if WAR.Person[i]["我方"] == true then
      if JY.Person[pid]["生命"] < JY.Person[pid]["生命最大值"] then
        JY.Person[pid]["生命"] = JY.Person[pid]["生命"] + math.modf(JY.Person[pid]["生命最大值"] / 5)
        if JY.Person[pid]["生命"] > JY.Person[pid]["生命最大值"] then
          JY.Person[pid]["生命"] = JY.Person[pid]["生命最大值"]
        end
      end
      if JY.Person[pid]["内力"] < JY.Person[pid]["内力最大值"] then
        JY.Person[pid]["内力"] = JY.Person[pid]["内力"] + math.modf(JY.Person[pid]["内力最大值"] / 5)
        if JY.Person[pid]["内力"] > JY.Person[pid]["内力最大值"] then
          JY.Person[pid]["内力"] = JY.Person[pid]["内力最大值"]
        end
      end
      if JY.Person[pid]["体力"] < 100 then
        JY.Person[pid]["体力"] = JY.Person[pid]["体力"] + 20
        if JY.Person[pid]["体力"] > 100 then
          JY.Person[pid]["体力"] = 100
        end
      end
    end
  end
  if warStatus == 2 and isexp == 0 then
    return
  end
  local liveNum = 0
  for i = 0, WAR.PersonNum - 1 do
    if WAR.Person[i]["我方"] == true and 0 < JY.Person[WAR.Person[i]["人物编号"]]["生命"] then
      liveNum = liveNum + 1
    end
  end
  if CC.ExpLevel > 3 or 0 >= CC.ExpLevel then
    CC.ExpLevel = 1
  end
  if warStatus == 1 then
    for i = 0, WAR.PersonNum - 1 do
      local pid = WAR.Person[i]["人物编号"]
      if WAR.Person[i]["我方"] == true and 0 < JY.Person[pid]["生命"] then
        if pid == 0 then
          WAR.Person[i]["经验"] = (WAR.Person[i]["经验"] + math.modf(WAR.Data["经验"] / liveNum)) * CC.ExpLevel * CC.ExpCS
        else
          WAR.Person[i]["经验"] = (WAR.Person[i]["经验"] + math.modf(WAR.Data["经验"] / liveNum)) * CC.ExpLevel * CC.ExpCS
        end
      end
    end
  end
  for i = 0, WAR.PersonNum - 1 do
    local pid = WAR.Person[i]["人物编号"]
    AddPersonAttrib(pid, "物品修炼点数", math.modf(WAR.Person[i]["经验"] * 8 / 10))
    if JY.Person[pid]["物品修炼点数"] > 30000 or 0 > JY.Person[pid]["物品修炼点数"] then
      JY.Person[pid]["物品修炼点数"] = 30000
    end
    AddPersonAttrib(pid, "修炼点数", math.modf(WAR.Person[i]["经验"] * 8 / 10))
    AddPersonAttrib(pid, "经验", WAR.Person[i]["经验"])
    if 30000 < JY.Person[pid]["修炼点数"] or 0 > JY.Person[pid]["修炼点数"] then
      JY.Person[pid]["修炼点数"] = 30000
    end
    if WAR.Person[i]["我方"] == true then
      Cls()
      DrawStrBoxWaitKey(string.format("%s 获得经验点数 %d", JY.Person[pid]["姓名"], WAR.Person[i]["经验"]), C_WHITE, CC.DefaultFont)
      JY.JSEXP = WAR.Person[i]["经验"]
      local r = War_AddPersonLevel(pid)
    end
    War_PersonTrainBook(pid)
    War_PersonTrainDrug(pid)
  end
end
function War_AddPersonLevel(pid)
  local tmplevel = JY.Person[pid]["等级"]
  if tmplevel >= CC.Level then
    return false
  end
  if JY.Person[pid]["经验"] < CC.Exp[tmplevel] then
    return false
  end
  while not (tmplevel >= CC.Level) do
    if JY.Person[pid]["经验"] >= CC.Exp[tmplevel] then
      if CC.FKUP == 1 then
        JY.Person[pid]["经验"] = JY.Person[pid]["经验"] - CC.Exp[tmplevel]
      end
      tmplevel = tmplevel + 1
    else
      break
    end
  end
  local levela = tmplevel - JY.Person[pid]["等级"]
  local sjq = {}
  sjq[0] = JY.Person[pid]["等级"]
  sjq[1] = JY.Person[pid]["生命最大值"]
  sjq[2] = JY.Person[pid]["内力最大值"]
  sjq[3] = JY.Person[pid]["攻击力"]
  sjq[4] = JY.Person[pid]["防御力"]
  sjq[5] = JY.Person[pid]["轻功"]
  sjq[6] = JY.Person[pid]["医疗能力"]
  sjq[7] = JY.Person[pid]["用毒能力"]
  sjq[8] = JY.Person[pid]["解毒能力"]
  sjq[9] = JY.Person[pid]["拳掌功夫"]
  sjq[10] = JY.Person[pid]["御剑能力"]
  sjq[11] = JY.Person[pid]["耍刀技巧"]
  sjq[12] = JY.Person[pid]["特殊兵器"]
  sjq[13] = JY.Person[pid]["暗器技巧"]
  local rwsx = {}
  for i = 1, 13 do
    rwsx[i] = 0
  end
  if CC.FKUP == 0 then
    if JY.Person[pid]["姓名"] == "szlzw" or JY.Person[pid]["姓名"] == CC.TSJSName then
      local leveladd = tmplevel - JY.Person[pid]["等级"]
      JY.Person[pid]["等级"] = JY.Person[pid]["等级"] + leveladd
      rwsx[1] = (JY.Person[pid]["生命增长"] + 2) * leveladd * 3
      AddPersonAttrib(pid, "生命最大值", rwsx[1])
      JY.Person[pid]["生命"] = JY.Person[pid]["生命最大值"]
      JY.Person[pid]["体力"] = CC.PersonAttribMax["体力"]
      JY.Person[pid]["受伤程度"] = 0
      JY.Person[pid]["中毒程度"] = 0
      local cleveradd
      if JY.Person[pid]["资质"] < 30 then
        cleveradd = 1
      elseif JY.Person[pid]["资质"] < 50 then
        cleveradd = 1
      elseif JY.Person[pid]["资质"] < 70 then
        cleveradd = 2
      elseif JY.Person[pid]["资质"] < 90 then
        cleveradd = 2
      else
        cleveradd = 3
      end
      rwsx[2] = 7 * leveladd * 4
      AddPersonAttrib(pid, "内力最大值", rwsx[2])
      JY.Person[pid]["内力"] = JY.Person[pid]["内力最大值"]
      local i = 0
      local zzadd = 0
      if JY.Person[0]["资质"] < 55 then
        zzadd = 1
      end
      for i = 1, leveladd do
        rwsx[3] = rwsx[3] + 4 - zzadd + Rnd(2)
        rwsx[4] = rwsx[4] + 4 - zzadd + Rnd(2)
        rwsx[5] = rwsx[5] + 4 - zzadd + Rnd(2)
        rwsx[6] = rwsx[6] + 2
        rwsx[7] = rwsx[7] + 2
        rwsx[8] = rwsx[8] + 2
        rwsx[9] = rwsx[9] + 2
        rwsx[10] = rwsx[10] + 2
        rwsx[11] = rwsx[11] + 2
        rwsx[12] = rwsx[12] + 2
        rwsx[13] = rwsx[13] + 2
      end
    else
      local leveladd = tmplevel - JY.Person[pid]["等级"]
      JY.Person[pid]["等级"] = JY.Person[pid]["等级"] + leveladd
      rwsx[1] = (JY.Person[pid]["生命增长"] + Rnd(3)) * leveladd * 3
      AddPersonAttrib(pid, "生命最大值", rwsx[1])
      JY.Person[pid]["生命"] = JY.Person[pid]["生命最大值"]
      JY.Person[pid]["体力"] = CC.PersonAttribMax["体力"]
      JY.Person[pid]["受伤程度"] = 0
      JY.Person[pid]["中毒程度"] = 0
      local cleveradd
      if JY.Person[pid]["资质"] < 30 then
        cleveradd = 1
      elseif JY.Person[pid]["资质"] < 50 then
        cleveradd = 1
      elseif JY.Person[pid]["资质"] < 70 then
        cleveradd = 2
      elseif JY.Person[pid]["资质"] < 90 then
        cleveradd = 2
      else
        cleveradd = 3
      end
      rwsx[2] = (9 - cleveradd) * leveladd * 4
      AddPersonAttrib(pid, "内力最大值", rwsx[2])
      JY.Person[pid]["内力"] = JY.Person[pid]["内力最大值"]
      local i = 0
      for i = 1, leveladd do
        rwsx[3] = rwsx[3] + Rnd(3) + cleveradd
        rwsx[4] = rwsx[4] + Rnd(3) + cleveradd
        rwsx[5] = rwsx[5] + Rnd(3) + cleveradd
        rwsx[6] = rwsx[6] + Rnd(2) + 1
        rwsx[7] = rwsx[7] + Rnd(2) + 1
        rwsx[8] = rwsx[8] + Rnd(2) + 1
        rwsx[9] = rwsx[9] + Rnd(2) + 1
        rwsx[10] = rwsx[10] + Rnd(2) + 1
        rwsx[11] = rwsx[11] + Rnd(2) + 1
        rwsx[12] = rwsx[12] + Rnd(2) + 1
        rwsx[13] = rwsx[13] + Rnd(2) + 1
        for j = 1, 10 do
          if JY.Selpstr[j] ~= nil and pid == 0 then
            AddPersonAttrib(pid, JY.Selpstr[j][1], JY.Selpstr[j][2])
          else
            break
          end
        end
      end
    end
  elseif JY.Person[pid]["姓名"] == "szlzw" or JY.Person[pid]["姓名"] == CC.TSJSName then
    local leveladd = tmplevel - JY.Person[pid]["等级"]
    JY.Person[pid]["等级"] = JY.Person[pid]["等级"] + leveladd
    rwsx[1] = (JY.Person[pid]["生命增长"] + 2) * leveladd * 3
    AddPersonAttrib(pid, "生命最大值", rwsx[1])
    JY.Person[pid]["生命"] = JY.Person[pid]["生命最大值"]
    JY.Person[pid]["体力"] = CC.PersonAttribMax["体力"]
    JY.Person[pid]["受伤程度"] = 0
    JY.Person[pid]["中毒程度"] = 0
    local cleveradd, cleveraddg, cleveraddf, qgadd
    if JY.Person[pid]["资质"] < 15 then
      cleveradd = CC.TSZZADD[1]
      cleveraddg = CC.TSZZADD[1]
      cleveraddf = CC.TSZZADD[7]
      qgadd = CC.TSQGADD[1]
    elseif JY.Person[pid]["资质"] < 30 then
      cleveradd = CC.TSZZADD[2]
      cleveraddg = CC.TSZZADD[2]
      cleveraddf = CC.TSZZADD[6]
      qgadd = CC.TSQGADD[2]
    elseif JY.Person[pid]["资质"] < 45 then
      cleveradd = CC.TSZZADD[3]
      cleveraddg = CC.TSZZADD[3]
      cleveraddf = CC.TSZZADD[5]
      qgadd = CC.TSQGADD[3]
    elseif JY.Person[pid]["资质"] < 60 then
      cleveradd = CC.TSZZADD[4]
      cleveraddg = CC.TSZZADD[4]
      cleveraddf = CC.TSZZADD[4]
      qgadd = CC.TSQGADD[4]
    elseif JY.Person[pid]["资质"] < 75 then
      cleveradd = CC.TSZZADD[5]
      cleveraddg = CC.TSZZADD[5]
      cleveraddf = CC.TSZZADD[3]
      qgadd = CC.TSQGADD[5]
    elseif JY.Person[pid]["资质"] < 90 then
      cleveradd = CC.TSZZADD[6]
      cleveraddg = CC.TSZZADD[6]
      cleveraddf = CC.TSZZADD[2]
      qgadd = CC.TSQGADD[6]
    else
      cleveradd = CC.TSZZADD[7]
      cleveraddg = CC.TSZZADD[7]
      cleveraddf = CC.TSZZADD[1]
      qgadd = CC.TSQGADD[7]
    end
    rwsx[2] = (15 - cleveradd) * leveladd * 5
    AddPersonAttrib(pid, "内力最大值", rwsx[2])
    JY.Person[pid]["内力"] = JY.Person[pid]["内力最大值"]
    for i = 1, leveladd do
      rwsx[3] = rwsx[3] + cleveradd
      rwsx[4] = rwsx[4] + cleveradd
      rwsx[5] = rwsx[5] + qgadd
      rwsx[6] = rwsx[6] + CC.TSUPADD[1]
      rwsx[7] = rwsx[7] + CC.TSUPADD[2]
      rwsx[8] = rwsx[8] + CC.TSUPADD[3]
      rwsx[9] = rwsx[9] + CC.TSUPADD[4]
      rwsx[10] = rwsx[10] + CC.TSUPADD[5]
      rwsx[11] = rwsx[11] + CC.TSUPADD[6]
      rwsx[12] = rwsx[12] + CC.TSUPADD[7]
      rwsx[13] = rwsx[13] + CC.TSUPADD[8]
    end
  else
    local leveladd = tmplevel - JY.Person[pid]["等级"]
    JY.Person[pid]["等级"] = JY.Person[pid]["等级"] + leveladd
    rwsx[1] = (JY.Person[pid]["生命增长"] + Rnd(3)) * leveladd * 3
    AddPersonAttrib(pid, "生命最大值", rwsx[1])
    JY.Person[pid]["生命"] = JY.Person[pid]["生命最大值"]
    JY.Person[pid]["体力"] = CC.PersonAttribMax["体力"]
    JY.Person[pid]["受伤程度"] = 0
    JY.Person[pid]["中毒程度"] = 0
    local cleveradd, cleveraddg, cleveraddf, qgadd
    if JY.Person[pid]["资质"] < 15 then
      cleveradd = CC.ZZADD[1]
      cleveraddg = CC.ZZADD[1]
      cleveraddf = CC.ZZADD[7]
      qgadd = CC.QGADD[1]
    elseif JY.Person[pid]["资质"] < 30 then
      cleveradd = CC.ZZADD[2]
      cleveraddg = CC.ZZADD[2]
      cleveraddf = CC.ZZADD[6]
      qgadd = CC.QGADD[2]
    elseif JY.Person[pid]["资质"] < 45 then
      cleveradd = CC.ZZADD[3]
      cleveraddg = CC.ZZADD[3]
      cleveraddf = CC.ZZADD[5]
      qgadd = CC.QGADD[3]
    elseif JY.Person[pid]["资质"] < 60 then
      cleveradd = CC.ZZADD[4]
      cleveraddg = CC.ZZADD[4]
      cleveraddf = CC.ZZADD[4]
      qgadd = CC.QGADD[4]
    elseif JY.Person[pid]["资质"] < 75 then
      cleveradd = CC.ZZADD[5]
      cleveraddg = CC.ZZADD[5]
      cleveraddf = CC.ZZADD[3]
      qgadd = CC.QGADD[5]
    elseif JY.Person[pid]["资质"] < 90 then
      cleveradd = CC.ZZADD[6]
      cleveraddg = CC.ZZADD[6]
      cleveraddf = CC.ZZADD[2]
      qgadd = CC.QGADD[6]
    else
      cleveradd = CC.ZZADD[7]
      cleveraddg = CC.ZZADD[7]
      cleveraddf = CC.ZZADD[1]
      qgadd = CC.QGADD[7]
    end
    rwsx[2] = (12 - cleveradd) * leveladd * 4
    AddPersonAttrib(pid, "内力最大值", rwsx[2])
    JY.Person[pid]["内力"] = JY.Person[pid]["内力最大值"]
    local i = 0
    for i = 1, leveladd do
      rwsx[3] = rwsx[3] + cleveradd
      rwsx[4] = rwsx[4] + cleveradd
      rwsx[5] = rwsx[5] + qgadd
      rwsx[6] = rwsx[6] + CC.UPADD[1]
      rwsx[7] = rwsx[7] + CC.UPADD[2]
      rwsx[8] = rwsx[8] + CC.UPADD[3]
      rwsx[9] = rwsx[9] + CC.UPADD[4]
      rwsx[10] = rwsx[10] + CC.UPADD[5]
      rwsx[11] = rwsx[11] + CC.UPADD[6]
      rwsx[12] = rwsx[12] + CC.UPADD[7]
      rwsx[13] = rwsx[13] + CC.UPADD[8]
      for j = 1, 10 do
        if JY.Selpstr[j] ~= nil and pid == 0 then
          AddPersonAttrib(pid, JY.Selpstr[j][1], JY.Selpstr[j][2])
        else
          break
        end
      end
    end
  end
  AddPersonAttrib(pid, "攻击力", rwsx[3])
  AddPersonAttrib(pid, "防御力", rwsx[4])
  AddPersonAttrib(pid, "轻功", rwsx[5])
  if JY.Person[pid]["医疗能力"] >= CC.SXYQ then
    AddPersonAttrib(pid, "医疗能力", rwsx[6])
  end
  if JY.Person[pid]["用毒能力"] >= CC.SXYQ then
    AddPersonAttrib(pid, "用毒能力", rwsx[7])
  end
  if JY.Person[pid]["解毒能力"] >= CC.SXYQ then
    AddPersonAttrib(pid, "解毒能力", rwsx[8])
  end
  if JY.Person[pid]["拳掌功夫"] >= CC.YXBQZ then
    AddPersonAttrib(pid, "拳掌功夫", rwsx[9])
  end
  if JY.Person[pid]["御剑能力"] >= CC.YXBQZ then
    AddPersonAttrib(pid, "御剑能力", rwsx[10])
  end
  if JY.Person[pid]["耍刀技巧"] >= CC.YXBQZ then
    AddPersonAttrib(pid, "耍刀技巧", rwsx[11])
  end
  if JY.Person[pid]["特殊兵器"] >= CC.YXBQZ then
    AddPersonAttrib(pid, "特殊兵器", rwsx[12])
  end
  if JY.Person[pid]["暗器技巧"] >= CC.YXBQZ then
    AddPersonAttrib(pid, "暗器技巧", rwsx[13])
  end
  Cls()
  local size = CC.DefaultFont
  local x1 = CC.ScreenW / 2 - size * 7
  local ysize = size * 1.1
  local y1 = size
  local x2 = CC.ScreenW / 2 + size * 7
  local y2 = CC.ScreenH - y1
  DrawBox(x1, y1, x2, y2, C_WHITE)
  DrawString(x1 + size, y1 + ysize * 0, string.format("%-8s", JY.Person[pid]["姓名"]), C_GOLD, size)
  DrawString(x1 + size * 6, y1 + ysize * 0, "升级了", C_WHITE, size)
  if JY.Person[pid]["等级"] >= CC.Level then
    DrawString(x1 + size, y1 + ysize * 1, string.format("等级 %4d", JY.Person[pid]["等级"]), C_GOLD, size)
    DrawString(x1 + size * 6, y1 + ysize * 1, "达到上限", C_ORANGE, size)
  else
    DrawString(x1 + size, y1 + ysize * 1, string.format("等级 %4d", sjq[0]), C_GOLD, size)
    DrawString(x1 + size * 6, y1 + ysize * 1, string.format("→ %4d", JY.Person[pid]["等级"]), C_WHITE, size)
    DrawString(x1 + size * 10, y1 + ysize * 1, string.format("↑%4d", levela), C_ORANGE, size)
  end
  DrawString(x1 + size, y1 + ysize * 2, string.format("经验 %4d", JY.Person[pid]["经验"] - JY.JSEXP), C_GOLD, size)
  DrawString(x1 + size * 6, y1 + ysize * 2, string.format("→ %4d", JY.Person[pid]["经验"]), C_WHITE, size)
  DrawString(x1 + size * 10, y1 + ysize * 2, string.format("↑%4d", JY.JSEXP), C_ORANGE, size)
  if JY.Person[pid]["生命最大值"] >= CC.PersonAttribMax["生命最大值"] then
    DrawString(x1 + size, y1 + ysize * 3, string.format("生命 %4d", JY.Person[pid]["生命最大值"]), C_GOLD, size)
    DrawString(x1 + size * 6, y1 + ysize * 3, "达到上限", C_ORANGE, size)
  else
    DrawString(x1 + size, y1 + ysize * 3, string.format("生命 %4d", sjq[1]), C_GOLD, size)
    DrawString(x1 + size * 6, y1 + ysize * 3, string.format("→ %4d", JY.Person[pid]["生命最大值"]), C_WHITE, size)
    DrawString(x1 + size * 10, y1 + ysize * 3, string.format("↑%4d", rwsx[1]), C_ORANGE, size)
  end
  if JY.Person[pid]["内力最大值"] >= CC.PersonAttribMax["内力最大值"] then
    DrawString(x1 + size, y1 + ysize * 4, string.format("内力 %4d", JY.Person[pid]["内力最大值"]), C_GOLD, size)
    DrawString(x1 + size * 6, y1 + ysize * 4, "达到上限", C_ORANGE, size)
  else
    DrawString(x1 + size, y1 + ysize * 4, string.format("内力 %4d", sjq[2]), C_GOLD, size)
    DrawString(x1 + size * 6, y1 + ysize * 4, string.format("→ %4d", JY.Person[pid]["内力最大值"]), C_WHITE, size)
    DrawString(x1 + size * 10, y1 + ysize * 4, string.format("↑%4d", rwsx[2]), C_ORANGE, size)
  end
  if JY.Person[pid]["攻击力"] >= CC.PersonAttribMax["攻击力"] then
    DrawString(x1 + size, y1 + ysize * 5, string.format("攻击 %4d", JY.Person[pid]["攻击力"]), C_GOLD, size)
    DrawString(x1 + size * 6, y1 + ysize * 5, "达到上限", C_ORANGE, size)
  else
    DrawString(x1 + size, y1 + ysize * 5, string.format("攻击 %4d", sjq[3]), C_GOLD, size)
    DrawString(x1 + size * 6, y1 + ysize * 5, string.format("→ %4d", JY.Person[pid]["攻击力"]), C_WHITE, size)
    DrawString(x1 + size * 10, y1 + ysize * 5, string.format("↑%4d", rwsx[3]), C_ORANGE, size)
  end
  if JY.Person[pid]["防御力"] >= CC.PersonAttribMax["防御力"] then
    DrawString(x1 + size, y1 + ysize * 6, string.format("防御 %4d", JY.Person[pid]["防御力"]), C_GOLD, size)
    DrawString(x1 + size * 6, y1 + ysize * 6, "达到上限", C_ORANGE, size)
  else
    DrawString(x1 + size, y1 + ysize * 6, string.format("防御 %4d", sjq[4]), C_GOLD, size)
    DrawString(x1 + size * 6, y1 + ysize * 6, string.format("→ %4d", JY.Person[pid]["防御力"]), C_WHITE, size)
    DrawString(x1 + size * 10, y1 + ysize * 6, string.format("↑%4d", rwsx[4]), C_ORANGE, size)
  end
  if JY.Person[pid]["轻功"] >= CC.PersonAttribMax["轻功"] then
    DrawString(x1 + size, y1 + ysize * 7, string.format("轻功 %4d", JY.Person[pid]["轻功"]), C_GOLD, size)
    DrawString(x1 + size * 6, y1 + ysize * 7, "达到上限", C_ORANGE, size)
  else
    DrawString(x1 + size, y1 + ysize * 7, string.format("轻功 %4d", sjq[5]), C_GOLD, size)
    DrawString(x1 + size * 6, y1 + ysize * 7, string.format("→ %4d", JY.Person[pid]["轻功"]), C_WHITE, size)
    DrawString(x1 + size * 10, y1 + ysize * 7, string.format("↑%4d", rwsx[5]), C_ORANGE, size)
  end
  if JY.Person[pid]["医疗能力"] >= CC.PersonAttribMax["医疗能力"] then
    DrawString(x1 + size, y1 + ysize * 8, string.format("医疗 %4d", JY.Person[pid]["医疗能力"]), C_GOLD, size)
    DrawString(x1 + size * 6, y1 + ysize * 8, "达到上限", C_ORANGE, size)
  else
    DrawString(x1 + size, y1 + ysize * 8, string.format("医疗 %4d", sjq[6]), C_GOLD, size)
    DrawString(x1 + size * 6, y1 + ysize * 8, string.format("→ %4d", JY.Person[pid]["医疗能力"]), C_WHITE, size)
    if rwsx[6] ~= 0 and JY.Person[pid]["医疗能力"] >= CC.SXYQ then
      DrawString(x1 + size * 10, y1 + ysize * 8, string.format("↑%4d", rwsx[6]), C_ORANGE, size)
    end
  end
  if JY.Person[pid]["用毒能力"] >= CC.PersonAttribMax["用毒能力"] then
    DrawString(x1 + size, y1 + ysize * 9, string.format("用毒 %4d", JY.Person[pid]["用毒能力"]), C_GOLD, size)
    DrawString(x1 + size * 6, y1 + ysize * 9, "达到上限", C_ORANGE, size)
  else
    DrawString(x1 + size, y1 + ysize * 9, string.format("用毒 %4d", sjq[7]), C_GOLD, size)
    DrawString(x1 + size * 6, y1 + ysize * 9, string.format("→ %4d", JY.Person[pid]["用毒能力"]), C_WHITE, size)
    if rwsx[7] ~= 0 and JY.Person[pid]["用毒能力"] >= CC.SXYQ then
      DrawString(x1 + size * 10, y1 + ysize * 9, string.format("↑%4d", rwsx[7]), C_ORANGE, size)
    end
  end
  if JY.Person[pid]["解毒能力"] >= CC.PersonAttribMax["解毒能力"] then
    DrawString(x1 + size, y1 + ysize * 10, string.format("解毒 %4d", JY.Person[pid]["解毒能力"]), C_GOLD, size)
    DrawString(x1 + size * 6, y1 + ysize * 10, "达到上限", C_ORANGE, size)
  else
    DrawString(x1 + size, y1 + ysize * 10, string.format("解毒 %4d", sjq[8]), C_GOLD, size)
    DrawString(x1 + size * 6, y1 + ysize * 10, string.format("→ %4d", JY.Person[pid]["解毒能力"]), C_WHITE, size)
    if rwsx[8] ~= 0 and JY.Person[pid]["解毒能力"] >= CC.SXYQ then
      DrawString(x1 + size * 10, y1 + ysize * 10, string.format("↑%4d", rwsx[8]), C_ORANGE, size)
    end
  end
  if JY.Person[pid]["拳掌功夫"] >= CC.PersonAttribMax["拳掌功夫"] then
    DrawString(x1 + size, y1 + ysize * 11, string.format("拳掌 %4d", JY.Person[pid]["拳掌功夫"]), C_GOLD, size)
    DrawString(x1 + size * 6, y1 + ysize * 11, "达到上限", C_ORANGE, size)
  else
    DrawString(x1 + size, y1 + ysize * 11, string.format("拳掌 %4d", sjq[9]), C_GOLD, size)
    DrawString(x1 + size * 6, y1 + ysize * 11, string.format("→ %4d", JY.Person[pid]["拳掌功夫"]), C_WHITE, size)
    if rwsx[9] ~= 0 and JY.Person[pid]["拳掌功夫"] >= CC.YXBQZ then
      DrawString(x1 + size * 10, y1 + ysize * 11, string.format("↑%4d", rwsx[9]), C_ORANGE, size)
    end
  end
  if JY.Person[pid]["御剑能力"] >= CC.PersonAttribMax["御剑能力"] then
    DrawString(x1 + size, y1 + ysize * 12, string.format("御剑 %4d", JY.Person[pid]["御剑能力"]), C_GOLD, size)
    DrawString(x1 + size * 6, y1 + ysize * 12, "达到上限", C_ORANGE, size)
  else
    DrawString(x1 + size, y1 + ysize * 12, string.format("御剑 %4d", sjq[10]), C_GOLD, size)
    DrawString(x1 + size * 6, y1 + ysize * 12, string.format("→ %4d", JY.Person[pid]["御剑能力"]), C_WHITE, size)
    if rwsx[10] ~= 0 and JY.Person[pid]["御剑能力"] >= CC.YXBQZ then
      DrawString(x1 + size * 10, y1 + ysize * 12, string.format("↑%4d", rwsx[10]), C_ORANGE, size)
    end
  end
  if JY.Person[pid]["耍刀技巧"] >= CC.PersonAttribMax["耍刀技巧"] then
    DrawString(x1 + size, y1 + ysize * 13, string.format("耍刀 %4d", JY.Person[pid]["耍刀技巧"]), C_GOLD, size)
    DrawString(x1 + size * 6, y1 + ysize * 13, "达到上限", C_ORANGE, size)
  else
    DrawString(x1 + size, y1 + ysize * 13, string.format("耍刀 %4d", sjq[11]), C_GOLD, size)
    DrawString(x1 + size * 6, y1 + ysize * 13, string.format("→ %4d", JY.Person[pid]["耍刀技巧"]), C_WHITE, size)
    if rwsx[11] ~= 0 and JY.Person[pid]["耍刀技巧"] >= CC.YXBQZ then
      DrawString(x1 + size * 10, y1 + ysize * 13, string.format("↑%4d", rwsx[11]), C_ORANGE, size)
    end
  end
  if JY.Person[pid]["特殊兵器"] >= CC.PersonAttribMax["特殊兵器"] then
    DrawString(x1 + size, y1 + ysize * 14, string.format("特殊 %4d", JY.Person[pid]["特殊兵器"]), C_GOLD, size)
    DrawString(x1 + size * 6, y1 + ysize * 14, "达到上限", C_ORANGE, size)
  else
    DrawString(x1 + size, y1 + ysize * 14, string.format("特殊 %4d", sjq[12]), C_GOLD, size)
    DrawString(x1 + size * 6, y1 + ysize * 14, string.format("→ %4d", JY.Person[pid]["特殊兵器"]), C_WHITE, size)
    if rwsx[13] ~= 0 and JY.Person[pid]["特殊兵器"] >= CC.YXBQZ then
      DrawString(x1 + size * 10, y1 + ysize * 14, string.format("↑%4d", rwsx[12]), C_ORANGE, size)
    end
  end
  if JY.Person[pid]["暗器技巧"] >= CC.PersonAttribMax["暗器技巧"] then
    DrawString(x1 + size, y1 + ysize * 15, string.format("暗器 %4d", JY.Person[pid]["暗器技巧"]), C_GOLD, size)
    DrawString(x1 + size * 6, y1 + ysize * 15, "达到上限", C_ORANGE, size)
  else
    DrawString(x1 + size, y1 + ysize * 15, string.format("暗器 %4d", sjq[13]), C_GOLD, size)
    DrawString(x1 + size * 6, y1 + ysize * 15, string.format("→ %4d", JY.Person[pid]["暗器技巧"]), C_WHITE, size)
    if rwsx[12] ~= 0 and JY.Person[pid]["暗器技巧"] >= CC.YXBQZ then
      DrawString(x1 + size * 10, y1 + ysize * 15, string.format("↑%4d", rwsx[13]), C_ORANGE, size)
    end
  end
  ShowScreen()
  WaitKey()
  return true
end
function War_PersonTrainBook(pid)
  local p = JY.Person[pid]
  local thingid = p["修炼物品"]
  if thingid < 0 then
    return
  end
  local wugongid = JY.Thing[thingid]["练出武功"]
  local needpoint = TrainNeedExp(pid)
  local mijilev = 0
  while needpoint <= p["修炼点数"] do
    local tf = true
    local wgpd = 0
    for i = 1, 10 do
      if 0 >= p["武功" .. i] then
        tf = false
        break
      else
        wgpd = 1
      end
    end
    local tf1 = true
    if tf then
      for i = 1, 10 do
        if p["武功" .. i] == wugongid then
          tf1 = false
          break
        end
      end
    end
    if tf and tf1 and wgpd == 1 then
      return
    end
    if needpoint <= p["修炼点数"] then
      local ndnd = JY.NDPER / 100
      if ndnd < 1 then
        ndnd = 1
      end
      AddPersonAttrib(pid, "生命最大值", JY.Thing[thingid]["加生命最大值"])
      AddPersonAttrib(pid, "生命", JY.Thing[thingid]["加生命"])
      if JY.Thing[thingid]["改变内力性质"] == 2 then
        p["内力性质"] = 2
      end
      AddPersonAttrib(pid, "内力最大值", JY.Thing[thingid]["加内力最大值"])
      AddPersonAttrib(pid, "内力", JY.Thing[thingid]["加内力"])
      AddPersonAttrib(pid, "攻击力", JY.Thing[thingid]["加攻击力"])
      AddPersonAttrib(pid, "轻功", JY.Thing[thingid]["加轻功"])
      AddPersonAttrib(pid, "防御力", JY.Thing[thingid]["加防御力"])
      AddPersonAttrib(pid, "医疗能力", JY.Thing[thingid]["加医疗能力"])
      AddPersonAttrib(pid, "用毒能力", JY.Thing[thingid]["加用毒能力"])
      AddPersonAttrib(pid, "解毒能力", JY.Thing[thingid]["加解毒能力"])
      AddPersonAttrib(pid, "抗毒能力", JY.Thing[thingid]["加抗毒能力"])
      AddPersonAttrib(pid, "拳掌功夫", JY.Thing[thingid]["加拳掌功夫"])
      AddPersonAttrib(pid, "御剑能力", JY.Thing[thingid]["加御剑能力"])
      AddPersonAttrib(pid, "耍刀技巧", JY.Thing[thingid]["加耍刀技巧"])
      AddPersonAttrib(pid, "特殊兵器", JY.Thing[thingid]["加特殊兵器"])
      AddPersonAttrib(pid, "暗器技巧", JY.Thing[thingid]["加暗器技巧"])
      AddPersonAttrib(pid, "武学常识", JY.Thing[thingid]["加武学常识"])
      AddPersonAttrib(pid, "品德", JY.Thing[thingid]["加品德"])
      AddPersonAttrib(pid, "攻击带毒", JY.Thing[thingid]["加攻击带毒"])
      if JY.Thing[thingid]["加攻击次数"] == 1 then
        p["左右互搏"] = 1
      end
      local xlmj = {}
      local xlmjstr = {}
      xlmjstr[1] = "生命最大值"
      xlmjstr[2] = "内力最大值"
      xlmjstr[3] = "攻击力"
      xlmjstr[4] = "轻功"
      xlmjstr[5] = "防御力"
      xlmjstr[6] = "医疗能力"
      xlmjstr[7] = "用毒能力"
      xlmjstr[8] = "解毒能力"
      xlmjstr[9] = "抗毒能力"
      xlmjstr[10] = "拳掌能力"
      xlmjstr[11] = "御剑能力"
      xlmjstr[12] = "耍刀技巧"
      xlmjstr[13] = "特殊兵器"
      xlmjstr[14] = "暗器技巧"
      xlmjstr[15] = "武学常识"
      xlmjstr[16] = "品德"
      xlmjstr[17] = "攻击带毒"
      xlmjstr[18] = "攻击次数"
      xlmjstr[19] = "内力转为调和"
      xlmj[1] = JY.Thing[thingid]["加生命最大值"]
      xlmj[2] = JY.Thing[thingid]["加内力最大值"]
      xlmj[3] = JY.Thing[thingid]["加攻击力"]
      xlmj[4] = JY.Thing[thingid]["加轻功"]
      xlmj[5] = JY.Thing[thingid]["加防御力"]
      xlmj[6] = JY.Thing[thingid]["加医疗能力"]
      xlmj[7] = JY.Thing[thingid]["加用毒能力"]
      xlmj[8] = JY.Thing[thingid]["加解毒能力"]
      xlmj[9] = JY.Thing[thingid]["加抗毒能力"]
      xlmj[10] = JY.Thing[thingid]["加拳掌功夫"]
      xlmj[11] = JY.Thing[thingid]["加御剑能力"]
      xlmj[12] = JY.Thing[thingid]["加耍刀技巧"]
      xlmj[13] = JY.Thing[thingid]["加特殊兵器"]
      xlmj[14] = JY.Thing[thingid]["加暗器技巧"]
      xlmj[15] = JY.Thing[thingid]["加武学常识"]
      xlmj[16] = JY.Thing[thingid]["加品德"]
      xlmj[17] = JY.Thing[thingid]["加攻击带毒"]
      xlmj[18] = JY.Thing[thingid]["加攻击次数"]
      xlmj[19] = JY.Thing[thingid]["改变内力性质"]
      local size = CC.DefaultFont
      local x1 = CC.ScreenW / 2 - size * 7
      local ysize = size * 1.1
      local y1 = size * 4
      local x2 = CC.ScreenW / 2 + size * 7
      local y2 = CC.ScreenH - y1
      Cls()
      DrawBox(x1, y1, x2, y2, C_WHITE)
      DrawString(x1 + size, y1 + ysize * 0, string.format("%s", p["姓名"]), C_GOLD, size)
      p["修炼点数"] = p["修炼点数"] - needpoint
      mijilev = mijilev + 1
      if 0 <= wugongid then
        local oldwugong = 0
        for i = 1, 10 do
          if p["武功" .. i] == wugongid then
            oldwugong = 1
            p["武功等级" .. i] = p["武功等级" .. i] + 100
            if p["修炼点数"] < TrainNeedExp(pid) and 10 > math.modf(p["武功等级" .. i] / 100) + 1 then
              DrawString(x1 + size, y1 + ysize * 1, string.format("修炼 %s 成功", JY.Thing[thingid]["名称"]), C_WHITE, size)
              DrawString(x1 + size, y1 + ysize * 2, string.format("%s 从%d级升至%d级", JY.Wugong[wugongid]["名称"], math.modf(p["武功等级" .. i] / 100) + 1 - mijilev, math.modf(p["武功等级" .. i] / 100) + 1), C_WHITE, size)
              local wggjl1
              if 0 < math.modf(p["武功等级" .. i] / 100) + 1 - mijilev then
                wggjl1 = JY.Wugong[wugongid]["攻击力" .. math.modf(p["武功等级" .. i] / 100) + 1 - mijilev]
              else
                wggjl1 = 0
              end
              local wggjl2 = JY.Wugong[wugongid]["攻击力" .. math.modf(p["武功等级" .. i] / 100) + 1]
              DrawString(x1 + size, y1 + ysize * 3, string.format("武功威力 %d → %d", wggjl1, wggjl2), C_WHITE, size)
              local k = 1
              for j = 1, 18 do
                if 0 < xlmj[j] or xlmj[j] < 0 then
                  if 0 < xlmj[j] then
                    DrawString(x1 + size, y1 + ysize * (3 + k), string.format("%-10s +%2d", xlmjstr[j], xlmj[j] * mijilev), C_WHITE, size)
                  else
                    DrawString(x1 + size, y1 + ysize * (3 + k), string.format("%-10s  %2d", xlmjstr[j], xlmj[j] * mijilev), C_WHITE, size)
                  end
                  k = k + 1
                end
              end
            end
            local wgdj = math.modf(p["武功等级" .. i] / 100) + 1
            if 10 <= wgdj then
              DrawString(x1 + size, y1 + ysize * 1, string.format("修炼 %s 成功", JY.Thing[thingid]["名称"]), C_WHITE, size)
              DrawString(x1 + size, y1 + ysize * 2, string.format("%s 从%d级升至%d级", JY.Wugong[wugongid]["名称"], math.modf(p["武功等级" .. i] / 100) + 1 - mijilev, math.modf(p["武功等级" .. i] / 100) + 1), C_WHITE, size)
              local wggjl1
              if 0 < math.modf(p["武功等级" .. i] / 100) + 1 - mijilev then
                wggjl1 = JY.Wugong[wugongid]["攻击力" .. math.modf(p["武功等级" .. i] / 100) + 1 - mijilev]
              else
                wggjl1 = 0
              end
              local wggjl2 = JY.Wugong[wugongid]["攻击力" .. math.modf(p["武功等级" .. i] / 100) + 1]
              DrawString(x1 + size, y1 + ysize * 3, string.format("武功威力 %d → %d", wggjl1, wggjl2), C_WHITE, size)
              local k = 1
              for j = 1, 18 do
                if 0 < xlmj[j] or xlmj[j] < 0 then
                  if 0 < xlmj[j] then
                    DrawString(x1 + size, y1 + ysize * (3 + k), string.format("%-10s +%2d", xlmjstr[j], xlmj[j] * mijilev), C_WHITE, size)
                  else
                    DrawString(x1 + size, y1 + ysize * (3 + k), string.format("%-10s  %2d", xlmjstr[j], xlmj[j] * mijilev), C_WHITE, size)
                  end
                  k = k + 1
                end
              end
              ShowScreen()
              WaitKey()
              return
            end
            break
          end
        end
        if oldwugong == 0 then
          if 0 < p["武功10"] and 0 <= JY.Thing[thingid]["练出武功"] then
            JY.ZUOBI = 1
            return
          end
          local k = 1
          for i = 1, 10 do
            if p["武功" .. i] == 0 then
              p["武功" .. i] = wugongid
              DrawString(x1 + size, y1 + ysize * 1, string.format("修炼 %s 成功", JY.Thing[thingid]["名称"]), C_WHITE, size)
              DrawString(x1 + size, y1 + ysize * 2, string.format("%s 从%d级升至%d级", JY.Wugong[wugongid]["名称"], math.modf(p["武功等级" .. i] / 100) + 1 - mijilev, math.modf(p["武功等级" .. i] / 100) + 1), C_WHITE, size)
              local wggjl1
              if 0 < math.modf(p["武功等级" .. i] / 100) + 1 - mijilev then
                wggjl1 = JY.Wugong[wugongid]["攻击力" .. math.modf(p["武功等级" .. i] / 100) + 1 - mijilev]
              else
                wggjl1 = 0
              end
              local wggjl2 = JY.Wugong[wugongid]["攻击力" .. math.modf(p["武功等级" .. i] / 100) + 1]
              DrawString(x1 + size, y1 + ysize * 3, string.format("武功威力 %d → %d", wggjl1, wggjl2), C_WHITE, size)
              for j = 1, 18 do
                if 0 < xlmj[j] or xlmj[j] < 0 then
                  if 0 < xlmj[j] then
                    DrawString(x1 + size, y1 + ysize * (3 + k), string.format("%-10s +%2d", xlmjstr[j], xlmj[j] * mijilev), C_WHITE, size)
                  else
                    DrawString(x1 + size, y1 + ysize * (3 + k), string.format("%-10s  %2d", xlmjstr[j], xlmj[j] * mijilev), C_WHITE, size)
                  end
                  k = k + 1
                end
              end
              break
            end
          end
          if xlmj[19] == 2 then
            DrawString(x1 + size, y1 + ysize * (3 + k), string.format(xlmjstr[19]), C_WHITE, size)
          end
        end
      elseif p["修炼点数"] < TrainNeedExp(pid) then
        DrawString(x1 + size, y1 + ysize * 1, string.format("修炼 %s 成功", JY.Thing[thingid]["名称"]), C_WHITE, size)
        local k = 0
        for j = 1, 18 do
          if 0 < xlmj[j] or xlmj[j] < 0 then
            if 0 < xlmj[j] then
              DrawString(x1 + size, y1 + ysize * (2 + k), string.format("%-10s +%2d", xlmjstr[j], xlmj[j] * mijilev), C_WHITE, size)
            else
              DrawString(x1 + size, y1 + ysize * (2 + k), string.format("%-10s  %2d", xlmjstr[j], xlmj[j] * mijilev), C_WHITE, size)
            end
            k = k + 1
          end
        end
        if xlmj[19] == 2 then
          DrawString(x1 + size, y1 + ysize * (2 + k), string.format(xlmjstr[19]), C_WHITE, size)
        end
      end
      if p["修炼点数"] < TrainNeedExp(pid) then
        ShowScreen()
        WaitKey()
      end
      needpoint = TrainNeedExp(pid)
    else
      return
    end
  end
end
function War_PersonTrainDrug(pid)
  local p = JY.Person[pid]
  local thingid = p["修炼物品"]
  if thingid < 0 then
    return
  end
  if 0 >= JY.Thing[thingid]["练出物品需经验"] then
    return
  end
  local needpoint = (7 - math.modf(p["资质"] / 15)) * JY.Thing[thingid]["练出物品需经验"]
  if needpoint > p["物品修炼点数"] then
    return
  end
  local haveMaterial = 0
  local MaterialNum = -1
  for i = 1, CC.MyThingNum do
    if JY.Base["物品" .. i] == JY.Thing[thingid]["需材料"] then
      haveMaterial = 1
      MaterialNum = JY.Base["物品数量" .. i]
      break
    end
  end
  if haveMaterial == 1 then
    local enough = {}
    local canMake = 0
    for i = 1, 5 do
      if MaterialNum >= JY.Thing[thingid]["需要物品数量" .. i] and 0 <= JY.Thing[thingid]["练出物品" .. i] then
        canMake = 1
        enough[i] = 1
      else
        enough[i] = 0
      end
    end
    if canMake == 1 then
      local makeID
      local makenum = 0
      for i = 1, 5 do
        if 0 < JY.Thing[thingid]["练出物品" .. i] then
          makenum = makenum + 1
        end
      end
      while true do
        makeID = Rnd(5) + 1
        if enough[makeID] == 1 then
          break
        end
      end
      local newThingID = JY.Thing[thingid]["练出物品" .. makeID]
      if 0 <= newThingID then
        local wpnum = 0
        if instruct_18(newThingID) == true then
          wpnum = 2 + Rnd(2)
          instruct_32(newThingID, wpnum)
        else
          wpnum = 2 + Rnd(2)
          instruct_32(newThingID, wpnum)
        end
        Cls()
        if JY.Thing[newThingID]["类型"] == 3 or JY.Thing[newThingID]["类型"] == 4 then
          DrawStrBoxWaitKey(string.format("%s 制造出%d个%s %s-%d，剩余%d%s", p["姓名"], wpnum, JY.Thing[newThingID]["名称"], JY.Thing[JY.Thing[thingid]["需材料"]]["名称"], JY.Thing[thingid]["需要物品数量" .. makeID], MaterialNum - JY.Thing[thingid]["需要物品数量" .. makeID], JY.Thing[JY.Thing[thingid]["需材料"]]["名称"]), C_WHITE, CC.DefaultFont)
        end
        instruct_32(JY.Thing[thingid]["需材料"], -JY.Thing[thingid]["需要物品数量" .. makeID])
        p["物品修炼点数"] = p["物品修炼点数"] - needpoint
      end
    end
  end
end
function War_isEnd()
  JY.WARWF = 0
  JY.WARDF = 0
  for i = 0, WAR.PersonNum - 1 do
    if 0 >= JY.Person[WAR.Person[i]["人物编号"]]["生命"] then
      WAR.Person[i]["死亡"] = true
    end
    if WAR.Person[i]["死亡"] == false then
      if WAR.Person[i]["我方"] then
        JY.WARWF = JY.WARWF + 1
      else
        JY.WARDF = JY.WARDF + 1
      end
    end
  end
  WarSetPerson()
  Cls()
  ShowScreen()
  local myNum = 0
  local EmenyNum = 0
  for i = 0, WAR.PersonNum - 1 do
    if WAR.Person[i]["死亡"] == false then
      if WAR.Person[i]["我方"] == true then
        myNum = 1
      else
        EmenyNum = 1
      end
    end
  end
  if EmenyNum == 0 then
    return 1
  end
  if myNum == 0 then
    return 2
  end
  return 0
end
function WarSelectTeam()
  WAR.PersonNum = 0
  JY.WN = 0
  while true do
    for i = 1, 6 do
      local id = WAR.Data["自动选择参战人" .. i]
      if 0 <= id then
        WAR.Person[WAR.PersonNum]["人物编号"] = id
        WAR.Person[WAR.PersonNum]["我方"] = true
        WAR.Person[WAR.PersonNum]["坐标X"] = WAR.Data["我方X" .. i]
        WAR.Person[WAR.PersonNum]["坐标Y"] = WAR.Data["我方Y" .. i]
        WAR.Person[WAR.PersonNum]["死亡"] = false
        WAR.Person[WAR.PersonNum]["人方向"] = 2
        WAR.PersonNum = WAR.PersonNum + 1
      end
    end
    if WAR.PersonNum > 0 then
      return
    end
    local warxrpd = 0
    for i = 1, CC.TeamNum do
      WAR.SelectPerson[i] = 0
      local id = JY.Base["队伍" .. i]
      if 0 <= id then
        for j = 1, 6 do
          if WAR.Data["手动选择参战人" .. j] == id then
            WAR.SelectPerson[i] = 1
            warxrpd = 1
          end
        end
      end
    end
    if 0 < WAR.SelectPerson[1] then
      WAR.SelectPerson[1] = 0
    end
    local menu = {}
    for i = 1, CC.TeamNum do
      menu[i] = {
        "",
        WarSelectMenu,
        0
      }
      local id = JY.Base["队伍" .. i]
      if 0 <= id then
        menu[i][3] = 1
        local s = JY.Person[id]["姓名"]
        if WAR.SelectPerson[i] == 1 then
          menu[i][1] = "出战  " .. s
          JY.WN = JY.WN + 1
        else
          menu[i][1] = "      " .. s
          for j = 1, CC.TeamNum do
            if zdyx[j][2] == id then
              WAR.SelectPerson[i] = 2
              menu[i][1] = "出战  " .. s
              warxrpd = 1
              JY.WN = JY.WN + 1
            end
          end
        end
      end
    end
    menu[CC.TeamNum + 1] = {
      "  选择全部",
      WarSelectMenu1,
      1
    }
    if warxrpd == 1 then
      menu[CC.TeamNum + 2] = {
        "  开始战斗",
        nil,
        2
      }
    else
      menu[CC.TeamNum + 2] = {
        "  开始战斗",
        nil,
        1
      }
    end
    Cls()
    local x = (CC.ScreenW - 7 * CC.DefaultFont - 2 * CC.MenuBorderPixel) / 2
    DrawStrBox(x, 10, "请选择参战人物", C_WHITE, CC.DefaultFont)
    local r = ShowMenu(menu, CC.TeamNum + 2, 0, x, 10 + CC.SingleLineHeight, 0, 0, 1, 0, CC.DefaultFont, C_ORANGE, C_WHITE)
    Cls()
    local rwwz = 0
    for i = 1, CC.TeamNum do
      if 0 < WAR.SelectPerson[i] then
        WAR.Person[WAR.PersonNum]["人物编号"] = JY.Base["队伍" .. i]
        WAR.Person[WAR.PersonNum]["我方"] = true
        if CC.TeamNum == 6 then
          WAR.Person[WAR.PersonNum]["坐标X"] = WAR.Data["我方X" .. i]
          WAR.Person[WAR.PersonNum]["坐标Y"] = WAR.Data["我方Y" .. i]
        elseif rwwz < 6 then
          rwwz = rwwz + 1
          WAR.Person[WAR.PersonNum]["坐标X"] = WAR.Data["我方X" .. rwwz]
          WAR.Person[WAR.PersonNum]["坐标Y"] = WAR.Data["我方Y" .. rwwz]
        else
          rwwz = rwwz + 1
          while true do
            local xkk = Rnd(3) - 1
            local ykk = Rnd(3) - 1
            local kkpd = true
            for j = 1, 20 do
              if WAR.Data["敌方X" .. j] == WAR.Data["我方X" .. rwwz - 6] + xkk and WAR.Data["敌方Y" .. j] == WAR.Data["我方Y" .. rwwz - 6] + ykk then
                kkpd = false
                break
              end
            end
            for j = 1, 6 do
              if WAR.Data["我方X" .. j] == WAR.Data["我方X" .. rwwz - 6] + xkk and WAR.Data["我方Y" .. j] == WAR.Data["我方Y" .. rwwz - 6] + ykk then
                kkpd = false
                break
              end
            end
            if kkpd then
              WAR.Person[WAR.PersonNum]["坐标X"] = WAR.Data["我方X" .. rwwz - 6] + xkk
              WAR.Person[WAR.PersonNum]["坐标Y"] = WAR.Data["我方Y" .. rwwz - 6] + ykk
              break
            end
          end
        end
        WAR.Person[WAR.PersonNum]["死亡"] = false
        WAR.Person[WAR.PersonNum]["人方向"] = 2
        WAR.PersonNum = WAR.PersonNum + 1
        zdyx[i][1] = 2
        zdyx[i][2] = JY.Base["队伍" .. i]
      else
        zdyx[i][1] = 0
        zdyx[i][2] = -1
      end
    end
    if WAR.PersonNum == 0 then
      WAR.SelectPerson[1] = 2
      zdyx[1][1] = 2
      zdyx[1][2] = JY.Base["队伍" .. 1]
    end
    if WAR.PersonNum > 0 then
      xzqbpd = 3
      break
    end
  end
end
function WarSelectMenu(newmenu, newid)
  local id = newmenu[newid][4]
  if WAR.SelectPerson[id] == 0 then
    JY.WN = JY.WN + 1
    WAR.SelectPerson[id] = 2
    if JY.WN > CC.TeamWarNum then
      WAR.SelectPerson[id] = 0
      JY.WN = JY.WN - 1
    end
  elseif WAR.SelectPerson[id] == 2 then
    WAR.SelectPerson[id] = 0
    JY.WN = JY.WN - 1
  end
  if WAR.SelectPerson[id] > 0 then
    newmenu[newid][1] = "出战  " .. string.sub(newmenu[newid][1], 7)
  else
    newmenu[newid][1] = "      " .. string.sub(newmenu[newid][1], 7)
  end
  return 0
end
function WarSelectMenu1(newmenu, newid)
  if xzqbpd == 0 then
    xzqbpd = 3
  elseif xzqbpd == 3 then
    xzqbpd = 0
  end
  for i = 1, newid - 1 do
    local id = JY.Base["队伍" .. i]
    if 0 <= id then
      newmenu[i][3] = 1
    end
  end
  local zdnum = 0
  if xzqbpd == 0 then
    for i = 1, newid - 1 do
      if WAR.SelectPerson[i] ~= 1 and newmenu[i][3] ~= 0 then
        if WAR.SelectPerson[i] == 0 then
          JY.WN = JY.WN + 1
          if JY.WN > CC.TeamWarNum then
            WAR.SelectPerson[i] = 0
            newmenu[i][1] = "      " .. string.sub(newmenu[i][1], 7)
            JY.WN = JY.WN - 1
          else
            newmenu[i][1] = "出战  " .. string.sub(newmenu[i][1], 7)
            WAR.SelectPerson[i] = 2
          end
        else
          newmenu[i][1] = "出战  " .. string.sub(newmenu[i][1], 7)
          WAR.SelectPerson[i] = 2
        end
      end
      if 0 < WAR.SelectPerson[i] then
        zdnum = zdnum + 1
      end
    end
    newmenu[newid][1] = "  取消全部"
  else
    for i = 1, newid - 1 do
      if WAR.SelectPerson[i] ~= 1 and newmenu[i][3] ~= 0 then
        if WAR.SelectPerson[i] == 2 then
          JY.WN = JY.WN - 1
        end
        newmenu[i][1] = "      " .. string.sub(newmenu[i][1], 7)
        WAR.SelectPerson[i] = 0
        zdnum = zdnum + 1
      end
    end
    for i = 1, newid - 1 do
      if 0 < WAR.SelectPerson[i] then
        zdnum = zdnum + 1
      end
    end
    newmenu[newid][1] = "  选择全部"
  end
  return 0
end
function WarSelectEnemy()
  for i = 1, 20 do
    if WAR.Data["敌人" .. i] > 0 then
      WAR.Person[WAR.PersonNum]["人物编号"] = WAR.Data["敌人" .. i]
      WAR.Person[WAR.PersonNum]["我方"] = false
      WAR.Person[WAR.PersonNum]["坐标X"] = WAR.Data["敌方X" .. i]
      WAR.Person[WAR.PersonNum]["坐标Y"] = WAR.Data["敌方Y" .. i]
      WAR.Person[WAR.PersonNum]["死亡"] = false
      WAR.Person[WAR.PersonNum]["人方向"] = 1
      WAR.PersonNum = WAR.PersonNum + 1
    end
  end
end
function WarLoadMap(mapid)
  lib.Debug(string.format("load war map %d", mapid))
  lib.LoadWarMap(CC.WarMapFile[1], CC.WarMapFile[2], mapid, 7, CC.WarWidth, CC.WarHeight)
end
function GetWarMap(x, y, level)
  if 63 < x or x < 0 or 63 < y or y < 0 then
    return
  end
  return lib.GetWarMap(x, y, level)
end
function SetWarMap(x, y, level, v)
  if 63 < x or x < 0 or 63 < y or y < 0 then
    return
  end
  lib.SetWarMap(x, y, level, v)
end
function CleanWarMap(level, v)
  lib.CleanWarMap(level, v)
end
function WarDrawMap(flag, v1, v2, v3, v4, v5, ex, ey)
  local x = WAR.Person[WAR.CurID]["坐标X"]
  local y = WAR.Person[WAR.CurID]["坐标Y"]
  v4 = v4 or JY.SubScene
  v5 = v5 or -1
  if flag == 0 then
    lib.DrawWarMap(0, x, y, 0, 0, -1, v4)
  elseif flag == 1 then
    if v4 == 0 or v4 == 2 or v4 == 3 or v4 == 4 or v4 == 39 then
      lib.DrawWarMap(1, x, y, v1, v2, -1, v4)
    else
      lib.DrawWarMap(2, x, y, v1, v2, -1, v4)
    end
  elseif flag == 2 then
    lib.DrawWarMap(3, x, y, 0, 0, -1, v4)
  elseif flag == 4 then
    if ex == nil or ey == nil then
      ex = -1
      ey = -1
    end
    lib.DrawWarMap(4, x, y, v1, v2, v3, v4, v5, ex, ey)
  end
  if WAR.ShowHead == 1 then
    WarShowHead()
  end
  if JY.XTKG == 1 then
    ShowXT()
  end
  DrawString(CC.ScreenW - CC.DefaultFont * 10, CC.DefaultFont + 2 * CC.Zoom, JY.WFWC, C_GOLD, CC.DefaultFont)
  DrawString(CC.ScreenW - CC.DefaultFont * 10, CC.DefaultFont * 2 + 2 * CC.Zoom, JY.DFWC, C_RED, CC.DefaultFont)
  DrawBox(CC.ScreenW - CC.DefaultFont * 5 - 2 * CC.Zoom, 0, CC.ScreenW, CC.DefaultFont * 3 + 4 * CC.Zoom, C_WHITE)
  DrawString(CC.ScreenW - CC.DefaultFont * 5, 2 * CC.Zoom, string.format("第%d回合", JY.ZDHH), C_WHITE, CC.DefaultFont)
  DrawString(CC.ScreenW - CC.DefaultFont * 5, CC.DefaultFont + 2 * CC.Zoom, string.format("我方：%2d人", JY.WARWF), C_GOLD, CC.DefaultFont)
  DrawString(CC.ScreenW - CC.DefaultFont * 5, CC.DefaultFont * 2 + 2 * CC.Zoom, string.format("敌方：%2d人", JY.WARDF), C_RED, CC.DefaultFont)
  if lib.GetTime() < 1000 + JY.SWGT then
    local wglen = #JY.SHOWWG
    lib.Background(CC.ScreenW / 2 - CC.StartMenuFontSize * 1.5 * wglen / 4, CC.ScreenH / 2 - CC.DefaultFont * 7, CC.ScreenW / 2 - CC.StartMenuFontSize * 1.5 * wglen / 4 + wglen / 2 * CC.StartMenuFontSize * 1.5, CC.ScreenH / 2 - CC.DefaultFont * 7 + CC.StartMenuFontSize * 1.5, 200)
    DrawString(CC.ScreenW / 2 - CC.StartMenuFontSize * 1.5 * wglen / 4, CC.ScreenH / 2 - CC.DefaultFont * 7, string.format(JY.SHOWWG), C_RED, CC.StartMenuFontSize * 1.5)
  end
end
function WarPersonSort()
  for i = 0, WAR.PersonNum - 1 do
    local id = WAR.Person[i]["人物编号"]
    local add = 0
    if JY.Person[id]["武器"] > -1 then
      add = add + JY.Thing[JY.Person[id]["武器"]]["加轻功"]
    end
    if -1 < JY.Person[id]["防具"] then
      add = add + JY.Thing[JY.Person[id]["防具"]]["加轻功"]
    end
    WAR.Person[i]["轻功"] = JY.Person[id]["轻功"] + add
    local move = math.modf(WAR.Person[i]["轻功"] / 15) - math.modf(JY.Person[id]["受伤程度"] / 40)
    if move < 0 then
      move = 0
    end
    WAR.Person[i]["移动步数"] = move
  end
  for i = 0, WAR.PersonNum - 2 do
    local maxid = i
    for j = i, WAR.PersonNum - 1 do
      if WAR.Person[j]["轻功"] > WAR.Person[maxid]["轻功"] then
        maxid = j
      end
    end
    WAR.Person[maxid], WAR.Person[i] = WAR.Person[i], WAR.Person[maxid]
  end
end
function WarPersonSort1()
  for i = 0, WAR.PersonNum - 1 do
    local id = WAR.Person[i]["人物编号"]
    local add = 0
    if JY.Person[id]["武器"] > -1 then
      add = add + JY.Thing[JY.Person[id]["武器"]]["加轻功"]
    end
    if -1 < JY.Person[id]["防具"] then
      add = add + JY.Thing[JY.Person[id]["防具"]]["加轻功"]
    end
    WAR.Person[i]["轻功"] = JY.Person[id]["轻功"] + add
    local move = math.modf(WAR.Person[i]["轻功"] / 15) - math.modf(JY.Person[id]["受伤程度"] / 40)
    if move < 0 then
      move = 0
    end
    WAR.Person[i]["移动步数"] = move
  end
  for i = 0, WAR.PersonNum - 2 do
    local maxid = i
    for j = i, WAR.PersonNum - 1 do
      if WAR.Person[j]["轻功"] > WAR.Person[maxid]["轻功"] then
        maxid = j
      end
    end
    WAR.Person[maxid], WAR.Person[i] = WAR.Person[i], WAR.Person[maxid]
  end
  JY.BJS[0] = 1
  for i = 1, WAR.PersonNum - 1 do
    JY.BJS[i] = WAR.Person[0]["轻功"] / WAR.Person[i]["轻功"]
  end
end
function WarSetPerson()
  CleanWarMap(2, -1)
  CleanWarMap(5, -1)
  for i = 0, WAR.PersonNum - 1 do
    if WAR.Person[i]["死亡"] == false then
      SetWarMap(WAR.Person[i]["坐标X"], WAR.Person[i]["坐标Y"], 2, i)
      SetWarMap(WAR.Person[i]["坐标X"], WAR.Person[i]["坐标Y"], 5, WAR.Person[i]["贴图"])
    end
  end
end
function WarCalPersonPic(id)
  local n = 5106
  n = n + JY.Person[WAR.Person[id]["人物编号"]]["头像代号"] * 8 + WAR.Person[id]["人方向"] * 2
  return n
end
function War_Manual()
  local r
  WAR.ShowHead = 1
  local movedtbs = WAR.Person[WAR.CurID]["移动步数"]
  local movedtx = WAR.Person[WAR.CurID]["坐标X"]
  local movedty = WAR.Person[WAR.CurID]["坐标Y"]
  local movedtfx = WAR.Person[WAR.CurID]["人方向"]
  local pic = WAR.Person[WAR.CurID]["贴图"]
  while true do
    r = War_Manual_Sub()
    if r == 0 then
      local x = WAR.Person[WAR.CurID]["坐标X"]
      local y = WAR.Person[WAR.CurID]["坐标Y"]
      SetWarMap(x, y, 2, -1)
      SetWarMap(x, y, 5, -1)
      WAR.Person[WAR.CurID]["坐标X"] = movedtx
      WAR.Person[WAR.CurID]["坐标Y"] = movedty
      WAR.Person[WAR.CurID]["人方向"] = movedtfx
      WAR.Person[WAR.CurID]["移动步数"] = movedtbs
      SetWarMap(movedtx, movedty, 2, WAR.CurID)
      SetWarMap(movedtx, movedty, 5, pic)
      WarDrawMap(0)
      ShowScreen()
    end
    if math.abs(r) ~= 1 and r ~= 0 then
      break
    end
  end
  WAR.ShowHead = 0
  return r
end
function War_Manual_Sub()
  local pid = WAR.Person[WAR.CurID]["人物编号"]
  local menu = {
    {
      "移动",
      War_MoveMenu,
      1
    },
    {
      "攻击",
      War_FightMenu,
      1
    },
    {
      "用毒",
      War_PoisonMenu,
      1
    },
    {
      "解毒",
      War_DecPoisonMenu,
      1
    },
    {
      "医疗",
      War_DoctorMenu,
      1
    },
    {
      "物品",
      War_ThingMenu,
      1
    },
    {
      "等待",
      War_WaitMenu,
      1
    },
    {
      "状态",
      War_StatusMenu,
      1
    },
    {
      "复活",
      War_Huhuo,
      0
    },
    {
      "变身",
      War_Bianshen,
      0
    },
	{
      "投降",
      War_Surrender,
      1
    },
    {
      "休息",
      War_RestMenu,
      1
    },
    {
      "自动",
      War_AutoMenu,
      1
    }
  }
  if CC.YXNDA == 2 then
    menu[7][3] = 0
  end
  if JY.Person[pid]["体力"] <= 5 or 0 >= WAR.Person[WAR.CurID]["移动步数"] then
    menu[1][3] = 0
  end
  local minv = War_GetMinNeiLi(pid)
  if minv > JY.Person[pid]["内力"] or JY.Person[pid]["体力"] < 10 then
    menu[2][3] = 0
  end
  if JY.Person[pid]["体力"] < 10 or JY.Person[pid]["用毒能力"] < 20 then
    menu[3][3] = 0
  end
  if JY.Person[pid]["体力"] < 10 or 20 > JY.Person[pid]["解毒能力"] then
    menu[4][3] = 0
  end
  if JY.Person[pid]["体力"] < 50 or 20 > JY.Person[pid]["医疗能力"] then
    menu[5][3] = 0
  end
  if pid == 0 and CC.BanBen == 1 then
    local lev = JY.Person[0]["等级"]
    local hhlev = 15
    if JY.Person[0]["姓名"] == "szlzw" then
      hhlev = 30
    end
    if CC.JS == 1 and JY.Person[0]["外号"] == "巫妖" and 0 >= JY.Huhuolq and 0 < JY.Huhuocs and lev >= hhlev then
      menu[9][3] = 1
    end
    if CC.JS == 1 and JY.Person[0]["姓名"] == "szlzw" and JY.YXND == 0 then
      menu[10][3] = 1
    end
    if CC.JS == 1 and JY.Person[0]["姓名"] == "szlzw" and JY.YXND == 1 and JY.Person[0]["等级"] > 9 then
      menu[10][3] = 1
    end
    if CC.JS == 1 and JY.Person[0]["姓名"] == "szlzw" and JY.YXND == 2 and JY.Person[0]["等级"] > 19 then
      menu[10][3] = 1
    end
  end
  Cls()
  return ShowMenu(menu, #menu, 0, CC.MainMenuX, CC.MainMenuY, 0, 0, 1, 1, CC.DefaultFont * 1.2, C_ORANGE, C_WHITE)
end
function War_Surrender()
  if DrawStrBoxYesNo(-1, -1, "是否投降认输？", C_WHITE, CC.DefaultFont) == false then
    return
  end
  for i = 0, WAR.PersonNum - 1 do
    if WAR.Person[i]["我方"] == true then
      WAR.Person[i]["死亡"] = true
    end
  end
  return 1
end
function War_XT()
  if JY.XTKG == 1 then
    JY.XTKG = 0
  else
    JY.XTKG = 1
  end
end
function War_GetMinNeiLi(pid)
  local minv = math.huge
  for i = 1, 10 do
    local tmpid = JY.Person[pid]["武功" .. i]
    if 0 < tmpid and minv > JY.Wugong[tmpid]["消耗内力点数"] then
      minv = JY.Wugong[tmpid]["消耗内力点数"]
    end
  end
  return minv
end
function WarShowHead(id)
  id = id or WAR.CurID
  if id < 0 then
    return
  end
  local pid = WAR.Person[id]["人物编号"]
  local p = JY.Person[pid]
  local h = CC.DefaultFont + CC.MenuBorderPixel
  local w = CC.DefaultFont + CC.MenuBorderPixel
  local headww = 65 * CC.Zoom
  local headhh = 65 * CC.Zoom
  local width = 2 * CC.MenuBorderPixel + 7.5 * h
  local height = 2 * CC.MenuBorderPixel + 7.5 * h + headhh
  local x1, y1
  local i = 1
  if WAR.Person[id]["我方"] == true then
    x1 = CC.ScreenW - width
    y1 = CC.ScreenH - height
  else
    x1 = 0
    y1 = 0
  end
  DrawBox(x1, y1, x1 + width, y1 + height, C_WHITE)
  local size = CC.DefaultFont
  local hid = p["头像代号"]
  if hid == 0 and (JY.Person[0]["姓名"] == "szlzw" or JY.Person[0]["姓名"] == CC.TSJSName) then
    if existFile(CC.HeadPath .. CC.JSHead .. ".png") then
      JY.Person[0]["头像代号"] = CC.JSHead
      hid = CC.JSHead
    else
      JY.Person[0]["头像代号"] = 0
      hid = 0
    end
  end
  if existFile(CC.HeadPath .. hid .. ".png") then
    local headw, headh = lib.GetPNGXY(1, hid * 2)
    local headx = CC.PersonStateRowPixel
    local heady = CC.PersonStateRowPixel
    local hdmax = 0
    if headw > hdmax then
      hdmax = headw
    end
    if headh > hdmax then
      hdmax = headh
    end
    local zoom = math.modf(70 * CC.Zoom / hdmax * 100 * (CONFIG.Zoom / 100))
    lib.LoadPicture(CC.HeadPath .. hid .. ".png", x1 + headx, y1 + heady, zoom)
    JY.Person[0]["头像代号"] = 0
  else
    local headw, headh = lib.PicGetXY(1, p["头像代号"] * 2)
    local headx = CC.PersonStateRowPixel
    local heady = CC.PersonStateRowPixel
    lib.PicLoadCache(1, p["头像代号"] * 2, x1 + headx, y1 + heady, 1)
  end
  DrawString(x1 + width - CC.DefaultFont * 4, y1, "武器", C_ORANGE, CC.DefaultFont)
  if 0 <= p["武器"] then
    local str1 = JY.Thing[p["武器"]]["名称"]
    DrawString(x1 + width - CC.DefaultFont * 4, y1 + h, str1, C_GOLD, CC.DefaultFont)
  else
    DrawString(x1 + width - CC.DefaultFont * 4, y1 + h, "无", C_GOLD, CC.DefaultFont)
  end
  DrawString(x1 + width - CC.DefaultFont * 4, y1 + h * 2, "防具", C_ORANGE, CC.DefaultFont)
  if 0 <= p["防具"] then
    local str2 = JY.Thing[p["防具"]]["名称"]
    DrawString(x1 + width - CC.DefaultFont * 4, y1 + h * 3, str2, C_GOLD, CC.DefaultFont)
  else
    DrawString(x1 + width - CC.DefaultFont * 4, y1 + h * 3, "无", C_GOLD, CC.DefaultFont)
  end
  x1 = x1 + CC.PersonStateRowPixel
  y1 = y1 + CC.PersonStateRowPixel * 2 + headhh
  DrawString(x1, y1, p["姓名"], C_WHITE, CC.DefaultFont)
  DrawString(x1 + w * 5, y1, string.format("%2d级", p["等级"]), C_GOLD, CC.DefaultFont)
  local color
  if p["受伤程度"] < 33 then
    color = RGB(236, 200, 40)
  elseif p["受伤程度"] < 66 then
    color = RGB(255, 192, 203)
  else
    color = RGB(232, 32, 44)
  end
  DrawString(x1, y1 + h, "生命", C_ORANGE, CC.DefaultFont)
  DrawString(x1 + w * 2, y1 + h, string.format("%4d", p["生命"]), color, CC.DefaultFont)
  DrawString(x1 + w * 4, y1 + h, "/", C_GOLD, CC.DefaultFont)
  if p["中毒程度"] == 0 then
    color = C_GOLD
  elseif p["中毒程度"] < 50 then
    color = RGB(120, 208, 88)
  else
    color = RGB(56, 136, 36)
  end
  DrawString(x1 + w * 4.5, y1 + h, string.format("%4d", p["生命最大值"]), color, CC.DefaultFont)
  if p["内力性质"] == 0 then
    color = RGB(208, 152, 208)
  elseif p["内力性质"] == 1 then
    color = RGB(236, 200, 40)
  else
    color = RGB(236, 236, 236)
  end
  DrawString(x1, y1 + h * 2, "内力", C_ORANGE, CC.DefaultFont)
  DrawString(x1 + w * 2, y1 + h * 2, string.format("%4d/%4d", p["内力"], p["内力最大值"]), color, CC.DefaultFont)
  DrawString(x1, y1 + h * 3, "体力", C_ORANGE, CC.DefaultFont)
  DrawString(x1 + w * 2, y1 + h * 3, string.format("%4d", p["体力"]), C_GOLD, CC.DefaultFont)
  DrawString(x1, y1 + h * 4, string.format("伤 %d", p["受伤程度"]), RGB(255, 192, 203), CC.DefaultFont)
  DrawString(x1 + w * 4, y1 + h * 4, string.format("毒 %d", p["中毒程度"]), RGB(120, 208, 88), CC.DefaultFont)
  local gjl = p["攻击力"]
  local fyl = p["防御力"]
  local qg = p["轻功"]
  if 0 <= p["武器"] then
    gjl = gjl + JY.Thing[p["武器"]]["加攻击力"]
    fyl = fyl + JY.Thing[p["武器"]]["加防御力"]
    qg = qg + JY.Thing[p["武器"]]["加轻功"]
  end
  if 0 <= p["防具"] then
    gjl = gjl + JY.Thing[p["防具"]]["加攻击力"]
    fyl = fyl + JY.Thing[p["防具"]]["加防御力"]
    qg = qg + JY.Thing[p["防具"]]["加轻功"]
  end
  DrawString(x1, y1 + h * 5, string.format("攻 %d", gjl), C_RED, CC.DefaultFont)
  DrawString(x1 + w * 4, y1 + h * 5, string.format("防 %d", fyl), C_RED, CC.DefaultFont)
  DrawString(x1, y1 + h * 6, string.format("轻 %d", qg), C_RED, CC.DefaultFont)
  DrawString(x1 + w * 4, y1 + h * 6, string.format("识 %d", p["武学常识"]), C_RED, CC.DefaultFont)
  if pid == 0 and JY.Person[pid]["外号"] == "拳霸" and CC.JS == 1 then
    local xgstr = "拳霸→破防伤害激活"
    local xglen = #xgstr
    DrawString(CC.ScreenW / 2 - CC.DefaultFont * xglen / 4, CC.DefaultFont, xgstr, C_WHITE, CC.DefaultFont)
  elseif pid == 0 and JY.Person[pid]["外号"] == "剑魔" and CC.JS == 1 then
    local xgstr = "剑魔→嗜血伤害激活"
    local xglen = #xgstr
    DrawString(CC.ScreenW / 2 - CC.DefaultFont * xglen / 4, CC.DefaultFont, xgstr, C_WHITE, CC.DefaultFont)
  elseif pid == 0 and JY.Person[pid]["外号"] == "刀痴" and CC.JS == 1 then
    local xgstr = "刀痴→一击必杀激活"
    local xglen = #xgstr
    DrawString(CC.ScreenW / 2 - CC.DefaultFont * xglen / 4, CC.DefaultFont, xgstr, C_WHITE, CC.DefaultFont)
  elseif pid == 0 and JY.Person[pid]["外号"] == "特狂" and CC.JS == 1 then
    local xgstr = "特狂→暴击伤害激活"
    local xglen = #xgstr
    DrawString(CC.ScreenW / 2 - CC.DefaultFont * xglen / 4, CC.DefaultFont, xgstr, C_WHITE, CC.DefaultFont)
  elseif pid == 0 and JY.Person[pid]["外号"] == "神助" and CC.JS == 1 then
    local xgstr = "神助→天神护体激活"
    local xglen = #xgstr
    DrawString(CC.ScreenW / 2 - CC.DefaultFont * xglen / 4, CC.DefaultFont, xgstr, C_WHITE, CC.DefaultFont)
  elseif pid == 0 and JY.Person[pid]["外号"] == "巫妖" and CC.JS == 1 then
    local xgstr = "巫妖→没有重生技能"
    local lev = JY.Person[0]["等级"]
    local hhlev = 15
    if 0 < JY.YXND and JY.Person[0]["姓名"] == "szlzw" then
      hhlev = 30
    end
    if JY.Person[0]["姓名"] ~= "szlzw" then
      if 0 < JY.Huhuolq and 0 < JY.Huhuocs and lev >= hhlev then
        xgstr = "巫妖→重生技能" .. JY.Huhuolq .. "回合后激活，剩余" .. JY.Huhuocs .. "次"
      elseif JY.Huhuolq == 0 and 0 < JY.Huhuocs and lev >= hhlev then
        xgstr = "巫妖→重生技能激活，剩余" .. JY.Huhuocs .. "次"
      elseif lev >= hhlev then
        xgstr = "巫妖→已用完重生技能"
      elseif lev < hhlev then
        xgstr = "巫妖→能力不足无法激活重生技能"
      end
    elseif 0 < JY.YXND then
      if 0 < JY.Huhuolq and 0 < JY.Huhuocs and lev >= hhlev then
        xgstr = "巫妖→重生技能" .. JY.Huhuolq .. "回合后激活，剩余" .. JY.Huhuocs .. "次"
      elseif JY.Huhuolq == 0 and 0 < JY.Huhuocs and lev >= hhlev then
        xgstr = "巫妖→重生技能激活，剩余" .. JY.Huhuocs .. "次"
      elseif lev >= hhlev then
        xgstr = "巫妖→已用完重生技能"
      elseif lev < hhlev then
        xgstr = "巫妖→能力不足无法激活重生技能"
      end
    end
    local xglen = #xgstr
    DrawString(CC.ScreenW / 2 - CC.DefaultFont * xglen / 4, CC.DefaultFont, xgstr, C_WHITE, CC.DefaultFont)
  elseif pid == 0 and JY.Person[pid]["外号"] == "毒王" and CC.JS == 1 then
    local xgstr = "毒王→淬毒伤害激活"
    local xglen = #xgstr
    DrawString(CC.ScreenW / 2 - CC.DefaultFont * xglen / 4, CC.DefaultFont, xgstr, C_WHITE, CC.DefaultFont)
  elseif pid == 0 and JY.Person[pid]["外号"] == "幻影" and CC.JS == 1 then
    local xgstr = "幻影→影杀技能激活"
    local xglen = #xgstr
    DrawString(CC.ScreenW / 2 - CC.DefaultFont * xglen / 4, CC.DefaultFont, xgstr, C_WHITE, CC.DefaultFont)
  end
  if 0 < JY.YXND and JY.Person[0]["姓名"] == "szlzw" and JY.Person[pid]["外号"] == "超神" and CC.JS == 1 then
    if JY.YXND == 1 then
      if JY.Person[0]["等级"] > 9 then
        local xgstr = "超神→改变型态激活"
        local xglen = #xgstr
        DrawString(CC.ScreenW / 2 - CC.DefaultFont * xglen / 4, CC.DefaultFont, xgstr, C_WHITE, CC.DefaultFont)
      else
        local xgstr = "超神→能力不足无法改变型态"
        local xglen = #xgstr
        DrawString(CC.ScreenW / 2 - CC.DefaultFont * xglen / 4, CC.DefaultFont, xgstr, C_WHITE, CC.DefaultFont)
      end
    elseif JY.YXND == 2 then
      if JY.Person[0]["等级"] > 19 then
        local xgstr = "超神→改变型态激活"
        local xglen = #xgstr
        DrawString(CC.ScreenW / 2 - CC.DefaultFont * xglen / 4, CC.DefaultFont, xgstr, C_WHITE, CC.DefaultFont)
      else
        local xgstr = "超神→能力不足无法改变型态"
        local xglen = #xgstr
        DrawString(CC.ScreenW / 2 - CC.DefaultFont * xglen / 4, CC.DefaultFont, xgstr, C_WHITE, CC.DefaultFont)
      end
    end
  end
end
function War_MoveMenu()
  WAR.ShowHead = 0
  if 0 >= WAR.Person[WAR.CurID]["移动步数"] then
    return 0
  end
  War_CalMoveStep(WAR.CurID, WAR.Person[WAR.CurID]["移动步数"], 0)
  local r
  local x, y = War_SelectMove()
  if x ~= nil then
    War_MovePerson(x, y)
    r = 1
  else
    r = 0
  end
  WAR.ShowHead = 1
  Cls()
  return r
end
function War_CalMoveStep(id, stepmax, flag)
  CleanWarMap(3, 255)
  local x = WAR.Person[id]["坐标X"]
  local y = WAR.Person[id]["坐标Y"]
  local steparray = {}
  for i = 0, stepmax do
    steparray[i] = {}
    steparray[i].x = {}
    steparray[i].y = {}
  end
  SetWarMap(x, y, 3, 0)
  steparray[0].num = 1
  steparray[0].x[1] = x
  steparray[0].y[1] = y
  for i = 0, stepmax - 1 do
    War_FindNextStep(steparray, i, flag)
    if steparray[i + 1].num == 0 then
      break
    end
  end
  return steparray
end
function War_FindNextStep(steparray, step, flag)
  local num = 0
  local step1 = step + 1
  for i = 1, steparray[step].num do
    local x = steparray[step].x[i]
    local y = steparray[step].y[i]
    if x + 1 < CC.WarWidth - 1 then
      local v = GetWarMap(x + 1, y, 3)
      if v == 255 and War_CanMoveXY(x + 1, y, flag) == true then
        num = num + 1
        steparray[step1].x[num] = x + 1
        steparray[step1].y[num] = y
        SetWarMap(x + 1, y, 3, step1)
      end
    end
    if 0 < x - 1 then
      local v = GetWarMap(x - 1, y, 3)
      if v == 255 and War_CanMoveXY(x - 1, y, flag) == true then
        num = num + 1
        steparray[step1].x[num] = x - 1
        steparray[step1].y[num] = y
        SetWarMap(x - 1, y, 3, step1)
      end
    end
    if y + 1 < CC.WarHeight - 1 then
      local v = GetWarMap(x, y + 1, 3)
      if v == 255 and War_CanMoveXY(x, y + 1, flag) == true then
        num = num + 1
        steparray[step1].x[num] = x
        steparray[step1].y[num] = y + 1
        SetWarMap(x, y + 1, 3, step1)
      end
    end
    if 0 < y - 1 then
      local v = GetWarMap(x, y - 1, 3)
      if v == 255 and War_CanMoveXY(x, y - 1, flag) == true then
        num = num + 1
        steparray[step1].x[num] = x
        steparray[step1].y[num] = y - 1
        SetWarMap(x, y - 1, 3, step1)
      end
    end
  end
  steparray[step1].num = num
end
function War_CanMoveXY(x, y, flag)
  if x < 0 or 63 < x or y < 0 or 63 < y then
    return false
  end
  if 0 < GetWarMap(x, y, 1) then
    return false
  end
  if flag == 0 then
    if CC.WarWater[GetWarMap(x, y, 0)] ~= nil then
      return false
    end
    if 0 <= GetWarMap(x, y, 2) then
      return false
    end
  end
  return true
end
function War_SelectMove()
  local x0 = WAR.Person[WAR.CurID]["坐标X"]
  local y0 = WAR.Person[WAR.CurID]["坐标Y"]
  local x = x0
  local y = y0
  while true do
    WAR.ShowHead = 0
    local x2 = x
    local y2 = y
    WarDrawMap(1, x, y)
    DrawString(CC.DefaultFont, CC.ScreenH - CC.DefaultFont * 3, string.format("%2d,%2d", x, y), C_GOLD, CC.DefaultFont)
    if 0 <= GetWarMap(x, y, 2) then
      WAR.ShowHead = 1
      WarShowHead(GetWarMap(x, y, 2))
    end
    ShowScreen()
    local key, ktype, mx, my = WaitKey(1)
    if key == VK_UP then
      y2 = y - 1
    elseif key == VK_DOWN then
      y2 = y + 1
    elseif key == VK_LEFT then
      x2 = x - 1
    elseif key == VK_RIGHT then
      x2 = x + 1
    elseif key == VK_SPACE or key == VK_RETURN or ktype == 3 then
      Movex, Movey = x, y
      return x, y
    elseif key == VK_ESCAPE or ktype == 4 then
      return nil
    elseif ktype == 2 then
      mx = mx - CC.ScreenW / 2
      my = my - CC.ScreenH / 2
      mx = mx / CC.XScale
      my = my / CC.YScale
      mx, my = (mx + my) / 2, (my - mx) / 2
      if 0 < mx then
        mx = mx + 0.99
      else
        mx = mx - 0.01
      end
      if 0 < my then
        my = my + 0.99
      else
        mx = mx - 0.01
      end
      mx = math.modf(mx)
      my = math.modf(my)
      for i = 0, 10 do
        if mx + i <= 63 and 63 < my + i then
          break
        end
        local hb = GetS(JY.SubScene, x0 + mx + i, y0 + my + i, 4)
        if math.abs(hb - CC.YScale * i * 2) < 5 then
          mx = mx + i
          my = my + i
        end
      end
      x2, y2 = mx + x0, my + y0
      x2 = limitX(x2, 0, 63)
      y2 = limitX(y2, 0, 63)
    end
    if GetWarMap(x2, y2, 3) < 128 then
      x = x2
      y = y2
    end
  end
end
function War_SelectMove1(v1, v2, v3)
  if v2 == nil then
    v2, v3 = 0, 0
  end
  local x0 = WAR.Person[WAR.CurID]["坐标X"]
  local y0 = WAR.Person[WAR.CurID]["坐标Y"]
  local x = x0
  local y = y0
  local mvx = 0
  local mvy = 0
  local mvx3 = {}
  local mvy3 = {}
  local mvljx = {}
  local mvljy = {}
  local rsnum = 0
  for i = -v3, v3 do
    mvx3[i] = {}
    mvy3[i] = {}
    mvljx[i] = {}
    mvljy[i] = {}
    for j = -v3, v3 do
      mvx3[i][j] = j + i
      mvy3[i][j] = 0 - j + i
      mvljy[i][j] = y - j
      mvljx[i][j] = x + i
    end
  end
  while true do
    WAR.ShowHead = 0
    local x2 = x
    local y2 = y
    local mvx1 = mvx
    local mvy1 = mvy
    WarDrawMap(1, x, y)
    DrawString(CC.DefaultFont, CC.ScreenH - CC.DefaultFont * 3, string.format("%2d,%2d", x, y), C_GOLD, CC.DefaultFont)
    DrawString(CC.ScreenW / 2 - CC.DefaultFont * 5, CC.ScreenH - CC.DefaultFont * 4, JY.WGMC .. string.format(" 可击中%d人", rsnum), C_WHITE, CC.DefaultFont)
    rsnum = 0
    if 0 <= GetWarMap(x, y, 2) then
      WAR.ShowHead = 1
      WarShowHead(GetWarMap(x, y, 2))
    end
    if v1 == 0 and 0 <= GetWarMap(x, y, 2) and WAR.Person[WAR.CurID]["我方"] ~= WAR.Person[GetWarMap(x, y, 2)]["我方"] then
      if CC.ScreenW >= 128 then
        ShowZhi(x, y)
      end
      rsnum = rsnum + 1
    end
    if v1 == 4 and 0 <= GetWarMap(x, y, 2) and WAR.Person[WAR.CurID]["我方"] ~= WAR.Person[GetWarMap(x, y, 2)]["我方"] then
      if CC.ScreenW >= 128 then
        ShowZhi(x, y)
      end
      rsnum = rsnum + 1
    end
    if v1 == 3 then
      for i = -v3, v3 do
        for j = -v3, v3 do
          if 0 <= GetWarMap(mvljx[i][j], mvljy[i][j], 2) then
            if WAR.Person[WAR.CurID]["我方"] ~= WAR.Person[GetWarMap(mvljx[i][j], mvljy[i][j], 2)]["我方"] then
              if CC.ScreenW >= 128 then
                ShowZhi(mvljx[i][j], mvljy[i][j])
              end
              rsnum = rsnum + 1
            end
          else
            lib.PicLoadCache(0, 0, CC.ScreenW / 2 + CC.XScale * mvx3[i][j], CC.ScreenH / 2 + CC.YScale * mvy3[i][j], 2, 100)
          end
        end
      end
    end
    ShowScreen()
    local key, ktype, mx, my = WaitKey(1)
    if key == VK_UP then
      y2 = y - 1
    elseif key == VK_DOWN then
      y2 = y + 1
    elseif key == VK_LEFT then
      x2 = x - 1
    elseif key == VK_RIGHT then
      x2 = x + 1
    elseif key == VK_SPACE or key == VK_RETURN then
      Movex, Movey = x, y
      return x, y
    elseif key == VK_ESCAPE or ktype == 4 then
      return nil
    elseif ktype == 2 or ktype == 3 then
      mx = mx - CC.ScreenW / 2
      my = my - CC.ScreenH / 2
      mx = mx / CC.XScale
      my = my / CC.YScale
      mx, my = (mx + my) / 2, (my - mx) / 2
      if 0 < mx then
        mx = mx + 0.99
      else
        mx = mx - 0.01
      end
      if 0 < my then
        my = my + 0.99
      else
        mx = mx - 0.01
      end
      mx = math.modf(mx)
      my = math.modf(my)
      for i = 0, 10 do
        if mx + i <= 63 and 63 < my + i then
          break
        end
        local hb = GetS(JY.SubScene, x0 + mx + i, y0 + my + i, 4)
        if 5 > math.abs(hb - CC.YScale * i * 2) then
          mx = mx + i
          my = my + i
        end
      end
      x2, y2 = mx + x0, my + y0
      x2 = limitX(x2, 0, 63)
      y2 = limitX(y2, 0, 63)
      if ktype == 3 then
        Movex, Movey = x, y
        return x, y
      end
    end
    if GetWarMap(x2, y2, 3) < 128 then
      x = x2
      y = y2
    end
    if v1 == 10 then
      if key == VK_UP then
        mvx1 = mvx1 + 1
        mvy1 = mvy1 - 1
      elseif key == VK_DOWN then
        mvx1 = mvx1 - 1
        mvy1 = mvy1 + 1
      elseif key == VK_LEFT then
        mvx1 = mvx1 - 1
        mvy1 = mvy1 - 1
      elseif key == VK_RIGHT then
        mvx1 = mvx1 + 1
        mvy1 = mvy1 + 1
      end
      if GetWarMap(x2, y2, 3) < 128 then
        mvx = mvx1
        mvy = mvy1
      end
    end
    if v1 == 3 then
      if key == VK_UP then
        if GetWarMap(x2, y2, 3) < 128 then
          mvx1 = mvx1 + 1
          mvy1 = mvy1 - 1
          for i = -v3, v3 do
            for j = -v3, v3 do
              mvx3[i][j] = mvx1 + j + i
              mvy3[i][j] = mvy1 - j + i
              mvljy[i][j] = y - j
              mvljx[i][j] = x + i
            end
          end
        end
      elseif key == VK_DOWN then
        if GetWarMap(x2, y2, 3) < 128 then
          mvx1 = mvx1 - 1
          mvy1 = mvy1 + 1
          for i = -v3, v3 do
            for j = -v3, v3 do
              mvx3[i][j] = mvx1 - j + i
              mvy3[i][j] = mvy1 + j + i
              mvljy[i][j] = y + j
              mvljx[i][j] = x + i
            end
          end
        end
      elseif key == VK_LEFT then
        mvx1 = mvx1 - 1
        mvy1 = mvy1 - 1
        if GetWarMap(x2, y2, 3) < 128 then
          for i = -v3, v3 do
            for j = -v3, v3 do
              mvx3[i][j] = mvx1 - j - i
              mvy3[i][j] = mvy1 - j + i
              mvljy[i][j] = y + i
              mvljx[i][j] = x - j
            end
          end
        end
      elseif key == VK_RIGHT then
        if GetWarMap(x2, y2, 3) < 128 then
          mvx1 = mvx1 + 1
          mvy1 = mvy1 + 1
          for i = -v3, v3 do
            for j = -v3, v3 do
              mvx3[i][j] = mvx1 + j + i
              mvy3[i][j] = mvy1 + j - i
              mvljy[i][j] = y - i
              mvljx[i][j] = x + j
            end
          end
        end
      elseif ktype == 2 then
        if mx < 0 then
          mvx1 = 0 - math.abs(mx)
          mvy1 = 0 - math.abs(mx)
        end
        if 0 < mx then
          mvx1 = 0 + mx
          mvy1 = 0 + mx
        end
        if my < 0 then
          mvx1 = mvx1 + math.abs(my)
          mvy1 = mvy1 - math.abs(my)
        end
        if 0 < my then
          mvx1 = mvx1 - my
          mvy1 = mvy1 + my
        end
        if 0 < mvx1 and 0 < mvy1 and GetWarMap(x2, y2, 3) < 128 then
          for i = -v3, v3 do
            for j = -v3, v3 do
              mvx3[i][j] = mvx1 + j + i
              mvy3[i][j] = mvy1 + j - i
              mvljy[i][j] = y - i
              mvljx[i][j] = x + j
            end
          end
        end
        if mvx1 < 0 and mvy1 < 0 and GetWarMap(x2, y2, 3) < 128 then
          for i = -v3, v3 do
            for j = -v3, v3 do
              mvx3[i][j] = mvx1 - j - i
              mvy3[i][j] = mvy1 - j + i
              mvljy[i][j] = y + i
              mvljx[i][j] = x - j
            end
          end
        end
        if 0 < mvx1 and mvy1 < 0 and GetWarMap(x2, y2, 3) < 128 then
          for i = -v3, v3 do
            for j = -v3, v3 do
              mvx3[i][j] = mvx1 + j + i
              mvy3[i][j] = mvy1 - j + i
              mvljy[i][j] = y - j
              mvljx[i][j] = x + i
            end
          end
        end
        if mvx1 < 0 and 0 < mvy1 and GetWarMap(x2, y2, 3) < 128 then
          for i = -v3, v3 do
            for j = -v3, v3 do
              mvx3[i][j] = mvx1 - j + i
              mvy3[i][j] = mvy1 + j + i
              mvljy[i][j] = y + j
              mvljx[i][j] = x + i
            end
          end
        end
        if my == 0 then
          mvx1 = 0 + mx
          mvy1 = 0 + mx
          if GetWarMap(x2, y2, 3) < 128 then
            for i = -v3, v3 do
              for j = -v3, v3 do
                mvx3[i][j] = mvx1 - j - i
                mvy3[i][j] = mvy1 - j + i
                mvljy[i][j] = y + i
                mvljx[i][j] = x - j
              end
            end
          end
        elseif mx == 0 and GetWarMap(x2, y2, 3) < 128 then
          mvx1 = 0 - my
          mvy1 = 0 + my
          for i = -v3, v3 do
            for j = -v3, v3 do
              mvx3[i][j] = mvx1 + j + i
              mvy3[i][j] = mvy1 - j + i
              mvljy[i][j] = y - j
              mvljx[i][j] = x + i
            end
          end
        end
      end
      if GetWarMap(x2, y2, 3) < 128 then
        mvx = mvx1
        mvy = mvy1
      end
    end
  end
end
function War_MovePerson(x, y)
  local movenum = GetWarMap(x, y, 3)
  WAR.Person[WAR.CurID]["移动步数"] = WAR.Person[WAR.CurID]["移动步数"] - movenum
  local movetable = {}
  for i = movenum, 1, -1 do
    movetable[i] = {}
    movetable[i].x = x
    movetable[i].y = y
    if GetWarMap(x - 1, y, 3) == i - 1 then
      x = x - 1
      movetable[i].direct = 1
    elseif GetWarMap(x + 1, y, 3) == i - 1 then
      x = x + 1
      movetable[i].direct = 2
    elseif GetWarMap(x, y - 1, 3) == i - 1 then
      y = y - 1
      movetable[i].direct = 3
    elseif GetWarMap(x, y + 1, 3) == i - 1 then
      y = y + 1
      movetable[i].direct = 0
    end
  end
  for i = 1, movenum do
    local t1 = lib.GetTime()
    SetWarMap(WAR.Person[WAR.CurID]["坐标X"], WAR.Person[WAR.CurID]["坐标Y"], 2, -1)
    SetWarMap(WAR.Person[WAR.CurID]["坐标X"], WAR.Person[WAR.CurID]["坐标Y"], 5, -1)
    WAR.Person[WAR.CurID]["坐标X"] = movetable[i].x
    WAR.Person[WAR.CurID]["坐标Y"] = movetable[i].y
    WAR.Person[WAR.CurID]["人方向"] = movetable[i].direct
    WAR.Person[WAR.CurID]["贴图"] = WarCalPersonPic(WAR.CurID)
    SetWarMap(WAR.Person[WAR.CurID]["坐标X"], WAR.Person[WAR.CurID]["坐标Y"], 2, WAR.CurID)
    SetWarMap(WAR.Person[WAR.CurID]["坐标X"], WAR.Person[WAR.CurID]["坐标Y"], 5, WAR.Person[WAR.CurID]["贴图"])
    WarDrawMap(0)
    ShowScreen()
    local t2 = lib.GetTime()
    if t2 - t1 < 2 * CC.Frame then
      lib.Delay(2 * CC.Frame - (t2 - t1))
    end
  end
end
function War_FightMenu()
  local pid = WAR.Person[WAR.CurID]["人物编号"]
  local gjfw = 0
  local gjstr = ""
  local numwugong = 0
  local menu = {}
  for i = 1, 10 do
    local tmp = JY.Person[pid]["武功" .. i]
    if 0 < tmp then
      gjfw = JY.Wugong[tmp]["攻击范围"]
      if gjfw == 0 then
        gjstr = "●"
      elseif gjfw == 1 then
        gjstr = "━"
      elseif gjfw == 2 then
        gjstr = "╋"
      elseif gjfw == 3 then
        gjstr = "■"
      end
      local level = {}
      local wgsh = {}
      local p = JY.Person[pid]
      local nlxh = 0
      local wgshlx = JY.Wugong[tmp]["伤害类型"]
      local wgjnl, wgsnl, nldb
      level[i] = math.modf(p["武功等级" .. i] / 100) + 1
      nldb = math.modf((level[i] + 1) / 2)
      nlxh = JY.Wugong[tmp]["消耗内力点数"] * nldb
      wgsh[i] = JY.Wugong[tmp]["攻击力" .. level[i]]
      if wgshlx == 0 or wgshlx == 2 then
        local ngwggjl = 0
        local wgjcxs = 0
        local nglevel = 0
        for iwgng = 1, #CC.WUGONGNEIGONG do
          if tmp == CC.WUGONGNEIGONG[iwgng][2] then
            for ing = 1, 10 do
              if p["武功" .. ing] == CC.WUGONGNEIGONG[iwgng][1] then
                wgjcxs = CC.WUGONGNEIGONG[iwgng][3]
                nglevel = math.modf(p["武功等级" .. ing] / 100) + 1
                ngwggjl = ngwggjl + ngwgzjwl(nglevel, wgsh[i], wgjcxs, true)
                break
              end
            end
          end
        end
        menu[i] = {
          string.format("%10s  %2d级  %2s  内：%3d  威力：%4d + %5d", JY.Wugong[tmp]["名称"], level[i], gjstr, nlxh, wgsh[i], ngwggjl),
          nil,
          1
        }
      elseif wgshlx == 1 or wgshlx == 3 then
        wgjnl = JY.Wugong[tmp]["加内力" .. level[i]]
        wgsnl = JY.Wugong[tmp]["杀内力" .. level[i]]
        menu[i] = {
          string.format("%10s  %2d级  %2s  吸：%3d  威力：%4d", JY.Wugong[tmp]["名称"], level[i], "●", wgjnl, wgsnl),
          nil,
          1
        }
      end
      if 1 > JY.Wugong[tmp]["移动范围10"] then
        menu[i][3] = 0
      end
      if JY.Wugong[tmp]["消耗内力点数"] > JY.Person[pid]["内力"] then
        menu[i][3] = 0
      end
      numwugong = numwugong + 1
    else
      menu[i] = {
        "",
        nil,
        0
      }
    end
  end
  if numwugong == 0 then
    return 0
  end
  local r
  r = ShowMenu(menu, #menu, 0, CC.MainSubMenuX, CC.MainSubMenuY, 0, 0, 1, 1, CC.DefaultFont * 1.2, C_ORANGE, C_WHITE, JY.WGXZWZ[pid])
  if r == 0 then
    return 0
  end
  JY.WGXZWZ[pid] = 0
  for i = 1, r do
    if menu[i][3] == 1 then
      JY.WGXZWZ[pid] = JY.WGXZWZ[pid] + 1
    end
  end
  WAR.ShowHead = 0
  local r2 = War_Fight_Sub(WAR.CurID, r)
  WAR.ShowHead = 1
  Cls()
  return r2
end
function War_AutoAnqi(id, x, y)
  local pid = WAR.Person[WAR.CurID]["人物编号"]
  local step
  if CC.SHGS > 2 then
    step = math.modf(JY.Person[pid]["暗器技巧"] / CC.PersonAttribMax["暗器技巧"] / 15 * 200) + 1
  else
    step = math.modf(JY.Person[pid]["暗器技巧"] / 15) + 1
  end
  War_CalMoveStep(WAR.CurID, step, 1)
  if x == nil then
    Cls()
    return 0
  else
    return War_ExecuteMenu_Sub(x, y, 4, id)
  end
end

function War_fight_hurtType0(emeny, wugong, level)

  local NGHT = CONFIG.NGHT or 0
  if CC.SHGS == 0 then
    if NGHT == 0 then
      WAR.Person[emeny]["点数"] = -War_WugongHurtLife(emeny, wugong, level)
    else
      WAR.Person[emeny]["点数"] = -War_WugongHurtLife1(emeny, wugong, level)
    end
  else
    if NGHT == 0 then
      WAR.Person[emeny]["点数"] = -War_WugongHurtLife_CL(emeny, wugong, level)
    else
      WAR.Person[emeny]["点数"] = -War_WugongHurtLife1_CL(emeny, wugong, level)
    end
  end
end

function War_fight_hurtType2(emeny, wugong, level)

  local NGHT = CONFIG.NGHT or 0
  if CC.SHGS == 0 then
    if NGHT == 0 then
      WAR.Person[emeny]["点数"] = -War_WugongHurt(emeny, wugong, level)
    else
      WAR.Person[emeny]["点数"] = -War_WugongHurt1(emeny, wugong, level)
    end
  else
    if NGHT == 0 then
      WAR.Person[emeny]["点数"] = -War_WugongHurt_CL(emeny, wugong, level)
    else
      WAR.Person[emeny]["点数"] = -War_WugongHurt1_CL(emeny, wugong, level)
    end
  end
end

function War_fight_hurtType3(emeny, wugong, level)

  local NGHT = CONFIG.NGHT or 0
  if CC.SHGS == 0 then
    if NGHT == 0 then
      WAR.Person[emeny]["点数"] = -War_WugongHurtType3(emeny, wugong, level)
    else
      WAR.Person[emeny]["点数"] = -War_WugongHurt1Type3(emeny, wugong, level)
    end
  else
    if NGHT == 0 then
      WAR.Person[emeny]["点数"] = -War_WugongHurt_CLType3(emeny, wugong, level)
    else
      WAR.Person[emeny]["点数"] = -War_WugongHurt1_CLType3(emeny, wugong, level)
    end
  end
end

function War_Fight_Sub(id, wugongnum, x, y)
  local pid = WAR.Person[id]["人物编号"]
  local wugong, level, fightscope
  CleanWarMap(4, 0)
  if wugongnum == -1 then
    War_AutoAnqi(JY.AQID, x, y)
    return 1
  else
    wugong = JY.Person[pid]["武功" .. wugongnum]
    level = math.modf(JY.Person[pid]["武功等级" .. wugongnum] / 100) + 1
    fightscope = JY.Wugong[wugong]["攻击范围"]
  end
  if fightscope == 0 then
    if War_FightSelectType0(wugong, level, x, y) == false then
      return 0
    end
  elseif fightscope == 1 then
    if War_FightSelectType1(wugong, level, x, y) == false then
      return 0
    end
  elseif fightscope == 2 then
    if War_FightSelectType2(wugong, level, x, y) == false then
      return 0
    end
  elseif fightscope == 3 and War_FightSelectType3(wugong, level, x, y) == false then
    return 0
  end
  local fightnum = 1
  if JY.Person[pid]["左右互搏"] == 1 then
    fightnum = 2
  end
  lib.PicLoadFile(string.format(CC.FightPicFile[1], JY.Person[pid]["头像代号"]), string.format(CC.FightPicFile[2], JY.Person[pid]["头像代号"]), 4)
  if fightnum == 2 then
    DrawStrBox(-1, -1, "左右互搏之术", C_RED, CC.StartMenuFontSize)
    ShowScreen()
    lib.Delay(300)
  end
  Cls()
  JY.SHOWWG = JY.Wugong[wugong]["名称"]
  JY.SWGT = lib.GetTime()
  for k = 1, fightnum do
    for i = 0, CC.WarWidth - 1 do
      for j = 0, CC.WarHeight - 1 do
        local effect = GetWarMap(i, j, 4)
        if 0 < effect then
          local emeny = GetWarMap(i, j, 2)
          if 0 <= emeny and WAR.Person[WAR.CurID]["我方"] ~= WAR.Person[emeny]["我方"] then
            lib.Debug(string.format("wugongliexing: %d", JY.Wugong[wugong]["伤害类型"]))
            if JY.Wugong[wugong]["伤害类型"] == 0 then

              War_fight_hurtType0(emeny, wugong, level)
              WAR.Effect = 2
              SetWarMap(i, j, 4, 2)
            elseif JY.Wugong[wugong]["伤害类型"] == 1 then
              WAR.Person[emeny]["点数"] = -War_WugongHurtNeili(emeny, wugong, level)
              SetWarMap(i, j, 4, 3)
              WAR.Effect = 3
            elseif JY.Wugong[wugong]["伤害类型"] == 2 then
              War_fight_hurtType2(emeny, wugong, level)
              WAR.Effect = 2
              SetWarMap(i, j, 4, 2)
            elseif JY.Wugong[wugong]["伤害类型"] == 3 then
              War_fight_hurtType3(emeny, wugong, level)
              WAR.Effect = 3
              SetWarMap(i, j, 4, 3)
            end
          end
        end
      end
    end
    x, y = Movex, Movey
    War_ShowFight(pid, wugong, JY.Wugong[wugong]["武功类型"], level, x, y, JY.Wugong[wugong]["武功动画&音效"])
    for i = 0, WAR.PersonNum - 1 do
      WAR.Person[i]["点数"] = 0
    end
    WAR.Person[WAR.CurID]["经验"] = WAR.Person[WAR.CurID]["经验"] + 2
    if JY.Person[pid]["武功等级" .. wugongnum] < 900 then
      JY.Person[pid]["武功等级" .. wugongnum] = JY.Person[pid]["武功等级" .. wugongnum] + Rnd(2) + 1
    end
    if math.modf(JY.Person[pid]["武功等级" .. wugongnum] / 100) + 1 ~= level then
      level = math.modf(JY.Person[pid]["武功等级" .. wugongnum] / 100) + 1
      DrawStrBox(-1, -1, string.format("%s 升为 %d 级", JY.Wugong[wugong]["名称"], level), C_ORANGE, CC.DefaultFont)
      ShowScreen()
      lib.Delay(500)
      Cls()
      ShowScreen()
    end
    AddPersonAttrib(pid, "内力", -math.modf((level + 1) / 2) * JY.Wugong[wugong]["消耗内力点数"])
  end
  AddPersonAttrib(pid, "体力", -3)
  return 1
end
function DrawYY(x, y, pic, pic2, yy)
  local x0 = WAR.Person[WAR.CurID]["坐标X"]
  local y0 = WAR.Person[WAR.CurID]["坐标Y"]
  local xyz = x - x0
  local yyz = y - y0
  local mvx1 = 0
  local mvy1 = 0
  if yyz < 0 then
    mvx1 = mvx1 + 1 * math.abs(yyz)
    mvy1 = mvy1 - 1 * math.abs(yyz)
  end
  if 0 < yyz then
    mvx1 = mvx1 - 1 * math.abs(yyz)
    mvy1 = mvy1 + 1 * math.abs(yyz)
  end
  if xyz < 0 then
    mvx1 = mvx1 - 1 * math.abs(xyz)
    mvy1 = mvy1 - 1 * math.abs(xyz)
  end
  if 0 < xyz then
    mvx1 = mvx1 + 1 * math.abs(xyz)
    mvy1 = mvy1 + 1 * math.abs(xyz)
  end
  lib.PicLoadCache(0, 0, CC.ScreenW / 2 + CC.XScale * mvx1, CC.ScreenH / 2 + CC.YScale * mvy1, 2, yy)
end
function YYZhi(x, y, str, pic, pic2, yy, color, fontsize, xadd, yadd, isbox)
  if xadd == nil then
    xadd = 0
  end
  if yadd == nil then
    yadd = 0
  end
  local x0 = 0
  local y0 = 0
  if JY.Status == GAME_SMAP then
    x0 = JY.Base["人X1"]
    y0 = JY.Base["人Y1"]
    if x0 <= 7 then
      x0 = 8
    end
    if 52 <= x0 then
      x0 = 51
    end
    if y0 <= 7 then
      y0 = 8
    end
    if 52 <= y0 then
      y0 = 51
    end
  elseif JY.Status == GAME_WMAP then
    x0 = WAR.Person[WAR.CurID]["坐标X"]
    y0 = WAR.Person[WAR.CurID]["坐标Y"]
  elseif JY.Status == GAME_MMAP then
    x0 = JY.Base["人X"]
    y0 = JY.Base["人Y"]
  end
  local xyz = x - x0
  local yyz = y - y0
  local mvx1 = 0
  local mvy1 = 0
  if yyz < 0 then
    mvx1 = mvx1 + 1 * math.abs(yyz)
    mvy1 = mvy1 - 1 * math.abs(yyz)
  end
  if 0 < yyz then
    mvx1 = mvx1 - 1 * math.abs(yyz)
    mvy1 = mvy1 + 1 * math.abs(yyz)
  end
  if xyz < 0 then
    mvx1 = mvx1 - 1 * math.abs(xyz)
    mvy1 = mvy1 - 1 * math.abs(xyz)
  end
  if 0 < xyz then
    mvx1 = mvx1 + 1 * math.abs(xyz)
    mvy1 = mvy1 + 1 * math.abs(xyz)
  end
  local wx = CC.ScreenW / 2 + CC.XScale * mvx1 + xadd
  local hx = CC.ScreenH / 2 + CC.YScale * mvy1 + yadd
  if pic ~= nil and pic2 ~= nil then
    lib.PicLoadCache(pic, pic2, CC.ScreenW / 2 + CC.XScale * mvx1, CC.ScreenH / 2 + CC.YScale * mvy1, 2, yy)
  end
  if fontsize == nil then
    fontsize = CC.DefaultFont
  end
  if isbox == nil then
    isbox = 0
  end
  if isbox == 1 then
    local xb1 = wx - string.len(str) / 4 * fontsize - CC.RowPixel
    local yb1 = hx - CC.YScale * 7 - CC.RowPixel
    local xb2 = xb1 + string.len(str) / 2 * fontsize + CC.RowPixel * 2
    local yb2 = yb1 + fontsize + CC.RowPixel * 2
    DrawBox(xb1, yb1, xb2, yb2, C_WHITE)
  end
  if str ~= nil then
    DrawString(wx - string.len(str) / 4 * fontsize, hx - CC.YScale * 7, str, color, fontsize)
  end
end
function GJYY(x, y, lx, v1, v2, v3, v4, v5)
  local rsnum = 0
  if lx == 0 then
  end
  if lx == 1 then
    local x0 = WAR.Person[WAR.CurID]["坐标X"]
    local y0 = WAR.Person[WAR.CurID]["坐标Y"]
    local lujinx = {}
    local lujiny = {}
    local mvljx = {}
    local mvljy = {}
    local mvx1 = 0
    local mvy1 = 0
    for i = 1, v1 do
      lujinx[i] = 0
      lujiny[i] = 0
      mvljx[i] = x0
      mvljy[i] = y0
    end
    if v2 == 0 then
      for i = 1, v1 do
        lujinx[i] = mvx1 + i
        lujiny[i] = mvy1 - i
        mvljy[i] = y0 - i
        mvljx[i] = x0
      end
    elseif v2 == 3 then
      for i = 1, v1 do
        lujinx[i] = mvx1 - i
        lujiny[i] = mvy1 + i
        mvljy[i] = y0 + i
        mvljx[i] = x0
      end
    elseif v2 == 2 then
      for i = 1, v1 do
        lujinx[i] = mvx1 - i
        lujiny[i] = mvy1 - i
        mvljx[i] = x0 - i
        mvljy[i] = y0
      end
    elseif v2 == 1 then
      for i = 1, v1 do
        lujinx[i] = mvx1 + i
        lujiny[i] = mvy1 + i
        mvljx[i] = x0 + i
        mvljy[i] = y0
      end
    end
    for i = 1, v1 do
      if 0 <= GetWarMap(mvljx[i], mvljy[i], 2) then
        if WAR.Person[WAR.CurID]["我方"] ~= WAR.Person[GetWarMap(mvljx[i], mvljy[i], 2)]["我方"] then
          if CC.ScreenW >= 128 then
            ShowZhi(mvljx[i], mvljy[i])
          end
          rsnum = rsnum + 1
        end
      else
        lib.PicLoadCache(0, 0, CC.ScreenW / 2 + CC.XScale * lujinx[i], CC.ScreenH / 2 + CC.YScale * lujiny[i], 2, 100)
      end
    end
  end
  if lx == 2 then
    local x0 = WAR.Person[WAR.CurID]["坐标X"]
    local y0 = WAR.Person[WAR.CurID]["坐标Y"]
    local lujinx = {}
    local lujiny = {}
    local mvljx = {}
    local mvljy = {}
    local mvx1 = 0
    local mvy1 = 0
    for i = 1, 4 do
      lujinx[i] = {}
      lujiny[i] = {}
      mvljx[i] = {}
      mvljy[i] = {}
    end
    for i = 1, v1 do
      lujinx[1][i] = mvx1 + i
      lujiny[1][i] = mvy1 - i
      mvljy[1][i] = y0 - i
      mvljx[1][i] = x0
      lujinx[2][i] = mvx1 - i
      lujiny[2][i] = mvy1 + i
      mvljy[2][i] = y0 + i
      mvljx[2][i] = x0
      lujinx[3][i] = mvx1 - i
      lujiny[3][i] = mvy1 - i
      mvljx[3][i] = x0 - i
      mvljy[3][i] = y0
      lujinx[4][i] = mvx1 + i
      lujiny[4][i] = mvy1 + i
      mvljx[4][i] = x0 + i
      mvljy[4][i] = y0
    end
    local pdjs = true
    for j = 1, 4 do
      for i = 1, v1 do
        if 0 <= GetWarMap(mvljx[j][i], mvljy[j][i], 2) then
          if WAR.Person[WAR.CurID]["我方"] ~= WAR.Person[GetWarMap(mvljx[j][i], mvljy[j][i], 2)]["我方"] then
            if CC.ScreenW >= 128 then
              ShowZhi(mvljx[j][i], mvljy[j][i])
            end
            rsnum = rsnum + 1
          end
        else
          lib.PicLoadCache(0, 0, CC.ScreenW / 2 + CC.XScale * lujinx[j][i], CC.ScreenH / 2 + CC.YScale * lujiny[j][i], 2, 100)
        end
      end
    end
  end
  DrawString(CC.ScreenW / 2 - CC.DefaultFont * 5, CC.ScreenH - CC.DefaultFont * 4, JY.WGMC .. string.format("  可击中%d人", rsnum), C_WHITE, CC.DefaultFont)
end
function War_FightSelectType0(wugong, level, x1, y1)
  local x0 = WAR.Person[WAR.CurID]["坐标X"]
  local y0 = WAR.Person[WAR.CurID]["坐标Y"]
  War_CalMoveStep(WAR.CurID, JY.Wugong[wugong]["移动范围" .. level], 1)
  if x1 == nil and y1 == nil then
    JY.WGMC = JY.Wugong[wugong]["名称"]
    x1, y1 = War_SelectMove1(0, JY.Wugong[wugong]["移动范围" .. level], 0)
    JY.WGMC = ""
  end
  if x1 == nil then
    Cls()
    JY.WGMC = ""
    return false
  end
  WAR.Person[WAR.CurID]["人方向"] = War_Direct(x0, y0, x1, y1)
  SetWarMap(x1, y1, 4, 1)
  WAR.EffectXY = {}
  WAR.EffectXY[1] = {x1, y1}
  WAR.EffectXY[2] = {x1, y1}
end
function War_FightSelectType1(wugong, level, x, y)
  local x0 = WAR.Person[WAR.CurID]["坐标X"]
  local y0 = WAR.Person[WAR.CurID]["坐标Y"]
  local direct
  local move = JY.Wugong[wugong]["移动范围" .. level]
  WAR.EffectXY = {}
  if x == nil and y == nil then
    direct = WAR.Person[WAR.CurID]["人方向"]
    Cls()
    GJYY(nil, nil, 1, move, direct)
    ShowScreen()
    local key, ktype, mx, my
    JY.WGMC = JY.Wugong[wugong]["名称"]
    while true do
      key, ktype, mx, my = WaitKey(1)
      if key == VK_UP then
        direct = 0
        Cls()
        GJYY(nil, nil, 1, move, direct)
      elseif key == VK_DOWN then
        direct = 3
        Cls()
        GJYY(nil, nil, 1, move, direct)
      elseif key == VK_LEFT then
        direct = 2
        Cls()
        GJYY(nil, nil, 1, move, direct)
      elseif key == VK_RIGHT then
        direct = 1
        Cls()
        GJYY(nil, nil, 1, move, direct)
      elseif key == VK_ESCAPE or ktype == 4 then
        direct = -1
        JY.WGMC = ""
        return false
      elseif ktype == 2 then
        mx = mx - CC.ScreenW / 2
        my = my - CC.ScreenH / 2
        mx = mx / CC.XScale
        my = my / CC.YScale
        mx, my = (mx + my) / 2, (my - mx) / 2
        if 0 < mx then
          mx = mx + 0.99
        else
          mx = mx - 0.01
        end
        if 0 < my then
          my = my + 0.99
        else
          mx = mx - 0.01
        end
        mx = math.modf(mx)
        my = math.modf(my)
        for i = 0, 10 do
          if mx + i <= 63 and 63 < my + i then
            break
          end
          local hb = GetS(JY.SubScene, x0 + mx + i, y0 + my + i, 4)
          if math.abs(hb - CC.YScale * i * 2) < 5 then
            mx = mx + i
            my = my + i
          end
        end
        if math.abs(mx) >= math.abs(my) then
          if 0 <= mx then
            direct = 1
            Cls()
            GJYY(nil, nil, 1, move, direct)
          elseif mx < 0 then
            direct = 2
            Cls()
            GJYY(nil, nil, 1, move, direct)
          end
        end
        if math.abs(my) > math.abs(mx) then
          if 0 <= my then
            direct = 3
            Cls()
            GJYY(nil, nil, 1, move, direct)
          elseif my < 0 then
            direct = 0
            Cls()
            GJYY(nil, nil, 1, move, direct)
          end
        end
      end
      if 0 <= direct and (key == VK_RETURN or key == VK_SPACE or ktype == 3) then
        break
      end
      ShowScreen()
    end
    JY.WGMC = ""
  else
    direct = War_Direct(x0, y0, x, y)
  end
  WAR.Person[WAR.CurID]["人方向"] = direct
  for i = 1, move do
    if direct == 0 then
      SetWarMap(x0, y0 - i, 4, 1)
    elseif direct == 3 then
      SetWarMap(x0, y0 + i, 4, 1)
    elseif direct == 2 then
      SetWarMap(x0 - i, y0, 4, 1)
    elseif direct == 1 then
      SetWarMap(x0 + i, y0, 4, 1)
    end
  end
  if direct == 0 then
    WAR.EffectXY[1] = {
      x0,
      y0 - 1
    }
    WAR.EffectXY[2] = {
      x0,
      y0 - move
    }
  elseif direct == 3 then
    WAR.EffectXY[1] = {
      x0,
      y0 + 1
    }
    WAR.EffectXY[2] = {
      x0,
      y0 + move
    }
  elseif direct == 2 then
    WAR.EffectXY[1] = {
      x0 - 1,
      y0
    }
    WAR.EffectXY[2] = {
      x0 - move,
      y0
    }
  elseif direct == 1 then
    WAR.EffectXY[1] = {
      x0 + 1,
      y0
    }
    WAR.EffectXY[2] = {
      x0 + move,
      y0
    }
  end
end
function War_FightSelectType2(wugong, level)
  local x0 = WAR.Person[WAR.CurID]["坐标X"]
  local y0 = WAR.Person[WAR.CurID]["坐标Y"]
  local move = JY.Wugong[wugong]["移动范围" .. level]
  WAR.EffectXY = {}
  if WAR.AutoFight == 0 and WAR.Person[WAR.CurID]["我方"] == true then
    JY.WGMC = JY.Wugong[wugong]["名称"]
    local key, ktype, mx, my
    while true do
      Cls()
      GJYY(nil, nil, 2, move)
      ShowScreen()
      key, ktype, mx, my = WaitKey(1)
      Cls()
      if key == VK_ESCAPE or ktype == 4 then
        Cls()
        JY.WGMC = ""
        return false
      elseif key == VK_RETURN or key == VK_SPACE or ktype == 3 then
        Cls()
        break
      end
    end
    JY.WGMC = ""
  end
  local j = 1
  for i = 1, move do
    SetWarMap(x0, y0 - i, 4, 1)
    SetWarMap(x0, y0 + i, 4, 1)
    SetWarMap(x0 - i, y0, 4, 1)
    SetWarMap(x0 + i, y0, 4, 1)
  end
  WAR.EffectXY[1] = {
    x0 - move,
    y0
  }
  WAR.EffectXY[2] = {
    x0 + move,
    y0
  }
end
function War_FightSelectType3(wugong, level, x1, y1)
  local x0 = WAR.Person[WAR.CurID]["坐标X"]
  local y0 = WAR.Person[WAR.CurID]["坐标Y"]
  War_CalMoveStep(WAR.CurID, JY.Wugong[wugong]["移动范围" .. level], 1)
  JY.WGMC = JY.Wugong[wugong]["名称"]
  if x1 == nil and y1 == nil then
    x1, y1 = War_SelectMove1(3, JY.Wugong[wugong]["移动范围" .. level], JY.Wugong[wugong]["杀伤范围" .. level])
  end
  if x1 == nil then
    Cls()
    JY.WGMC = ""
    return false
  end
  WAR.Person[WAR.CurID]["人方向"] = War_Direct(x0, y0, x1, y1)
  local move = JY.Wugong[wugong]["杀伤范围" .. level]
  WAR.EffectXY = {}
  for i = -move, move do
    for j = -move, move do
      SetWarMap(x1 + i, y1 + j, 4, 1)
    end
  end
  WAR.EffectXY[1] = {
    x1 - 2 * move,
    y1
  }
  WAR.EffectXY[2] = {
    x1 + 2 * move,
    y1
  }
end
function War_Direct(x1, y1, x2, y2)
  local x = x2 - x1
  local y = y2 - y1
  if math.abs(y) > math.abs(x) then
    if 0 < y then
      return 3
    else
      return 0
    end
  elseif 0 < x then
    return 1
  else
    return 2
  end
end
function War_ShowFight(pid, wugong, wugongtype, level, x, y, eft)
  local x0 = WAR.Person[WAR.CurID]["坐标X"]
  local y0 = WAR.Person[WAR.CurID]["坐标Y"]
  local fightdelay, fightframe, sounddelay
  if 0 <= wugongtype then
    fightdelay = JY.Person[pid]["出招动画延迟" .. wugongtype + 1]
    fightframe = JY.Person[pid]["出招动画帧数" .. wugongtype + 1]
    sounddelay = JY.Person[pid]["武功音效延迟" .. wugongtype + 1]
  else
    fightdelay = 0
    fightframe = -1
    sounddelay = -1
  end
  if fightdelay == 0 or fightframe == 0 then
    fightdelay = JY.Person[pid]["出招动画延迟" .. 2]
    fightframe = JY.Person[pid]["出招动画帧数" .. 2]
    sounddelay = JY.Person[pid]["武功音效延迟" .. 2]
    wugongtype = 1
  end
  local framenum = fightdelay + CC.Effect[eft]
  local startframe = 0
  if 0 <= wugongtype then
    for i = 0, wugongtype - 1 do
      startframe = startframe + 4 * JY.Person[pid]["出招动画帧数" .. i + 1]
    end
  end
  local starteft = 0
  for i = 0, eft - 1 do
    starteft = starteft + CC.Effect[i]
  end
  WAR.Person[WAR.CurID]["贴图类型"] = 0
  WAR.Person[WAR.CurID]["贴图"] = WarCalPersonPic(WAR.CurID)
  WarSetPerson()
  WarDrawMap(0)
  ShowScreen()
  local fastdraw
  if CONFIG.FastShowScreen == 0 or CC.AutoWarShowHead == 1 then
    fastdraw = 0
  else
    fastdraw = 1
  end
  local oldpic = WAR.Person[WAR.CurID]["贴图"] / 2
  local oldpic_type = 0
  local oldeft = -1
  for i = 0, framenum - 1 do
    local tstart = lib.GetTime()
    local mytype
    if 0 < fightframe then
      WAR.Person[WAR.CurID]["贴图类型"] = 1
      mytype = 4
      if i < fightframe then
        WAR.Person[WAR.CurID]["贴图"] = (startframe + WAR.Person[WAR.CurID]["人方向"] * fightframe + i) * 2
      end
    else
      WAR.Person[WAR.CurID]["贴图类型"] = 0
      WAR.Person[WAR.CurID]["贴图"] = WarCalPersonPic(WAR.CurID)
      mytype = 0
    end
    if i == sounddelay then
      PlayWavAtk(JY.Wugong[wugong]["出招音效"])
    end
    if i == fightdelay then
      PlayWavE(eft)
    end
    local pic = WAR.Person[WAR.CurID]["贴图"] / 2
    if fastdraw == 1 then
      local rr = ClipRect(Cal_PicClip(0, 0, oldpic, oldpic_type, 0, 0, pic, mytype))
      if rr ~= nil then
        lib.SetClip(0, 0, CC.ScreenW, CC.ScreenH)
      end
    else
    end
    oldpic = pic
    oldpic_type = mytype
    if i < fightdelay then
      WarDrawMap(4, pic * 2, mytype, -1)
    else
      starteft = starteft + 1
      if fastdraw == 1 then
        local clip1 = {}
        clip1 = Cal_PicClip(WAR.EffectXY[1][1] - x0, WAR.EffectXY[1][2] - y0, oldeft, 3, WAR.EffectXY[1][1] - x0, WAR.EffectXY[1][2] - y0, starteft, 3)
        local clip2 = {}
        clip2 = Cal_PicClip(WAR.EffectXY[2][1] - x0, WAR.EffectXY[2][2] - y0, oldeft, 3, WAR.EffectXY[2][1] - x0, WAR.EffectXY[2][2] - y0, starteft, 3)
        local clip = ClipRect(MergeRect(clip1, clip2))
        if clip ~= nil then
          lib.SetClip(0, 0, CC.ScreenW, CC.ScreenH)
          WarDrawMap(4, pic * 2, mytype, starteft * 2, -1, 3)
        else
          WarDrawMap(4, pic * 2, mytype, starteft * 2, -1, 3)
        end
      else
        WarDrawMap(4, pic * 2, mytype, starteft * 2, -1, 3)
      end
      oldeft = starteft
    end
    ShowScreen(fastdraw)
    local tend = lib.GetTime()
    if tend - tstart < 1 * CC.Frame then
      lib.Delay(1 * CC.Frame - (tend - tstart))
    end
  end
  WAR.Person[WAR.CurID]["贴图类型"] = 0
  WAR.Person[WAR.CurID]["贴图"] = WarCalPersonPic(WAR.CurID)
  WarSetPerson()
  WarDrawMap(0)
  ShowScreen()
  lib.Delay(200)
  WarDrawMap(2)
  ShowScreen()
  lib.Delay(200)
  WarDrawMap(0)
  ShowScreen()
  local HitXY = {}
  local HitXYNum = 0
  for i = 0, WAR.PersonNum - 1 do
    local x1 = WAR.Person[i]["坐标X"]
    local y1 = WAR.Person[i]["坐标Y"]
    if WAR.Person[i]["死亡"] == false and 1 < GetWarMap(x1, y1, 4) then
      local n = WAR.Person[i]["点数"]
      HitXY[HitXYNum] = {
        x1,
        y1,
        string.format("%+d", n)
      }
      HitXYNum = HitXYNum + 1
    end
  end
  if 0 < HitXYNum then
    local clips = {}
    for i = 0, HitXYNum - 1 do
      local dx = HitXY[i][1] - x0
      local dy = HitXY[i][2] - y0
      local ll = string.len(HitXY[i][3])
      local w = ll * CC.DefaultFont / 2 * (CONFIG.Zoom / 100 / CC.Zoom) + 1
      clips[i] = {
        x1 = CC.XScale * (dx - dy) + CC.ScreenW / 2,
        y1 = CC.YScale * (dx + dy) + CC.ScreenH / 2,
        x2 = CC.XScale * (dx - dy) + CC.ScreenW / 2 + w,
        y2 = CC.YScale * (dx + dy) + CC.ScreenH / 2 + CC.DefaultFont * (CONFIG.Zoom / 100 / CC.Zoom) + 1
      }
    end
    local clip = clips[0]
    for i = 1, HitXYNum - 1 do
      clip = MergeRect(clip, clips[i])
    end
    local area = (clip.x2 - clip.x1) * (clip.y2 - clip.y1)
    for i = 1, 15 do
      local tstart = lib.GetTime()
      local y_off = (i + 40) * CC.Zoom * (CONFIG.Zoom / 100 / CC.Zoom)
      if fastdraw == 1 and area < CC.ScreenW * CC.ScreenH / 2 then
        local tmpclip = {
          x1 = clip.x1,
          y1 = clip.y1 - y_off,
          x2 = clip.x2,
          y2 = clip.y2 - y_off
        }
        tmpclip = ClipRect(tmpclip)
        if tmpclip ~= nil then
          lib.SetClip(0, 0, CC.ScreenW, CC.ScreenH)
          WarDrawMap(0)
          for j = 0, HitXYNum - 1 do
            local len1 = string.len(tostring(HitXY[j][3])) / 4
            DrawString(clips[j].x1 - CC.DefaultFont * len1, clips[j].y1 - y_off - CC.DefaultFont, HitXY[j][3], WAR.EffectColor[WAR.Effect], CC.DefaultFont * (CONFIG.Zoom / 100 / CC.Zoom))
          end
        end
      else
        WarDrawMap(0)
        for j = 0, HitXYNum - 1 do
          local len1 = string.len(tostring(HitXY[j][3])) / 4
          DrawString(clips[j].x1 - CC.DefaultFont * len1, clips[j].y1 - y_off - CC.DefaultFont, HitXY[j][3], WAR.EffectColor[WAR.Effect], CC.DefaultFont * (CONFIG.Zoom / 100 / CC.Zoom))
        end
      end
      ShowScreen(1)
      local tend = lib.GetTime()
      if tend - tstart < CC.Frame then
        lib.Delay(CC.Frame - (tend - tstart))
      end
    end
  end
  WarDrawMap(0)
  ShowScreen()
end
function War_WugongHurtLife(emenyid, wugong, level)
  local pid = WAR.Person[WAR.CurID]["人物编号"]
  local eid = WAR.Person[emenyid]["人物编号"]
  local mywuxue = 0
  local emenywuxue = 0
  for i = 0, WAR.PersonNum - 1 do
    local id = WAR.Person[i]["人物编号"]
    if WAR.Person[i]["死亡"] == false and JY.Person[id]["武学常识"] >= CC.WXCS then
      if WAR.Person[WAR.CurID]["我方"] == WAR.Person[i]["我方"] then
        mywuxue = mywuxue + JY.Person[id]["武学常识"]
      else
        emenywuxue = emenywuxue + JY.Person[id]["武学常识"]
      end
    end
  end
  while math.modf((level + 1) / 2) * JY.Wugong[wugong]["消耗内力点数"] > JY.Person[pid]["内力"] do
    level = level - 1
    goto lbl_80
    do break end
    ::lbl_80::
  end
  if level <= 0 then
    level = 1
  end
  local phgjl = 0
  for i, v in ipairs(CC.ExtraOffense) do
    if v[1] == JY.Person[pid]["武器"] and v[2] == wugong then
      phgjl = v[3]
      break
    end
  end
  for i, v in ipairs(CC.ExtraOffense) do
    if v[1] == JY.Person[pid]["防具"] and v[2] == wugong then
      phgjl = phgjl + v[3]
      break
    end
  end
  local wgwl = JY.Wugong[wugong]["攻击力" .. level]
  local jsgjl = JY.Person[pid]["攻击力"]
  local zbgjl = 0
  if 0 <= JY.Person[pid]["武器"] then
    zbgjl = zbgjl + JY.Thing[JY.Person[pid]["武器"]]["加攻击力"]
  end
  if 0 <= JY.Person[pid]["防具"] then
    zbgjl = zbgjl + JY.Thing[JY.Person[pid]["防具"]]["加攻击力"]
  end
  local jsfyl = JY.Person[eid]["防御力"]
  local zbfyl = 0
  if 0 <= JY.Person[eid]["武器"] then
    zbfyl = zbfyl + JY.Thing[JY.Person[eid]["武器"]]["加防御力"]
  end
  if 0 <= JY.Person[eid]["防具"] then
    zbfyl = zbfyl + JY.Thing[JY.Person[eid]["防具"]]["加防御力"]
  end
  local wgjnd = CC.YXND[JY.YXNDXZ][1]
  local wfynd = CC.YXND[JY.YXNDXZ][2]
  local dgjnd = CC.YXND[JY.YXNDXZ][3]
  local dfynd = CC.YXND[JY.YXNDXZ][4]
  local hurt
  if WAR.Person[WAR.CurID]["我方"] then
    hurt = ((mywuxue * 2 + (jsgjl * 3 + wgwl) / 2 + zbgjl + phgjl) * wgjnd - (emenywuxue * 2 + jsfyl + zbfyl) * 3 * dfynd) * 2 / 3 + Rnd(20) - Rnd(20)
  else
    hurt = ((mywuxue * 2 + (jsgjl * 3 + wgwl) / 2 + zbgjl + phgjl) * dgjnd - (emenywuxue * 2 + jsfyl + zbfyl) * 3 * wfynd) * 2 / 3 + Rnd(20) - Rnd(20)
  end
  if hurt < 0 then
    hurt = Rnd(10) + 1
  end
  hurt = hurt + JY.Person[pid]["体力"] / 15 + JY.Person[eid]["受伤程度"] / 20
  local offset = math.abs(WAR.Person[WAR.CurID]["坐标X"] - WAR.Person[emenyid]["坐标X"]) + math.abs(WAR.Person[WAR.CurID]["坐标Y"] - WAR.Person[emenyid]["坐标Y"])
  if offset < 10 then
    hurt = hurt * (100 - (offset - 1) * 3) / 100
  else
    hurt = hurt * 2 / 3
  end
  hurt = math.modf(hurt)
  if hurt <= 0 then
    hurt = Rnd(8) + 1
  end
  JY.Person[eid]["生命"] = JY.Person[eid]["生命"] - hurt
  WAR.Person[WAR.CurID]["经验"] = WAR.Person[WAR.CurID]["经验"] + math.modf(hurt / 5)
  if 0 >= JY.Person[eid]["生命"] then
    JY.Person[eid]["生命"] = 0
    WAR.Person[WAR.CurID]["经验"] = WAR.Person[WAR.CurID]["经验"] + JY.Person[eid]["等级"] * 10
    if JY.DEADKG == 1 then
      local did
      for i = 0, WAR.PersonNum - 1 do
        if JY.DEADPD[i][1] == eid then
          did = i
          break
        end
      end
      if JY.DEADPD[did][2] == 0 then
        local name1 = JY.Person[pid]["姓名"]
        local name2 = JY.Person[eid]["姓名"]
        local size = CC.DefaultFont * 1.5
        local str = name1 .. " 击败 " .. name2
        local slen = string.len(str)
        if WAR.Person[WAR.CurID]["我方"] == false then
          DrawStrBox(-1, -1, str, C_RED, size)
        else
          DrawStrBox(-1, -1, str, C_GOLD, size)
        end
        ShowScreen()
        lib.Delay(500)
        Cls()
        JY.DEADPD[did][2] = 1
      end
    end
  end
  AddPersonAttrib(eid, "受伤程度", math.modf(hurt / 10))
  local poisonnum = level * JY.Wugong[wugong]["敌人中毒点数"] + JY.Person[pid]["攻击带毒"] * 5
  if JY.Person[eid]["抗毒能力"] > CC.PersonAttribMax["抗毒能力"] then
    JY.Person[eid]["抗毒能力"] = 75
  end
  if poisonnum > JY.Person[eid]["抗毒能力"] and JY.Person[eid]["抗毒能力"] < CC.PersonAttribMax["抗毒能力"] * 9 / 10 then
    if CC.SHGS == 0 then
      AddPersonAttrib(eid, "中毒程度", math.modf(poisonnum / 15))
    else
      local dkmax = JY.Person[eid]["抗毒能力"] / CC.PersonAttribMax["抗毒能力"] * 100
      if 80 < dkmax then
        dkmax = 80
      end
      poisonnum = math.modf(poisonnum * (100 - dkmax) / 100)
      if 1000 < poisonnum then
        poisonnum = 1000
      end
      AddPersonAttrib(eid, "中毒程度", math.modf(poisonnum / 30))
    end
  end
  return hurt
end
function War_WugongHurtLife1(emenyid, wugong, level)
  local pid = WAR.Person[WAR.CurID]["人物编号"]
  local eid = WAR.Person[emenyid]["人物编号"]
  local mywuxue = 0
  local emenywuxue = 0
  for i = 0, WAR.PersonNum - 1 do
    local id = WAR.Person[i]["人物编号"]
    if WAR.Person[i]["死亡"] == false and JY.Person[id]["武学常识"] >= CC.WXCS then
      if WAR.Person[WAR.CurID]["我方"] == WAR.Person[i]["我方"] then
        mywuxue = mywuxue + JY.Person[id]["武学常识"]
      else
        emenywuxue = emenywuxue + JY.Person[id]["武学常识"]
      end
    end
  end
  while math.modf((level + 1) / 2) * JY.Wugong[wugong]["消耗内力点数"] > JY.Person[pid]["内力"] do
    level = level - 1
    goto lbl_80
    do break end
    ::lbl_80::
  end
  if level <= 0 then
    level = 1
  end
  local phgjl = 0
  for i, v in ipairs(CC.ExtraOffense) do
    if v[1] == JY.Person[pid]["武器"] and v[2] == wugong then
      phgjl = v[3]
      break
    end
  end
  local wgwl = JY.Wugong[wugong]["攻击力" .. level]
  local jsgjl = JY.Person[pid]["攻击力"]
  local zbgjl = 0
  if 0 <= JY.Person[pid]["武器"] then
    zbgjl = zbgjl + JY.Thing[JY.Person[pid]["武器"]]["加攻击力"]
  end
  if 0 <= JY.Person[pid]["防具"] then
    zbgjl = zbgjl + JY.Thing[JY.Person[pid]["防具"]]["加攻击力"]
  end
  local jsfyl = JY.Person[eid]["防御力"]
  local zbfyl = 0
  if 0 <= JY.Person[eid]["武器"] then
    zbfyl = zbfyl + JY.Thing[JY.Person[eid]["武器"]]["加防御力"]
  end
  if 0 <= JY.Person[eid]["防具"] then
    zbfyl = zbfyl + JY.Thing[JY.Person[eid]["防具"]]["加防御力"]
  end
  local hurt = (mywuxue * 2 + (jsgjl * 3 + wgwl) / 2 + zbgjl + phgjl - (emenywuxue * 2 + jsfyl + zbfyl) * 3) * 2 / 3 + Rnd(20) - Rnd(20)
  hurt = hurt + JY.Person[pid]["体力"] / 15 + JY.Person[eid]["受伤程度"] / 20
  local ngatt = 0
  local ngdef = 0
  local ngyz = math.modf((CC.PersonAttribMax["内力最大值"] + 1) / 1000)
  local ngcz = math.modf(JY.Person[pid]["资质"] / 15)
  local maxnl = math.modf(((9 - ngcz) * 30 + 410) * ngyz)
  if maxnl < JY.Person[pid]["内力"] then
    ngatt = ngatt + math.modf(maxnl / (20 - ngcz) / ngyz * 1.5)
  else
    ngatt = ngatt + math.modf(JY.Person[pid]["内力"] / (20 - ngcz) / ngyz * 1.5)
  end
  if maxnl < JY.Person[eid]["内力"] then
    ngdef = ngdef + math.modf(maxnl / (14 + ngcz) / ngyz)
  else
    ngdef = ngdef + math.modf(JY.Person[eid]["内力"] / (14 + ngcz) / ngyz)
  end
  hurt = hurt + ngatt - ngdef
  local offset = math.abs(WAR.Person[WAR.CurID]["坐标X"] - WAR.Person[emenyid]["坐标X"]) + math.abs(WAR.Person[WAR.CurID]["坐标Y"] - WAR.Person[emenyid]["坐标Y"])
  if offset < 10 then
    hurt = hurt * (100 - (offset - 1) * 3) / 100
  else
    hurt = hurt * 2 / 3
  end
  hurt = math.modf(hurt)
  if hurt <= 0 then
    hurt = Rnd(8) + 1
  end
  local htbs = math.modf((CC.PersonAttribMax["内力最大值"] + 1) / 10)
  local nllevel = math.modf(JY.Person[eid]["内力"] / htbs)
  if 5 < nllevel then
    nllevel = 5
  end
  if htbs <= JY.Person[eid]["内力"] then
    local htnum = nllevel * 4
    if htnum < JY.Person[eid]["内力"] then
      if hurt < htnum then
        JY.Person[eid]["内力"] = JY.Person[eid]["内力"] - hurt
        hurt = 0
      else
        JY.Person[eid]["内力"] = JY.Person[eid]["内力"] - htnum
        hurt = hurt - htnum
      end
    end
  end
  JY.Person[eid]["生命"] = JY.Person[eid]["生命"] - hurt
  WAR.Person[WAR.CurID]["经验"] = WAR.Person[WAR.CurID]["经验"] + math.modf(hurt / 5)
  if 0 >= JY.Person[eid]["生命"] then
    JY.Person[eid]["生命"] = 0
    WAR.Person[WAR.CurID]["经验"] = WAR.Person[WAR.CurID]["经验"] + JY.Person[eid]["等级"] * 10
  end
  AddPersonAttrib(eid, "受伤程度", math.modf(hurt / 10))
  local poisonnum = level * JY.Wugong[wugong]["敌人中毒点数"] + JY.Person[pid]["攻击带毒"] * 5
  if poisonnum > JY.Person[eid]["抗毒能力"] + math.modf(JY.Person[eid]["内力"] / 100) and JY.Person[eid]["抗毒能力"] < 90 then
    if CC.SHGS == 0 then
      AddPersonAttrib(eid, "中毒程度", math.modf(poisonnum / 15))
    else
      local dkmax = JY.Person[eid]["抗毒能力"]
      if 80 < dkmax then
        dkmax = 80
      end
      poisonnum = math.modf(poisonnum * (100 - dkmax) / 100)
      if 1000 < poisonnum then
        poisonnum = 1000
      end
      AddPersonAttrib(eid, "中毒程度", math.modf(poisonnum / 20))
    end
  end
  return hurt
end

function War_WugongHurt_CL(emenyid, wugong, level)
  local hurt = War_WugongHurtLife_CL(emenyid, wugong, level)
  War_WugongHurtNeili(emenyid, wugong, level)
  War_WugongHurtTili(emenyid, wugong, level)
  return hurt
end

function War_WugongHurt_CLType3(emenyid, wugong, level)
  local hurt = War_WugongHurtNeili(emenyid, wugong, level)
  War_WugongHurtTili(emenyid, wugong, level)
  return hurt
end

function War_WugongHurt1_CL(emenyid, wugong, level)
  local hurt = War_WugongHurtLife1_CL(emenyid, wugong, level)
  War_WugongHurtNeili(emenyid, wugong, level)
  War_WugongHurtTili(emenyid, wugong, level)
  return hurt
end

function War_WugongHurt1_CLType3(emenyid, wugong, level)
  local hurt = War_WugongHurtNeili(emenyid, wugong, level)
  War_WugongHurtTili(emenyid, wugong, level)
  return hurt
end

function War_WugongHurt(emenyid, wugong, level)
  local hurt = War_WugongHurtLife(emenyid, wugong, level)
  War_WugongHurtNeili(emenyid, wugong, level)
  War_WugongHurtTili(emenyid, wugong, level)
  return hurt
end

function War_WugongHurtType3(emenyid, wugong, level)
  local hurt = War_WugongHurtNeili(emenyid, wugong, level)
  War_WugongHurtTili(emenyid, wugong, level)
  return hurt
end

function War_WugongHurt1(emenyid, wugong, level)
  local hurt = War_WugongHurtLife1(emenyid, wugong, level)
  War_WugongHurtNeili(emenyid, wugong, level)
  War_WugongHurtTili(emenyid, wugong, level)
  return hurt
end

function War_WugongHurt1Type3(emenyid, wugong, level)
  local hurt = War_WugongHurtNeili(emenyid, wugong, level)
  War_WugongHurtTili(emenyid, wugong, level)
  return hurt
end

function War_WugongHurtLife_CL(emenyid, wugong, level)
  local pid = WAR.Person[WAR.CurID]["人物编号"]
  local eid = WAR.Person[emenyid]["人物编号"]
  local mywuxue = 0
  local emenywuxue = 0
  for i = 0, WAR.PersonNum - 1 do
    local id = WAR.Person[i]["人物编号"]
    if WAR.Person[i]["死亡"] == false and JY.Person[id]["武学常识"] >= CC.WXCS then
      if WAR.Person[WAR.CurID]["我方"] == WAR.Person[i]["我方"] then
        if CC.SHGS == 3 then
          if mywuxue < JY.Person[id]["武学常识"] then
            mywuxue = JY.Person[id]["武学常识"]
          end
          if mywuxue > JY.WARWF * (CC.PersonAttribMax["武学常识"] / 1) then
            mywuxue = JY.WARWF * (CC.PersonAttribMax["武学常识"] / 1)
          end
        else
          mywuxue = mywuxue + JY.Person[id]["武学常识"]
        end
      elseif CC.SHGS == 3 then
        if emenywuxue < JY.Person[id]["武学常识"] then
          emenywuxue = JY.Person[id]["武学常识"]
        end
        if emenywuxue > JY.WARDF * (CC.PersonAttribMax["武学常识"] / 1) then
          emenywuxue = JY.WARDF * (CC.PersonAttribMax["武学常识"] / 1)
        end
      else
        emenywuxue = emenywuxue + JY.Person[id]["武学常识"]
      end
    end
  end
  if mywuxue > CC.WFWXSX then
    mywuxue = CC.WFWXSX
  end
  if emenywuxue > CC.DFWXSX then
    emenywuxue = CC.DFWXSX
  end
  while math.modf((level + 1) / 2) * JY.Wugong[wugong]["消耗内力点数"] > JY.Person[pid]["内力"] do
    level = level - 1
    goto lbl_154
    do break end
    ::lbl_154::
  end
  if level <= 0 then
    level = 1
  end
  local fightnum = 0
  local wqph = 0
  for i, v in ipairs(CC.ExtraOffense) do
    if v[1] == JY.Person[pid]["武器"] and v[2] == wugong then
      wqph = v[3]
      break
    end
  end
  for i, v in ipairs(CC.ExtraOffense) do
    if v[1] == JY.Person[pid]["防具"] and v[2] == wugong then
      wqph = wqph + v[3]
      break
    end
  end
  local wgwl = JY.Wugong[wugong]["攻击力" .. level]
  local jsgjl = JY.Person[pid]["攻击力"]
  local zbgjl = 0
  if 0 <= JY.Person[pid]["武器"] then
    zbgjl = JY.Thing[JY.Person[pid]["武器"]]["加攻击力"]
  end
  if 0 <= JY.Person[pid]["防具"] then
    zbgjl = zbgjl + JY.Thing[JY.Person[pid]["防具"]]["加攻击力"]
    if CC.YCSX == 1 and JY.Thing[JY.Person[pid]["防具"]]["代号"] == 58 then
      jsgjl = jsgjl + 500
    end
  end
  local atadd = 1
  local yxnd = 0
  local txqh = 1.5
  local tsjs = 0
  if JY.YXND == 1 then
    yxnd = 0.15
    txqh = 1.25
  elseif JY.YXND == 2 then
    yxnd = 0.3
    txqh = 1
  end
  if CC.JS == 1 then
    tsjs = 0.25
  end
  local wgjnd = CC.YXND[JY.YXNDXZ][1]
  local wfynd = CC.YXND[JY.YXNDXZ][2]
  local dgjnd = CC.YXND[JY.YXNDXZ][3]
  local dfynd = CC.YXND[JY.YXNDXZ][4]
  local ngwggjl = 0
  for iwgng = 1, #CC.WUGONGNEIGONG do
    local p = JY.Person[pid]
    if wugong == CC.WUGONGNEIGONG[iwgng][2] then
      for ing = 1, 10 do
        if p["武功" .. ing] == CC.WUGONGNEIGONG[iwgng][1] then
          local wgjcxs = CC.WUGONGNEIGONG[iwgng][3]
          local nglevel = math.modf(p["武功等级" .. ing] / 100) + 1
          ngwggjl = ngwgzjwl(nglevel, wgwl, wgjcxs, WAR.Person[WAR.CurID]["我方"])
          break
        end
      end
    end
  end
  wgwl = wgwl + ngwggjl
  if WAR.Person[WAR.CurID]["我方"] then
    atadd = 1
    fightnum = (wgwl / 3 + jsgjl + (zbgjl + wqph) * 2 / 3) * atadd + mywuxue * 1.2
    fightnum = fightnum * wgjnd
  else
    atadd = 1 + JY.ZCWGCS / 20 + yxnd + tsjs
    fightnum = (wgwl / 3 + jsgjl + (zbgjl + wqph) * 2 / 3) * atadd + mywuxue * 1.2
    fightnum = fightnum * dgjnd
  end
  local wglxsh, nlmax, neishang
  nlmax = JY.Person[pid]["内力最大值"]
  neishang = JY.Person[pid]["受伤程度"]
  if JY.Wugong[wugong]["武功类型"] == 1 then
    wglxsh = JY.Person[pid]["拳掌功夫"]
  elseif JY.Wugong[wugong]["武功类型"] == 2 then
    wglxsh = JY.Person[pid]["御剑能力"]
  elseif JY.Wugong[wugong]["武功类型"] == 3 then
    wglxsh = JY.Person[pid]["耍刀技巧"]
  elseif JY.Wugong[wugong]["武功类型"] == 4 then
    wglxsh = JY.Person[pid]["特殊兵器"]
  end
  local diziyx, gaoziyx
  if 6 >= JY.Person[pid]["资质"] / 10 then
    diziyx = 0.03 * (6 - JY.Person[pid]["资质"] / 10)
  elseif JY.Person[pid]["资质"] / 10 > 5 then
    gaoziyx = 0.04 * (9 - (JY.Person[pid]["资质"] - 10) / 10)
  end
  local ziyxg = 0
  local nlxzg = 0
  local nlxzf = 0
  local zyg = 0
  
  if 0 < JY.Person[pid]["左右互搏"] then
    zyg = 0
  end
  if CC.SHGS == 2 then
    if WAR.Person[WAR.CurID]["我方"] then
      fightnum = (jsgjl + mywuxue * 3 + wgwl / 3 + nlmax / 25 + wglxsh * 1.5) * (1 - neishang / 200) + wqph * 2 / 3 + zbgjl
      fightnum = fightnum * wgjnd
    else
      fightnum = (jsgjl + mywuxue * 3 + wgwl / 3 + nlmax / 25 + wglxsh * 1.5) * (1 - neishang / 200) + wqph * 2 / 3 + zbgjl
      fightnum = fightnum * dgjnd
    end
  elseif CC.SHGS == 3 then
    if WAR.Person[WAR.CurID]["我方"] then
      fightnum = (jsgjl / 1 * 1 + mywuxue * 3 + wgwl * 2 / 3 + nlmax / 25 / 2 + wglxsh / 4) * (1 - neishang / 200 / 2) + wqph * 2 / 3 + zbgjl / 2
      fightnum = fightnum * wgjnd / 2
    else
      fightnum = (jsgjl / 1 * 1 + mywuxue * 3 + wgwl * 2 / 3 + nlmax / 25 / 2 + wglxsh / 4) * (1 - neishang / 200 / 2) + wqph * 2 / 3 + zbgjl / 2
      fightnum = fightnum * (dgjnd + JY.NDXS + JY.NDXS1) / 2
    end
    fightnum = fightnum * math.modf(CC.PersonAttribMax["生命最大值"] / 999 / 2)
  end
  local defencenum = 0
  local zfyl = JY.Person[eid]["防御力"]
  local zbfyl = 0
  local jsfyl = JY.Person[eid]["防御力"]
  if 0 <= JY.Person[eid]["武器"] then
    zfyl = zfyl + JY.Thing[JY.Person[eid]["武器"]]["加防御力"]
    zbfyl = JY.Thing[JY.Person[eid]["武器"]]["加防御力"]
  end
  if 0 <= JY.Person[eid]["防具"] then
    zfyl = zfyl + JY.Thing[JY.Person[eid]["防具"]]["加防御力"]
    zbfyl = zbfyl + JY.Thing[JY.Person[eid]["防具"]]["加防御力"]
  end
  if WAR.Person[WAR.CurID]["我方"] == false then
    atadd = 1
    defencenum = zfyl * 2 * atadd + emenywuxue * 4
    defencenum = defencenum * wfynd
  else
    atadd = 1 + JY.ZCWGCS / 20 + yxnd + tsjs
    defencenum = zfyl * 2 * atadd + emenywuxue * 4
    defencenum = defencenum * dfynd
  end
  local wglxfy
  nlmax = JY.Person[eid]["内力最大值"]
  neishang = JY.Person[eid]["受伤程度"]
  if JY.Wugong[wugong]["武功类型"] == 1 then
    wglxfy = JY.Person[eid]["拳掌功夫"]
  elseif JY.Wugong[wugong]["武功类型"] == 2 then
    wglxfy = JY.Person[eid]["御剑能力"]
  elseif JY.Wugong[wugong]["武功类型"] == 3 then
    wglxfy = JY.Person[eid]["耍刀技巧"]
  elseif JY.Wugong[wugong]["武功类型"] == 4 then
    wglxfy = JY.Person[eid]["特殊兵器"]
  end
  local ziyxf = 0
  if CC.SHGS == 2 then
    if WAR.Person[WAR.CurID]["我方"] == false then
      defencenum = (jsfyl * 2 + emenywuxue * 3 + nlmax / 25 + wglxfy * 1.5) * (1 - neishang / 200) + zbfyl * 2
      defencenum = defencenum * wfynd * 1
    else
      defencenum = (jsfyl * 2 + emenywuxue * 3 + nlmax / 25 + wglxfy * 1.5) * (1 - neishang / 200) + zbfyl * 2
      defencenum = defencenum * dfynd * 1
    end
  elseif CC.SHGS == 3 then
    if WAR.Person[WAR.CurID]["我方"] == false then
      defencenum = (jsfyl / 1 * 1 + emenywuxue * 3 + nlmax / 25 / 2 * 1 + wglxfy / 4 * 1) * (1 - neishang / 200 / 2) + zbfyl * 1
      defencenum = defencenum * wfynd
    else
      defencenum = (jsfyl / 1 * 1 + emenywuxue * 3 + nlmax / 25 / 2 * 1 + wglxfy / 4 * 1) * (1 - neishang / 200 / 2) + zbfyl * 1
      defencenum = defencenum * dfynd * (1 + JY.NDXS + JY.NDXS1) / 2
    end
    defencenum = defencenum * math.modf(CC.PersonAttribMax["生命最大值"] / 999 / 2)
  end
  local bsxg = 1
  if pid == 0 and JY.Person[pid]["姓名"] == "szlzw" and JY.Wugong[30]["未知2"] ~= 0 and CC.JS == 1 then
    bsxg = 2
  end
  if eid == 0 and JY.Person[eid]["姓名"] == "szlzw" and JY.Wugong[30]["未知2"] ~= 0 and CC.JS == 1 then
    bsxg = 2
  end
  if pid == 0 and JY.Person[pid]["外号"] == "拳霸" and JY.Wugong[wugong]["武功类型"] == 1 and CC.JS == 1 then
    local lev = JY.Person[pid]["等级"]
    local zizhi = 10 - math.modf((JY.Person[pid]["资质"] - 1) / 10)
    local gailv = math.modf(lev / 2 * txqh / bsxg) + zizhi + JY.ZCWGCS
    if 30 <= gailv then
      gailv = 30
    end
    if gailv >= Rnd(100) + 1 then
      defencenum = defencenum - math.modf(defencenum / 2)
      local xgstr = JY.Person[pid]["姓名"] .. "→对 " .. JY.Person[eid]["姓名"] .. " 发动破防攻击"
      local xglen = #xgstr
      Cls()
      DrawString(CC.ScreenW / 2 - CC.StartMenuFontSize * xglen / 4, CC.ScreenH / 2, xgstr, C_WHITE, CC.StartMenuFontSize)
      ShowScreen()
      lib.Delay(1000)
    end
  end
  local hurt = fightnum - defencenum
  local ys = 15
  if CC.SHGS == 3 then
    ys = 15 - math.modf((10000 - CC.PersonAttribMax["生命最大值"]) / 999 * 0.7)
  end
  if CC.FK == 1 then
    if hurt < fightnum / ys then
      hurt = math.modf(fightnum / ys)
    end
    hurt = hurt * (1 + nlxzg - nlxzf + zyg) + hurt * (ziyxg - ziyxf)
  elseif hurt < fightnum / 7 then
    hurt = math.modf(fightnum / 7)
  end
  hurt = hurt + Rnd(6) - Rnd(6)
  hurt = hurt + JY.Person[pid]["体力"] / 15 + JY.Person[eid]["受伤程度"] / 20
  local offset = math.abs(WAR.Person[WAR.CurID]["坐标X"] - WAR.Person[emenyid]["坐标X"]) + math.abs(WAR.Person[WAR.CurID]["坐标Y"] - WAR.Person[emenyid]["坐标Y"])
  if offset < 10 then
    hurt = hurt * (100 - (offset - 1) * 3) / 100
  else
    hurt = hurt * 2 / 3
  end
  hurt = math.modf(hurt)
  if hurt <= 0 then
    hurt = Rnd(8) + 1
  end
  if pid == 0 and JY.Person[pid]["外号"] == "剑魔" and JY.Wugong[wugong]["武功类型"] == 2 and CC.JS == 1 then
    local lev = JY.Person[pid]["等级"]
    local zizhi = 10 - math.modf((JY.Person[pid]["资质"] - 1) / 10)
    local gailv = math.modf(lev / 2 * txqh / bsxg) + zizhi + JY.ZCWGCS
    if 30 <= gailv then
      gailv = 30
    end
    if gailv >= Rnd(100) + 1 then
      JY.Person[pid]["生命"] = JY.Person[pid]["生命"] + hurt + math.modf(hurt * lev / 100 + 1)
      if JY.Person[pid]["生命"] > CC.PersonAttribMax["生命最大值"] then
        JY.Person[pid]["生命"] = CC.PersonAttribMax["生命最大值"]
      end
      local xgstr = JY.Person[pid]["姓名"] .. "→发动嗜血攻击，生命恢复 " .. math.modf(hurt * lev / 100 / bsxg + 1)
      local xglen = #xgstr
      Cls()
      DrawString(CC.ScreenW / 2 - CC.StartMenuFontSize * xglen / 4, CC.ScreenH / 2, xgstr, C_WHITE, CC.StartMenuFontSize)
      ShowScreen()
      lib.Delay(500)
    end
  end
  if pid == 0 and JY.Person[pid]["外号"] == "幻影" and CC.JS == 1 then
    hurt = hurt + math.modf(hurt * JY.Person[pid]["等级"] / 200 * txqh / bsxg) + 1
    local xgstr = JY.Person[pid]["姓名"] .. "→发动影子攻击，伤害增加 " .. math.modf(hurt * JY.Person[pid]["等级"] / 200 * txqh / bsxg) + 1
    local xglen = #xgstr
    Cls()
    DrawString(CC.ScreenW / 2 - CC.StartMenuFontSize * xglen / 4, CC.ScreenH / 2, xgstr, C_WHITE, CC.StartMenuFontSize)
    ShowScreen()
    lib.Delay(100)
  end
  if eid == 0 and JY.Person[eid]["外号"] == "幻影" and CC.JS == 1 then
    local lev = JY.Person[eid]["等级"]
    local zizhi = 10 - math.modf((JY.Person[eid]["资质"] - 1) / 10)
    local gailv = math.modf(lev / 2 * txqh / bsxg) + zizhi + JY.ZCWGCS
    if 30 <= gailv then
      gailv = 30
    end
    if gailv >= Rnd(100) + 1 then
      hurt = 0
      local xgstr = JY.Person[eid]["姓名"] .. "→发动影子回避，" .. JY.Person[pid]["姓名"] .. " 的攻击无效"
      local xglen = #xgstr
      Cls()
      DrawString(CC.ScreenW / 2 - CC.StartMenuFontSize * xglen / 4, CC.ScreenH / 2, xgstr, C_WHITE, CC.StartMenuFontSize)
      ShowScreen()
      lib.Delay(1000)
    end
  end
  if pid == 0 and JY.Person[pid]["外号"] == "刀痴" and JY.Wugong[wugong]["武功类型"] == 3 and CC.JS == 1 then
    local lev = JY.Person[pid]["等级"]
    local zizhi = 10 - math.modf((JY.Person[pid]["资质"] - 1) / 10)
    local gailv = math.modf(lev / 2 * txqh / bsxg) + zizhi + JY.ZCWGCS
    if 30 <= gailv then
      gailv = 30
    end
    if gailv >= Rnd(100) + 1 then
      if JY.Person[eid]["生命"] * 3 / 2 < JY.Person[eid]["生命最大值"] then
        if hurt < JY.Person[eid]["生命"] then
          hurt = JY.Person[eid]["生命"] + 1
        end
        local xgstr = "刀痴→对 " .. JY.Person[eid]["姓名"] .. " 一击必杀"
        local xglen = #xgstr
        DrawString(CC.ScreenW / 2 - CC.StartMenuFontSize * xglen / 4, CC.ScreenH / 2, xgstr, C_WHITE, CC.StartMenuFontSize)
        ShowScreen()
        lib.Delay(1000)
      elseif hurt < math.modf(JY.Person[eid]["生命"] / 2) then
        hurt = math.modf(JY.Person[eid]["生命"] / 2)
        local xgstr = JY.Person[pid]["姓名"] .. "→对 " .. JY.Person[eid]["姓名"] .. " 发动斩断伤害"
        local xglen = #xgstr
        Cls()
        DrawString(CC.ScreenW / 2 - CC.StartMenuFontSize * xglen / 4, CC.ScreenH / 2, xgstr, C_WHITE, CC.StartMenuFontSize)
        ShowScreen()
        lib.Delay(1000)
      else
        hurt = JY.Person[eid]["生命"] + 1
        local xgstr = JY.Person[pid]["姓名"] .. "→对 " .. JY.Person[eid]["姓名"] .. " 发动一击必杀"
        local xglen = #xgstr
        Cls()
        DrawString(CC.ScreenW / 2 - CC.StartMenuFontSize * xglen / 4, CC.ScreenH / 2, xgstr, C_WHITE, CC.StartMenuFontSize)
        ShowScreen()
        lib.Delay(1000)
      end
    end
  end
  if pid == 0 and JY.Person[pid]["外号"] == "特狂" and JY.Wugong[wugong]["武功类型"] == 4 and CC.JS == 1 then
    local lev = JY.Person[pid]["等级"]
    local zizhi = 10 - math.modf((JY.Person[pid]["资质"] - 1) / 10)
    local gailv = math.modf(lev / 2 * txqh / bsxg) + zizhi + JY.ZCWGCS
    if 30 <= gailv then
      gailv = 30
    end
    if gailv >= Rnd(100) + 1 then
      hurt = hurt * 2
      local xgstr = JY.Person[pid]["姓名"] .. "→对 " .. JY.Person[eid]["姓名"] .. " 发动暴击伤害"
      local xglen = #xgstr
      Cls()
      DrawString(CC.ScreenW / 2 - CC.StartMenuFontSize * xglen / 4, CC.ScreenH / 2, xgstr, C_WHITE, CC.StartMenuFontSize)
      ShowScreen()
      lib.Delay(1000)
    end
  end
  if eid == 0 and JY.Person[eid]["外号"] == "神助" and CC.JS == 1 then
    local lev = JY.Person[pid]["等级"]
    local zizhi = 10 - math.modf((JY.Person[eid]["资质"] - 1) / 10)
    local gailv = math.modf(lev * txqh / bsxg) + zizhi + JY.ZCWGCS
    if 50 <= gailv then
      gailv = 50
    end
    hurt = hurt - math.modf(hurt * gailv / 100)
    local xgstr = JY.Person[eid]["姓名"] .. "→发动天神护体，伤害减少 " .. math.modf(hurt * gailv / 100)
    local xglen = #xgstr
    Cls()
    DrawString(CC.ScreenW / 2 - CC.StartMenuFontSize * xglen / 4, CC.ScreenH / 2, xgstr, C_WHITE, CC.StartMenuFontSize)
    ShowScreen()
    lib.Delay(300)
  end
  JY.Person[eid]["生命"] = JY.Person[eid]["生命"] - hurt
  WAR.Person[WAR.CurID]["经验"] = WAR.Person[WAR.CurID]["经验"] + math.modf(hurt / 5)
  if 0 >= JY.Person[eid]["生命"] then
    JY.Person[eid]["生命"] = 0
    WAR.Person[WAR.CurID]["经验"] = WAR.Person[WAR.CurID]["经验"] + JY.Person[eid]["等级"] * 10
    if JY.DEADKG == 1 then
      local did
      for i = 0, WAR.PersonNum - 1 do
        if JY.DEADPD[i][1] == eid then
          did = i
          break
        end
      end
      if JY.DEADPD[did][2] == 0 then
        local name1 = JY.Person[pid]["姓名"]
        local name2 = JY.Person[eid]["姓名"]
        local size = CC.DefaultFont * 1.5
        local str = name1 .. " 击败 " .. name2
        local slen = string.len(str)
        if WAR.Person[WAR.CurID]["我方"] == false then
          DrawStrBox(-1, -1, str, C_RED, size)
        else
          DrawStrBox(-1, -1, str, C_GOLD, size)
        end
        ShowScreen()
        lib.Delay(500)
        Cls()
        JY.DEADPD[did][2] = 1
      end
    end
  end
  local smsx = math.modf(CC.PersonAttribMax["生命最大值"] / 999)
  AddPersonAttrib(eid, "受伤程度", math.modf(hurt / 10 / smsx))
  local duye = 0
  if pid == 0 and JY.Person[pid]["外号"] == "毒王" and CC.JS == 1 then
    local zizhi = 10 - math.modf((JY.Person[pid]["资质"] - 1) / 10)
    duye = math.modf(JY.Person[pid]["等级"] / bsxg * txqh) + zizhi + JY.ZCWGCS
    if 40 <= duye then
      duye = 40
    end
  end
  local poisonnum = level * JY.Wugong[wugong]["敌人中毒点数"] + JY.Person[pid]["攻击带毒"] * 3 + duye * 5
  local gs3 = 1
  if CC.SHGS == 3 then
    poisonnum = level * JY.Wugong[wugong]["敌人中毒点数"] * 5
    if 500 < poisonnum then
      poisonnum = 500
    end
    poisonnum = poisonnum + JY.Person[pid]["攻击带毒"] * 5
    gs3 = 5
  end
  if JY.Person[eid]["抗毒能力"] > CC.PersonAttribMax["抗毒能力"] then
    JY.Person[eid]["抗毒能力"] = 75
  end
  if poisonnum > JY.Person[eid]["抗毒能力"] * 5 and JY.Person[eid]["抗毒能力"] < CC.PersonAttribMax["抗毒能力"] * 9 / 10 then
    if CC.SHGS == 0 then
      AddPersonAttrib(eid, "中毒程度", math.modf(poisonnum / 15))
    else
      local dkmax = JY.Person[eid]["抗毒能力"] / CC.PersonAttribMax["抗毒能力"] * 100
      if 100 < dkmax then
        dkmax = 100
      end
      poisonnum = math.modf(poisonnum * (100 - dkmax) / 100)
      if 1000 < poisonnum then
        poisonnum = 1000
      end
      local dsnum = math.modf(poisonnum / 10)
      if 50 < dsnum then
        dsnum = 50
      end
      AddPersonAttrib(eid, "中毒程度", dsnum)
    end
  end
  return hurt
end
function War_WugongHurtLife1_CL(emenyid, wugong, level)
  local pid = WAR.Person[WAR.CurID]["人物编号"]
  local eid = WAR.Person[emenyid]["人物编号"]
  local mywuxue = 0
  local emenywuxue = 0
  for i = 0, WAR.PersonNum - 1 do
    local id = WAR.Person[i]["人物编号"]
    if WAR.Person[i]["死亡"] == false and JY.Person[id]["武学常识"] > CC.WXCS then
      if WAR.Person[WAR.CurID]["我方"] == WAR.Person[i]["我方"] then
        mywuxue = mywuxue + JY.Person[id]["武学常识"]
      else
        emenywuxue = emenywuxue + JY.Person[id]["武学常识"]
      end
    end
  end
  while math.modf((level + 1) / 2) * JY.Wugong[wugong]["消耗内力点数"] > JY.Person[pid]["内力"] do
    level = level - 1
    goto lbl_80
    do break end
    ::lbl_80::
  end
  if level <= 0 then
    level = 1
  end
  local fightnum = 0
  local wqph = 0
  for i, v in ipairs(CC.ExtraOffense) do
    if v[1] == JY.Person[pid]["武器"] and v[2] == wugong then
      wqph = v[3]
      break
    end
  end
  local wgwl = JY.Wugong[wugong]["攻击力" .. level]
  local jsgjl = JY.Person[pid]["攻击力"]
  local zbgjl = 0
  if 0 <= JY.Person[pid]["武器"] then
    zbgjl = JY.Thing[JY.Person[pid]["武器"]]["加攻击力"]
  end
  if 0 <= JY.Person[pid]["防具"] then
    zbgjl = zbgjl + JY.Thing[JY.Person[pid]["防具"]]["加攻击力"]
  end
  local atadd = 1
  if WAR.Person[WAR.CurID]["我方"] then
    fightnum = wgwl / 3 + jsgjl + (zbgjl + wqph) * 2 / 3 + mywuxue * 1.2
  else
    atadd = 1 + JY.ZCWGCS / 20
    fightnum = (wgwl / 3 + jsgjl + (zbgjl + wqph) * 2 / 3 + mywuxue * 1.2) * atadd
  end
  local defencenum = 0
  local zfyl = JY.Person[eid]["防御力"]
  if 0 <= JY.Person[eid]["武器"] then
    zfyl = zfyl + JY.Thing[JY.Person[eid]["武器"]]["加防御力"]
  end
  if 0 <= JY.Person[eid]["防具"] then
    zfyl = zfyl + JY.Thing[JY.Person[eid]["防具"]]["加防御力"]
  end
  if WAR.Person[WAR.CurID]["我方"] == false then
    atadd = 1
    defencenum = (zfyl * 2 + emenywuxue * 4) * atadd
  else
    atadd = 1 + JY.ZCWGCS / 10
    defencenum = (zfyl * 2 + emenywuxue * 4) * atadd
  end
  local hurt = fightnum - defencenum
  if hurt < fightnum / 8 and 0 < hurt then
    hurt = fightnum / 8
    if 70 < hurt then
      hurt = 70
    end
  elseif hurt < 0 then
    hurt = fightnum / 8
    if 70 < hurt then
      hurt = 70
    end
  end
  hurt = hurt + JY.Person[pid]["体力"] / 15 + JY.Person[eid]["受伤程度"] / 20
  local ngatt = 0
  local ngdef = 0
  local ngyz = math.modf((CC.PersonAttribMax["内力最大值"] + 1) / 1000)
  local ngcz = math.modf(JY.Person[pid]["资质"] / 15)
  local maxnl = math.modf(((9 - ngcz) * 30 + 410) * ngyz)
  if maxnl < JY.Person[pid]["内力"] then
    ngatt = ngatt + math.modf(maxnl / (20 - ngcz) / ngyz * 1.5)
  else
    ngatt = ngatt + math.modf(JY.Person[pid]["内力"] / (20 - ngcz) / ngyz * 1.5)
  end
  if maxnl < JY.Person[eid]["内力"] then
    ngdef = ngdef + math.modf(maxnl / (14 + ngcz) / ngyz)
  else
    ngdef = ngdef + math.modf(JY.Person[eid]["内力"] / (14 + ngcz) / ngyz)
  end
  hurt = hurt + ngatt - ngdef
  local offset = math.abs(WAR.Person[WAR.CurID]["坐标X"] - WAR.Person[emenyid]["坐标X"]) + math.abs(WAR.Person[WAR.CurID]["坐标Y"] - WAR.Person[emenyid]["坐标Y"])
  if offset < 10 then
    hurt = hurt * (100 - (offset - 1) * 3) / 100
  else
    hurt = hurt * 2 / 3
  end
  hurt = math.modf(hurt)
  if hurt <= 0 then
    hurt = Rnd(8) + 1
  end
  if pid == 0 and JY.Person[pid]["外号"] == "拳霸" and CC.JS == 1 then
    hurt = hurt + math.modf(hurt * JY.Person[pid]["等级"] / 200)
  end
  if eid == 0 and JY.Person[eid]["外号"] == "剑魔" and CC.JS == 1 then
    local lev = JY.Person[eid]["等级"]
    if Rnd(100) + 1 <= math.modf(lev / 2) then
      hurt = 0
      local xgstr = "剑魔→闪躲成功"
      local xglen = #xgstr
      DrawString(CC.ScreenW / 2 - CC.StartMenuFontSize * xglen / 4, CC.ScreenH / 2, xgstr, C_WHITE, CC.StartMenuFontSize)
      ShowScreen()
      lib.Delay(1000)
    end
  end
  if pid == 0 and JY.Person[pid]["外号"] == "刀痴" and CC.JS == 1 then
    local lev = JY.Person[pid]["等级"]
    if Rnd(100) + 1 <= math.modf(lev / 2) and JY.Person[eid]["生命"] * 2 < JY.Person[eid]["生命最大值"] then
      if hurt < JY.Person[eid]["生命"] then
        hurt = JY.Person[eid]["生命"] + 1
      end
      local xgstr = "刀痴→一击必杀"
      local xglen = #xgstr
      DrawString(CC.ScreenW / 2 - CC.StartMenuFontSize * xglen / 4, CC.ScreenH / 2, xgstr, C_WHITE, CC.StartMenuFontSize)
      ShowScreen()
      lib.Delay(1000)
    end
  end
  if pid == 0 and JY.Person[pid]["外号"] == "特狂" and CC.JS == 1 then
    local lev = JY.Person[pid]["等级"]
    if Rnd(100) + 1 <= math.modf(lev / 2) then
      hurt = hurt + hurt
      local xgstr = "特狂→暴击成功"
      local xglen = #xgstr
      DrawString(CC.ScreenW / 2 - CC.StartMenuFontSize * xglen / 4, CC.ScreenH / 2, xgstr, C_WHITE, CC.StartMenuFontSize)
      ShowScreen()
      lib.Delay(1000)
    end
  end
  if eid == 0 and JY.Person[eid]["外号"] == "神助" and CC.JS == 1 then
    hurt = hurt - math.modf(hurt * JY.Person[pid]["等级"] / 100)
  end
  local htbs = math.modf((CC.PersonAttribMax["内力最大值"] + 1) / 10)
  local nllevel = math.modf(JY.Person[eid]["内力"] / htbs)
  if 5 < nllevel then
    nllevel = 5
  end
  if htbs <= JY.Person[eid]["内力"] then
    local htnum = nllevel * 4
    if htnum < JY.Person[eid]["内力"] then
      if hurt < htnum then
        JY.Person[eid]["内力"] = JY.Person[eid]["内力"] - hurt
        hurt = 0
      else
        JY.Person[eid]["内力"] = JY.Person[eid]["内力"] - htnum
        hurt = hurt - htnum
      end
    end
  end
  JY.Person[eid]["生命"] = JY.Person[eid]["生命"] - hurt
  WAR.Person[WAR.CurID]["经验"] = WAR.Person[WAR.CurID]["经验"] + math.modf(hurt / 5)
  if 0 > JY.Person[eid]["生命"] then
    JY.Person[eid]["生命"] = 0
    WAR.Person[WAR.CurID]["经验"] = WAR.Person[WAR.CurID]["经验"] + JY.Person[eid]["等级"] * 10
  end
  AddPersonAttrib(eid, "受伤程度", math.modf(hurt / 10))
  local poisonnum = level * JY.Wugong[wugong]["敌人中毒点数"] + JY.Person[pid]["攻击带毒"] * 5
  if poisonnum > JY.Person[eid]["抗毒能力"] + math.modf(JY.Person[eid]["内力"] / 1000) and JY.Person[eid]["抗毒能力"] < 90 then
    if CC.SHGS == 0 then
      AddPersonAttrib(eid, "中毒程度", math.modf(poisonnum / 15))
    else
      local dkmax = JY.Person[eid]["抗毒能力"]
      if 80 < dkmax then
        dkmax = 80
      end
      poisonnum = math.modf(poisonnum * (100 - dkmax) / 100)
      if 1000 < poisonnum then
        poisonnum = 1000
      end
      AddPersonAttrib(eid, "中毒程度", math.modf(poisonnum / 20))
    end
  end
  return hurt
end
function War_WugongHurtNeili(enemyid, wugong, level)
  local pid = WAR.Person[WAR.CurID]["人物编号"]
  local eid = WAR.Person[enemyid]["人物编号"]
  local addvalue = JY.Wugong[wugong]["加内力" .. level]
  local decvalue = JY.Wugong[wugong]["杀内力" .. level]
  if 3 < addvalue then
    AddPersonAttrib(pid, "内力最大值", Rnd(math.modf(addvalue / 2)))
    AddPersonAttrib(pid, "内力", addvalue + Rnd(3) - Rnd(3))
  end
  return -AddPersonAttrib(eid, "内力", -(decvalue + Rnd(3) - Rnd(3)))
end

function War_WugongHurtTili(enemyid, wugong, level)
  local pid = WAR.Person[WAR.CurID]["人物编号"]
  local eid = WAR.Person[enemyid]["人物编号"]
  local decvalue = JY.Wugong[wugong]["杀体力" .. level]
  if decvalue > 0 then
    decvalue = decvalue + Rnd(3) - Rnd(3)
    return -AddPersonAttrib(eid, "体力", -decvalue)
  end
end

function War_PoisonMenu()
  WAR.ShowHead = 0
  local r = War_ExecuteMenu(1)
  WAR.ShowHead = 1
  Cls()
  return r
end
function War_PoisonHurt(pid, emenyid)
  if CC.SHGS == 0 then
    local v = math.modf((JY.Person[pid]["用毒能力"] - JY.Person[emenyid]["抗毒能力"]) / 4)
    if v < 0 then
      v = 0
    end
    return AddPersonAttrib(emenyid, "中毒程度", v)
  else
    local duxing, dunum
    if JY.Person[emenyid]["抗毒能力"] > CC.PersonAttribMax["抗毒能力"] then
      JY.Person[emenyid]["抗毒能力"] = 100
    end
    if JY.Person[emenyid]["抗毒能力"] < CC.PersonAttribMax["抗毒能力"] then
      if JY.Person[emenyid]["抗毒能力"] / CC.PersonAttribMax["抗毒能力"] * 100 > 100 then
        duxing = 100
      else
        duxing = math.modf(JY.Person[emenyid]["抗毒能力"] / CC.PersonAttribMax["抗毒能力"] * 100)
      end
      dunum = math.modf(JY.Person[pid]["用毒能力"] /  5 - duxing)
      if 35 < dunum then
        dunum = 35
      end
      if dunum < 0 then
        dunum = 0
      end
    else
      dunum = 0
    end
    return AddPersonAttrib(emenyid, "中毒程度", dunum)
  end
end
function War_DecPoisonMenu()
  WAR.ShowHead = 0
  local r = War_ExecuteMenu(2)
  WAR.ShowHead = 1
  Cls()
  return r
end
function War_DoctorMenu()
  WAR.ShowHead = 0
  local r = War_ExecuteMenu(3)
  WAR.ShowHead = 1
  Cls()
  return r
end
function War_ExecuteMenu(flag, thingid)
  local pid = WAR.Person[WAR.CurID]["人物编号"]
  local step
  if flag == 1 then
    step = math.modf(JY.Person[pid]["用毒能力"] / 15) + 1
  elseif flag == 2 then
    step = math.modf(JY.Person[pid]["解毒能力"] / 15) + 1
  elseif flag == 3 then
    step = math.modf(JY.Person[pid]["医疗能力"] / 15) + 1
  elseif flag == 4 then
    if 2 < CC.SHGS then
      step = math.modf(JY.Person[pid]["暗器技巧"] / CC.PersonAttribMax["暗器技巧"] / 15 * 200) + 1
    else
      step = math.modf(JY.Person[pid]["暗器技巧"] / 15) + 1
    end
  end
  War_CalMoveStep(WAR.CurID, step, 1)
  local x1, y1 = War_SelectMove1(4)
  if x1 == nil then
    Cls()
    return 0
  else
    return War_ExecuteMenu_Sub(x1, y1, flag, thingid)
  end
end
function War_ExecuteMenu_Sub(x1, y1, flag, thingid)
  local pid = WAR.Person[WAR.CurID]["人物编号"]
  local x0 = WAR.Person[WAR.CurID]["坐标X"]
  local y0 = WAR.Person[WAR.CurID]["坐标Y"]
  CleanWarMap(4, 0)
  WAR.Person[WAR.CurID]["人方向"] = War_Direct(x0, y0, x1, y1)
  SetWarMap(x1, y1, 4, 1)
  lib.PicLoadFile(string.format(CC.FightPicFile[1], JY.Person[pid]["头像代号"]), string.format(CC.FightPicFile[2], JY.Person[pid]["头像代号"]), 4)
  local emeny = GetWarMap(x1, y1, 2)
  if 0 <= emeny then
    if flag == 1 then
      if WAR.Person[WAR.CurID]["我方"] ~= WAR.Person[emeny]["我方"] then
        WAR.Person[emeny]["点数"] = War_PoisonHurt(pid, WAR.Person[emeny]["人物编号"])
        SetWarMap(x1, y1, 4, 5)
        WAR.Effect = 5
      end
    elseif flag == 2 then
      if WAR.Person[WAR.CurID]["我方"] == WAR.Person[emeny]["我方"] then
        WAR.Person[emeny]["点数"] = ExecDecPoison(pid, WAR.Person[emeny]["人物编号"])
        SetWarMap(x1, y1, 4, 6)
        WAR.Effect = 6
      end
    elseif flag == 3 then
      if WAR.Person[WAR.CurID]["我方"] == WAR.Person[emeny]["我方"] then
        WAR.Person[emeny]["点数"] = ExecDoctor(pid, WAR.Person[emeny]["人物编号"])
        SetWarMap(x1, y1, 4, 4)
        WAR.Effect = 4
      end
    elseif flag == 4 and WAR.Person[WAR.CurID]["我方"] ~= WAR.Person[emeny]["我方"] then
      WAR.Person[emeny]["点数"] = War_AnqiHurt(pid, WAR.Person[emeny]["人物编号"], thingid)
      SetWarMap(x1, y1, 4, 2)
      WAR.Effect = 2
    end
  end
  WAR.EffectXY = {}
  WAR.EffectXY[1] = {x1, y1}
  WAR.EffectXY[2] = {x1, y1}
  if flag == 1 then
    War_ShowFight(pid, 0, 0, 0, x1, y1, 30)
  elseif flag == 2 then
    War_ShowFight(pid, 0, 0, 0, x1, y1, 36)
  elseif flag == 3 then
    War_ShowFight(pid, 0, 0, 0, x1, y1, 0)
  elseif flag == 4 and 0 <= emeny then
    War_ShowFight(pid, 0, -1, 0, x1, y1, JY.Thing[thingid]["暗器动画编号"])
  end
  for i = 0, WAR.PersonNum - 1 do
    WAR.Person[i]["点数"] = 0
  end
  if flag == 4 then
    if 0 <= emeny then
      if WAR.Person[WAR.CurID]["我方"] then
        instruct_32(thingid, -1)
        return 1
      else
        instruct_41(pid, thingid, -1)
        return 1
      end
    else
      return 0
    end
  else
    WAR.Person[WAR.CurID]["经验"] = WAR.Person[WAR.CurID]["经验"] + 1
    AddPersonAttrib(pid, "体力", -2)
  end
  return 1
end
function War_ThingMenu()
  WAR.ShowHead = 0
  local thing = {}
  local thingnum = {}
  for i = 0, CC.MyThingNum - 1 do
    thing[i] = -1
    thingnum[i] = 0
  end
  local num = 0
  for i = 0, CC.MyThingNum - 1 do
    local id = JY.Base["物品" .. i + 1]
    if 0 <= id and (JY.Thing[id]["类型"] == 3 or JY.Thing[id]["类型"] == 4) then
      thing[num] = id
      thingnum[num] = JY.Base["物品数量" .. i + 1]
      num = num + 1
    end
  end
  local r = SelectThing(thing, thingnum)
  Cls()
  local rr = 0
  if 0 <= r and UseThing(r) == 1 then
    rr = 1
  end
  WAR.ShowHead = 1
  return rr
end
function War_UseAnqi(id)
  return War_ExecuteMenu(4, id)
end
function War_AnqiHurt(pid, emenyid, thingid)
  local num
  if JY.Person[emenyid]["受伤程度"] == 0 then
    num = JY.Thing[thingid]["加生命"] / 4 - Rnd(5)
  elseif JY.Person[emenyid]["受伤程度"] <= 33 then
    num = JY.Thing[thingid]["加生命"] / 3 - Rnd(5)
  elseif JY.Person[emenyid]["受伤程度"] <= 66 then
    num = JY.Thing[thingid]["加生命"] / 2 - Rnd(5)
  else
    num = JY.Thing[thingid]["加生命"] / 2 - Rnd(5)
  end
  if CC.SHGS ~= 3 then
    num = math.modf((num - JY.Person[pid]["暗器技巧"] * 2) / 3)
  else
    num = num * (1 + (JY.NDPER / 100 - 1) / 2)
    local thsh = num
    local mywuxue = 0
    local emenywuxue = 0
    for i = 0, WAR.PersonNum - 1 do
      local id = WAR.Person[i]["人物编号"]
      if WAR.Person[i]["死亡"] == false and JY.Person[id]["武学常识"] >= CC.WXCS then
        if WAR.Person[i]["我方"] then
          if CC.SHGS == 3 then
            if mywuxue < JY.Person[id]["武学常识"] then
              mywuxue = JY.Person[id]["武学常识"]
            end
          else
            mywuxue = mywuxue + JY.Person[id]["武学常识"]
          end
        elseif CC.SHGS == 3 then
          if emenywuxue < JY.Person[id]["武学常识"] then
            emenywuxue = JY.Person[id]["武学常识"]
          end
        else
          emenywuxue = emenywuxue + JY.Person[id]["武学常识"]
        end
      end
    end
    if mywuxue > JY.WARWF * (CC.PersonAttribMax["武学常识"] / 6) then
      mywuxue = JY.WARWF * (CC.PersonAttribMax["武学常识"] / 6)
    end
    if emenywuxue > JY.WARDF * (CC.PersonAttribMax["武学常识"] / 6) then
      emenywuxue = JY.WARDF * (CC.PersonAttribMax["武学常识"] / 6)
    end
     local gfys, minsh
    if WAR.Person[WAR.CurID]["我方"] == true then
      gfys = JY.Person[pid]["攻击力"] / 10 - JY.Person[emenyid]["防御力"] / 10 * (JY.NDPER / 100)
      minsh = -(JY.Person[pid]["攻击力"] / 10 + JY.Person[pid]["暗器技巧"] / 5 + mywuxue / 4 - thsh) / 10
    else
      gfys = JY.Person[pid]["攻击力"] / 10 * (JY.NDPER / 100) - JY.Person[emenyid]["防御力"] / 10
      minsh = -(JY.Person[pid]["攻击力"] / 10 * (JY.NDPER / 100) + JY.Person[pid]["暗器技巧"] / 5 + mywuxue / 4 - thsh) / 10
    end
    local aqys = JY.Person[pid]["暗器技巧"] / 5 - JY.Person[emenyid]["暗器技巧"] / 5
    local wxcx = mywuxue / 4 - emenywuxue / 4
    local sxys = CC.PersonAttribMax["生命最大值"] / 999
	      minsh = minsh * sxys
    local gjyx = (gfys + aqys + wxcx) * sxys / 2
    if gjyx < -minsh then
      gjyx = -minsh
    end
	  num = num - gjyx - Rnd(10)
  end
  AddPersonAttrib(emenyid, "受伤程度", math.modf(-num / 10 / (CC.PersonAttribMax["生命最大值"] / 999)))
  AddPersonAttrib(emenyid, "生命", math.modf(num))
  local r = num
  WAR.Person[WAR.CurID]["经验"] = WAR.Person[WAR.CurID]["经验"] + math.modf(-r / 5)
  if JY.Person[emenyid]["抗毒能力"] > 100 then
    JY.Person[emenyid]["抗毒能力"] = 100
  end
  if 0 < JY.Thing[thingid]["加中毒解毒"] and JY.Person[emenyid]["抗毒能力"] < 100 then
    num = math.modf(JY.Thing[thingid]["加中毒解毒"])
    num = num - JY.Person[emenyid]["抗毒能力"]
    if 50 < num then
      num = 50
    end
    num = limitX(num, 0, CC.PersonAttribMax["用毒能力"])
    AddPersonAttrib(emenyid, "中毒程度", num)
  end
  return r
end
function War_RestMenu()
  local pid = WAR.Person[WAR.CurID]["人物编号"]
  local v = 3 + Rnd(3)
  AddPersonAttrib(pid, "体力", v)
  if JY.Person[pid]["体力"] >= 30 then
    v = 3 + Rnd(math.modf(JY.Person[pid]["体力"] / 10) - 2) + math.modf(JY.Person[pid]["生命最大值"] / 100)
    AddPersonAttrib(pid, "生命", v)
    v = 3 + Rnd(math.modf(JY.Person[pid]["体力"] / 10) - 2) + math.modf(JY.Person[pid]["内力最大值"] / 33)
    AddPersonAttrib(pid, "内力", v)
  end
  return 1
end
function War_WaitMenu()
  for i = WAR.CurID, WAR.PersonNum - 2 do
    local tmp = WAR.Person[i + 1]
    WAR.Person[i + 1] = WAR.Person[i]
    WAR.Person[i] = tmp
  end
  WarSetPerson()
  for i = 0, WAR.PersonNum - 1 do
    WAR.Person[i]["贴图"] = WarCalPersonPic(i)
  end
  return 1
end
function War_Huhuo()
  local menu = {}
  local menunum = 0
  for i = 0, WAR.PersonNum - 1 do
    menu[i + 1] = {
      JY.Person[WAR.Person[i]["人物编号"]]["姓名"],
      nil,
      0
    }
    if WAR.Person[i]["我方"] == true and WAR.Person[i]["死亡"] == true then
      menu[i + 1][3] = 1
      menunum = menunum + 1
    end
  end
  if menunum == 0 then
    DrawStrBoxWaitKey("没有需要复活的队友！", C_WHITE, CC.DefaultFont)
    return
  end
  Cls()
  local str = "选择需要复活的队友"
  local size = CC.DefaultFont
  local x = CC.ScreenW / 2 - #str / 4 * size
  local y = CC.ScreenH / 2 - 5 * size
  DrawStrBox(x, y, str, C_GOLD, CC.DefaultFont)
  local r = ShowMenu(menu, WAR.PersonNum, 0, x + size * 3, y + size * 2, 0, 0, 1, 1, CC.DefaultFont, C_ORANGE, C_WHITE)
  Cls()
  if 0 < r then
    r = r - 1
    WAR.Person[r]["死亡"] = false
    local pid = WAR.Person[r]["人物编号"]
    JY.Person[pid]["生命"] = math.modf(JY.Person[pid]["生命最大值"] / 2)
    WarSetPerson()
    JY.Huhuocs = JY.Huhuocs - 1
    Cls()
    DrawStrBoxWaitKey(JY.Person[pid]["姓名"] .. " 复活，加入战斗！", C_WHITE, CC.DefaultFont)
    return 1
  else
    return
  end
end
function SetRevivePosition(id)
  local minDest = math.huge
  local x, y
  War_CalMoveStep(WAR.CurID, 100, 0)
  for i = 0, CC.WarWidth - 1 do
    for j = 0, CC.WarHeight - 1 do
      local dest = Byte.get16(WAR.Map3, (j * CC.WarWidth + i) * 2)
      if 0 < dest and dest < 128 then
        if minDest > dest then
          minDest = dest
          x = i
          y = j
        elseif minDest == dest and Rnd(2) == 0 then
          x = i
          y = j
        end
      end
    end
  end
  if minDest < math.huge then
    WAR.Person[id]["坐标X"] = x
    WAR.Person[id]["坐标Y"] = y
  end
end
function War_Bianshen()
  if DrawStrBoxYesNo(-1, -1, "让角色变身吗？", C_WHITE, CC.DefaultFont * 1.2) == false then
    Cls()
    return
  end
  Cls()
  if JY.Person[0]["外号"] == "超神" then
    local menu = {
      {
        "拳霸",
        nil,
        1
      },
      {
        "剑魔",
        nil,
        1
      },
      {
        "刀痴",
        nil,
        1
      },
      {
        "特狂",
        nil,
        1
      },
      {
        "神助",
        nil,
        1
      },
      {
        "巫妖",
        nil,
        1
      },
      {
        "毒王",
        nil,
        1
      },
      {
        "还原",
        nil,
        0
      },
      {
        "幻影",
        nil,
        1
      }
    }
    local size = CC.StartMenuFontSize
    local menux = CC.ScreenW / 2 - CC.StartMenuFontSize
    local tsy = CC.ScreenH / 2 - size * 5
    DrawStrBox(menux - size * 2.5, tsy, "选择变身型态", C_GOLD, size)
    local r = ShowMenu(menu, #menu, 0, menux, CC.ScreenH / 2 - CC.StartMenuFontSize * 3, 0, 0, 1, 1, CC.StartMenuFontSize, C_GOLD, C_WHITE)
    if r == 0 then
      return
    elseif r == 1 then
      JY.Wugong[30]["未知2"] = 1
      JY.Person[0]["外号"] = "拳霸"
      DrawStrBoxWaitKey("变身拳霸→破防伤害开启", C_WHITE, CC.DefaultFont)
    elseif r == 2 then
      JY.Wugong[30]["未知2"] = 2
      JY.Person[0]["外号"] = "剑魔"
      DrawStrBoxWaitKey("变身剑魔→嗜血伤害开启", C_WHITE, CC.DefaultFont)
    elseif r == 3 then
      JY.Wugong[30]["未知2"] = 3
      JY.Person[0]["外号"] = "刀痴"
      DrawStrBoxWaitKey("变身刀痴→一击必杀开启", C_WHITE, CC.DefaultFont)
    elseif r == 4 then
      JY.Wugong[30]["未知2"] = 4
      JY.Person[0]["外号"] = "特狂"
      DrawStrBoxWaitKey("变身特狂→暴击伤害开启", C_WHITE, CC.DefaultFont)
    elseif r == 5 then
      JY.Wugong[30]["未知2"] = 5
      JY.Person[0]["外号"] = "神助"
      DrawStrBoxWaitKey("变身神助→天神护体开启", C_WHITE, CC.DefaultFont)
    elseif r == 6 then
      JY.Wugong[30]["未知2"] = 6
      JY.Person[0]["外号"] = "巫妖"
      DrawStrBoxWaitKey("变身巫妖→重生技能开启", C_WHITE, CC.DefaultFont)
      JY.Huhuocs = math.modf(JY.Person[0]["等级"] / 30)
    elseif r == 7 then
      JY.Wugong[30]["未知2"] = 7
      JY.Person[0]["外号"] = "毒王"
      DrawStrBoxWaitKey("变身毒王→淬毒伤害开启", C_WHITE, CC.DefaultFont)
    elseif r == 9 then
      JY.Wugong[30]["未知2"] = 9
      JY.Person[0]["外号"] = "幻影"
      DrawStrBoxWaitKey("变身幻影→影杀技能开启", C_WHITE, CC.DefaultFont)
    end
  else
    DrawStrBoxWaitKey("恢复型态", C_WHITE, CC.DefaultFont)
    JY.Person[0]["外号"] = "超神"
    JY.Wugong[30]["未知2"] = 0
  end
  return 1
end
function War_StatusMenu()
  WAR.ShowHead = 0
  local menu = {
    {
      "我方状态",
      nil,
      1
    },
    {
      "敌方状态",
      nil,
      1
    }
  }
  local size = CC.DefaultFont * 1.2
  local menux = size * 3
  local menuy = CC.ScreenH / 2 - size * 0.5
  local r = ShowMenu(menu, #menu, 0, CC.MainSubMenuX, CC.MainSubMenuY, 0, 0, 1, 1, size, C_GOLD, C_WHITE)
  if r == 1 then
    Menu_Status()
  elseif r == 2 then
    Menu_EmyStatus()
  end
  WAR.ShowHead = 1
  Cls()
end
function War_AutoMenu()
  local atmenu = {}
  local j = 1
  local pid = WAR.Person[WAR.CurID]["人物编号"]
  local p = {}
  for i = 0, WAR.PersonNum - 1 do
    if WAR.Person[i]["我方"] then
      pid = WAR.Person[i]["人物编号"]
      p[j] = JY.Person[pid]
      JY.ATAI[j][1] = pid
      if JY.ATAI[j][2] == 1 then
        atmenu[j] = {
          "普通  " .. p[j]["姓名"],
          nil,
          1
        }
      elseif JY.ATAI[j][2] == 2 then
        atmenu[j] = {
          "死士  " .. p[j]["姓名"],
          nil,
          1
        }
      elseif JY.ATAI[j][2] == 3 then
        atmenu[j] = {
          "混子  " .. p[j]["姓名"],
          nil,
          1
        }
      elseif JY.ATAI[j][2] == 4 then
        atmenu[j] = {
          "奶妈  " .. p[j]["姓名"],
          nil,
          1
        }
      end
      if WAR.Person[i]["死亡"] == true then
        atmenu[j][3] = 0
      end
      j = j + 1
    end
  end
  atmenu[j] = {
    "  全体设置",
    nil,
    1
  }
  j = j + 1
  atmenu[j] = {
    "  自动战斗",
    nil,
    1
  }
  local size = CC.DefaultFont
  local menux = CC.ScreenW / 2 - size * 5
  local tsy = CC.ScreenH / 2 - #atmenu * size / 2 - size * 1.5
  local rr = j
  while true do
    Cls()
    DrawStrBox(menux - size * 0.5, tsy, "调整自动战斗AI", C_GOLD, size)
    local r = ShowMenu(atmenu, #atmenu, 0, menux, CC.ScreenH / 2 - #atmenu * size / 2, 0, 0, 1, 1, size, C_GOLD, C_WHITE, rr)
    if 0 < r and j > r then
      local lxmenu = {
        {
          "普通",
          nil,
          1
        },
        {
          "死士",
          nil,
          1
        },
        {
          "混子",
          nil,
          1
        }
      }
      local r1 = ShowMenu(lxmenu, #lxmenu, 0, menux + size * 2, CC.ScreenH / 2 - size * 3, 0, 0, 1, 1, size, C_GOLD, C_WHITE)
      if r ~= j - 1 then
        if r1 == 1 then
          atmenu[r] = {
            "普通  " .. p[r]["姓名"],
            nil,
            1
          }
          JY.ATAI[r][2] = r1
        elseif r1 == 2 then
          atmenu[r] = {
            "死士  " .. p[r]["姓名"],
            nil,
            1
          }
          JY.ATAI[r][2] = r1
        elseif r1 == 3 then
          atmenu[r] = {
            "混子  " .. p[r]["姓名"],
            nil,
            1
          }
          JY.ATAI[r][2] = r1
        elseif r1 == 4 then
          atmenu[r] = {
            "奶妈  " .. p[r]["姓名"],
            nil,
            1
          }
          JY.ATAI[r][2] = r1
        end
      elseif r == j - 1 then
        for i = 1, j - 2 do
          if r1 == 1 then
            atmenu[i] = {
              "普通  " .. p[i]["姓名"],
              nil,
              1
            }
            JY.ATAI[i][2] = r1
          elseif r1 == 2 then
            atmenu[i] = {
              "死士  " .. p[i]["姓名"],
              nil,
              1
            }
            JY.ATAI[i][2] = r1
          elseif r1 == 3 then
            atmenu[i] = {
              "混子  " .. p[i]["姓名"],
              nil,
              1
            }
            JY.ATAI[i][2] = r1
          elseif r1 == 4 then
            atmenu[i] = {
              "奶妈  " .. p[i]["姓名"],
              nil,
              1
            }
            JY.ATAI[i][2] = r1
          end
        end
      end
      rr = r
    else
      if r == j then
        break
      end
      if r == 0 then
        return
      end
    end
  end
  WAR.AutoFight = 1
  WAR.ShowHead = 0
  Cls()
  War_Auto()
  return 1
end
function War_Auto()
  WAR.ShowHead = 1
  WarDrawMap(0)
  ShowScreen()
  lib.Delay(CC.WarAutoDelay)
  WAR.ShowHead = 0
  if CC.AutoWarShowHead == 1 then
    WAR.ShowHead = 1
  end
  local autotype = War_Think()
  if autotype == 0 then
    War_AutoEscape()
    War_RestMenu()
  elseif autotype == 1 then
    War_AutoFight()
  elseif autotype == 2 then
    War_AutoEscape()
    War_AutoEatDrug(2)
  elseif autotype == 3 then
    War_AutoEscape()
    War_AutoEatDrug(3)
  elseif autotype == 4 then
    War_AutoEscape()
    War_AutoEatDrug(4)
  elseif autotype == 5 then
    War_AutoEscape()
    War_AutoDoctor()
  elseif autotype == 6 then
    War_AutoEscape()
    War_AutoEatDrug(6)
  elseif autotype == 7 then
    War_AutoAQ(JY.AQID)
  end
  return 0
end
function War_Think()
  local pid = WAR.Person[WAR.CurID]["人物编号"]
  local r = -1
  if JY.Person[pid]["体力"] < 10 then
    r = War_ThinkDrug(4)
    if 0 <= r then
      return r
    end
    return 0
  end
  local aipd = 0
  if WAR.Person[WAR.CurID]["我方"] then
    for i = 1, 20 do
      if JY.ATAI[i][1] == pid then
        JY.AISET = JY.ATAI[i][2]
        break
      end
    end
    aipd = 1
  else
    JY.AISET = 1
  end
  if JY.AISET == 3 then
    if JY.Person[pid]["受伤程度"] > 50 then
      r = War_ThinkDoctor()
      if 0 <= r then
        return r
      end
    end
    local rate = -1
    if JY.Person[pid]["生命"] < JY.Person[pid]["生命最大值"] / 5 then
      rate = 100
    elseif JY.Person[pid]["生命"] < JY.Person[pid]["生命最大值"] / 4 then
      rate = 100
    elseif JY.Person[pid]["生命"] < JY.Person[pid]["生命最大值"] / 3 then
      rate = 80
    elseif JY.Person[pid]["生命"] < JY.Person[pid]["生命最大值"] / 2 then
      rate = 40
    end
    if rate > Rnd(100) then
      r = War_ThinkDoctor()
      if 0 <= r then
        return r
      end
    end
    return 0
  end
  if JY.AISET == 1 then
    if JY.Person[pid]["受伤程度"] > 50 then
      r = War_ThinkDrug(2)
      if 0 <= r then
        return r
      end
    end
    local rate = -1
    if JY.Person[pid]["生命"] < JY.Person[pid]["生命最大值"] / 5 then
      rate = 100
    elseif JY.Person[pid]["生命"] < JY.Person[pid]["生命最大值"] / 4 then
      rate = 100
    elseif JY.Person[pid]["生命"] < JY.Person[pid]["生命最大值"] / 3 then
      rate = 80
    elseif JY.Person[pid]["生命"] < JY.Person[pid]["生命最大值"] / 2 then
      rate = 40
    end
    if rate > Rnd(100) then
      r = War_ThinkDrug(2)
      if 0 <= r then
        return r
      else
        r = War_ThinkDoctor()
        if 0 <= r then
          return r
        end
      end
    end
  end
  if JY.AISET == 1 then
    local rate = -1
    if JY.Person[pid]["内力"] < JY.Person[pid]["内力最大值"] / 5 then
      rate = 80
    elseif JY.Person[pid]["内力"] < JY.Person[pid]["内力最大值"] / 4 then
      rate = 50
    end
    if rate > Rnd(100) then
      r = War_ThinkDrug(3)
      if 0 <= r then
        return r
      end
    end
  end
  if JY.AISET == 1 then
    local rate = -1
    if JY.Person[pid]["中毒程度"] > CC.PersonAttribMax["中毒程度"] * 3 / 4 then
      rate = 100
    elseif JY.Person[pid]["中毒程度"] > CC.PersonAttribMax["中毒程度"] / 2 then
      rate = 50
    elseif JY.Person[pid]["中毒程度"] > CC.PersonAttribMax["中毒程度"] / 4 then
      rate = 25
    end
    if rate > Rnd(100) then
      r = War_ThinkDrug(6)
      if 0 <= r then
        return r
      end
    end
  end
  if JY.AISET == 1 or JY.AISET == 2 then
    local minNeili = War_GetMinNeiLi(pid)
    if minNeili <= JY.Person[pid]["内力"] then
      local dwpd = 0
      if WAR.Person[WAR.CurID]["我方"] then
        dwpd = 1
      end
      local j = 1
      local aqwp = {}
      local aqwpno = {}
      local aqmax = {}
      aqmax[1] = math.huge
      aqmax[2] = -1
      if dwpd == 1 then
        for i = 1, JY.AQNUM do
          if instruct_18(JY.AQ[i]) then
            aqwp[j] = JY.Thing[JY.AQ[i]]["加生命"]
            aqwpno[j] = JY.AQ[i]
            if aqmax[1] > aqwp[j] then
              aqmax[1] = aqwp[j]
              aqmax[2] = aqwpno[j]
            end
            j = j + 1
          end
        end
        if j < 2 then
          r = 0
          JY.AQID = -1
        else
          if aqmax[1] > -3 then
            aqmax[1] = -4
          end
          if 50 > Rnd(100) and JY.Person[pid]["暗器技巧"] + math.modf(-aqmax[1] / 4) > JY.Person[pid]["攻击力"] + Rnd(math.modf(-aqmax[1] / 4)) then
            r = 10
            JY.AQID = aqmax[2]
            return r
          end
        end
      else
        for i = 1, JY.AQNUM do
          for k = 1, 4 do
            if JY.Person[pid]["携带物品" .. k] == JY.AQ[i] then
              aqwp[j] = JY.Thing[JY.AQ[i]]["加生命"]
              aqwpno[j] = JY.AQ[i]
              if aqmax[1] > aqwp[j] then
                aqmax[1] = aqwp[j]
                aqmax[2] = aqwpno[j]
              end
              j = j + 1
            end
          end
        end
        if j < 2 then
          r = 0
          JY.AQID = -1
        else
          if aqmax[1] > -3 then
            aqmax[1] = -4
          end
          if JY.Person[pid]["暗器技巧"] + math.modf(-aqmax[1] / 4) > JY.Person[pid]["攻击力"] + Rnd(math.modf(-aqmax[1] / 4)) then
            r = 10
            JY.AQID = aqmax[2]
            return r
          end
        end
      end
      r = 1
      return r
    else
      r = 0
    end
  end
  if JY.AISET == 1 or JY.AISET == 2 then
    local dwpd = 0
    if WAR.Person[WAR.CurID]["我方"] then
      dwpd = 1
    end
    local j = 1
    local aqwp = {}
    local aqwpno = {}
    local aqmax = {}
    aqmax[1] = math.huge
    aqmax[2] = -1
    if dwpd == 1 then
      for i = 1, JY.AQNUM do
        if instruct_18(JY.AQ[i]) then
          aqwp[j] = JY.Thing[JY.AQ[i]]["加生命"]
          aqwpno[j] = JY.AQ[i]
          if aqmax[1] > aqwp[j] then
            aqmax[1] = aqwp[j]
            aqmax[2] = aqwpno[j]
          end
          j = j + 1
        end
      end
      if j < 2 then
        r = 0
        JY.AQID = -1
      else
        r = 7
        JY.AQID = aqmax[2]
        return r
      end
    else
      for i = 1, JY.AQNUM do
        for k = 1, 4 do
          if JY.Person[pid]["携带物品" .. k] == JY.AQ[i] then
            aqwp[j] = JY.Thing[JY.AQ[i]]["加生命"]
            aqwpno[j] = JY.AQ[i]
            if aqmax[1] > aqwp[j] then
              aqmax[1] = aqwp[j]
              aqmax[2] = aqwpno[j]
            end
            j = j + 1
          end
        end
      end
      if j < 2 then
        r = 0
        JY.AQID = -1
      else
        r = 7
        JY.AQID = aqmax[2]
        return r
      end
    end
  end
  return r
end
function War_ThinkDrug(flag)
  local pid = WAR.Person[WAR.CurID]["人物编号"]
  local str
  local r = -1
  if flag == 2 then
    str = "加生命"
  elseif flag == 3 then
    str = "加内力"
  elseif flag == 4 then
    str = "加体力"
  elseif flag == 6 then
    str = "加中毒解毒"
  else
    return r
  end
  local Get_Add = function(thingid)
    if flag == 6 then
      return -JY.Thing[thingid][str]
    else
      return JY.Thing[thingid][str]
    end
  end
  if WAR.Person[WAR.CurID]["我方"] == true then
    for i = 1, CC.MyThingNum do
      local thingid = JY.Base["物品" .. i]
      if 0 <= thingid and JY.Thing[thingid]["类型"] == 3 and 0 < Get_Add(thingid) then
        r = flag
        break
      end
    end
  else
    for i = 1, 4 do
      local thingid = JY.Person[pid]["携带物品" .. i]
      if 0 <= thingid and JY.Thing[thingid]["类型"] == 3 and 0 < Get_Add(thingid) then
        r = flag
        break
      end
    end
  end
  return r
end
function War_ThinkDoctor()
  local pid = WAR.Person[WAR.CurID]["人物编号"]
  if JY.Person[pid]["体力"] < 50 or JY.Person[pid]["医疗能力"] < 20 then
    return -1
  end
  if JY.Person[pid]["受伤程度"] > JY.Person[pid]["医疗能力"] + 20 then
    return -1
  end
  local rate = -1
  local v = JY.Person[pid]["生命最大值"] - JY.Person[pid]["生命"]
  if JY.Person[pid]["医疗能力"] < v / 4 then
    rate = 30
  elseif JY.Person[pid]["医疗能力"] < v / 3 then
    rate = 50
  elseif JY.Person[pid]["医疗能力"] < v / 2 then
    rate = 70
  else
    rate = 90
  end
  if rate > Rnd(100) then
    return 5
  end
  return -1
end
function War_AutoAQ(id)
  if id == -1 then
    War_AutoEscape()
    War_RestMenu()
    return
  end
  local r = War_AutoMove(-1)
  if r == 1 then
    War_AutoExecuteFight(-1)
  else
    War_RestMenu()
  end
end
function War_AutoFight()
  local wugongnum = War_AutoSelectWugong()
  if wugongnum <= 0 then
    War_AutoEscape()
    War_RestMenu()
    return
  end
  local r = War_AutoMove(wugongnum)
  if r == 1 then
    War_AutoExecuteFight(wugongnum)
  else
    War_RestMenu()
  end
end
function War_AutoSelectWugong()
  local pid = WAR.Person[WAR.CurID]["人物编号"]
  local probability = {}
  local wugongnum = 10
  for i = 1, 10 do
    local wugongid = JY.Person[pid]["武功" .. i]
    if 0 < wugongid then
      probability[i] = 0
      if JY.Wugong[wugongid]["伤害类型"] ~= 4 then
        if JY.Wugong[wugongid]["消耗内力点数"] <= JY.Person[pid]["内力"] then
          local level = math.modf(JY.Person[pid]["武功等级" .. i] / 100) + 1
          probability[i] = (JY.Person[pid]["攻击力"] * 3 + JY.Wugong[wugongid]["攻击力" .. level]) / 2
          if CC.SHGS == 3 then
            probability[i] = JY.Person[pid]["攻击力"] * 1.5 + JY.Wugong[wugongid]["攻击力" .. level]
          end
          local extranum = 0
          for j, v in ipairs(CC.ExtraOffense) do
            if v[1] == JY.Person[pid]["武器"] and v[2] == wugongid then
              extranum = v[3]
              break
            end
          end
          probability[i] = probability[i] + extranum * 2
        else
          probability[i] = 0
        end
      else
        probability[i] = 10
      end
    else
      probability[i] = 0
    end
  end
  local mynum = 0
  local enemynum = 0
  for i = 0, WAR.PersonNum - 1 do
    if WAR.Person[i]["死亡"] == false then
      if WAR.Person[i]["我方"] == WAR.Person[WAR.CurID]["我方"] then
        mynum = mynum + 1
      else
        enemynum = enemynum + 1
      end
    end
  end
  local factor = 0
  if mynum < enemynum then
    factor = enemynum
  elseif enemynum < 2 then
    factor = 0
  else
    factor = enemynum / 2
  end
  local gjfwnum = {
    0,
    0,
    0,
    0
  }
  local dyz = 0
  for i = 1, wugongnum do
    local wugongid = JY.Person[pid]["武功" .. i]
    if 0 < probability[i] then
      local level = math.modf(JY.Person[pid]["武功等级" .. i] / 100) + 1
      if JY.Wugong[wugongid]["攻击范围"] == 0 then
        if factor == 0 then
          dyz = 1
        else
          dyz = 0
        end
        probability[i] = probability[i] + probability[i] * dyz * 5 / 100
        if probability[i] > gjfwnum[1] then
          gjfwnum[1] = probability[i]
        else
          probability[i] = 0
        end
      elseif JY.Wugong[wugongid]["攻击范围"] == 1 then
        probability[i] = probability[i] + JY.Wugong[wugongid]["移动范围" .. level] * factor * 20 * probability[i] / 1000 + probability[i] * dyz * 3 / 100
        if probability[i] > gjfwnum[2] then
          gjfwnum[2] = probability[i]
        else
          probability[i] = 0
        end
      elseif JY.Wugong[wugongid]["攻击范围"] == 2 then
        probability[i] = probability[i] + JY.Wugong[wugongid]["移动范围" .. level] * factor * 40 * probability[i] / 1000 + probability[i] * dyz * 2 / 100
        if probability[i] > gjfwnum[3] then
          gjfwnum[3] = probability[i]
        else
          probability[i] = 0
        end
      elseif JY.Wugong[wugongid]["攻击范围"] == 3 then
        probability[i] = probability[i] + JY.Wugong[wugongid]["移动范围" .. level] * factor * 30 * probability[i] / 1000 + JY.Wugong[wugongid]["杀伤范围" .. level] * 50 * factor * probability[i] / 1000 + probability[i] * dyz * 1 / 100
        if probability[i] > gjfwnum[4] then
          gjfwnum[4] = probability[i]
        else
          probability[i] = 0
        end
      end
    end
  end
  for i = 1, wugongnum do
    local wugongid = JY.Person[pid]["武功" .. i]
    if 0 < probability[i] then
      if JY.Wugong[wugongid]["攻击范围"] == 0 then
        if probability[i] < gjfwnum[1] then
          probability[i] = 0
        end
      elseif JY.Wugong[wugongid]["攻击范围"] == 1 then
        if probability[i] < gjfwnum[2] then
          probability[i] = 0
        end
      elseif JY.Wugong[wugongid]["攻击范围"] == 2 then
        if probability[i] < gjfwnum[3] then
          probability[i] = 0
        end
      elseif JY.Wugong[wugongid]["攻击范围"] == 3 and probability[i] < gjfwnum[4] then
        probability[i] = 0
      end
    end
  end
  local maxoffense = 0
  for i = 1, wugongnum do
    if maxoffense < probability[i] then
      maxoffense = probability[i]
    end
  end
  for i = 1, wugongnum do
    if probability[i] < maxoffense * 2 / 3 then
      probability[i] = 0
    end
    if (enemynum < 2 or mynum > enemynum) and probability[i] < maxoffense * 9 / 10 then
      probability[i] = 0
    end
  end
  local s = {}
  local maxnum = 0
  for i = 1, wugongnum do
    s[i] = maxnum
    maxnum = maxnum + probability[i]
  end
  s[wugongnum + 1] = maxnum
  if maxnum == 0 then
    return -1
  end
  local v = Rnd(maxnum)
  local selectid = 0
  for i = 1, wugongnum do
    if v >= s[i] and v < s[i + 1] then
      selectid = i
      break
    end
  end
  return selectid
end
function War_AutoSelectEnemy()
  local enemyid = War_AutoSelectEnemy_near()
  WAR.Person[WAR.CurID]["自动选择对手"] = enemyid
  return enemyid
end
function War_AutoSelectEnemy_near()
  War_CalMoveStep(WAR.CurID, 100, 1)
  local maxDest = math.huge
  local nearid = -1
  for i = 0, WAR.PersonNum - 1 do
    if WAR.Person[WAR.CurID]["我方"] ~= WAR.Person[i]["我方"] and WAR.Person[i]["死亡"] == false then
      local step = GetWarMap(WAR.Person[i]["坐标X"], WAR.Person[i]["坐标Y"], 3)
      if maxDest > step then
        nearid = i
        maxDest = step
      end
    end
  end
  return nearid
end
function War_AutoMove(wugongnum)
  local pid = WAR.Person[WAR.CurID]["人物编号"]
  local wugongid, level, wugongtype, movescope, fightscope, scope
  if wugongnum == -1 then
    if CC.SHGS > 2 then
      scope = math.modf(JY.Person[pid]["暗器技巧"] / CC.PersonAttribMax["暗器技巧"] / 15 * 200) + 1
    else
      scope = math.modf(JY.Person[pid]["暗器技巧"] / 15) + 1
    end
    wugongid = -1
    wugongtype = 0
  else
    wugongid = JY.Person[pid]["武功" .. wugongnum]
    level = math.modf(JY.Person[pid]["武功等级" .. wugongnum] / 100) + 1
    wugongtype = JY.Wugong[wugongid]["攻击范围"]
    movescope = JY.Wugong[wugongid]["移动范围" .. level]
    fightscope = JY.Wugong[wugongid]["杀伤范围" .. level]
    scope = movescope + fightscope
  end
  local x, y
  local move = 128
  local maxenemy = 0
  local movestep = War_CalMoveStep(WAR.CurID, WAR.Person[WAR.CurID]["移动步数"], 0)
  War_AutoCalMaxEnemyMap(wugongid, level)
  for i = 0, WAR.Person[WAR.CurID]["移动步数"] do
    local step_num = movestep[i].num
    if step_num == 0 then
      break
    end
    for j = 1, step_num do
      local xx = movestep[i].x[j]
      local yy = movestep[i].y[j]
      local num = 0
      if wugongtype == 0 or wugongtype == 2 or wugongtype == 3 then
        num = GetWarMap(xx, yy, 4)
      elseif wugongtype == 1 then
        local v = GetWarMap(xx, yy, 4)
        if 0 < v then
          num = War_AutoCalMaxEnemy(xx, yy, wugongid, level)
        end
      end
      if maxenemy < num then
        maxenemy = num
        x = xx
        y = yy
        move = i
      elseif num == maxenemy and 0 < num and Rnd(3) == 0 then
        maxenemy = num
        x = xx
        y = yy
        move = i
      end
    end
  end
  if 0 < maxenemy then
    War_CalMoveStep(WAR.CurID, WAR.Person[WAR.CurID]["移动步数"], 0)
    War_MovePerson(x, y)
    return 1
  else
    x, y = War_GetCanFightEnemyXY(scope)
    local minDest = math.huge
    if x == nil then
      local enemyid = War_AutoSelectEnemy()
      War_CalMoveStep(WAR.CurID, 100, 0)
      for i = 0, CC.WarWidth - 1 do
        for j = 0, CC.WarHeight - 1 do
          local dest = GetWarMap(i, j, 3)
          if dest < 128 then
            local dx = math.abs(i - WAR.Person[enemyid]["坐标X"])
            local dy = math.abs(j - WAR.Person[enemyid]["坐标Y"])
            if minDest > dx + dy then
              minDest = dx + dy
              x = i
              y = j
            elseif minDest == dx + dy and Rnd(2) == 0 then
              x = i
              y = j
            end
          end
        end
      end
    else
      minDest = 0
    end
    if minDest < math.huge then
      while true do
        local i = GetWarMap(x, y, 3)
        if i <= WAR.Person[WAR.CurID]["移动步数"] then
          break
        end
        if GetWarMap(x - 1, y, 3) == i - 1 then
          x = x - 1
        elseif GetWarMap(x + 1, y, 3) == i - 1 then
          x = x + 1
        elseif GetWarMap(x, y - 1, 3) == i - 1 then
          y = y - 1
        elseif GetWarMap(x, y + 1, 3) == i - 1 then
          y = y + 1
        end
      end
      War_MovePerson(x, y)
    end
  end
  return 0
end
function War_GetCanFightEnemyXY(scope)
  local minStep = math.huge
  local newx, newy
  War_CalMoveStep(WAR.CurID, 100, 0)
  for x = 0, CC.WarWidth - 1 do
    for y = 0, CC.WarHeight - 1 do
      if 0 < GetWarMap(x, y, 4) then
        local step = GetWarMap(x, y, 3)
        if step < 128 then
          if minStep > step then
            minStep = step
            newx = x
            newy = y
          elseif minStep == step and Rnd(2) == 0 then
            newx = x
            newy = y
          end
        end
      end
    end
  end
  if minStep < math.huge then
    return newx, newy
  end
end
function War_AutoCalMaxEnemyMap(wugongid, level)
  local pid = WAR.Person[WAR.CurID]["人物编号"]
  local wugongtype, movescope, fightscope
  local x0 = WAR.Person[WAR.CurID]["坐标X"]
  local y0 = WAR.Person[WAR.CurID]["坐标Y"]
  CleanWarMap(4, 0)
  if wugongid == -1 then
    if CC.SHGS > 2 then
      movescope = math.modf(JY.Person[pid]["暗器技巧"] / CC.PersonAttribMax["暗器技巧"] / 15 * 200) + 1
    else
      movescope = math.modf(JY.Person[pid]["暗器技巧"] / 15) + 1
    end
    wugongtype = 0
    fightscope = 0
  else
    wugongtype = JY.Wugong[wugongid]["攻击范围"]
    movescope = JY.Wugong[wugongid]["移动范围" .. level]
    fightscope = JY.Wugong[wugongid]["杀伤范围" .. level]
  end
  if wugongtype == 0 or wugongtype == 3 then
    for n = 0, WAR.PersonNum - 1 do
      if n ~= WAR.CurID and WAR.Person[n]["死亡"] == false and WAR.Person[n]["我方"] ~= WAR.Person[WAR.CurID]["我方"] then
        local xx = WAR.Person[n]["坐标X"]
        local yy = WAR.Person[n]["坐标Y"]
        local movestep = War_CalMoveStep(n, movescope, 1)
        for i = 1, movescope do
          local step_num = movestep[i].num
          if step_num == 0 then
            break
          end
          local v = 0
          for j = 1, step_num do
            if wugongtype == 0 then
              SetWarMap(movestep[i].x[j], movestep[i].y[j], 4, 1)
            elseif wugongtype == 3 then
              for aa = -fightscope, fightscope do
                for bb = -fightscope, fightscope do
                  local id = GetWarMap(movestep[i].x[j] + aa, movestep[i].y[j] + bb, 2)
                  if 0 <= id and WAR.Person[WAR.CurID]["我方"] ~= WAR.Person[id]["我方"] then
                    v = v + 1
                  end
                end
              end
              SetWarMap(movestep[i].x[j], movestep[i].y[j], 4, v + 1)
            end
          end
        end
      end
    end
  elseif wugongtype == 1 or wugongtype == 2 then
    for n = 0, WAR.PersonNum - 1 do
      if n ~= WAR.CurID and WAR.Person[n]["死亡"] == false and WAR.Person[n]["我方"] ~= WAR.Person[WAR.CurID]["我方"] then
        local xx = WAR.Person[n]["坐标X"]
        local yy = WAR.Person[n]["坐标Y"]
        for direct = 0, 3 do
          for i = 1, movescope do
            local xnew = xx + CC.DirectX[direct + 1] * i
            local ynew = yy + CC.DirectY[direct + 1] * i
            if 0 <= xnew and xnew < CC.WarWidth and 0 <= ynew and ynew < CC.WarHeight then
              local v = GetWarMap(xnew, ynew, 4)
              SetWarMap(xnew, ynew, 4, v + 1)
            end
          end
        end
      end
    end
  end
end
function War_AutoCalMaxEnemy(x, y, wugongid, level)
  local pid = WAR.Person[WAR.CurID]["人物编号"]
  local wugongtype, movescope, fightscope
  local maxnum = 0
  local xmax, ymax
  if wugongid == -1 then
    if CC.SHGS > 2 then
      movescope = math.modf(JY.Person[pid]["暗器技巧"] / CC.PersonAttribMax["暗器技巧"] / 15 * 200) + 1
    else
      movescope = math.modf(JY.Person[pid]["暗器技巧"] / 15) + 1
    end
    wugongtype = 0
    fightscope = 0
  else
    wugongtype = JY.Wugong[wugongid]["攻击范围"]
    movescope = JY.Wugong[wugongid]["移动范围" .. level]
    fightscope = JY.Wugong[wugongid]["杀伤范围" .. level]
  end
  if wugongtype == 0 or wugongtype == 3 then
    local movestep = War_CalMoveStep(WAR.CurID, movescope, 1)
    for i = 1, movescope do
      local step_num = movestep[i].num
      if step_num == 0 then
        break
      end
      for j = 1, step_num do
        local xx = movestep[i].x[j]
        local yy = movestep[i].y[j]
        local enemynum = 0
        for n = 0, WAR.PersonNum - 1 do
          if n ~= WAR.CurID and WAR.Person[n]["死亡"] == false and WAR.Person[n]["我方"] ~= WAR.Person[WAR.CurID]["我方"] then
            local x = math.abs(WAR.Person[n]["坐标X"] - xx)
            local y = math.abs(WAR.Person[n]["坐标Y"] - yy)
            if fightscope >= x and fightscope >= y then
              enemynum = enemynum + 1
            end
          end
        end
        if maxnum < enemynum then
          maxnum = enemynum
          xmax = xx
          ymax = yy
        end
      end
    end
  elseif wugongtype == 1 then
    for direct = 0, 3 do
      local enemynum = 0
      for i = 1, movescope do
        local xnew = x + CC.DirectX[direct + 1] * i
        local ynew = y + CC.DirectY[direct + 1] * i
        if 0 <= xnew and xnew < CC.WarWidth and 0 <= ynew and ynew < CC.WarHeight then
          local id = GetWarMap(xnew, ynew, 2)
          if 0 <= id and WAR.Person[WAR.CurID]["我方"] ~= WAR.Person[id]["我方"] then
            enemynum = enemynum + 1
          end
        end
      end
      if maxnum < enemynum then
        maxnum = enemynum
        xmax = x + CC.DirectX[direct + 1]
        ymax = y + CC.DirectY[direct + 1]
      end
    end
  elseif wugongtype == 2 then
    local enemynum = 0
    for direct = 0, 3 do
      for i = 1, movescope do
        local xnew = x + CC.DirectX[direct + 1] * i
        local ynew = y + CC.DirectY[direct + 1] * i
        if 0 <= xnew and xnew < CC.WarWidth and 0 <= ynew and ynew < CC.WarHeight then
          local id = GetWarMap(xnew, ynew, 2)
          if 0 <= id and WAR.Person[WAR.CurID]["我方"] ~= WAR.Person[id]["我方"] then
            enemynum = enemynum + 1
          end
        end
      end
    end
    if 0 < enemynum then
      maxnum = enemynum
      xmax = x
      ymax = y
    end
  end
  return maxnum, xmax, ymax
end
function War_AutoExecuteFight(wugongnum)
  local pid = WAR.Person[WAR.CurID]["人物编号"]
  local x0 = WAR.Person[WAR.CurID]["坐标X"]
  local y0 = WAR.Person[WAR.CurID]["坐标Y"]
  local wugongid, level
  if wugongnum == -1 then
    wugongid = -1
  else
    wugongid = JY.Person[pid]["武功" .. wugongnum]
    level = math.modf(JY.Person[pid]["武功等级" .. wugongnum] / 100) + 1
  end
  local maxnum, x, y = War_AutoCalMaxEnemy(x0, y0, wugongid, level)
  if x ~= nil then
    War_Fight_Sub(WAR.CurID, wugongnum, x, y)
  end
end
function War_AutoEscape()
  local pid = WAR.Person[WAR.CurID]["人物编号"]
  if JY.Person[pid]["体力"] <= 5 then
    return
  end
  local maxDest = 0
  local x, y
  War_CalMoveStep(WAR.CurID, WAR.Person[WAR.CurID]["移动步数"], 0)
  for i = 0, CC.WarWidth - 1 do
    for j = 0, CC.WarHeight - 1 do
      if GetWarMap(i, j, 3) < 128 then
        local minDest = math.huge
        for k = 0, WAR.PersonNum - 1 do
          if WAR.Person[WAR.CurID]["我方"] ~= WAR.Person[k]["我方"] and WAR.Person[k]["死亡"] == false then
            local dx = math.abs(i - WAR.Person[k]["坐标X"])
            local dy = math.abs(j - WAR.Person[k]["坐标Y"])
            if minDest > dx + dy then
              minDest = dx + dy
            end
          end
        end
        if maxDest < minDest then
          maxDest = minDest
          x = i
          y = j
        end
      end
    end
  end
  if 0 < maxDest then
    War_MovePerson(x, y)
  end
end
function War_AutoEatDrug(flag)
  local pid = WAR.Person[WAR.CurID]["人物编号"]
  local life = JY.Person[pid]["生命"]
  local maxlife = JY.Person[pid]["生命最大值"]
  local selectid
  local minvalue = math.huge
  local shouldadd, maxattrib, str
  if flag == 2 then
    maxattrib = JY.Person[pid]["生命最大值"]
    shouldadd = maxattrib - JY.Person[pid]["生命"]
    str = "加生命"
  elseif flag == 3 then
    maxattrib = JY.Person[pid]["内力最大值"]
    shouldadd = maxattrib - JY.Person[pid]["内力"]
    str = "加内力"
  elseif flag == 4 then
    maxattrib = CC.PersonAttribMax["体力"]
    shouldadd = maxattrib - JY.Person[pid]["体力"]
    str = "加体力"
  elseif flag == 6 then
    maxattrib = CC.PersonAttribMax["中毒程度"]
    shouldadd = JY.Person[pid]["中毒程度"]
    str = "加中毒解毒"
  else
    return
  end
  local Get_Add = function(thingid)
    if flag == 6 then
      return -JY.Thing[thingid][str] / 2
    else
      return JY.Thing[thingid][str]
    end
  end
  if WAR.Person[WAR.CurID]["我方"] == true then
    local extra = 0
    for i = 1, CC.MyThingNum do
      local thingid = JY.Base["物品" .. i]
      if 0 <= thingid then
        local add = Get_Add(thingid)
        if JY.Thing[thingid]["类型"] == 3 and 0 < add then
          local v = shouldadd - add
          if v < 0 then
            extra = 1
            break
          elseif minvalue > v then
            minvalue = v
            selectid = thingid
          end
        end
      end
    end
    if extra == 1 then
      minvalue = math.huge
      for i = 1, CC.MyThingNum do
        local thingid = JY.Base["物品" .. i]
        if 0 <= thingid then
          local add = Get_Add(thingid)
          if JY.Thing[thingid]["类型"] == 3 and 0 < add then
            local v = add - shouldadd
            if 0 <= v and minvalue > v then
              minvalue = v
              selectid = thingid
            end
          end
        end
      end
    end
    if UseThingEffect(selectid, pid) == 1 then
      instruct_32(selectid, -1)
    end
  else
    local extra = 0
    for i = 1, 4 do
      local thingid = JY.Person[pid]["携带物品" .. i]
      if 0 <= thingid then
        local add = Get_Add(thingid)
        if JY.Thing[thingid]["类型"] == 3 and 0 < add then
          local v = shouldadd - add
          if v < 0 then
            extra = 1
            break
          elseif minvalue > v then
            minvalue = v
            selectid = thingid
          end
        end
      end
    end
    if extra == 1 then
      minvalue = math.huge
      for i = 1, 4 do
        local thingid = JY.Person[pid]["携带物品" .. i]
        if 0 <= thingid then
          local add = Get_Add(thingid)
          if JY.Thing[thingid]["类型"] == 3 and 0 < add then
            local v = add - shouldadd
            if 0 <= v and minvalue > v then
              minvalue = v
              selectid = thingid
            end
          end
        end
      end
    end
    if UseThingEffect(selectid, pid) == 1 then
      instruct_41(pid, selectid, -1)
    end
  end
  lib.Delay(500)
end
function War_AutoDoctor()
  local x1 = WAR.Person[WAR.CurID]["坐标X"]
  local y1 = WAR.Person[WAR.CurID]["坐标Y"]
  War_ExecuteMenu_Sub(x1, y1, 3, -1)
end
function existFile(filename)
  local f = io.open(filename)
  if f == nil then
    return false
  end
  io.close(f)
  return true
end
function delaytime(dtime)
  lib.Delay(dtime)
end
function WhoAmI()
  local ztsize = CC.DefaultFont * 0.8
  DrawString(1, 1, CC.YXBB, C_RED, ztsize)
  DrawString(1, ztsize * 2, CC.YXBD, C_RED, ztsize)
  DrawString(1, ztsize * 4, CC.YXZZ, C_RED, ztsize)
  DrawString(1, CC.ScreenH - ztsize, "门派群英版 by 木岛主", C_RED, ztsize * 0.8)
end
function MSG()
  if CC.ShowXY == 1 then
    local size = CC.DefaultFont
    local dtsize = CC.DefaultFont
    if JY.Status == GAME_MMAP then
      local sx = {}
      local sy = {}
      local mcstr = {}
      local mapsx = {}
      local mapsy = {}
      local mapmcstr = {}
      local mapcx, mapcy
      if JY.MiniMap == 1 and JY.JZKG == 1 then
        if CONFIG.Operation == 0 then
          lib.Background(0, 0, CC.ScreenW, CC.ScreenH, 224)
        else
          lib.Background(0, 0, CC.ScreenW, CC.ScreenH, 224)
        end
        mapcx = CC.ScreenW / 2 - CC.DefaultFont * 0.2
        mapcy = CC.ScreenH / 2 - CC.DefaultFont * 0.2
        DrawString(mapcx, mapcy, "♀", C_ORANGE, CC.DefaultFont * 0.3)
      end
      if JY.JZKG == 1 then
        for i = 0, JY.SceneNum - 1 do
          if (JY.Scene[i]["进入条件"] == 0 or JY.Scene[i]["进入条件"] == 2) and (JY.Scene[i]["外景入口X1"] ~= 0 and JY.Scene[i]["外景入口Y1"] ~= 0 or JY.Scene[i]["外景入口X2"] ~= 0 and JY.Scene[i]["外景入口Y2"] ~= 0) then
            sx[i] = JY.Scene[i]["外景入口X1"]
            sy[i] = JY.Scene[i]["外景入口Y1"]
            mcstr[i] = JY.Scene[i]["名称"]
            if math.abs(sx[i] - JY.Base["人X"]) <= 30 and 30 >= math.abs(sy[i] - JY.Base["人Y"]) then
              if CONFIG.Operation == 1 and JY.MiniMap == 1 and JY.Status == GAME_MMAP then
              elseif JY.MoveZTime + 3000 >= lib.GetTime() then
                YYZhi(sx[i], sy[i], mcstr[i], 0, 0, 80, C_ORANGE, dtsize, nil, nil, 1)
              elseif JY.MoveZTime + 3000 < lib.GetTime() and JY.MoveZTime + 6000 >= lib.GetTime() then
                YYZhi(sx[i], sy[i], mcstr[i], 0, 0, 80, C_GOLD, dtsize, nil, nil, 1)
              else
                YYZhi(sx[i], sy[i], mcstr[i], 0, 0, 80, C_GOLD, dtsize, nil, nil, 1)
                JY.MoveZTime = lib.GetTime()
              end
              if JY.Scene[i]["外景入口X2"] ~= JY.Scene[i]["外景入口X1"] or JY.Scene[i]["外景入口Y2"] ~= JY.Scene[i]["外景入口Y1"] then
                YYZhi(JY.Scene[i]["外景入口X2"], JY.Scene[i]["外景入口Y2"], nil, 0, 0, 80, C_GOLD)
              end
            end
            if JY.MiniMap == 1 then
              mapsx[i] = JY.Scene[i]["外景入口X1"]
              mapsy[i] = JY.Scene[i]["外景入口Y1"]
              mapmcstr[i] = JY.Scene[i]["名称"]
              local mmsx = {}
              local mmsy = {}
              if math.abs(mapsx[i] - JY.Base["人X"]) <= 200 and math.abs(mapsy[i] - JY.Base["人Y"]) <= 200 then
                local jl = 3
                mmsx[i] = mapcx + (mapsx[i] - JY.Base["人X"]) * jl - (mapsy[i] - JY.Base["人Y"]) * jl
                mmsy[i] = mapcy + (mapsx[i] - JY.Base["人X"]) * jl + (mapsy[i] - JY.Base["人Y"]) * jl
                local strlen = #mapmcstr[i]
                local mapsize = CC.DefaultFont * 0.6
                local zhix = mmsx[i] - mapsize * strlen / 4
                local zhiy = mmsy[i] - mapsize * 0.4
                DrawString(zhix, zhiy, mapmcstr[i], RGB(120, 208, 88), mapsize)
                DrawString(mmsx[i], mmsy[i], "●", C_RED, CC.DefaultFont * 0.2)
              end
            end
          end
        end
      end
    elseif JY.Status == GAME_SMAP then
      if JY.DHBZ == 0 then
        if JY.JZKG == 1 then
          local x1 = 0
          local y1 = 0
          if 0 < JY.Scene[JY.SubScene]["出口X2"] and 0 < JY.Scene[JY.SubScene]["出口Y2"] then
            x1 = JY.Scene[JY.SubScene]["出口X2"]
            y1 = JY.Scene[JY.SubScene]["出口Y2"]
          elseif 0 < JY.Scene[JY.SubScene]["出口X1"] and 0 < JY.Scene[JY.SubScene]["出口Y1"] then
            x1 = JY.Scene[JY.SubScene]["出口X1"]
            y1 = JY.Scene[JY.SubScene]["出口Y1"]
          else
            x1 = JY.Scene[JY.SubScene]["出口X3"]
            y1 = JY.Scene[JY.SubScene]["出口Y3"]
          end
          local str1 = "离开" .. JY.Scene[JY.SubScene]["名称"]
          YYZhi(x1 + 1, y1 + 1, str1, 0, 0, 0, C_ORANGE, size, nil, nil, 1)
          YYZhi(JY.Scene[JY.SubScene]["出口X1"] + 1, JY.Scene[JY.SubScene]["出口Y1"] + 1, nil, 0, 0, 80, C_ORANGE, size)
          if JY.Scene[JY.SubScene]["出口X2"] ~= JY.Scene[JY.SubScene]["出口X1"] or JY.Scene[JY.SubScene]["出口Y2"] ~= JY.Scene[JY.SubScene]["出口Y1"] then
            YYZhi(JY.Scene[JY.SubScene]["出口X2"] + 1, JY.Scene[JY.SubScene]["出口Y2"] + 1, nil, 0, 0, 80, C_ORANGE, size)
          end
          if (JY.Scene[JY.SubScene]["出口X3"] ~= JY.Scene[JY.SubScene]["出口X1"] or JY.Scene[JY.SubScene]["出口Y3"] ~= JY.Scene[JY.SubScene]["出口Y1"]) and (JY.Scene[JY.SubScene]["出口X3"] ~= JY.Scene[JY.SubScene]["出口X2"] or JY.Scene[JY.SubScene]["出口Y3"] ~= JY.Scene[JY.SubScene]["出口Y2"]) then
            YYZhi(JY.Scene[JY.SubScene]["出口X3"] + 1, JY.Scene[JY.SubScene]["出口Y3"] + 1, nil, 0, 0, 80, C_ORANGE, size)
          end
          local x2 = 0
          local y2 = 0
          if 0 < JY.Scene[JY.SubScene]["跳转口X1"] and 0 < JY.Scene[JY.SubScene]["跳转口Y1"] then
            x2 = JY.Scene[JY.SubScene]["跳转口X1"]
            y2 = JY.Scene[JY.SubScene]["跳转口Y1"]
            local tzcj = JY.Scene[JY.SubScene]["跳转场景"]
            if JY.Scene[tzcj] ~= nil then
              local str2 = "进入" .. JY.Scene[tzcj]["名称"]
              YYZhi(x2 + 1, y2 + 1, str2, 0, 0, 80, C_ORANGE, size, nil, nil, 1)
            end
          end
        end
        if JY.TXKG == 1 then
          if CC.BanBen == 0 then
            if JY.Scene[JY.SubScene]["代号"] == 70 then
            end
          elseif CC.BanBen == 1 then
            if JY.Scene[JY.SubScene]["代号"] == 70 then
              YYZhi(7, 21, "五两银子还我没？", nil, nil, nil, C_WHITE, size)
              YYZhi(8, 27, "公子，你回来啦！", nil, nil, nil, C_WHITE, size)
              local yxndstr
              if JY.YXND == 0 then
                yxndstr = "风平浪静"
              elseif JY.YXND == 1 then
                yxndstr = "风起云涌"
              elseif JY.YXND == 2 then
                yxndstr = "惊涛骇浪"
              end
              if CC.ZCOPEN == 1 then
                YYZhi(18, 35, "练功场", nil, nil, nil, C_ORANGE, size)
                YYZhi(18, 26, "挑战台", nil, nil, nil, C_ORANGE, size)
              end
            end
          elseif CC.BanBen == 2 and JY.Scene[JY.SubScene]["代号"] == 70 then
            YYZhi(30, 42, "炼丹炉", nil, nil, nil, C_ORANGE, size)
            YYZhi(39, 41, "打铁炉", nil, nil, nil, C_ORANGE)
          end
          if JY.DHSJ + 5000 < lib.GetTime() then
            JY.DHSJ = lib.GetTime() + 5000
          elseif JY.DHSJ < lib.GetTime() then
            JY.DHSJ = lib.GetTime() + 5000
            JY.DHBZ = 1
          end
        end
      elseif JY.DHBZ == 1 then
        if JY.JZKG == 1 then
          local x1 = 0
          local y1 = 0
          if 0 < JY.Scene[JY.SubScene]["出口X2"] and 0 < JY.Scene[JY.SubScene]["出口Y2"] then
            x1 = JY.Scene[JY.SubScene]["出口X2"]
            y1 = JY.Scene[JY.SubScene]["出口Y2"]
          elseif 0 < JY.Scene[JY.SubScene]["出口X1"] and 0 < JY.Scene[JY.SubScene]["出口Y1"] then
            x1 = JY.Scene[JY.SubScene]["出口X1"]
            y1 = JY.Scene[JY.SubScene]["出口Y1"]
          else
            x1 = JY.Scene[JY.SubScene]["出口X3"]
            y1 = JY.Scene[JY.SubScene]["出口Y3"]
          end
          local str1 = "离开" .. JY.Scene[JY.SubScene]["名称"]
          YYZhi(x1 + 1, y1 + 1, str1, 0, 0, 0, C_GOLD, size, nil, nil, 1)
          YYZhi(JY.Scene[JY.SubScene]["出口X1"] + 1, JY.Scene[JY.SubScene]["出口Y1"] + 1, nil, 0, 0, 80, C_GOLD, size)
          if JY.Scene[JY.SubScene]["出口X2"] ~= JY.Scene[JY.SubScene]["出口X1"] or JY.Scene[JY.SubScene]["出口Y2"] ~= JY.Scene[JY.SubScene]["出口Y1"] then
            YYZhi(JY.Scene[JY.SubScene]["出口X2"] + 1, JY.Scene[JY.SubScene]["出口Y2"] + 1, nil, 0, 0, 80, C_GOLD, size)
          end
          if (JY.Scene[JY.SubScene]["出口X3"] ~= JY.Scene[JY.SubScene]["出口X1"] or JY.Scene[JY.SubScene]["出口Y3"] ~= JY.Scene[JY.SubScene]["出口Y1"]) and (JY.Scene[JY.SubScene]["出口X3"] ~= JY.Scene[JY.SubScene]["出口X2"] or JY.Scene[JY.SubScene]["出口Y3"] ~= JY.Scene[JY.SubScene]["出口Y2"]) then
            YYZhi(JY.Scene[JY.SubScene]["出口X3"] + 1, JY.Scene[JY.SubScene]["出口Y3"] + 1, nil, 0, 0, 80, C_GOLD, size)
          end
          local x2 = 0
          local y2 = 0
          if 0 < JY.Scene[JY.SubScene]["跳转口X1"] and 0 < JY.Scene[JY.SubScene]["跳转口Y1"] or 0 < JY.Scene[JY.SubScene]["跳转口X2"] and 0 < JY.Scene[JY.SubScene]["跳转口Y2"] then
            x2 = JY.Scene[JY.SubScene]["跳转口X1"]
            y2 = JY.Scene[JY.SubScene]["跳转口Y1"]
            local tzcj = JY.Scene[JY.SubScene]["跳转场景"]
            if JY.Scene[tzcj] ~= nil then
              local str2 = "进入" .. JY.Scene[tzcj]["名称"]
              YYZhi(x2 + 1, y2 + 1, str2, 0, 0, 80, C_GOLD, size, nil, nil, 1)
            end
          end
        end
        if JY.TXKG == 1 then
          if CC.BanBen == 0 then
            if JY.Scene[JY.SubScene]["代号"] == 70 then
            end
          elseif CC.BanBen == 1 then
            if JY.Scene[JY.SubScene]["代号"] == 70 then
              if instruct_16(37) then
                instruct_3(-2, 7, -2, -2, 0, 0, 0, -2, -2, -2, -2, -2, -2)
                instruct_3(-2, 8, -2, -2, 0, 0, 0, -2, -2, -2, -2, -2, -2)
              end
              YYZhi(7, 21, "zzZ...zzZ...", nil, nil, nil, C_WHITE, size)
              YYZhi(8, 27, "公子，要休息吗？", nil, nil, nil, C_WHITE, size)
              local yxndstr
              if JY.YXND == 0 then
                yxndstr = "风平浪静"
              elseif JY.YXND == 1 then
                yxndstr = "风起云涌"
              elseif JY.YXND == 2 then
                yxndstr = "惊涛骇浪"
              end
              if CC.ZCOPEN == 1 then
                YYZhi(18, 35, "练功场", nil, nil, nil, C_ORANGE, size)
                YYZhi(18, 26, "挑战台", nil, nil, nil, C_ORANGE, size)
              end
            end
          elseif CC.BanBen == 2 and JY.Scene[JY.SubScene]["代号"] == 70 then
            YYZhi(30, 42, "炼丹炉", nil, nil, nil, C_ORANGE, size)
            YYZhi(39, 41, "打铁炉", nil, nil, nil, C_ORANGE)
          end
          if JY.DHSJ + 5000 < lib.GetTime() then
            JY.DHSJ = lib.GetTime() + 5000
          elseif JY.DHSJ < lib.GetTime() then
            JY.DHSJ = lib.GetTime() + 5000
            JY.DHBZ = 0
          end
        end
      end
      local jj = 0
      if CC.RWGN == 1 then
        local rwnum = 0
        for i = 0, math.huge do
          if 0 >= GetD(JY.SubScene, i, 9) or 0 >= GetD(JY.SubScene, i, 10) then
            break
          end
          rwnum = rwnum + 1
        end
        for i = 0, rwnum do
          if 0 < GetD(JY.SubScene, i, 2) or 0 < GetD(JY.SubScene, i, 3) or 0 < GetD(JY.SubScene, i, 4) then
            local dnum = {}
            local dtrue = false
            if RWPD(GetD(JY.SubScene, i, 2)) then
              YYZhi(GetD(JY.SubScene, i, 9), GetD(JY.SubScene, i, 10), "★", nil, nil, nil, C_RED, size)
              dnum[jj] = {
                GetD(JY.SubScene, i, 2),
                GetD(JY.SubScene, i, 9),
                GetD(JY.SubScene, i, 10)
              }
              dtrue = true
            elseif RWPD(GetD(JY.SubScene, i, 3)) then
              YYZhi(GetD(JY.SubScene, i, 9), GetD(JY.SubScene, i, 10), "★", nil, nil, nil, C_RED, size)
              dnum[jj] = {
                GetD(JY.SubScene, i, 3),
                GetD(JY.SubScene, i, 9),
                GetD(JY.SubScene, i, 10)
              }
              dtrue = true
            elseif RWPD(GetD(JY.SubScene, i, 4)) then
              YYZhi(GetD(JY.SubScene, i, 9), GetD(JY.SubScene, i, 10), "★", nil, nil, nil, C_RED, size)
              dnum[jj] = {
                GetD(JY.SubScene, i, 4),
                GetD(JY.SubScene, i, 9),
                GetD(JY.SubScene, i, 10)
              }
              dtrue = true
            end
            if dtrue then
              local mapcx = CC.ScreenW / 2 - CC.DefaultFont * 0.2
              local mapcy = CC.ScreenH / 2 - CC.DefaultFont * 0.2
              local smsx = {}
              local smsy = {}
              local jl = 5
              local renx = JY.Base["人X1"]
              local reny = JY.Base["人Y1"]
              if renx < 7 then
                renx = 7
              elseif 50 < renx then
                renx = 50
              end
              if reny < 7 then
                reny = 7
              elseif 50 < reny then
                reny = 50
              end
              smsx[jj] = mapcx + (dnum[jj][2] - renx) * jl - (dnum[jj][3] - reny) * jl
              smsy[jj] = mapcy + (dnum[jj][2] - renx) * jl + (dnum[jj][3] - reny) * jl
              local strlen = string.len("★")
              local mapsize = CC.DefaultFont * 0.8
              local zhix = smsx[jj] - mapsize * strlen / 4
              local zhiy = smsy[jj] - mapsize * 0.5
              DrawString(smsx[jj], smsy[jj], "★", RGB(120, 208, 88), CC.DefaultFont * 0.4)
              jj = jj + 1
            end
          end
        end
      end
    end
    if JY.TXKG == 1 then
      if JY.ZLX == nil then
        JY.ZLX = JY.Base["人X"]
        JY.ZLY = JY.Base["人Y"]
      end
      if JY.ZLBZ == 0 or JY.ZLQH == 1 then
        if JY.Status == GAME_MMAP then
          JY.ZLX = JY.Base["人X"]
          JY.ZLY = JY.Base["人Y"]
          JY.ZLT = lib.GetTime() + 120000
          JY.ZLBZ = 1
        else
          JY.ZLX = JY.Base["人X1"]
          JY.ZLY = JY.Base["人Y1"]
          JY.ZLT = lib.GetTime() + 120000
          JY.ZLBZ = 1
        end
        JY.ZLQH = 0
      end
      if JY.Status == GAME_MMAP then
        if JY.ZLBZ == 1 and JY.ZLT < lib.GetTime() and JY.ZLX == JY.Base["人X"] and JY.ZLY == JY.Base["人Y"] then
          YYZhi(JY.Base["人X"], JY.Base["人Y"], "站很久啦！可以让我动一动吗？", nil, nil, nil, C_RED, size)
          JY.ZLSHBZ = 1
        elseif JY.ZLT < lib.GetTime() and (JY.ZLX ~= JY.Base["人X"] or JY.ZLY ~= JY.Base["人Y"]) then
          if JY.ZLBZ1 == 0 then
            JY.ZLT1 = lib.GetTime() + 5000
            JY.ZLBZ1 = 1
          end
          if JY.ZLBZ1 == 1 and JY.ZLT1 > lib.GetTime() and JY.ZLSHBZ == 1 then
            YYZhi(JY.Base["人X"], JY.Base["人Y"], "总算能动了，累就休息一下吧！", nil, nil, nil, C_WHITE, size)
          else
            JY.ZLBZ1 = 0
            JY.ZLBZ = 0
            JY.ZLSHBZ = 0
          end
        end
      elseif JY.ZLBZ == 1 and JY.ZLT < lib.GetTime() and JY.ZLX == JY.Base["人X1"] and JY.ZLY == JY.Base["人Y1"] then
        YYZhi(JY.Base["人X1"], JY.Base["人Y1"], "站很久啦！可以让我动一动吗？", nil, nil, nil, C_RED, size)
        JY.ZLSHBZ = 1
      elseif JY.ZLT < lib.GetTime() and (JY.ZLX ~= JY.Base["人X1"] or JY.ZLY ~= JY.Base["人Y1"]) then
        if JY.ZLBZ1 == 0 then
          JY.ZLT1 = lib.GetTime() + 5000
          JY.ZLBZ1 = 1
        end
        if JY.ZLBZ1 == 1 and JY.ZLT1 > lib.GetTime() and JY.ZLSHBZ == 1 then
          YYZhi(JY.Base["人X1"], JY.Base["人Y1"], "总算能动了，累就休息一下吧！", nil, nil, nil, C_WHITE, size)
        else
          JY.ZLBZ1 = 0
          JY.ZLBZ = 0
          JY.ZLSHBZ = 0
        end
      end
    end
    SCMSG()
    if CONFIG.Operation ~= 1 or JY.MiniMap ~= 1 or JY.Status == GAME_MMAP then
    else
    end
  end
  if JY.ZBJKSJ < lib.GetTime() then
    JY.ZBJK = 1
    JY.ZBJKSJ = lib.GetTime() + 60000
  end
  if JY.ZBJK == 1 then
    local id = 0
    local clevel = JY.Person[id]["等级"]
    if CC.BanBen == 1 then
      if JY.Person[id]["攻击力"] > 200 + clevel * 30 or JY.Person[id]["攻击力"] > 600 then
        JY.ZUOBI = 1
      end
      if JY.Person[id]["防御力"] > 200 + clevel * 30 or 600 < JY.Person[id]["防御力"] then
        JY.ZUOBI = 1
      end
      if JY.Person[id]["轻功"] > 200 + clevel * 30 or 600 < JY.Person[id]["轻功"] then
        JY.ZUOBI = 1
      end
      if JY.Person[id]["拳掌功夫"] > 150 + clevel * 20 or JY.Person[id]["拳掌功夫"] > 500 then
        JY.ZUOBI = 1
      end
      if JY.Person[id]["御剑能力"] > 150 + clevel * 20 or 500 < JY.Person[id]["御剑能力"] then
        JY.ZUOBI = 1
      end
      if JY.Person[id]["耍刀技巧"] > 150 + clevel * 20 or 500 < JY.Person[id]["耍刀技巧"] then
        JY.ZUOBI = 1
      end
      if JY.Person[id]["特殊兵器"] > 150 + clevel * 20 or 500 < JY.Person[id]["特殊兵器"] then
        JY.ZUOBI = 1
      end
    elseif CC.BanBen == 0 then
      if JY.Person[id]["攻击力"] > 50 + clevel * 10 or JY.Person[id]["攻击力"] > 100 then
        JY.ZUOBI = 1
      end
      if JY.Person[id]["防御力"] > 50 + clevel * 10 or JY.Person[id]["防御力"] > 100 then
        JY.ZUOBI = 1
      end
      if JY.Person[id]["轻功"] > 50 + clevel * 10 or JY.Person[id]["轻功"] > 100 then
        JY.ZUOBI = 1
      end
      if JY.Person[id]["拳掌功夫"] > 50 + clevel * 10 or JY.Person[id]["拳掌功夫"] > 100 then
        JY.ZUOBI = 1
      end
      if JY.Person[id]["御剑能力"] > 50 + clevel * 10 or JY.Person[id]["御剑能力"] > 100 then
        JY.ZUOBI = 1
      end
      if JY.Person[id]["耍刀技巧"] > 50 + clevel * 10 or JY.Person[id]["耍刀技巧"] > 100 then
        JY.ZUOBI = 1
      end
      if JY.Person[id]["特殊兵器"] > 50 + clevel * 10 or JY.Person[id]["特殊兵器"] > 100 then
        JY.ZUOBI = 1
      end
    end
    JY.ZBJK = 0
  end
end
function SCMSG()
  if JY.SCKG == 1 or JY.MENUMSG == 1 then
    local menuxadd = 0
    local menuyadd = 0
    if JY.MENUMSG == 1 then
      menuxadd = CC.MainSubMenuX
      menuyadd = CC.MainSubMenuY
    end
    local i
    local id = {}
    local idnum
    for i = 0, CC.MyThingNum - 1 do
      id[i] = JY.Base["物品" .. i + 1]
      if id[i] == CC.MoneyID then
        idnum = JY.Base["物品数量" .. i + 1]
        if 30000 < idnum then
          JY.Base["物品数量" .. i + 1] = 30000
        end
        i = CC.MyThingNum
      end
    end
    local zcbl = 0
    if CC.ZCOPEN == 1 then
      zcbl = 1
    end
    if 0 < JY.SubScene and CC.HanhuaKG == 1 then
      for i = 1, 1000 do
        if CC.Hanhua[i] == nil then
          break
        end
        if CC.Hanhua[i][1] == JY.SubScene then
          Hanhua(CC.Hanhua[i][1], CC.Hanhua[i][2], CC.Hanhua[i][3], CC.Hanhua[i][4], CC.Hanhua[i][5])
        elseif CC.Hanhua[i][1] > JY.SubScene then
          break
        end
      end
    end
    local fontsize = CC.DefaultFont * 0.8
    DrawBox(menuxadd + 0, menuyadd + 0, menuxadd + fontsize * 12, menuyadd + fontsize * (4 + zcbl) * 1.1, C_WHITE)
    DrawString(menuxadd + 0, menuyadd + 0, string.format("%s", JY.Person[0]["姓名"]), C_GOLD, fontsize)
    DrawString(menuxadd + fontsize * 3.7, menuyadd + 0, string.format("   %-2d级", JY.Person[0]["等级"]), C_GOLD, fontsize)
    if JY.Person[0]["生命"]< JY.Person[0]["生命最大值"] then
      DrawString(menuxadd + fontsize * 6.9, menuyadd + 0, string.format(" %4d/%-4d", JY.Person[0]["生命"], JY.Person[0]["生命最大值"]), RGB(255, 192, 203), fontsize)
    else
      DrawString(menuxadd + fontsize * 6.9, menuyadd + 0, string.format(" %4d/%-4d", JY.Person[0]["生命"], JY.Person[0]["生命最大值"]), C_GOLD, fontsize)
    end
    if 0 < JY.Person[0]["受伤程度"] then
      DrawString(menuxadd + 0, menuyadd + fontsize * 2.2, string.format("内伤 %4d", JY.Person[0]["受伤程度"]), RGB(255, 192, 203), fontsize)
    else
      DrawString(menuxadd + 0, menuyadd + fontsize * 2.2, string.format("内伤 %4d", JY.Person[0]["受伤程度"]), C_GOLD, fontsize)
    end
    if 0 < JY.Person[0]["中毒程度"] then
      DrawString(menuxadd + CC.DefaultFont * 4.1, menuyadd + fontsize * 2.2, string.format("中毒 %3d", JY.Person[0]["中毒程度"]), RGB(120, 208, 88), fontsize)
    else
      DrawString(menuxadd + CC.DefaultFont * 4.1, menuyadd + fontsize * 2.2, string.format("中毒 %3d", JY.Person[0]["中毒程度"]), C_GOLD, fontsize)
    end
    local msstr
    if CC.YXNDA == 0 then
      msstr = "休闲"
    elseif CC.YXNDA == 1 then
      msstr = "经典"
    elseif CC.YXNDA == 2 then
      msstr = "挑战"
    end
    local ndsum = math.modf((CC.YXND[JY.YXNDXZ][3] + CC.YXND[JY.YXNDXZ][4]) / (CC.YXND[JY.YXNDXZ][1] + CC.YXND[JY.YXNDXZ][2]) * 100)
    DrawString(menuxadd + CC.DefaultFont * 7.9, menuyadd + fontsize * 2.2, msstr, C_GOLD, fontsize)
    DrawString(menuxadd + CC.DefaultFont * 7.9, menuyadd + fontsize * 3.2, ndsum .. "%", C_GOLD, fontsize)
    DrawString(menuxadd + 0, menuyadd + fontsize * 1.1, string.format("品德 %4s", JY.Person[0]["品德"]), C_GOLD, CC.DefaultFont * 0.8)
    if JY.Person[0]["左右互搏"] == 1 then
      DrawString(menuxadd + CC.DefaultFont * 4.1, menuyadd + fontsize * 1.1, "◎", C_RED, fontsize)
    else
      DrawString(menuxadd + CC.DefaultFont * 4.1, menuyadd + fontsize * 1.1, "○", C_GOLD, fontsize)
    end
    if JY.Person[0]["内力性质"] == 0 then
      DrawString(menuxadd + fontsize * 5.9, menuyadd + fontsize * 1.1, string.format(" %5d/%-5d", JY.Person[0]["内力"], JY.Person[0]["内力最大值"]), RGB(208, 152, 208), fontsize)
    elseif JY.Person[0]["内力性质"] == 1 then
      DrawString(menuxadd + fontsize * 5.9, menuyadd + fontsize * 1.1, string.format(" %5d/%-5d", JY.Person[0]["内力"], JY.Person[0]["内力最大值"]), C_GOLD, fontsize)
    elseif JY.Person[0]["内力性质"] == 2 then
      DrawString(menuxadd + fontsize * 5.9, menuyadd + fontsize * 1.1, string.format(" %5d/%-5d", JY.Person[0]["内力"], JY.Person[0]["内力最大值"]), C_WHITE, fontsize)
    end
    if idnum ~= nil then
      DrawString(menuxadd + 0, menuyadd + fontsize * 3.3, string.format("%s%5d", JY.Thing[CC.MoneyID]["名称"], idnum), C_GOLD, CC.DefaultFont * 0.8)
    end
    DrawString(menuxadd + CC.DefaultFont * 4.1, menuyadd + fontsize * 3.3, string.format("%s", os.date("%X", os.time())), C_GOLD, CC.DefaultFont * 0.8)
    DrawBox(menuxadd + 0, menuyadd + fontsize * (4 + zcbl) * 1.1, menuxadd + fontsize * 12, menuyadd + fontsize * (4 + zcbl + 1.1) * 1.1, C_WHITE)
    if JY.Status == GAME_MMAP then
      DrawString(menuxadd + 0, menuyadd + fontsize * (4 + zcbl + 0.1) * 1.1, string.format("大地图（%d,%d）", JY.Base["人X"], JY.Base["人Y"]), C_GOLD, CC.DefaultFont * 0.8)
    elseif JY.Status == GAME_SMAP then
      DrawString(menuxadd + 0, menuyadd + fontsize * (4 + zcbl + 0.1) * 1.1, string.format("%s（%d,%d）", JY.Scene[JY.SubScene]["名称"], JY.Base["人X1"], JY.Base["人Y1"]), C_GOLD, fontsize)
    end
    DrawString(menuxadd + CC.DefaultFont * 6.8, menuyadd + fontsize * (4 + zcbl + 0.1) * 1.1, string.format("天书 %2d", JY.Book), C_GOLD, CC.DefaultFont * 0.8)
    if CC.ZCOPEN == 1 then
      if 0 < JY.ZCWGCS then
        local zcstr
        if JY.ZCWGCS == 1 then
          zcstr = "一"
        elseif JY.ZCWGCS == 2 then
          zcstr = "二"
        elseif JY.ZCWGCS == 3 then
          zcstr = "三"
        elseif JY.ZCWGCS == 4 then
          zcstr = "四"
        elseif JY.ZCWGCS == 5 then
          zcstr = "五"
        end
        DrawString(menuxadd + 0, menuyadd + fontsize * 4.4, "自创武功   第" .. zcstr .. "重", C_GOLD, CC.DefaultFont * 0.8)
      else
        DrawString(menuxadd + 0, menuyadd + fontsize * 4.4, "自创武功   无", C_GOLD, CC.DefaultFont * 0.8)
      end
    end
    if CC.JS == 1 and string.len(JY.Person[0]["外号"]) == 4 then
      local str1 = string.sub(JY.Person[0]["外号"], 1, 2)
      local str2 = string.sub(JY.Person[0]["外号"], 3, 4)
      DrawString(menuxadd + CC.DefaultFont * 8, menuyadd + fontsize * 2.2, str1, C_ORANGE, CC.DefaultFont * 0.8)
      DrawString(menuxadd + CC.DefaultFont * 8, menuyadd + fontsize * 3.3, str2, C_ORANGE, CC.DefaultFont * 0.8)
    end
  end
end
function Split(szFullString, szSeparator)
  local nFindStartIndex = 1
  local nSplitIndex = 1
  local nSplitArray = {}
  while true do
    local nFindLastIndex = string.find(szFullString, szSeparator, nFindStartIndex)
    if not nFindLastIndex then
      nSplitArray[nSplitIndex] = string.sub(szFullString, nFindStartIndex, string.len(szFullString))
      break
    else
      nSplitArray[nSplitIndex] = string.sub(szFullString, nFindStartIndex, nFindLastIndex - 1)
      nFindStartIndex = nFindLastIndex + string.len(szSeparator)
      nSplitIndex = nSplitIndex + 1
    end
  end
  return nSplitIndex, nSplitArray
end
function copyfile(source, destination)
  local sourcefile = io.open(source, "r")
  local destinationfile = io.open(destination, "w")
  for line in sourcefile:lines() do
    destinationfile:write(line .. "\n")
  end
  sourcefile:close()
  destinationfile:close()
end
function SeachItem()
  local picid = 600
  instruct_0()
  if instruct_18(234) then
    say("你手里还有介绍信，赶紧先去入门", picid, 1, "开局助手")
  else
    local title = "是否搜刮减道德的箱子"
    local str = "是：搜刮之后道德减四*否：不搜刮减道德箱子*放弃：不使用自动搜刮功能"
    local btn = {
      "是",
      "否",
      "放弃"
    }
    local num = #btn
    local r = JYMsgBox(title, str, btn, num)
    if r == 3 then
      return
    end
    if 0 < GetD(0, 1, 2) then
      instruct_32(210, 10)
      instruct_0()
      instruct_3(0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
    end
    if 0 < GetD(0, 2, 2) then
      instruct_32(0, 10)
      instruct_0()
      instruct_3(0, 2, 0, 0, 0, 0, 0, 2468, 2468, 2468, -2, -2, -2)
    end
    if 0 < GetD(0, 3, 2) then
      instruct_32(3, 10)
      instruct_0()
      instruct_3(0, 3, 0, 0, 0, 0, 0, 2468, 2468, 2468, -2, -2, -2)
    end
    if 0 < GetD(0, 5, 2) then
      instruct_32(19, 1)
      instruct_0()
      instruct_3(0, 5, 0, 0, 0, 0, 0, 2468, 2468, 2468, -2, -2, -2)
    end
    if 0 < GetD(9, 8, 2) then
      instruct_3(9, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
      instruct_32(210, 10)
      instruct_0()
    end
    if 0 < GetD(9, 5, 2) then
      instruct_3(9, 5, 1, 0, 0, 0, 0, 2468, 2468, 2468, -2, -2, -2)
      instruct_0()
      instruct_32(209, 50)
      instruct_0()
    end
    if 0 < GetD(9, 7, 2) then
      instruct_32(0, 10)
      instruct_0()
      instruct_3(9, 7, 0, 0, 0, 0, 0, 2468, 2468, 2468, -2, -2, -2)
    end
    if 0 < GetD(9, 6, 2) then
      instruct_32(3, 10)
      instruct_0()
      instruct_3(9, 6, 0, 0, 0, 0, 0, 2468, 2468, 2468, -2, -2, -2)
      instruct_0()
    end
    if 0 < GetD(18, 4, 2) then
      instruct_3(18, 4, 1, 0, 0, 0, 0, 2612, 2612, 2612, -2, -2, -2)
      instruct_0()
      instruct_32(107, 1)
      instruct_0()
    end
    if 0 < GetD(20, 15, 2) then
      instruct_32(210, 10)
      instruct_0()
      instruct_3(20, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
    end
    if 0 < GetD(21, 13, 2) then
      instruct_3(21, 13, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
      instruct_32(210, 10)
      instruct_0()
    end
    if 0 < GetD(21, 12, 2) then
      instruct_3(21, 12, 1, 0, 0, 0, 0, 2492, 2492, 2492, -2, -2, -2)
      instruct_0()
      instruct_32(213, 1)
      instruct_0()
    end
    if 0 < GetD(22, 1, 2) then
      instruct_3(22, 1, 1, 0, 0, 0, 0, 2612, 2612, 2612, -2, -2, -2)
      instruct_0()
      instruct_32(209, 50)
      instruct_0()
      instruct_32(174, 200)
      instruct_0()
    end
    if 0 < GetD(22, 2, 2) then
      instruct_3(22, 2, 1, 0, 0, 0, 0, 2612, 2612, 2612, -2, -2, -2)
      instruct_0()
      instruct_32(176, 1)
      instruct_0()
    end
    if 0 < GetD(22, 3, 2) then
      instruct_3(22, 3, 1, 0, 0, 0, 0, 2492, 2492, 2492, -2, -2, -2)
      instruct_0()
      instruct_32(210, 10)
      instruct_0()
      instruct_32(10, 5)
      instruct_0()
    end
    if 0 < GetD(22, 4, 2) then
      instruct_3(22, 4, 1, 0, 0, 0, 0, 2492, 2492, 2492, -2, -2, -2)
      instruct_0()
      instruct_32(6, 1)
      instruct_0()
    end
    if 0 < GetD(22, 6, 2) then
      instruct_3(22, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
      instruct_32(210, 10)
      instruct_0()
    end
    if 0 < GetD(22, 0, 2) then
      instruct_3(22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
      instruct_0()
      instruct_32(201, 1)
      instruct_0()
    end
    if 0 < GetD(23, 2, 2) then
      instruct_3(23, 2, 1, 0, 0, 0, 0, 2468, 2468, 2468, -2, -2, -2)
      instruct_0()
      instruct_32(210, 10)
      instruct_0()
    end
    if 0 < GetD(23, 3, 2) then
      instruct_3(23, 3, 1, 0, 0, 0, 0, 2468, 2468, 2468, -2, -2, -2)
      instruct_0()
      instruct_32(210, 10)
      instruct_0()
    end
    if 0 < GetD(23, 4, 2) then
      instruct_3(23, 4, 1, 0, 0, 0, 0, 2468, 2468, 2468, -2, -2, -2)
      instruct_0()
      instruct_32(210, 10)
      instruct_0()
    end
    if 0 < GetD(23, 5, 2) then
      instruct_3(23, 5, 1, 0, 0, 0, 0, 2468, 2468, 2468, -2, -2, -2)
      instruct_0()
      instruct_32(210, 10)
      instruct_0()
    end
    if 0 < GetD(23, 9, 2) then
      instruct_3(23, 9, 1, 0, 0, 0, 0, 0, 0, 0, -2, -2, -2)
      instruct_0()
      instruct_32(18, 2)
      instruct_0()
    end
    if 0 < GetD(24, 10, 2) then
      instruct_32(0, 10)
      instruct_0()
      instruct_3(24, 10, 0, 0, 0, 0, 0, 2468, 2468, 2468, -2, -2, -2)
    end
    if 0 < GetD(24, 13, 2) then
      instruct_32(210, 10)
      instruct_0()
      instruct_3(24, 13, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
    end
    if 0 < GetD(28, 84, 2) then
      instruct_3(28, 84, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
      instruct_32(210, 10)
      instruct_0()
    end
    if 0 < GetD(28, 18, 2) and r == 1 then
      instruct_3(28, 18, 1, 0, 0, 0, 0, 2468, 2468, 2468, -2, -2, -2)
      instruct_0()
      instruct_32(210, 15)
      instruct_0()
      instruct_37(-1)
    end
    if 0 < GetD(30, 1, 2) then
      instruct_3(30, 1, 1, 0, 0, 0, 0, 2612, 2612, 2612, -2, -2, -2)
      instruct_0()
      instruct_32(7, 3)
      instruct_0()
      instruct_32(209, 50)
      instruct_0()
    end
    if 0 < GetD(30, 2, 2) then
      instruct_3(30, 2, 1, 0, 0, 0, 0, 2468, 2468, 2468, -2, -2, -2)
      instruct_0()
      instruct_32(9, 10)
      instruct_0()
      instruct_32(10, 5)
      instruct_0()
    end
    if 0 < GetD(30, 3, 2) then
      instruct_3(30, 3, 1, 0, 0, 0, 0, 2468, 2468, 2468, -2, -2, -2)
      instruct_0()
      instruct_32(3, 10)
      instruct_0()
      instruct_32(4, 5)
      instruct_0()
    end
    if 0 < GetD(30, 4, 2) then
      instruct_3(30, 4, 1, 0, 0, 0, 0, 2468, 2468, 2468, -2, -2, -2)
      instruct_0()
      instruct_32(0, 10)
      instruct_0()
      instruct_32(1, 5)
      instruct_0()
    end
    if 0 < GetD(30, 5, 2) then
      instruct_32(210, 10)
      instruct_0()
      instruct_3(30, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
    end
    if 0 < GetD(32, 4, 2) then
      instruct_3(32, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
      instruct_32(210, 10)
      instruct_0()
    end
    if 0 < GetD(33, 28, 2) then
      instruct_32(210, 10)
      instruct_0()
      instruct_3(33, 28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
    end
    if 0 < GetD(35, 11, 2) then
      instruct_3(35, 11, 1, 0, 0, 0, 0, 2492, 2492, 2492, -2, -2, -2)
      instruct_0()
      instruct_32(210, 10)
      instruct_0()
      instruct_32(10, 5)
      instruct_0()
    end
    if 0 < GetD(36, 6, 2) and r == 1 then
      instruct_3(36, 6, 1, 0, 0, 0, 0, 2608, 2608, 2608, -2, -2, -2)
      instruct_0()
      instruct_32(174, 200)
      instruct_0()
      instruct_32(1, 2)
      instruct_0()
      instruct_37(-1)
    end
    if 0 < GetD(37, 9, 2) then
      instruct_32(3, 10)
      instruct_0()
      instruct_3(37, 9, 0, 0, 0, 0, 0, 2468, 2468, 2468, -2, -2, -2)
      instruct_0()
    end
    if 0 < GetD(37, 11, 2) then
      instruct_32(210, 10)
      instruct_0()
      instruct_3(37, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
    end
    if 0 < GetD(38, 8, 2) then
      instruct_3(38, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
      instruct_0()
      instruct_32(15, 1)
      instruct_0()
    end
    if 0 < GetD(40, 32, 2) then
      instruct_3(40, 32, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
      instruct_32(210, 10)
      instruct_0()
    end
    if 0 < GetD(43, 34, 2) then
      instruct_3(43, 34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
      instruct_32(210, 10)
      instruct_0()
    end
    if 0 < GetD(43, 14, 2) and r == 1 then
      instruct_3(43, 14, 1, 0, 0, 0, 0, 2492, 2492, 2492, -2, -2, -2)
      instruct_0()
      instruct_32(8, 2)
      instruct_0()
      instruct_37(-1)
    end
    if 0 < GetD(44, 3, 2) then
      instruct_3(44, 3, 1, 0, 0, 0, 0, 2612, 2612, 2612, -2, -2, -2)
      instruct_0()
      instruct_32(209, 50)
      instruct_0()
      instruct_32(174, 200)
      instruct_0()
    end
    if 0 < GetD(44, 4, 2) then
      instruct_3(44, 4, 0, 0, 0, 0, 0, 2492, 2492, 2492, -2, -2, -2)
      instruct_0()
      instruct_32(2, 2)
      instruct_0()
    end
    if 0 < GetD(44, 5, 2) then
      instruct_3(44, 5, 0, 0, 0, 0, 0, 2492, 2492, 2492, -2, -2, -2)
      instruct_0()
      instruct_32(6, 2)
      instruct_0()
    end
    if 0 < GetD(44, 6, 2) then
      instruct_32(210, 10)
      instruct_0()
      instruct_3(44, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
    end
    if 0 < GetD(46, 8, 2) then
      instruct_3(46, 8, 1, 0, 0, 0, 0, 2612, 2612, 2612, -2, -2, -2)
      instruct_0()
      instruct_32(209, 50)
      instruct_0()
      instruct_32(174, 200)
      instruct_0()
    end
    if 0 < GetD(46, 2, 2) then
      instruct_3(46, 2, 1, 0, 0, 0, 0, 2608, 2608, 2608, -2, -2, -2)
      instruct_0()
      instruct_32(30, 10)
      instruct_0()
    end
    if 0 < GetD(49, 3, 2) then
      instruct_3(49, 3, 1, 0, 0, 0, 0, 2492, 2492, 2492, -2, -2, -2)
      instruct_0()
      instruct_32(0, 10)
      instruct_0()
      instruct_32(1, 3)
      instruct_0()
      instruct_32(2, 1)
      instruct_0()
      instruct_32(3, 10)
      instruct_0()
      instruct_32(4, 3)
      instruct_0()
      instruct_32(5, 2)
      instruct_0()
      instruct_32(6, 1)
      instruct_0()
      instruct_32(10, 3)
      instruct_0()
      instruct_32(209, 50)
      instruct_0()
    end
    if 0 < GetD(49, 4, 2) then
      instruct_32(210, 10)
      instruct_0()
      instruct_3(49, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
    end
    if 0 < GetD(50, 2, 2) then
      instruct_3(50, 2, 1, 0, 0, 0, 0, 2492, 2492, 2492, -2, -2, -2)
      instruct_0()
      instruct_32(0, 10)
      instruct_0()
      instruct_32(209, 20)
      instruct_0()
    end
    if 0 < GetD(50, 3, 2) then
      instruct_3(50, 3, 1, 0, 0, 0, 0, 2468, 2468, 2468, -2, -2, -2)
      instruct_0()
      instruct_32(1, 3)
      instruct_0()
      instruct_32(4, 3)
      instruct_0()
    end
    if 0 < GetD(50, 4, 2) then
      instruct_3(50, 4, 1, 0, 0, 0, 0, 2468, 2468, 2468, -2, -2, -2)
      instruct_0()
      instruct_32(8, 1)
      instruct_0()
      instruct_32(0, 5)
      instruct_0()
    end
    if 0 < GetD(50, 9, 2) then
      instruct_32(210, 10)
      instruct_0()
      instruct_3(50, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
    end
    if 0 < GetD(54, 1, 2) then
      instruct_3(54, 1, 1, 0, 0, 0, 0, 2492, 2492, 2492, -2, -2, -2)
      instruct_0()
      instruct_32(0, 10)
      instruct_0()
      instruct_32(1, 3)
      instruct_0()
      instruct_32(2, 1)
      instruct_0()
      instruct_32(3, 10)
      instruct_0()
      instruct_32(4, 3)
      instruct_0()
      instruct_32(5, 2)
      instruct_0()
      instruct_32(6, 1)
      instruct_0()
      instruct_32(10, 3)
      instruct_0()
      instruct_32(209, 50)
      instruct_0()
    end
    if 0 < GetD(54, 33, 2) then
      instruct_32(210, 10)
      instruct_0()
      instruct_3(54, 33, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
    end
    if 0 < GetD(54, 34, 2) then
      instruct_32(210, 10)
      instruct_0()
      instruct_3(54, 34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
    end
    if 0 < GetD(56, 4, 2) then
      instruct_3(56, 4, 1, 0, 0, 0, 0, 2608, 2608, 2608, -2, -2, -2)
      instruct_0()
      instruct_32(174, 200)
      instruct_0()
      instruct_32(0, 3)
      instruct_0()
    end
    if 0 < GetD(59, 31, 2) then
      instruct_32(210, 10)
      instruct_0()
      instruct_3(59, 31, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
    end
    if 0 < GetD(59, 32, 2) then
      instruct_32(210, 10)
      instruct_0()
      instruct_3(59, 32, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
    end
    if 0 < GetD(60, 11, 2) then
      instruct_32(210, 10)
      instruct_0()
      instruct_3(60, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
    end
    if 0 < GetD(64, 1, 2) then
      instruct_3(64, 1, 1, 0, 0, 0, 0, 2492, 2492, 2492, -2, -2, -2)
      instruct_0()
      instruct_32(174, 100)
      instruct_0()
      instruct_32(28, 10)
      instruct_0()
    end
    if 0 < GetD(64, 3, 2) then
      instruct_32(210, 10)
      instruct_0()
      instruct_3(64, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
    end
    if 0 < GetD(65, 4, 2) then
      instruct_32(210, 10)
      instruct_0()
      instruct_3(65, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
    end
    if 0 < GetD(68, 30, 2) then
      instruct_32(210, 10)
      instruct_0()
      instruct_3(68, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
    end
    if 0 < GetD(73, 8, 2) then
      instruct_32(210, 10)
      instruct_0()
      instruct_3(73, 8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
    end
    if 0 < GetD(73, 3, 2) then
      instruct_3(73, 3, 1, 0, 0, 0, 0, 2492, 2492, 2492, -2, -2, -2)
      instruct_0()
      instruct_32(0, 5)
      instruct_0()
      instruct_32(9, 3)
      instruct_0()
    end
    if 0 < GetD(75, 44, 2) then
      instruct_3(75, 44, 1, 0, 0, 0, 0, 2608, 2608, 2608, -2, -2, -2)
      instruct_0()
      instruct_32(220, 1)
      instruct_0()
    end
    if 0 < GetD(76, 3, 2) then
      instruct_3(76, 3, -2, 0, 0, 0, 0, 2612, 2612, 2612, -2, -2, -2)
      instruct_0()
      instruct_32(0, 10)
      instruct_0()
      instruct_32(3, 3)
      instruct_0()
    end
    if 0 < GetD(76, 4, 2) and r == 1 then
      instruct_3(76, 4, -2, 0, 0, 0, 0, 2612, 2612, 2612, -2, -2, -2)
      instruct_0()
      instruct_32(28, 10)
      instruct_0()
      instruct_32(174, 500)
      instruct_0()
      instruct_37(-1)
      instruct_0()
    end
    if 0 < GetD(76, 6, 2) then
      instruct_3(76, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
      instruct_32(210, 10)
      instruct_0()
    end
    if 0 < GetD(78, 1, 2) then
      instruct_32(210, 10)
      instruct_0()
      instruct_3(78, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
    end
    if 0 < GetD(78, 2, 2) then
      instruct_32(210, 10)
      instruct_0()
      instruct_3(78, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
    end
    if 0 < GetD(92, 17, 2) then
      instruct_3(92, 17, 1, 0, 0, 0, 0, 2608, 2608, 2608, -2, -2, -2)
      instruct_0()
      instruct_32(194, 1)
      instruct_0()
    end
    if 0 < GetD(94, 12, 2) then
      instruct_32(210, 10)
      instruct_0()
      instruct_3(94, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
    end
    if 0 < GetD(94, 13, 2) then
      instruct_32(210, 10)
      instruct_0()
      instruct_3(94, 13, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
    end
    if 0 < GetD(95, 15, 2) then
      instruct_3(95, 15, 1, 0, 0, 0, 0, 2608, 2608, 2608, -2, -2, -2)
      instruct_0()
      instruct_32(17, 1)
      instruct_0()
      instruct_32(209, 100)
      instruct_0()
    end
    if 0 < GetD(96, 14, 2) then
      instruct_32(210, 10)
      instruct_0()
      instruct_3(96, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
    end
    if 0 < GetD(97, 1, 2) then
      instruct_3(97, 1, 1, 0, 0, 0, 0, 3500, 3500, 3500, -2, -2, -2)
      instruct_0()
      instruct_32(141, 1)
      instruct_0()
    end
    if 0 < GetD(98, 9, 2) then
      instruct_3(98, 9, 1, 0, 0, 0, 0, 2612, 2612, 2612, -2, -2, -2)
      instruct_0()
      instruct_32(196, 1)
      instruct_0()
    end
    if 0 < GetD(98, 10, 2) then
      instruct_3(98, 10, -2, 0, 0, 0, 0, 2612, 2612, 2612, -2, -2, -2)
      instruct_0()
      instruct_32(0, 10)
      instruct_0()
      instruct_32(3, 3)
      instruct_0()
    end
    if 0 < GetD(98, 11, 2) then
      instruct_3(98, 11, 0, 0, 0, 0, 0, 2608, 2608, 2608, -2, -2, -2)
      instruct_0()
      instruct_32(14, 2)
      instruct_0()
    end
    if 0 < GetD(102, 10, 2) then
      instruct_32(0, 10)
      instruct_0()
      instruct_3(102, 10, 0, 0, 0, 0, 0, 2468, 2468, 2468, -2, -2, -2)
    end
    if 0 < GetD(103, 10, 2) then
      instruct_3(103, 10, 1, 0, 0, 0, 0, 6698, 6698, 6698, -2, -2, -2)
      instruct_0()
      instruct_32(212, 1)
      instruct_0()
    end
    say("祝你好运！", picid, 1, "开局助手")
    instruct_3(-2, -2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
  end
end
function JYMsgBox(title, str, button, num, headid, isEsc)
  local strArray = {}
  local xnum, ynum, width, height
  local picw, pich = 0, 0
  local x1, x2, y1, y2
  local size = CC.DefaultFont
  local xarr = {}
  local between = function(x)
    for i = 1, num do
      if x > xarr[i] and x < xarr[i] + string.len(button[i]) * size / 2 then
        return i
      end
    end
    return 0
  end
  if headid ~= nil then
    headid = headid * 2
    picw, pich = lib.GetPNGXY(1, headid)
    picw = picw / CC.Zoom + CC.MenuBorderPixel * 2
    pich = pich / CC.Zoom + CC.MenuBorderPixel * 2
    picw = 90 * CC.Zoom + CC.MenuBorderPixel * 2
    pich = 90 * CC.Zoom + CC.MenuBorderPixel * 2
  end
  ynum, strArray = Split(str, "*")
  xnum = 0
  for i = 1, ynum do
    local len = string.len(strArray[i])
    if xnum < len then
      xnum = len
    end
  end
  if xnum < 12 then
    xnum = 12
  end
  width = CC.MenuBorderPixel * 2 + math.modf(size * xnum / 2) + picw
  height = CC.MenuBorderPixel * 2 + (size + CC.MenuBorderPixel) * ynum
  if pich > height then
    height = pich
  end
  y2 = height
  height = height + CC.MenuBorderPixel * 2 + size * 2
  x1 = (CC.ScreenW - width) / 2 + CC.MenuBorderPixel
  x2 = x1 + picw
  y1 = (CC.ScreenH - height) / 2 + CC.MenuBorderPixel + 2 + size * 0.7
  y2 = y2 + y1 - 5
  local select = 1
  Cls()
  DrawBoxTitle(width, height, title, C_GOLD)
  if headid ~= nil then
    local headw, headh = lib.GetPNGXY(1, headid)
    local hdmax = 0
    if headw > hdmax then
      hdmax = headw
    end
    if headh > hdmax then
      hdmax = headh
    end
    local zoom = math.modf(70 * CC.Zoom / hdmax * 100 * (CONFIG.Zoom / 100))
    lib.LoadPicture(CC.HeadPath .. headid / 2 .. ".png", x1 + size * 0.7, y1, zoom)
  end
  for i = 1, ynum do
    DrawString(x2, y1 + (CC.MenuBorderPixel + size) * (i - 1), strArray[i], C_WHITE, size)
  end
  local surid = lib.SaveSur((CC.ScreenW - width) / 2 - 4, (CC.ScreenH - height) / 2 - size, (CC.ScreenW + width) / 2 + 4, (CC.ScreenH + height) / 2 + 4)
  while true do
    Cls()
    lib.LoadSur(surid, (CC.ScreenW - width) / 2 - 4, (CC.ScreenH - height) / 2 - size)
    for i = 1, num do
      local color, bjcolor
      if i == select then
        color = M_Yellow
        bjcolor = M_DarkOliveGreen
      else
        color = M_DarkOliveGreen
      end
      xarr[i] = (CC.ScreenW - width) / 2 + width * i / (num + 1) - string.len(button[i]) * size / 4
      DrawStrBox2(xarr[i], y2, button[i], color, size, bjcolor)
    end
    ShowScreen()
    local key, ktype, mx, my = WaitKey(1)
    if key == VK_ESCAPE or ktype == 4 then
      if isEsc ~= nil and isEsc == 1 then
        select = -2
        break
      end
    elseif key == VK_LEFT or ktype == 6 then
      select = select - 1
      if select < 1 then
        select = num
      end
    elseif key == VK_RIGHT or ktype == 7 then
      select = select + 1
      if num < select then
        select = 1
      end
    else
      if key == VK_RETURN or key == VK_SPACE or ktype == 5 then
        break
      end
      if (ktype == 2 or ktype == 3) and x1 <= mx and mx <= x1 + width and y2 <= my and my <= y2 + 2 * CC.MenuBorderPixel + size then
        select = between(mx)
        if 0 < select and num >= select and ktype == 3 then
          break
        end
      end
    end
  end
  select = limitX(select, -2, num)
  lib.FreeSur(surid)
  Cls()
  return select
end
function DrawBoxTitle(width, height, str, color)
  local s = 4
  local x1, y1, x2, y2, tx1, tx2
  local fontsize = s + CC.DefaultFont
  local len = string.len(str) * fontsize / 2
  x1 = (CC.ScreenW - width) / 2
  x2 = (CC.ScreenW + width) / 2
  y1 = (CC.ScreenH - height) / 2
  y2 = (CC.ScreenH + height) / 2
  tx1 = (CC.ScreenW - len) / 2
  tx2 = (CC.ScreenW + len) / 2
  lib.Background(x1, y1 + s, x1 + s, y2 - s, 128)
  lib.Background(x1 + s, y1, x2 - s, y2, 128)
  lib.Background(x2 - s, y1 + s, x2, y2 - s, 128)
  lib.Background(tx1, y1 - fontsize / 2 + s, tx2, y1, 128)
  lib.Background(tx1 + s, y1 - fontsize / 2, tx2 - s, y1 - fontsize / 2 + s, 128)
  local r, g, b = GetRGB(color)
  DrawBoxTitle_sub(x1 + 1, y1 + 1, x2, y2, tx1 + 1, y1 - fontsize / 2 + 1, tx2, y1 + fontsize / 2, RGB(math.modf(r / 2), math.modf(g / 2), math.modf(b / 2)))
  DrawBoxTitle_sub(x1, y1, x2 - 1, y2 - 1, tx1, y1 - fontsize / 2, tx2 - 1, y1 + fontsize / 2 - 1, color)
  DrawString(tx1 + 2 * s, y1 - (fontsize - s) / 2, str, color, CC.DefaultFont)
end
function DrawBoxTitle_sub(x1, y1, x2, y2, tx1, ty1, tx2, ty2, color)
  local s = 4
  lib.DrawRect(x1 + s, y1, tx1, y1, color)
  lib.DrawRect(tx2, y1, x2 - s, y1, color)
  lib.DrawRect(x2 - s, y1, x2 - s, y1 + s, color)
  lib.DrawRect(x2 - s, y1 + s, x2, y1 + s, color)
  lib.DrawRect(x2, y1 + s, x2, y2 - s, color)
  lib.DrawRect(x2, y2 - s, x2 - s, y2 - s, color)
  lib.DrawRect(x2 - s, y2 - s, x2 - s, y2, color)
  lib.DrawRect(x2 - s, y2, x1 + s, y2, color)
  lib.DrawRect(x1 + s, y2, x1 + s, y2 - s, color)
  lib.DrawRect(x1 + s, y2 - s, x1, y2 - s, color)
  lib.DrawRect(x1, y2 - s, x1, y1 + s, color)
  lib.DrawRect(x1, y1 + s, x1 + s, y1 + s, color)
  lib.DrawRect(x1 + s, y1 + s, x1 + s, y1, color)
  DrawBox_1(tx1, ty1, tx2, ty2, color)
end
function DrawStrBox2(x, y, str, color, size, bjcolor)
  local strarray = {}
  local num, maxlen
  maxlen = 0
  num, strarray = Split(str, "*")
  for i = 1, num do
    local len = string.len(strarray[i])
    if maxlen < len then
      maxlen = len
    end
  end
  local w = size * maxlen / 2 + 2 * CC.MenuBorderPixel
  local h = 2 * CC.MenuBorderPixel + size * num
  if x == -1 then
    x = (CC.ScreenW - size / 2 * maxlen - 2 * CC.MenuBorderPixel) / 2
  end
  if y == -1 then
    y = (CC.ScreenH - size * num - 2 * CC.MenuBorderPixel) / 2
  end
  DrawBox2(x, y, x + w - 1, y + h - 1, C_WHITE, bjcolor)
  for i = 1, num do
    DrawString(x + CC.MenuBorderPixel, y + CC.MenuBorderPixel + size * (i - 1), strarray[i], color, size)
  end
end
function DrawBox2(x1, y1, x2, y2, color, bjcolor)
  local s = 4
  bjcolor = bjcolor or 0
  if 0 <= bjcolor then
    lib.Background(x1, y1 + s, x1 + s, y2 - s, 128, bjcolor)
    lib.Background(x1 + s, y1, x2 - s, y2, 128, bjcolor)
    lib.Background(x2 - s, y1 + s, x2, y2 - s, 128, bjcolor)
  end
  if 0 <= color then
    local r, g, b = GetRGB(color)
    DrawBox_2(x1 + 1, y1, x2, y2, RGB(math.modf(r / 2), math.modf(g / 2), math.modf(b / 2)))
    DrawBox_2(x1, y1, x2 - 1, y2 - 1, color)
  end
end
function DrawBox_2(x1, y1, x2, y2, color)
  local s = 4
  lib.DrawRect(x1 + s, y1, x2 - s, y1, color)
  lib.DrawRect(x2 - s, y1, x2 - s, y1 + s, color)
  lib.DrawRect(x2 - s, y1 + s, x2, y1 + s, color)
  lib.DrawRect(x2, y1 + s, x2, y2 - s, color)
  lib.DrawRect(x2, y2 - s, x2 - s, y2 - s, color)
  lib.DrawRect(x2 - s, y2 - s, x2 - s, y2, color)
  lib.DrawRect(x2 - s, y2, x1 + s, y2, color)
  lib.DrawRect(x1 + s, y2, x1 + s, y2 - s, color)
  lib.DrawRect(x1 + s, y2 - s, x1, y2 - s, color)
  lib.DrawRect(x1, y2 - s, x1, y1 + s, color)
  lib.DrawRect(x1, y1 + s, x1 + s, y1 + s, color)
  lib.DrawRect(x1 + s, y1 + s, x1 + s, y1, color)
end
function say(s, pid, flag, name)
  local picw = 130
  local pich = 130
  local talkxnum = 18
  local talkynum = 3
  local dx = 2
  local dy = 2
  local boxpicw = picw + 10
  local boxpich = pich + 10
  local boxtalkw = talkxnum * CC.DefaultFont + 10
  local boxtalkh = boxpich - 27
  local headid = pid
  pid = pid or 0
  if (headid == 0 or headid == nil) and (name == nil or name == JY.Person[0]["姓名"]) then
    headid = 280 + GetS(4, 5, 5, 5)
  end
  if flag == nil then
    if pid == 0 then
      flag = 1
    else
      flag = 0
    end
  end
  name = name or JY.Person[pid]["姓名"]
  local talkBorder = (pich - talkynum * CC.DefaultFont) / (talkynum + 1)
  local xy = {
    [0] = {
      headx = dx,
      heady = dy,
      talkx = dx + boxpicw + 2,
      talky = dy + 27,
      namex = dx + boxpicw + 2,
      namey = dy,
      showhead = 1
    },
    {
      headx = CC.ScreenW - 1 - dx - boxpicw,
      heady = CC.ScreenH - dy - boxpich,
      talkx = CC.ScreenW - 1 - dx - boxpicw - boxtalkw - 2,
      talky = CC.ScreenH - dy - boxpich + 27,
      namex = CC.ScreenW - 1 - dx - boxpicw - 96,
      namey = CC.ScreenH - dy - boxpich,
      showhead = 1
    },
    {
      headx = dx,
      heady = dy,
      talkx = dx + boxpicw - 43,
      talky = dy + 27,
      namex = dx + boxpicw + 2,
      namey = dy,
      showhead = 0
    },
    {
      headx = CC.ScreenW - 1 - dx - boxpicw,
      heady = CC.ScreenH - dy - boxpich,
      talkx = CC.ScreenW - 1 - dx - boxpicw - boxtalkw - 2,
      talky = CC.ScreenH - dy - boxpich + 27,
      namex = CC.ScreenW - 1 - dx - boxpicw - 96,
      namey = CC.ScreenH - dy - boxpich,
      showhead = 1
    },
    {
      headx = CC.ScreenW - 1 - dx - boxpicw,
      heady = dy,
      talkx = CC.ScreenW - 1 - dx - boxpicw - boxtalkw - 2,
      talky = dy + 27,
      namex = CC.ScreenW - 1 - dx - boxpicw - 96,
      namey = dy,
      showhead = 1
    },
    {
      headx = dx,
      heady = CC.ScreenH - dy - boxpich,
      talkx = dx + boxpicw + 2,
      talky = CC.ScreenH - dy - boxpich + 27,
      namex = dx + boxpicw + 2,
      namey = CC.ScreenH - dy - boxpich,
      showhead = 1
    }
  }
  if flag < 0 or 5 < flag then
    flag = 0
  end
  if xy[flag].showhead == 0 then
    headid = -1
  end
  if CONFIG.KeyRepeat == 0 then
    lib.EnableKeyRepeat(0, CONFIG.KeyRepeatInterval)
  end
  local readstr = function(str)
    local T1 = {
      "０",
      "１",
      "２",
      "３",
      "４",
      "５",
      "６",
      "７",
      "８",
      "９"
    }
    local T2 = {
      {
        "Ｒ",
        C_RED
      },
      {
        "Ｇ",
        C_GOLD
      },
      {
        "Ｂ",
        C_BLACK
      },
      {
        "Ｗ",
        C_WHITE
      },
      {
        "Ｏ",
        C_ORANGE
      }
    }
    local T3 = {
      {
        "Ｈ",
        CC.FontNameSong
      },
      {
        "Ｓ",
        CC.FontNameHei
      },
      {
        "Ｆ",
        CC.FontName
      }
    }
    for i = 0, 9 do
      if T1[i + 1] == str then
        return 1, i * 50
      end
    end
    for i = 1, 5 do
      if T2[i][1] == str then
        return 2, T2[i][2]
      end
    end
    for i = 1, 3 do
      if T3[i][1] == str then
        return 3, T3[i][2]
      end
    end
    return 0
  end
  local mydelay = function(t)
    if t <= 0 then
      return
    end
    lib.ShowSurface(0)
    lib.Delay(t)
  end
  local page, cy, cx = 0, 0, 0
  local color, t, font = C_WHITE, 0, CC.FontName
  while 1 <= string.len(s) do
    if page == 0 then
      Cls()
      if 0 <= headid then
        DrawBox(xy[flag].headx, xy[flag].heady, xy[flag].headx + boxpicw, xy[flag].heady + boxpich, C_WHITE)
        DrawBox(xy[flag].namex, xy[flag].namey, xy[flag].namex + 96, xy[flag].namey + 24, C_WHITE)
        MyDrawString(xy[flag].namex, xy[flag].namex + 96, xy[flag].namey + 1, name, C_ORANGE, 21)
        local w, h = lib.GetPNGXY(1, headid * 2)
        local x = (picw - w) / 2
        local y = (pich - h) / 2
        lib.LoadPNG(1, headid * 2, xy[flag].headx + 5 + x, xy[flag].heady + 5 + y, 1)
      end
      DrawBox(xy[flag].talkx, xy[flag].talky, xy[flag].talkx + boxtalkw, xy[flag].talky + boxtalkh, C_WHITE)
      page = 1
    end
    local str
    str = string.sub(s, 1, 1)
    if str == "*" then
      str = "Ｈ"
      s = string.sub(s, 2, -1)
    elseif string.byte(s, 1, 1) > 127 then
      str = string.sub(s, 1, 2)
      s = string.sub(s, 3, -1)
    else
      str = string.sub(s, 1, 1)
      s = string.sub(s, 2, -1)
    end
    if str == "Ｈ" then
      cx = 0
      cy = cy + 1
      if cy == 3 then
        cy = 0
        page = 0
      end
    elseif str == "Ｐ" then
      cx = 0
      cy = 0
      page = 0
    elseif str == "ｐ" then
      ShowScreen()
      WaitKey()
      lib.Delay(100)
    elseif str == "Ｎ" then
      s = JY.Person[pid]["姓名"] .. s
    elseif str == "ｎ" then
      s = JY.Person[0]["姓名"] .. s
    else
      local kz1, kz2 = readstr(str)
      if kz1 == 1 then
        t = kz2
      elseif kz1 == 2 then
        color = kz2
      elseif kz1 == 3 then
        font = kz2
      else
        lib.DrawStr(xy[flag].talkx + CC.DefaultFont * cx + 5, xy[flag].talky + (CC.DefaultFont + talkBorder) * cy + talkBorder - 8, str, color, CC.DefaultFont, font, 0, 0, 255)
        mydelay(t)
        cx = cx + string.len(str) / 2
        if cx == talkxnum then
          cx = 0
          cy = cy + 1
          if cy == talkynum then
            cy = 0
            page = 0
          end
        end
      end
    end
    if page == 0 or 1 > string.len(s) then
      ShowScreen()
      WaitKey()
      lib.Delay(100)
    end
  end
  if CONFIG.KeyRepeat == 0 then
    lib.EnableKeyRepeat(CONFIG.KeyRepeatDelay, CONFIG.KeyRepeatInterval)
  end
  Cls()
end
function MyDrawString(x1, x2, y, str, color, size)
  local len = math.modf(string.len(str) * size / 4)
  local x = math.modf((x1 + x2) / 2) - len
  DrawString(x, y, str, color, size)
end
function JubenBugFix()
  local j = 1
  for i = 0, 10000 do
    if JY.Thing[i] == nil then
      JY.AQNUM = j - 1
      break
    elseif JY.Thing[i]["类型"] == 4 then
      JY.AQ[j] = i
      j = j + 1
    end
  end
  if CC.BUGFIX == 1 then
    if CC.BUGYB == 1 then
      JY.Scene[5]["名称"] = "闯王山洞"
      JY.Scene[7]["名称"] = "神雕山洞"
      JY.Scene[10]["名称"] = "蜘蛛山洞"
      JY.Scene[41]["名称"] = "白骨山洞"
      JY.Scene[65]["名称"] = "唐诗山洞"
      JY.Scene[66]["名称"] = "冰蚕山洞"
      JY.Scene[67]["名称"] = "昆仑山洞"
      JY.Scene[79]["名称"] = "鸳鸯山洞"
    end
    if CC.BUGCL == 1 then
      JY.YXND = JY.Wugong[30]["未知3"]
      JY.Thing[88]["名称"] = "须弥山神掌"
      JY.Thing[88]["名称2"] = "须弥山神掌"
      JY.Thing[89]["名称"] = "七伤拳谱"
      JY.Thing[89]["名称2"] = "七伤拳谱"
      JY.Thing[110]["名称2"] = "五毒秘传"
      JY.Thing[178]["名称"] = "大剪刀刀法"
      JY.Thing[181]["名称2"] = "棋盘招式"
      JY.Thing[196]["物品说明"] = "大燕传国玉玺"
      JY.Thing[197]["物品说明"] = "大燕皇帝世袭图表"
      JY.Thing[212]["名称2"] = "广陵散琴曲"
      for i = 311, 319 do
        JY.Person[i]["头像代号"] = 214
      end
      JY.Thing[139]["需耍刀技巧"] = 30
      JY.Thing[139]["需经验"] = 35
      JY.Wugong[63]["消耗内力点数"] = 5
      local wggjl = {
        30,
        60,
        90,
        120,
        150,
        190,
        230,
        260,
        300,
        350
      }
      local wgfw = {
        1,
        2,
        3,
        4,
        5,
        5,
        5,
        5,
        5,
        6
      }
      for i = 1, 10 do
        JY.Wugong[63]["攻击力" .. i] = wggjl[i]
        JY.Wugong[63]["移动范围" .. i] = wgfw[i]
      end
      if 0 < JY.Person[29]["携带物品1"] then
        JY.Person[29]["携带物品数量1"] = 1
      end
      JY.Person[114]["武学常识"] = 100
      JY.Person[114]["攻击力"] = 350
      JY.Person[114]["防御力"] = 350
      JY.Person[141]["攻击力"] = 50
      JY.Person[141]["轻功"] = 30
      if JY.YXND == 1 then
        JY.Person[114]["武学常识"] = 100
        JY.Person[114]["攻击力"] = 400
        JY.Person[114]["防御力"] = 400
      elseif JY.YXND == 2 then
        JY.Person[114]["武学常识"] = 100
        JY.Person[114]["攻击力"] = 400
        JY.Person[114]["防御力"] = 400
      end
      JY.Person[90]["外号"] = "毒貂女"
      if GetD(84, 8, 2) == 18 then
        SetD(84, 8, 2, 0)
        SetD(84, 8, 3, 18)
      end
      JY.Thing[227]["物品说明"] = "（44，33）"
      JY.Scene[5]["名称"] = "闯王山洞"
      JY.Scene[7]["名称"] = "神雕山洞"
      JY.Scene[10]["名称"] = "蜘蛛山洞"
      JY.Scene[41]["名称"] = "白骨山洞"
      JY.Scene[65]["名称"] = "唐诗山洞"
      JY.Scene[79]["名称"] = "鸳鸯山洞"
      JY.Scene[84]["名称"] = "闯王山洞"
      JY.Scene[85]["名称"] = "闯王山洞"
      JY.Thing[235]["仅修炼人物"] = -1
      if instruct_18(219) and instruct_18(147) then
        instruct_3(28, 12, -2, -2, -2, 303, -2, -2, -2, -2, -2, -2, -2)
      end
      instruct_3(1, 2, -2, -2, -2, -2, -2, 5404, 5404, 5404, -2, -2, -2)
      instruct_3(102, 13, -2, -2, -2, -2, -2, -2, -2, -2, -2, 20, 25)
      instruct_3(0, 0, -2, -2, 0, 0, 0, -2, -2, -2, -2, -2, -2)
      JY.Thing[190]["需材料"] = 209
      ZCKG()
      if instruct_18(74) == false and CC.ZCOPEN == 1 then
        instruct_3(13, 6, -2, -2, 0, 0, 1090, -2, -2, -2, -2, 18, 28)
        instruct_3(13, 7, -2, -2, 0, 0, 1090, -2, -2, -2, -2, 18, 29)
        instruct_3(13, 4, 0, 0, 0, 0, 0, 0, 0, 0, -2, -2, -2)
        instruct_3(13, 3, 0, 0, 0, 0, 0, 0, 0, 0, -2, -2, -2)
        instruct_3(13, 2, 0, 0, 0, 0, 0, 0, 0, 0, -2, -2, -2)
      end
      JY.Selpstr = {}
      if CC.JS == 1 then
        if JY.Person[0]["姓名"] ~= "szlzw" then
          if JY.Person[0]["外号"] == "拳霸" and JY.Wugong[30]["未知1"] == 1 then
            JY.Selpstr[1] = {"拳掌功夫", 1}
            JY.Selpstr[2] = {"攻击力", -1}
            JY.Selpstr[3] = {"防御力", 2}
            JY.Selpstr[4] = {"轻功", 2}
            DrawStrBoxWaitKey("拳霸→破防伤害开启", C_WHITE, CC.DefaultFont)
          elseif JY.Person[0]["外号"] == "剑魔" and JY.Wugong[30]["未知1"] == 2 then
            JY.Selpstr[1] = {"御剑能力", 1}
            JY.Selpstr[2] = {"攻击力", 2}
            JY.Selpstr[3] = {"防御力", -2}
            DrawStrBoxWaitKey("剑魔→嗜血伤害开启", C_WHITE, CC.DefaultFont)
          elseif JY.Person[0]["外号"] == "刀痴" and JY.Wugong[30]["未知1"] == 3 then
            JY.Selpstr[1] = {"耍刀技巧", 1}
            JY.Selpstr[2] = {"攻击力", -1}
            JY.Selpstr[3] = {"防御力", 2}
            JY.Selpstr[4] = {"轻功", 2}
            DrawStrBoxWaitKey("刀痴→一击必杀开启", C_WHITE, CC.DefaultFont)
          elseif JY.Person[0]["外号"] == "特狂" and JY.Wugong[30]["未知1"] == 4 then
            JY.Selpstr[1] = {"特殊兵器", 1}
            JY.Selpstr[2] = {"防御力", 4}
            JY.Selpstr[3] = {"轻功", -2}
            DrawStrBoxWaitKey("特狂→暴击伤害开启", C_WHITE, CC.DefaultFont)
          elseif JY.Person[0]["外号"] == "神助" and JY.Wugong[30]["未知1"] == 5 then
            local lev = JY.Person[0]["等级"]
            JY.Selpstr[1] = {"攻击力", 3}
            JY.Selpstr[2] = {"防御力", -2}
            JY.Selpstr[3] = {"轻功", -2}
            JY.Selpstr[4] = {"内力最大值", 50}
            DrawStrBoxWaitKey("神助→天神护体开启", C_WHITE, CC.DefaultFont)
          elseif JY.Person[0]["外号"] == "巫妖" and JY.Wugong[30]["未知1"] == 6 then
            JY.Selpstr[1] = {"医疗能力", 3}
            JY.Selpstr[2] = {"用毒能力", 1}
            JY.Selpstr[3] = {"抗毒能力", 2}
            JY.Selpstr[4] = {"攻击力", -1}
            JY.Selpstr[5] = {"轻功", 2}
            DrawStrBoxWaitKey("巫妖→重生技能开启", C_WHITE, CC.DefaultFont)
          elseif JY.Person[0]["外号"] == "毒王" and JY.Wugong[30]["未知1"] == 7 then
            JY.Selpstr[1] = {"用毒能力", 3}
            JY.Selpstr[2] = {"抗毒能力", 3}
            JY.Selpstr[3] = {"攻击力", -1}
            JY.Selpstr[4] = {"防御力", 2}
            DrawStrBoxWaitKey("毒王→淬毒伤害开启", C_WHITE, CC.DefaultFont)
          elseif JY.Person[0]["外号"] == "幻影" and JY.Wugong[30]["未知1"] == 9 then
            JY.Selpstr[1] = {"攻击力", -1}
            JY.Selpstr[2] = {"防御力", 2}
            JY.Selpstr[3] = {"轻功", 2}
            DrawStrBoxWaitKey("幻影→影杀技能开启", C_WHITE, CC.DefaultFont)
          else
            DrawStrBoxWaitKey("特殊角色→开启失败", C_RED, CC.DefaultFont)
            CC.JS = 0
          end
        elseif JY.Person[0]["姓名"] == "szlzw" and JY.Wugong[30]["未知1"] == 8 then
          if 0 < JY.YXND then
            if JY.YXND == 0 then
              DrawStrBoxWaitKey("变身型态→开启", C_WHITE, CC.DefaultFont)
            elseif JY.YXND == 1 and JY.Person[0]["等级"] > 9 then
              DrawStrBoxWaitKey("变身型态→开启", C_WHITE, CC.DefaultFont)
            elseif JY.YXND == 2 and JY.Person[0]["等级"] > 19 then
              DrawStrBoxWaitKey("变身型态→开启", C_WHITE, CC.DefaultFont)
            end
          end
          if JY.Wugong[30]["未知2"] == 1 then
            JY.Person[0]["外号"] = "拳霸"
            DrawStrBoxWaitKey("变身拳霸→破防伤害开启", C_WHITE, CC.DefaultFont)
          elseif JY.Wugong[30]["未知2"] == 2 then
            JY.Person[0]["外号"] = "剑魔"
            DrawStrBoxWaitKey("变身剑魔→嗜血伤害开启", C_WHITE, CC.DefaultFont)
          elseif JY.Wugong[30]["未知2"] == 3 then
            JY.Person[0]["外号"] = "刀痴"
            DrawStrBoxWaitKey("变身刀痴→一击必杀开启", C_WHITE, CC.DefaultFont)
          elseif JY.Wugong[30]["未知2"] == 4 then
            JY.Person[0]["外号"] = "特狂"
            DrawStrBoxWaitKey("变身特狂→暴击伤害开启", C_WHITE, CC.DefaultFont)
          elseif JY.Wugong[30]["未知2"] == 5 then
            JY.Person[0]["外号"] = "神助"
            DrawStrBoxWaitKey("变身神助→天神护体开启", C_WHITE, CC.DefaultFont)
          elseif JY.Wugong[30]["未知2"] == 6 then
            JY.Person[0]["外号"] = "巫妖"
            DrawStrBoxWaitKey("变身巫妖→重生技能开启", C_WHITE, CC.DefaultFont)
          elseif JY.Wugong[30]["未知2"] == 7 then
            JY.Person[0]["外号"] = "毒王"
            DrawStrBoxWaitKey("变身毒王→淬毒伤害开启", C_WHITE, CC.DefaultFont)
          elseif JY.Wugong[30]["未知2"] == 9 then
            JY.Person[0]["外号"] = "幻影"
            DrawStrBoxWaitKey("变身幻影→影杀技能开启", C_WHITE, CC.DefaultFont)
          elseif JY.Person[0]["外号"] ~= "超神" then
            DrawStrBoxWaitKey("特殊角色→开启失败", C_RED, CC.DefaultFont)
            CC.JS = 0
          end
        end
      end
    end
    if CC.BUGZZ == 1 then
      JY.Scene[80]["外景入口X1"] = 247
      JY.Scene[80]["外景入口Y1"] = 234
      JY.Scene[80]["外景入口X2"] = 247
      JY.Scene[80]["外景入口Y2"] = 234
      JY.Scene[3]["外景入口X1"] = 78
      JY.Scene[3]["外景入口Y1"] = 138
      JY.Scene[3]["外景入口X2"] = 78
      JY.Scene[3]["外景入口Y2"] = 138
      instruct_3(69, 9, -2, -2, -2, -2, -2, 5106, 5116, 5106, -2, -2, -2)
      if instruct_18(236) == false then
        instruct_3(22, 8, -2, -2, 1215, -2, -2, -2, -2, -2, -2, -2, -2)
      else
        instruct_3(22, 8, -2, -2, 0, -2, -2, -2, -2, -2, -2, -2, -2)
      end
      JY.Thing[197]["类型"] = 2
      JY.Thing[37]["类型"] = 4
      JY.Thing[33]["加防御力"] = 2
      if instruct_18(46) == false then
        JY.Person[2]["携带物品1"] = 46
        JY.Person[2]["携带物品数量1"] = 1
      end
      JY.Thing[28]["需要物品数量1"] = 1
      JY.Thing[28]["练出物品需经验"] = 1
      JY.Thing[49]["练出物品需经验"] = 10
      if GetD(79, 2, 4) == 1145 and CONFIG.ZCWG ~= nil then
        JY.Wugong[1]["名称"] = CONFIG.ZCWG
      end
      JY.Wugong[1]["名称"] = CONFIG.ZCWG
    end
    if CC.BUGPTT == 1 then
      JY.Scene[86]["外景入口X1"] = 349
      JY.Scene[86]["外景入口Y1"] = 339
      JY.Scene[86]["外景入口X2"] = 349
      JY.Scene[86]["外景入口Y2"] = 339
      JY.Scene[87]["外景入口X1"] = 270
      JY.Scene[87]["外景入口Y1"] = 426
      JY.Scene[87]["外景入口X2"] = 270
      JY.Scene[87]["外景入口Y2"] = 426
      JY.Scene[89]["外景入口X1"] = 57
      JY.Scene[89]["外景入口Y1"] = 224
      JY.Scene[89]["外景入口X2"] = 57
      JY.Scene[89]["外景入口Y2"] = 224
    end
    if CC.BUGTSJ == 1 then
      JY.Scene[127]["外景入口X1"] = 330
      JY.Scene[127]["外景入口Y1"] = 196
      JY.Scene[127]["外景入口X2"] = 330
      JY.Scene[127]["外景入口Y2"] = 196
      JY.Scene[120]["外景入口X1"] = 349
      JY.Scene[120]["外景入口Y1"] = 295
      JY.Scene[120]["外景入口X2"] = 349
      JY.Scene[120]["外景入口Y2"] = 295
      JY.Scene[108]["外景入口X1"] = 67
      JY.Scene[108]["外景入口Y1"] = 89
      JY.Scene[108]["外景入口X2"] = 67
      JY.Scene[108]["外景入口Y2"] = 89
      JY.Scene[123]["出口X1"] = 22
      JY.Scene[123]["出口Y1"] = 62
      JY.Scene[123]["出口X2"] = 23
      JY.Scene[123]["出口Y2"] = 62
      JY.Scene[128]["外景入口X1"] = 0
      JY.Scene[128]["外景入口Y1"] = 0
      JY.Scene[128]["外景入口X2"] = 0
      JY.Scene[128]["外景入口Y2"] = 0
      JY.Scene[128]["出口X1"] = 0
      JY.Scene[128]["出口Y1"] = 0
      JY.Scene[128]["出口X2"] = 0
      JY.Scene[128]["出口Y2"] = 0
      JY.Scene[128]["出口X3"] = 0
      JY.Scene[128]["出口Y3"] = 0
      JY.Scene[128]["跳转口X1"] = 62
      JY.Scene[128]["跳转口Y1"] = 61
      JY.Scene[128]["跳转口X2"] = 61
      JY.Scene[128]["跳转口Y2"] = 61
      JY.Scene[126]["入口X"] = 61
      JY.Scene[126]["入口Y"] = 31
      JY.Scene[126]["出口X1"] = 62
      JY.Scene[126]["出口Y1"] = 31
      JY.Scene[126]["出口X2"] = 62
      JY.Scene[126]["出口Y2"] = 31
      JY.Scene[46]["外景入口X1"] = 192
      JY.Scene[46]["外景入口Y1"] = 292
      JY.Scene[46]["外景入口X2"] = 192
      JY.Scene[46]["外景入口Y2"] = 292
    end
    if CC.BUG1028 == 1 then
      JY.Thing[88]["名称"] = "须弥山神掌"
      JY.Thing[88]["名称2"] = "须弥山神掌"
      JY.Thing[89]["名称"] = "七伤拳谱"
      JY.Thing[89]["名称2"] = "七伤拳谱"
      JY.Thing[110]["名称2"] = "五毒秘传"
      JY.Thing[178]["名称"] = "大剪刀刀法"
      JY.Thing[181]["名称2"] = "棋盘招式"
      JY.Thing[196]["物品说明"] = "大燕传国玉玺"
      JY.Thing[197]["物品说明"] = "大燕皇帝世袭图表"
      JY.Thing[212]["名称2"] = "广陵散琴曲"
      JY.Scene[5]["名称"] = "闯王山洞"
      JY.Scene[7]["名称"] = "神雕山洞"
      JY.Scene[10]["名称"] = "蜘蛛山洞"
      JY.Scene[41]["名称"] = "白骨山洞"
      JY.Scene[65]["名称"] = "唐诗山洞"
      JY.Scene[79]["名称"] = "鸳鸯山洞"
      JY.Scene[84]["名称"] = "闯王山洞"
      JY.Scene[85]["名称"] = "闯王山洞"
      JY.Scene[85]["外景入口X1"] = 44
      JY.Scene[85]["外景入口Y1"] = 33
      JY.Scene[85]["外景入口X2"] = 44
      JY.Scene[85]["外景入口Y2"] = 33
      JY.Thing[227]["物品说明"] = "（44，33）"
      if GetD(84, 8, 2) == 18 then
        SetD(84, 8, 2, 0)
        SetD(84, 8, 3, 18)
      end
    end
    if CC.BanBen == 100 and JY.Person[0]["经验"] == 0 then
      JY.Person[35]["攻击力"] = 30
      JY.Person[35]["轻功"] = 30
      JY.Person[35]["防御力"] = 30
      JY.Person[100]["攻击力"] = 30
      JY.Person[100]["轻功"] = 30
      JY.Person[100]["防御力"] = 30
      JY.Person[104]["攻击力"] = 30
      JY.Person[104]["轻功"] = 30
      JY.Person[104]["防御力"] = 30
      JY.Person[105]["攻击力"] = 30
      JY.Person[105]["轻功"] = 30
      JY.Person[105]["防御力"] = 30
    end
  end
  JY.ZBJKSJ = lib.GetTime() + 30000
  xzqbpd = 3
  zdyx = {}
  for i = 1, CC.TeamNum do
    zdyx[i] = {}
    zdyx[i][1] = 0
    zdyx[i][2] = -1
  end
  JY.WGXZWZ = {}
  if CONFIG.SaveTime ~= nil and 120 >= CONFIG.SaveTime and 0 < CONFIG.SaveTime then
    JY.SaveTime = CONFIG.SaveTime
  end
  JY.AtTime = lib.GetTime()
  JY.DiyTime = JY.AtTime + JY.SaveTime * 60000
  local fontsize = CC.NewGameFontSize
  DrawString(CC.ScreenW / 2 - fontsize * 6, CC.ScreenH - fontsize * 2, string.format("当前自动存档间隔为%d分钟", JY.SaveTime), C_RED, CC.NewGameFontSize, 1)
  CC.RUNSTR[CC.NUMBER] = string.format("当前自动存档间隔时间设定为%d分钟 可在“功能加强”->“存档设定”里更改", JY.SaveTime)
  local booknum = 0
  for i = 1, CC.BookNum do
    if instruct_18(CC.BookStart + i - 1) == true then
      booknum = booknum + 1
    end
  end
  JY.Book = booknum
  if booknum == CC.BookNum then
    CC.ExpLevel = 3
    CC.RUNSTR[CC.NUMBER + 1] = "天书已收集完成，当前经验值已大幅度增加，练功狂不容错过！"
  else
    CC.RUNSTR[CC.NUMBER + 1] = string.format("天书已收集%d本，收集完14本天书经验值将大幅度增加，练功狂不容错过！", booknum)
    CC.ExpLevel = 1
  end
  JY.SETPD = 1
  JY.XTKG = CC.XTKG
  JY.TXKG = CC.TXKG
  JY.JZKG = CC.JZKG
  JY.SCKG = CC.SCKG
  JY.DEADKG = CC.DEADKG
  for i = 1, CC.MyThingNum do
    if JY.Base["物品" .. i] ~= -1 then
      if (JY.Thing[JY.Base["物品" .. i]]["类型"] == 1 or JY.Thing[JY.Base["物品" .. i]]["类型"] == 2) and 1 < JY.Base["物品数量" .. i] then
        JY.Base["物品数量" .. i] = 1
      end
    else
      break
    end
  end
  local ndsum = math.modf((CC.YXND[JY.YXNDXZ][3] + CC.YXND[JY.YXNDXZ][4]) / (CC.YXND[JY.YXNDXZ][1] + CC.YXND[JY.YXNDXZ][2]) * 100)
  ShowScreen()
end
function ZCKG()
  if CC.ZCOPEN == 0 then
    instruct_3(70, 65, -2, -2, -1, -2, -2, -2, -2, -2, -2, -2, -2)
    instruct_3(70, 66, -2, -2, -1, -2, -2, -2, -2, -2, -2, -2, -2)
  else
    instruct_3(70, 65, -2, -2, 1089, -2, -2, -2, -2, -2, -2, -2, -2)
    if instruct_18(241) then
      instruct_3(70, 66, -2, -2, 1087, -2, -2, -2, -2, -2, -2, -2, -2)
    else
      instruct_3(70, 66, -2, -2, 1087, -2, -2, -2, -2, -2, -2, -2, -2)
    end
  end
  if CC.ZCOPEN == 1 or instruct_18(237) then
    for i = 1, 5 do
      if 0 < JY.Wugong[114 + i - 1]["未知1"] then
        JY.ZCWGCS = i
      else
        JY.ZCWGCS = i - 1
        break
      end
    end
    JY.Person[589]["头像代号"] = 30
    JY.Person[589]["武学常识"] = 0
    if 0 < JY.ZCWGCS then
      dugong()
    end
  end
end
function TSInstruce()
  local filemenu = {}
  local n = 0
  for i = 1, math.huge do
    if existFile(string.format("%s%d.txt", CONFIG.HelpPath, i)) then
      filemenu[i] = string.format("%s%d.txt", CONFIG.HelpPath, i)
      n = n + 1
    else
      break
    end
  end
  if existFile(CONFIG.CurrentPath .. "update.txt") then
    filemenu[n + 1] = CONFIG.CurrentPath .. "update.txt"
    n = n + 1
  end
  local menu = {}
  local maxlen = 0
  for i = 1, n do
    local file = io.open(filemenu[i], "r")
    local str = file:read("*l")
    if str == nil then
      str = " "
    end
    if maxlen < #str then
      maxlen = #str
    end
    str = string.gsub(str, "\r", "")
    menu[i] = {
      i .. str,
      nil,
      1
    }
    file:close()
  end
  local size = CC.DefaultFont
  local rr = 1
  while true do
    Cls()
    local r = ShowMenu2_new(menu, #menu, 3, 12, size, size, 0, 0, 1, 1, size, C_ORANGE, C_WHITE, nil, rr)
    if 0 < r then
      rr = r
      InstruceTS(r)
    else
      break
    end
  end
  Cls()
end
function TSGL(filename, id)
  Cls()
  local file = io.open(filename, "r")
  local str = {}
  local k = 1
  local ja
  local color = {}
  local ll = 0
  for line in file:lines() do
    str[k] = line
    if str[k] ~= nil then
      str[k] = string.gsub(str[k], "\r", "")
      local i1, j1 = string.find(str[k], "'%x+'", 1)
      if i1 ~= nil then
        local tsnum = tonumber(string.sub(str[k], i1 + 1, j1 - 1))
        if JY.GLTS[id - 1][tsnum] == 1 then
          color[k] = RGB(120, 208, 88)
          str[k] = string.gsub(str[k], "'%x+'", "（完成）", 1)
        else
          color[k] = C_WHITE
          str[k] = string.gsub(str[k], "'%x+'", "", 1)
        end
      end
      str[k] = GenTalkString(str[k], 25)
      k = k + 1
    end
  end
  file:close()
  local size = CC.DefaultFont
  local linenum = 50
  local maxlen = 15
  local w = linenum * size / 2 + size
  local h = maxlen * (size + CC.RowPixel) + 2 * CC.RowPixel
  local bx = (CC.ScreenW - w) / 2
  local by = (CC.ScreenH - h) / 2
  DrawBox(bx, by, bx + w, by + h, C_WHITE)
  for i = 1, k - 1 do
    local slen = string.len(str[i])
    local wz1, wz2 = string.find(str[i], "*")
    local swz1 = {}
    local swz2 = {}
    local s = {}
    for j = 1, 100 do
      if str[i] == nil then
        break
      end
      if swz1[j - 1] == nil then
        swz1[j - 1] = 0
      end
      swz1[j] = string.find(str[i], "*", j + swz1[j - 1])
      if swz1[j] ~= nil then
        s[j] = string.sub(str[i], 1 + swz1[j - 1], swz1[j] - 1)
      elseif swz1[j] == nil then
        if j == 1 then
          s[j] = str[i]
          break
        end
        s[j] = string.sub(str[i], 1 + swz1[j - 1], -1)
        break
      end
    end
    if color[i] == nil then
      color[i] = C_WHITE
    end
    color[1] = C_RED
    for jj = 1, 20 do
      if s[jj] ~= nil and s[jj] ~= "" then
        DrawString(bx + size * 0.5, by + (CC.RowPixel + size) * ll, s[jj], color[i], size)
        ll = ll + 1
        if 14 < ll then
          ShowScreen()
          local keyPress, ktype, mx, my = WaitKey()
          Cls()
          DrawBox(bx, by, bx + w, by + h, C_WHITE)
          ll = 0
        end
      else
        break
      end
    end
  end
  ShowScreen()
  local keyPress, ktype, mx, my = WaitKey()
end
function InstruceTS(id)
  local filename = string.format("%s%d.txt", CONFIG.HelpPath, id)
  if existFile(filename) == false then
    if existFile(string.format(CONFIG.CurrentPath .. "update.txt")) then
      filename = string.format(CONFIG.CurrentPath .. "update.txt")
    else
      return
    end
  end
  TSGL(filename, id)
end
function DrawTxt(filename, id)
  Cls()
  local file = io.open(filename, "r")
  local str = file:read("*a")
  file:close()
  str = string.gsub(str, "\r", "")
  local size = CC.DefaultFont
  local color = C_WHITE
  local linenum = 50
  local maxlen = 14
  local w = linenum * size / 2 + size
  local h = maxlen * (size + CC.RowPixel) + 2 * CC.RowPixel
  local bx = (CC.ScreenW - w) / 2
  local by = (CC.ScreenH - h) / 2
  DrawBox(bx, by, bx + w, by + h, C_WHITE)
  local x = bx + CC.RowPixel
  local y = by + CC.RowPixel
  local surid = lib.SaveSur(0, 0, CC.ScreenW, CC.ScreenH)
  local strcolor = AnalyString(str)
  local l = 0
  local row = 0
  for i, v in pairs(strcolor) do
    while v[1] ~= nil do
      local index = string.find(v[1], "\n")
      if linenum > l + #v[1] and index == nil then
        DrawString(x + l * size / 2, y + row * (size + CC.RowPixel), v[1], v[2] or color, size)
        l = l + #v[1]
        if i == #strcolor then
          for j = 0, l do
            lib.SetClip(x, y, x + (j + 1) * size / 2, y + size + row * (size + CC.RowPixel))
            ShowScreen(1)
          end
          lib.SetClip(0, 0, 0, 0)
        end
        break
      else
        local tmp, pos1, pos2
        if index == nil then
          pos1 = linenum - l
          pos2 = pos1 + 1
        else
          pos1 = index - 1
          pos2 = pos1 + 2
          if pos1 > linenum - l then
            index = nil
            pos1 = linenum - l
            pos2 = pos1 + 1
          end
        end
        if pos1 > #v[1] then
          tmp = v[1]
          v[1] = nil
        else
          tmp = string.sub(v[1], 1, pos1)
          local flag = 0
          for i = 1, pos1 do
            if string.byte(tmp, i) <= 127 then
              flag = flag + 1
            end
          end
          if math.fmod(flag, 2) == 1 and index == nil and 127 < string.byte(tmp, -1) then
            tmp = string.sub(v[1], 1, pos1 - 1)
            pos2 = pos2 - 1
          end
          v[1] = string.sub(v[1], pos2)
        end
        DrawString(x + l * size / 2, y + row * (size + CC.RowPixel), tmp, v[2] or color, size)
        l = l + #tmp
        for j = 0, l do
          lib.SetClip(x, y, x + j * size / 2, y + size + row * (size + CC.RowPixel))
          ShowScreen(1)
        end
        row = row + 1
        l = 0
      end
      lib.SetClip(0, 0, 0, 0)
      if row == maxlen then
        local keyPress, ktype, mx, my = WaitKey()
        if keyPress == VK_ESCAPE or ktype == 4 then
          break
        end
        row = 0
        Cls()
        lib.LoadSur(surid, 0, 0)
      end
      local i1, j1 = string.find(v[1], "'%x+'", 1)
      if i1 ~= nil then
        local tsnum = tonumber(string.sub(v[1], i1 + 1, j1 - 1))
        if JY.GLTS[id - 1][tsnum] == 1 then
          color = RGB(120, 208, 88)
          v[1] = string.gsub(v[1], "'%x+'", "（完成）", 1)
        else
          color = C_WHITE
          v[1] = string.gsub(v[1], "'%x+'", "", 1)
        end
      end
    end
  end
  lib.SetClip(0, 0, 0, 0)
  WaitKey()
  lib.FreeSur(surid)
end
function ZBInstruce()
  local flag = false
  Cls()
  repeat
    local x1 = CC.ScreenW / 4
    local y1 = CC.ScreenH / 4
    DrawStrBoxWaitKey("未完善", C_WHITE, CC.DefaultFont)
    do break end
    local menu = {
      {
        "真武剑",
        nil,
        1
      },
      {
        "白马",
        nil,
        1
      },
      {
        "玄铁剑",
        nil,
        1
      },
      {
        "倚天剑",
        nil,
        1
      },
      {
        "屠龙刀",
        nil,
        1
      },
      {
        "软蝟甲",
        nil,
        1
      }
    }
    local numItem = #menu
    local size = CC.DefaultFont
    local r = ShowMenu(menu, numItem, 0, x1 + size * 3, y1 + size * 2, 0, 0, 1, 1, size, C_ORANGE, C_WHITE)
    if r == 0 then
      flag = true
    elseif r == 1 then
      say("真武剑，使用太极剑法必连击", 232, 1, "百事通")
    elseif r == 2 then
      say("白马，额外提高五点集气速度", 232, 1, "百事通")
    elseif r == 3 then
      say("玄铁剑，配合玄铁剑法必暴击，配合其它剑法提高暴击率", 232, 1, "百事通")
    elseif r == 4 then
      say("倚天剑，攻击必流血，并且一定机率封穴", 232, 1, "百事通")
    elseif r == 5 then
      say("屠龙刀，使用等级为极的刀法提高百分之四十暴击率，暴击的情况下有百分之五十机率大幅度杀集气，并且造成流血。杀集气量与武功威力有关", 232, 1, "百事通")
    elseif r == 6 then
      say("软蝟甲，受到拳系武功攻击时反射一定的伤害，受到非拳系武功攻击时减少伤害", 232, 1, "百事通")
    end
  until flag
end
function WuGongIntruce()
  local menu = {}
  for i = 1, JY.WugongNum - 1 do
    menu[i] = {
      i .. JY.Wugong[i]["名称"],
      nil,
      0
    }
  end
  for i = 1, CC.MyThingNum do
    if JY.Base["物品" .. i] > -1 and 0 < JY.Base["物品数量" .. i] then
      local wg = JY.Thing[JY.Base["物品" .. i]]["练出武功"]
      if 0 < wg then
        menu[wg][3] = 1
      end
    else
      break
    end
  end
  for i = 1, CC.TeamNum do
    if 0 <= JY.Base["队伍" .. i] then
      for j = 1, 10 do
        if 0 < JY.Person[JY.Base["队伍" .. i]]["武功" .. j] then
          menu[JY.Person[JY.Base["队伍" .. i]]["武功" .. j]][3] = 1
        else
          break
        end
      end
    else
      break
    end
  end
  local r = -1
  while true do
    Cls()
    r = ShowMenu2_new(menu, JY.WugongNum - 1, 4, 12, 10, (CC.ScreenH - 12 * (CC.DefaultFont + CC.RowPixel)) / 2 + 20, 0, 0, 1, 1, CC.DefaultFont, C_ORANGE, C_WHITE, "请选择查看的武功", r)
    if 0 < r and r < JY.WugongNum then
      InstruceWuGong(r)
    else
      break
    end
  end
end
function InstruceWuGong(id)
  if id < 0 or id >= JY.WugongNum then
    QZXS("武功未知错误，无法查看")
    return
  end
  local filename = string.format("%s%d.txt", CONFIG.WuGongPath, id)
  if existFile(filename) == false then
    QZXS("此武功未包含任何说明，请自行琢磨")
    return
  end
  DrawTxt(filename)
end
function QZXS(s)
  DrawStrBoxWaitKey(s, C_GOLD, CC.DefaultFont)
end
function AnalyString(str)
  local tlen = 0
  local strcolor = {}
  local f1, f2 = string.find(str, "<[A-R]>")
  if f1 ~= nil then
    while true do
      if 1 < f1 then
        local s1 = string.sub(str, 1, f1 - 1)
        table.insert(strcolor, {s1, nil})
        tlen = tlen + #s1
      end
      local match = string.match(str, "<([A-R])>")
      local f3, f4 = string.find(str, "</" .. match .. ">")
      if f3 ~= nil then
        local s2 = string.sub(str, f2 + 1, f3 - 1)
        table.insert(strcolor, {
          s2,
          CC.Color[match]
        })
        tlen = tlen + #s2
        if f4 + 1 >= #str then
          break
        end
        str = string.sub(str, f4 + 1, #str)
        f1, f2 = string.find(str, "<[A-R]>")
        if f1 == nil then
          table.insert(strcolor, {str, nil})
          break
        end
      else
        str = string.sub(str, f2 + 1, #str)
        table.insert(strcolor, {
          str,
          CC.Color[match]
        })
        break
      end
    end
  else
    table.insert(strcolor, {str, nil})
  end
  return strcolor
end
function ShowMenu2_new(menu, itemNum, numShow, showRow, x1, y1, x2, y2, isBox, isEsc, size, color, selectColor, str, selIndex, currentxz)
  local w = 0
  local h = 0
  local i, j = 0, 0
  local col = 0
  local row = 0
  Cls()
  local menuItem = {}
  local numItem = 0
  for i, v in pairs(menu) do
    if v[3] ~= 2 then
      numItem = numItem + 1
      menuItem[numItem] = {
        v[1],
        v[2],
        v[3],
        i
      }
    end
  end
  if numShow == 0 or numShow > numItem then
    col = numItem
    row = 1
  else
    col = numShow
    row = math.modf((numItem - 1) / col)
  end
  if showRow > row + 1 then
    showRow = row + 1
  end
  local maxlength = 0
  if x2 == 0 and y2 == 0 then
    for i = 1, numItem do
      if maxlength < string.len(menuItem[i][1]) then
        maxlength = string.len(menuItem[i][1])
      end
    end
    w = (size * maxlength / 2 + CC.RowPixel) * col + 2 * CC.MenuBorderPixel
    h = showRow * (size + CC.RowPixel) + 2 * CC.MenuBorderPixel
  else
    w = x2 - x1
    h = y2 - y1
  end
  if x1 == -1 then
    x1 = (CC.ScreenW - w) / 2
  end
  if y1 == -1 then
    y1 = (CC.ScreenH - h + size) / 2
  end
  local start = 0
  local curx = 1
  local cury = 0
  local current = curx + cury * numShow
  if selIndex ~= nil and 0 < selIndex then
    current = currentxz or selIndex
    curx = math.fmod(selIndex - 1, numShow) + 1
    cury = (selIndex - curx) / numShow
    if cury >= showRow / 2 then
      start = limitX(cury - showRow / 2, 0, row - showRow + 1)
    end
  end
  local returnValue = 0
  if str ~= nil then
    DrawStrBox(-1, y1 - size - 2 * CC.MenuBorderPixel, str, color, size)
  end
  local surid = lib.SaveSur(0, 0, CC.ScreenW, CC.ScreenH)
  if isBox == 1 then
    DrawBox(x1, y1, x1 + w, y1 + h, C_WHITE)
  end
  while true do
    if col ~= 0 then
      lib.LoadSur(surid, 0, 0)
      if isBox == 1 then
        DrawBox(x1, y1, x1 + w, y1 + h, C_WHITE)
      end
    end
    for i = start, showRow + start - 1 do
      for j = 1, col do
        local n = i * col + j
        if numItem < n then
          break
        end
        local drawColor = color
        if menuItem[n][3] == 0 or menuItem[n][3] == 3 then
          drawColor = M_DimGray
        end
        local xx = x1 + (j - 1) * (size * maxlength / 2 + CC.RowPixel) + CC.MenuBorderPixel
        local yy = y1 + (i - start) * (size + CC.RowPixel) + CC.MenuBorderPixel
        if n == current then
          drawColor = selectColor
          lib.Background(xx, yy, xx + size * maxlength / 2, yy + size, 128, color)
        end
        DrawString(xx, yy, menuItem[n][1], drawColor, size)
      end
    end
    ShowScreen()
    local keyPress, ktype, mx, my = WaitKey(1)
    if keyPress == VK_ESCAPE or ktype == 4 then
      if isEsc == 1 then
        break
      end
    elseif keyPress == VK_DOWN or ktype == 7 then
      if numItem >= curx + (cury + 1) * col then
        cury = cury + 1
        if row < cury then
          cury = row
        elseif cury >= showRow / 2 and cury <= row - showRow / 2 + 1 and start <= row - showRow then
          start = start + 1
        end
      end
    elseif keyPress == VK_UP or ktype == 6 then
      cury = cury - 1
      if cury < 0 then
        cury = 0
      elseif cury >= showRow / 2 - 1 and cury < row - showRow / 2 and 0 < start then
        start = start - 1
      end
    elseif keyPress == VK_RIGHT then
      curx = curx + 1
      if col < curx then
        curx = 1
      elseif numItem < curx + cury * col then
        curx = 1
      end
    elseif keyPress == VK_LEFT then
      curx = curx - 1
      if curx < 1 then
        curx = col
        if numItem < curx + cury * col then
          curx = numItem - cury * col
        end
      end
    else
      local mk = false
      if (ktype == 2 or ktype == 3) and x1 <= mx and mx <= x1 + w and y1 <= my and my <= y1 + h then
        curx = math.modf((mx - x1 - CC.MenuBorderPixel) / (size * maxlength / 2 + CC.RowPixel)) + 1
        cury = start + math.modf((my - y1 - CC.MenuBorderPixel) / (size + CC.RowPixel))
        mk = true
      end
      if keyPress == VK_SPACE or keyPress == VK_RETURN or ktype == 5 or ktype == 3 and mk then
        current = curx + cury * col
        currentxz = current
        if menuItem[current][3] == 3 then
        elseif menuItem[current][2] == nil then
          returnValue = current
          break
        else
          local r = menuItem[current][2](menuItem, current)
          if r == 1 then
            returnValue = -current
            break
          else
            lib.LoadSur(surid, 0, 0)
            if isBox == 1 then
              DrawBox(x1, y1, x1 + w, y1 + h, C_WHITE)
            end
          end
        end
      end
    end
    current = curx + cury * col
  end
  lib.FreeSur(surid)
  if 0 < returnValue then
    return menuItem[returnValue][4]
  else
    return returnValue
  end
end
function My_ChuangSong_List()
  local menu = {}
  for i = 0, JY.SceneNum - 1 do
    menu[i + 1] = {
      i .. JY.Scene[i]["名称"],
      nil,
      1
    }
    if JY.Scene[i]["进入条件"] ~= 0 or JY.Scene[i]["外景入口X1"] == 0 and JY.Scene[i]["外景入口Y1"] == 0 and JY.Scene[i]["外景入口X2"] == 0 and JY.Scene[i]["外景入口Y2"] == 0 then
      menu[i + 1][3] = 2
    end
  end
  menu[3] = {
    "2" .. JY.Scene[2]["名称"],
    nil,
    1
  }
  menu[39] = {
    "38" .. JY.Scene[38]["名称"],
    nil,
    1
  }
  local r = ShowMenu2_new(menu, JY.SceneNum, 4, 12, -1, -1, 0, 0, 1, 1, CC.DefaultFont, C_ORANGE, C_WHITE, "请选择传送场景")
  if r == 0 then
    Cls()
    return 0
  end
  if 0 < r then
    local sid = r - 1
    if JY.Scene[sid]["进入条件"] == 0 and JY.Scene[sid]["外景入口X1"] ~= 0 and JY.Scene[sid]["外景入口Y1"] ~= 0 and JY.Scene[sid]["外景入口X2"] ~= 0 and JY.Scene[sid]["外景入口Y2"] ~= 0 then
      New_Enter_SubScene(sid, -1, -1)
    elseif sid == 2 or sid == 38 then
      New_Enter_SubScene(sid, -1, -1)
    else
      say("您目前现在不能进入此场景", -1, 1, "车夫")
      return 1
    end
  end
  return 1
end
function My_ChuangSong_Ex()
  local title = "马车驿站"
  local str = "公子，您这是要去哪？"
  local btn = {
    "编号",
    "附近",
    "驿站",
    "攻略"
  }
  local num = #btn
  local r = JYMsgBox(title, str, btn, num, CC.DXKTX, 1)
  if r == 1 then
    return My_ChuangSong_List()
  elseif r == 2 then
    return Menu_Scene()
  elseif r == 3 then
    return Menu_Fly()
  elseif r == 4 then
    return TSInstruce()
  elseif r == 5 then
    Cls()
    local sid = InputNum("请输入场景数字", 0, JY.SceneNum - 1, 1)
    if sid ~= nil then
      if JY.Scene[sid]["进入条件"] == 0 or JY.Scene[sid]["进入条件"] == 2 then
        New_Enter_SubScene(sid, -1, -1)
      else
        say("您目前现在不能进入此场景", -1, 1, "车夫")
        return 1
      end
    end
  end
end
function InputNum(str, minNum, maxNum, isEsc)
  local size = CC.DefaultFont
  local color = C_WHITE
  local ll = #str
  local w = size * ll / 2 + 2 * CC.MenuBorderPixel
  local h = size + 2 * CC.MenuBorderPixel
  local x = (CC.ScreenW - size / 2 * ll - 2 * CC.MenuBorderPixel) / 2
  local y = (CC.ScreenH - size - 2 * CC.MenuBorderPixel) / 2
  DrawBox(x, y, x + w - 1, y + h - 1, C_WHITE)
  DrawString(x + CC.MenuBorderPixel, y + CC.MenuBorderPixel, str, color, size)
  if maxNum < minNum then
    minNum, maxNum = maxNum, minNum
  end
  local help = "上下加减一，左右加减十"
  if minNum ~= nil then
    help = help .. " 最小" .. minNum
  end
  if minNum ~= nil then
    help = help .. " 最大" .. maxNum
  end
  if isEsc ~= nil then
    help = help .. " ESC取消输入"
  end
  DrawString((CC.ScreenW - size * #help / 2) / 2, y - 2 * size, help, color, size)
  local sid = lib.SaveSur(0, 0, CC.ScreenW, CC.ScreenH)
  local num = 0
  if minNum ~= nil then
    num = minNum
  end
  while true do
    DrawString(CC.ScreenW / 2, y + h + size, num .. "", C_RED, size)
    ShowScreen()
    local key, ktype, mx, my = WaitKey(1)
    if key == VK_UP or ktype == 6 then
      if maxNum == nil or maxNum > num then
        num = num + 1
      end
    elseif key == VK_DOWN or ktype == 7 then
      if minNum == nil or minNum < num then
        num = num - 1
      end
    elseif key == VK_LEFT then
      if minNum == nil or num >= minNum + 10 then
        num = num - 10
      else
        num = minNum
      end
    elseif key == VK_RIGHT then
      if maxNum == nil or num <= maxNum - 10 then
        num = num + 10
      else
        num = maxNum
      end
    else
      if key == VK_SPACE or key == VK_RETURN or ktype == 3 then
        break
      end
      if (key == VK_ESCAPE or ktype == 4) and isEsc ~= nil then
        num = nil
        break
      end
    end
    ClsN()
    lib.LoadSur(sid, 0, 0)
  end
  lib.FreeSur(sid)
  return num
end
function My_Enter_SubScene(sceneid, x, y, direct)
  JY.SubScene = sceneid
  local flag = 1
  if x == -1 and y == -1 then
    JY.Base["人X1"] = JY.Scene[sceneid]["入口X"]
    JY.Base["人Y1"] = JY.Scene[sceneid]["入口Y"]
  else
    JY.Base["人X1"] = x
    JY.Base["人Y1"] = y
    flag = 0
  end
  if -1 < direct then
    JY.Base["人方向"] = direct
  end
  if JY.Status == GAME_MMAP then
    CleanMemory()
    lib.UnloadMMap()
  end
  lib.ShowSlow(20, 1)
  JY.Status = GAME_SMAP
  JY.MmapMusic = -1
  JY.Base["乘船"] = 0
  JY.MyPic = GetMyPic()
  local sid = JY.Scene[sceneid]["跳转场景"]
  if sid < 0 or 0 >= JY.Scene[sid]["外景入口X1"] and 0 >= JY.Scene[sid]["外景入口Y1"] then
    JY.Base["人X"] = JY.Scene[sceneid]["外景入口X1"]
    JY.Base["人Y"] = JY.Scene[sceneid]["外景入口Y1"]
  else
    JY.Base["人X"] = JY.Scene[sid]["外景入口X1"]
    JY.Base["人Y"] = JY.Scene[sid]["外景入口Y1"]
  end
  Init_SMap(flag)
  if flag == 0 then
    DrawStrBox(-1, 10, JY.Scene[JY.SubScene]["名称"], C_WHITE, CC.DefaultFont)
    ShowScreen()
    WaitKey()
  end
  Cls()
end
function New_Enter_SubScene(sceneid, x, y)
  local et = Rnd(2) + 1
  local x1 = JY.Scene[sceneid]["外景入口X" .. et]
  local y1 = JY.Scene[sceneid]["外景入口Y" .. et]
  lib.ShowSlow(50, 1)
  local i = 1
  if lib.GetMMap(x1, y1 + i, 3) == 0 and lib.GetMMap(x1, y1 + i, 4) == 0 then
    JY.Base["人X"] = x1
    JY.Base["人Y"] = y1 + i
    JY.Base["人方向"] = 0
  elseif lib.GetMMap(x1, y1 - i, 3) == 0 and lib.GetMMap(x1, y1 - i, 4) == 0 then
    JY.Base["人X"] = x1
    JY.Base["人Y"] = y1 - i
    JY.Base["人方向"] = 3
  elseif lib.GetMMap(x1 + i, y1, 3) == 0 and lib.GetMMap(x1 + i, y1, 4) == 0 then
    JY.Base["人X"] = x1 + i
    JY.Base["人Y"] = y1
    JY.Base["人方向"] = 2
  elseif lib.GetMMap(x1 - i, y1, 3) == 0 and lib.GetMMap(x1 - i, y1, 4) == 0 then
    JY.Base["人X"] = x1 - i
    JY.Base["人Y"] = y1
    JY.Base["人方向"] = 1
  end
  Cls()
  lib.ShowSlow(50, 0)
end
function ClsN(x1, y1, x2, y2)
  if x1 == nil then
    x1 = 0
    y1 = 0
    x2 = 0
    y2 = 0
  end
  lib.SetClip(x1, y1, x2, y2)
  lib.FillColor(0, 0, 0, 0, 0)
  lib.SetClip(0, 0, 0, 0)
end
function DrawTimer()
  if CC.OpenTimmerRemind ~= 1 then
    return
  end
  local t2 = lib.GetTime()
  if CC.Timer.status == 0 then
    if t2 - CC.Timer.stime > 10000 or CC.Timer.stime == 0 then
      CC.Timer.stime = t2
      CC.Timer.status = 1
      CC.Timer.str = CC.RUNSTR[math.random(#CC.RUNSTR)]
      CC.Timer.len = string.len(CC.Timer.str) / 2 + 3
    end
  else
    CC.Timer.fun(t2)
  end
end
function demostr(t)
  local tt = t - CC.Timer.stime
  tt = math.modf(tt / 25) % (CC.ScreenW + CC.Timer.len * CC.DefaultFont) * 1
  if runword(CC.Timer.str, M_Orange, CC.DefaultFont, 1, tt) == 1 and Rnd(2) == 1 then
    CC.Timer.status = 0
    CC.Timer.stime = t
  end
end
function runword(str, color, size, place, offset)
  offset = CC.ScreenW - offset
  local y1, y2
  if place == 0 then
    y1 = 0
    y2 = size
  elseif place == 1 then
    y1 = CC.ScreenH - size
    y2 = CC.ScreenH
  end
  lib.Background(0, y1, CC.ScreenW, y2, 128)
  if -offset > (CC.Timer.len - 1) * size then
    return 1
  end
  DrawString(offset, y1, str, color, size)
  return 0
end
function AutoSave()
  if lib.GetTime() > JY.DiyTime then
    JY.AtTime = lib.GetTime()
    JY.DiyTime = JY.AtTime + JY.SaveTime * 60000
    SaveRecord(11)
    JY.SBZ = 1
  end
  if JY.SBZ == 1 then
    local fontsize = CC.NewGameFontSize
    local i = math.modf((lib.GetTime() - JY.AtTime) / 500)
    if i == 0 or i == 2 or i == 4 or i == 6 or i == 8 or i == 10 or i == 12 or i == 14 or i == 16 or i == 18 or i == 20 then
      DrawString(CC.ScreenW / 2 - fontsize * 10, CC.ScreenH - fontsize * 3, string.format("存档成功保存，当前自动存档间隔为%d分钟", JY.SaveTime), C_RED, CC.NewGameFontSize, 1)
    else
      DrawString(CC.ScreenW / 2 - fontsize * 10, CC.ScreenH - fontsize * 3, string.format("存档成功保存，当前自动存档间隔为%d分钟", JY.SaveTime), C_WHITE, CC.NewGameFontSize, 1)
    end
    if JY.AtTime + 5000 < lib.GetTime() then
      JY.SBZ = 0
    end
  end
end
function X50ZL16(id1, id2, id3, id4, id5, id6, id7)
  id2 = id2 % 256
  id2 = id2 % 16
  id2 = id2 % 8
  local strbl, idbl1, idbl2, idbl3
  if id2 == 0 then
    idbl1 = id4
    idbl2 = id5
    idbl3 = id6
  elseif id2 == 1 then
    idbl1 = X50[id4]
    idbl2 = id5
    idbl3 = id6
  elseif id2 == 2 then
    idbl1 = id4
    idbl2 = X50[id5]
    idbl3 = id6
  elseif id2 == 3 then
    idbl1 = X50[id4]
    idbl2 = X50[id5]
    idbl3 = id6
  elseif id2 == 4 then
    idbl1 = id4
    idbl2 = id5
    idbl3 = X50[id6]
  elseif id2 == 5 then
    idbl1 = X50[id4]
    idbl2 = id5
    idbl3 = X50[id6]
  elseif id2 == 6 then
    idbl1 = id4
    idbl2 = X50[id5]
    idbl3 = X50[id6]
  elseif id2 == 7 then
    idbl1 = X50[id4]
    idbl2 = X50[id5]
    idbl3 = X50[id6]
  end
  if idbl1 < 0 then
    return
  end
  if id3 == 0 then
    if idbl2 == 0 then
      strbl = "代号"
    elseif idbl2 == 2 then
      strbl = "头像代号"
    elseif idbl2 == 4 then
      strbl = "生命增长"
    elseif idbl2 == 6 then
      strbl = "无用"
    elseif idbl2 == 8 then
      strbl = "姓名"
    elseif idbl2 == 18 then
      strbl = "外号"
    elseif idbl2 == 28 then
      strbl = "性别"
    elseif idbl2 == 30 then
      strbl = "等级"
    elseif idbl2 == 32 then
      strbl = "经验"
    elseif idbl2 == 34 then
      strbl = "生命"
    elseif idbl2 == 36 then
      strbl = "生命最大值"
    elseif idbl2 == 38 then
      strbl = "受伤程度"
    elseif idbl2 == 40 then
      strbl = "中毒程度"
    elseif idbl2 == 42 then
      strbl = "体力"
    elseif idbl2 == 44 then
      strbl = "物品修炼点数"
    elseif idbl2 == 46 then
      strbl = "武器"
    elseif idbl2 == 48 then
      strbl = "防具"
    elseif idbl2 == 80 then
      strbl = "内力性质"
    elseif idbl2 == 82 then
      strbl = "内力"
    elseif idbl2 == 84 then
      strbl = "内力最大值"
    elseif idbl2 == 86 then
      strbl = "攻击力"
    elseif idbl2 == 88 then
      strbl = "轻功"
    elseif idbl2 == 90 then
      strbl = "防御力"
    elseif idbl2 == 92 then
      strbl = "医疗能力"
    elseif idbl2 == 94 then
      strbl = "用毒能力"
    elseif idbl2 == 96 then
      strbl = "解毒能力"
    elseif idbl2 == 98 then
      strbl = "抗毒能力"
    elseif idbl2 == 100 then
      strbl = "拳掌功夫"
    elseif idbl2 == 102 then
      strbl = "御剑能力"
    elseif idbl2 == 104 then
      strbl = "耍刀技巧"
    elseif idbl2 == 106 then
      strbl = "特殊兵器"
    elseif idbl2 == 108 then
      strbl = "暗器技巧"
    elseif idbl2 == 110 then
      strbl = "武学常识"
    elseif idbl2 == 112 then
      strbl = "品德"
    elseif idbl2 == 114 then
      strbl = "攻击带毒"
    elseif idbl2 == 116 then
      strbl = "左右互搏"
    elseif idbl2 == 118 then
      strbl = "声望"
    elseif idbl2 == 120 then
      strbl = "资质"
    elseif idbl2 == 122 then
      strbl = "修炼物品"
    elseif idbl2 == 124 then
      strbl = "修炼点数"
    elseif idbl2 == 126 then
      strbl = "武功1"
    elseif idbl2 == 128 then
      strbl = "武功2"
    elseif idbl2 == 130 then
      strbl = "武功3"
    elseif idbl2 == 132 then
      strbl = "武功4"
    elseif idbl2 == 134 then
      strbl = "武功5"
    elseif idbl2 == 136 then
      strbl = "武功6"
    elseif idbl2 == 138 then
      strbl = "武功7"
    elseif idbl2 == 140 then
      strbl = "武功8"
    elseif idbl2 == 142 then
      strbl = "武功9"
    elseif idbl2 == 144 then
      strbl = "武功10"
    elseif idbl2 == 146 then
      strbl = "武功等级1"
    elseif idbl2 == 148 then
      strbl = "武功等级2"
    elseif idbl2 == 150 then
      strbl = "武功等级3"
    elseif idbl2 == 152 then
      strbl = "武功等级4"
    elseif idbl2 == 154 then
      strbl = "武功等级5"
    elseif idbl2 == 156 then
      strbl = "武功等级6"
    elseif idbl2 == 158 then
      strbl = "武功等级7"
    elseif idbl2 == 160 then
      strbl = "武功等级8"
    elseif idbl2 == 162 then
      strbl = "武功等级9"
    elseif idbl2 == 164 then
      strbl = "武功等级10"
    elseif idbl2 == 166 then
      strbl = "携带物品1"
    elseif idbl2 == 168 then
      strbl = "携带物品2"
    elseif idbl2 == 170 then
      strbl = "携带物品3"
    elseif idbl2 == 172 then
      strbl = "携带物品4"
    elseif idbl2 == 174 then
      strbl = "携带物品数量1"
    elseif idbl2 == 176 then
      strbl = "携带物品数量2"
    elseif idbl2 == 178 then
      strbl = "携带物品数量3"
    elseif idbl2 == 180 then
      strbl = "携带物品数量4"
    end
  elseif id3 == 1 then
    if idbl2 == 0 then
      strbl = "代号"
    elseif idbl2 == 2 then
      strbl = "名称"
    elseif idbl2 == 22 then
      strbl = "名称2"
    elseif idbl2 == 42 then
      strbl = "物品说明"
    elseif idbl2 == 72 then
      strbl = "练出武功"
    elseif idbl2 == 74 then
      strbl = "暗器动画编号"
    elseif idbl2 == 76 then
      strbl = "使用人"
    elseif idbl2 == 78 then
      strbl = "装备类型"
    elseif idbl2 == 80 then
      strbl = "显示物品说明"
    elseif idbl2 == 82 then
      strbl = "类型"
    elseif idbl2 == 84 then
      strbl = "未知5"
    elseif idbl2 == 86 then
      strbl = "未知6"
    elseif idbl2 == 88 then
      strbl = "未知7"
    elseif idbl2 == 90 then
      strbl = "加生命"
    elseif idbl2 == 92 then
      strbl = "加生命最大值"
    elseif idbl2 == 94 then
      strbl = "加中毒解毒"
    elseif idbl2 == 96 then
      strbl = "加体力"
    elseif idbl2 == 98 then
      strbl = "改变内力性质"
    elseif idbl2 == 100 then
      strbl = "加内力"
    elseif idbl2 == 102 then
      strbl = "加内力最大值"
    elseif idbl2 == 104 then
      strbl = "加攻击力"
    elseif idbl2 == 106 then
      strbl = "加轻功"
    elseif idbl2 == 108 then
      strbl = "加防御力"
    elseif idbl2 == 110 then
      strbl = "加医疗能力"
    elseif idbl2 == 112 then
      strbl = "加用毒能力"
    elseif idbl2 == 114 then
      strbl = "加解毒能力"
    elseif idbl2 == 116 then
      strbl = "加抗毒能力"
    elseif idbl2 == 118 then
      strbl = "加拳掌功夫"
    elseif idbl2 == 120 then
      strbl = "加御剑能力"
    elseif idbl2 == 122 then
      strbl = "加耍刀技巧"
    elseif idbl2 == 124 then
      strbl = "加特殊兵器"
    elseif idbl2 == 126 then
      strbl = "加暗器技巧"
    elseif idbl2 == 128 then
      strbl = "加武学常识"
    elseif idbl2 == 130 then
      strbl = "加品德"
    elseif idbl2 == 132 then
      strbl = "加攻击次数"
    elseif idbl2 == 134 then
      strbl = "加攻击带毒"
    elseif idbl2 == 136 then
      strbl = "仅修炼人物"
    elseif idbl2 == 138 then
      strbl = "需内力性质"
    elseif idbl2 == 140 then
      strbl = "需内力"
    elseif idbl2 == 142 then
      strbl = "需攻击力"
    elseif idbl2 == 144 then
      strbl = "需轻功"
    elseif idbl2 == 146 then
      strbl = "需用毒能力"
    elseif idbl2 == 148 then
      strbl = "需医疗能力"
    elseif idbl2 == 150 then
      strbl = "需解毒能力"
    elseif idbl2 == 152 then
      strbl = "需拳掌功夫"
    elseif idbl2 == 154 then
      strbl = "需御剑能力"
    elseif idbl2 == 156 then
      strbl = "需耍刀技巧"
    elseif idbl2 == 158 then
      strbl = "需特殊兵器"
    elseif idbl2 == 160 then
      strbl = "需暗器技巧"
    elseif idbl2 == 162 then
      strbl = "需资质"
    elseif idbl2 == 164 then
      strbl = "需经验"
    elseif idbl2 == 166 then
      strbl = "练出物品需经验"
    elseif idbl2 == 168 then
      strbl = "需材料"
    elseif idbl2 == 170 then
      strbl = "练出物品1"
    elseif idbl2 == 172 then
      strbl = "练出物品2"
    elseif idbl2 == 174 then
      strbl = "练出物品3"
    elseif idbl2 == 176 then
      strbl = "练出物品4"
    elseif idbl2 == 178 then
      strbl = "练出物品5"
    elseif idbl2 == 180 then
      strbl = "需要物品数量1"
    elseif idbl2 == 182 then
      strbl = "需要物品数量2"
    elseif idbl2 == 184 then
      strbl = "需要物品数量3"
    elseif idbl2 == 186 then
      strbl = "需要物品数量4"
    elseif idbl2 == 188 then
      strbl = "需要物品数量5"
    end
  elseif id3 == 2 then
    if idbl2 == 0 then
      strbl = "代号"
    elseif idbl2 == 2 then
      strbl = "名称"
    elseif idbl2 == 12 then
      strbl = "出门音乐"
    elseif idbl2 == 14 then
      strbl = "进门音乐"
    elseif idbl2 == 16 then
      strbl = "跳转场景"
    elseif idbl2 == 18 then
      strbl = "进入条件"
    elseif idbl2 == 20 then
      strbl = "外景入口X1"
    elseif idbl2 == 22 then
      strbl = "外景入口Y1"
    elseif idbl2 == 24 then
      strbl = "外景入口X2"
    elseif idbl2 == 26 then
      strbl = "外景入口Y2"
    elseif idbl2 == 28 then
      strbl = "入口X"
    elseif idbl2 == 30 then
      strbl = "入口Y"
    elseif idbl2 == 32 then
      strbl = "出口X1"
    elseif idbl2 == 34 then
      strbl = "出口X2"
    elseif idbl2 == 36 then
      strbl = "出口X3"
    elseif idbl2 == 38 then
      strbl = "出口Y1"
    elseif idbl2 == 40 then
      strbl = "出口Y2"
    elseif idbl2 == 42 then
      strbl = "出口Y3"
    elseif idbl2 == 44 then
      strbl = "跳转口X1"
    elseif idbl2 == 46 then
      strbl = "跳转口Y1"
    elseif idbl2 == 48 then
      strbl = "跳转口X2"
    elseif idbl2 == 50 then
      strbl = "跳转口Y2"
    end
  elseif id3 == 3 then
    if idbl2 == 0 then
      strbl = "代号"
    elseif idbl2 == 2 then
      strbl = "名称"
    elseif idbl2 == 12 then
      strbl = "未知1"
    elseif idbl2 == 14 then
      strbl = "未知2"
    elseif idbl2 == 16 then
      strbl = "未知3"
    elseif idbl2 == 18 then
      strbl = "未知4"
    elseif idbl2 == 20 then
      strbl = "未知5"
    elseif idbl2 == 22 then
      strbl = "出招音效"
    elseif idbl2 == 24 then
      strbl = "武功类型"
    elseif idbl2 == 26 then
      strbl = "武功动画&音效"
    elseif idbl2 == 28 then
      strbl = "伤害类型"
    elseif idbl2 == 30 then
      strbl = "攻击范围"
    elseif idbl2 == 32 then
      strbl = "消耗内力点数"
    elseif idbl2 == 34 then
      strbl = "敌人中毒点数"
    elseif idbl2 == 36 then
      strbl = "攻击力1"
    elseif idbl2 == 38 then
      strbl = "攻击力2"
    elseif idbl2 == 40 then
      strbl = "攻击力3"
    elseif idbl2 == 42 then
      strbl = "攻击力4"
    elseif idbl2 == 44 then
      strbl = "攻击力5"
    elseif idbl2 == 46 then
      strbl = "攻击力6"
    elseif idbl2 == 48 then
      strbl = "攻击力7"
    elseif idbl2 == 50 then
      strbl = "攻击力8"
    elseif idbl2 == 52 then
      strbl = "攻击力9"
    elseif idbl2 == 54 then
      strbl = "攻击力10"
    elseif idbl2 == 56 then
      strbl = "移动范围1"
    elseif idbl2 == 58 then
      strbl = "移动范围2"
    elseif idbl2 == 60 then
      strbl = "移动范围3"
    elseif idbl2 == 62 then
      strbl = "移动范围4"
    elseif idbl2 == 64 then
      strbl = "移动范围5"
    elseif idbl2 == 66 then
      strbl = "移动范围6"
    elseif idbl2 == 68 then
      strbl = "移动范围7"
    elseif idbl2 == 70 then
      strbl = "移动范围8"
    elseif idbl2 == 72 then
      strbl = "移动范围9"
    elseif idbl2 == 74 then
      strbl = "移动范围10"
    elseif idbl2 == 76 then
      strbl = "杀伤范围1"
    elseif idbl2 == 78 then
      strbl = "杀伤范围2"
    elseif idbl2 == 80 then
      strbl = "杀伤范围3"
    elseif idbl2 == 82 then
      strbl = "杀伤范围4"
    elseif idbl2 == 84 then
      strbl = "杀伤范围5"
    elseif idbl2 == 86 then
      strbl = "杀伤范围6"
    elseif idbl2 == 88 then
      strbl = "杀伤范围7"
    elseif idbl2 == 90 then
      strbl = "杀伤范围8"
    elseif idbl2 == 92 then
      strbl = "杀伤范围9"
    elseif idbl2 == 94 then
      strbl = "杀伤范围10"
    elseif idbl2 == 96 then
      strbl = "加内力1"
    elseif idbl2 == 98 then
      strbl = "加内力2"
    elseif idbl2 == 100 then
      strbl = "加内力3"
    elseif idbl2 == 102 then
      strbl = "加内力4"
    elseif idbl2 == 104 then
      strbl = "加内力5"
    elseif idbl2 == 106 then
      strbl = "加内力6"
    elseif idbl2 == 108 then
      strbl = "加内力7"
    elseif idbl2 == 110 then
      strbl = "加内力8"
    elseif idbl2 == 112 then
      strbl = "加内力9"
    elseif idbl2 == 114 then
      strbl = "加内力10"
    elseif idbl2 == 116 then
      strbl = "杀内力1"
    elseif idbl2 == 118 then
      strbl = "杀内力2"
    elseif idbl2 == 120 then
      strbl = "杀内力3"
    elseif idbl2 == 122 then
      strbl = "杀内力4"
    elseif idbl2 == 124 then
      strbl = "杀内力5"
    elseif idbl2 == 126 then
      strbl = "杀内力6"
    elseif idbl2 == 128 then
      strbl = "杀内力7"
    elseif idbl2 == 130 then
      strbl = "杀内力8"
    elseif idbl2 == 132 then
      strbl = "杀内力9"
    elseif idbl2 == 134 then
      strbl = "杀内力10"
    end
  end
  if id3 == 0 then
    JY.Person[idbl1][strbl] = idbl3
  elseif id3 == 1 then
    JY.Thing[idbl1][strbl] = idbl3
  elseif id3 == 2 then
    JY.Scene[idbl1][strbl] = idbl3
  elseif id3 == 3 then
    JY.Wugong[idbl1][strbl] = idbl3
  end
end
function X50ZL17(id1, id2, id3, id4, id5, id6, id7)
  id2 = id2 % 256
  id2 = id2 % 16
  id2 = id2 % 8
  id2 = id2 % 4
  local strbl, idbl1, idbl2
  if id2 == 0 then
    idbl1 = id4
    idbl2 = id5
  elseif id2 == 1 then
    idbl1 = X50[id4]
    idbl2 = id5
  elseif id2 == 2 then
    idbl1 = id4
    idbl2 = X50[id5]
  elseif id2 == 3 then
    idbl1 = X50[id4]
    idbl2 = X50[id5]
  end
  if idbl1 < 0 then
    return
  end
  if id3 == 0 then
    if idbl2 == 0 then
      strbl = "代号"
    elseif idbl2 == 2 then
      strbl = "头像代号"
    elseif idbl2 == 4 then
      strbl = "生命增长"
    elseif idbl2 == 6 then
      strbl = "无用"
    elseif idbl2 == 8 then
      strbl = "姓名"
    elseif idbl2 == 18 then
      strbl = "外号"
    elseif idbl2 == 28 then
      strbl = "性别"
    elseif idbl2 == 30 then
      strbl = "等级"
    elseif idbl2 == 32 then
      strbl = "经验"
    elseif idbl2 == 34 then
      strbl = "生命"
    elseif idbl2 == 36 then
      strbl = "生命最大值"
    elseif idbl2 == 38 then
      strbl = "受伤程度"
    elseif idbl2 == 40 then
      strbl = "中毒程度"
    elseif idbl2 == 42 then
      strbl = "体力"
    elseif idbl2 == 44 then
      strbl = "物品修炼点数"
    elseif idbl2 == 46 then
      strbl = "武器"
    elseif idbl2 == 48 then
      strbl = "防具"
    elseif idbl2 == 80 then
      strbl = "内力性质"
    elseif idbl2 == 82 then
      strbl = "内力"
    elseif idbl2 == 84 then
      strbl = "内力最大值"
    elseif idbl2 == 86 then
      strbl = "攻击力"
    elseif idbl2 == 88 then
      strbl = "轻功"
    elseif idbl2 == 90 then
      strbl = "防御力"
    elseif idbl2 == 92 then
      strbl = "医疗能力"
    elseif idbl2 == 94 then
      strbl = "用毒能力"
    elseif idbl2 == 96 then
      strbl = "解毒能力"
    elseif idbl2 == 98 then
      strbl = "抗毒能力"
    elseif idbl2 == 100 then
      strbl = "拳掌功夫"
    elseif idbl2 == 102 then
      strbl = "御剑能力"
    elseif idbl2 == 104 then
      strbl = "耍刀技巧"
    elseif idbl2 == 106 then
      strbl = "特殊兵器"
    elseif idbl2 == 108 then
      strbl = "暗器技巧"
    elseif idbl2 == 110 then
      strbl = "武学常识"
    elseif idbl2 == 112 then
      strbl = "品德"
    elseif idbl2 == 114 then
      strbl = "攻击带毒"
    elseif idbl2 == 116 then
      strbl = "左右互搏"
    elseif idbl2 == 118 then
      strbl = "声望"
    elseif idbl2 == 120 then
      strbl = "资质"
    elseif idbl2 == 122 then
      strbl = "修炼物品"
    elseif idbl2 == 124 then
      strbl = "修炼点数"
    elseif idbl2 == 126 then
      strbl = "武功1"
    elseif idbl2 == 128 then
      strbl = "武功2"
    elseif idbl2 == 130 then
      strbl = "武功3"
    elseif idbl2 == 132 then
      strbl = "武功4"
    elseif idbl2 == 134 then
      strbl = "武功5"
    elseif idbl2 == 136 then
      strbl = "武功6"
    elseif idbl2 == 138 then
      strbl = "武功7"
    elseif idbl2 == 140 then
      strbl = "武功8"
    elseif idbl2 == 142 then
      strbl = "武功9"
    elseif idbl2 == 144 then
      strbl = "武功10"
    elseif idbl2 == 146 then
      strbl = "武功等级1"
    elseif idbl2 == 148 then
      strbl = "武功等级2"
    elseif idbl2 == 150 then
      strbl = "武功等级3"
    elseif idbl2 == 152 then
      strbl = "武功等级4"
    elseif idbl2 == 154 then
      strbl = "武功等级5"
    elseif idbl2 == 156 then
      strbl = "武功等级6"
    elseif idbl2 == 158 then
      strbl = "武功等级7"
    elseif idbl2 == 160 then
      strbl = "武功等级8"
    elseif idbl2 == 162 then
      strbl = "武功等级9"
    elseif idbl2 == 164 then
      strbl = "武功等级10"
    elseif idbl2 == 166 then
      strbl = "携带物品1"
    elseif idbl2 == 168 then
      strbl = "携带物品2"
    elseif idbl2 == 170 then
      strbl = "携带物品3"
    elseif idbl2 == 172 then
      strbl = "携带物品4"
    elseif idbl2 == 174 then
      strbl = "携带物品数量1"
    elseif idbl2 == 176 then
      strbl = "携带物品数量2"
    elseif idbl2 == 178 then
      strbl = "携带物品数量3"
    elseif idbl2 == 180 then
      strbl = "携带物品数量4"
    end
  elseif id3 == 1 then
    if idbl2 == 0 then
      strbl = "代号"
    elseif idbl2 == 2 then
      strbl = "名称"
    elseif idbl2 == 22 then
      strbl = "名称2"
    elseif idbl2 == 42 then
      strbl = "物品说明"
    elseif idbl2 == 72 then
      strbl = "练出武功"
    elseif idbl2 == 74 then
      strbl = "暗器动画编号"
    elseif idbl2 == 76 then
      strbl = "使用人"
    elseif idbl2 == 78 then
      strbl = "装备类型"
    elseif idbl2 == 80 then
      strbl = "显示物品说明"
    elseif idbl2 == 82 then
      strbl = "类型"
    elseif idbl2 == 84 then
      strbl = "未知5"
    elseif idbl2 == 86 then
      strbl = "未知6"
    elseif idbl2 == 88 then
      strbl = "未知7"
    elseif idbl2 == 90 then
      strbl = "加生命"
    elseif idbl2 == 92 then
      strbl = "加生命最大值"
    elseif idbl2 == 94 then
      strbl = "加中毒解毒"
    elseif idbl2 == 96 then
      strbl = "加体力"
    elseif idbl2 == 98 then
      strbl = "改变内力性质"
    elseif idbl2 == 100 then
      strbl = "加内力"
    elseif idbl2 == 102 then
      strbl = "加内力最大值"
    elseif idbl2 == 104 then
      strbl = "加攻击力"
    elseif idbl2 == 106 then
      strbl = "加轻功"
    elseif idbl2 == 108 then
      strbl = "加防御力"
    elseif idbl2 == 110 then
      strbl = "加医疗能力"
    elseif idbl2 == 112 then
      strbl = "加用毒能力"
    elseif idbl2 == 114 then
      strbl = "加解毒能力"
    elseif idbl2 == 116 then
      strbl = "加抗毒能力"
    elseif idbl2 == 118 then
      strbl = "加拳掌功夫"
    elseif idbl2 == 120 then
      strbl = "加御剑能力"
    elseif idbl2 == 122 then
      strbl = "加耍刀技巧"
    elseif idbl2 == 124 then
      strbl = "加特殊兵器"
    elseif idbl2 == 126 then
      strbl = "加暗器技巧"
    elseif idbl2 == 128 then
      strbl = "加武学常识"
    elseif idbl2 == 130 then
      strbl = "加品德"
    elseif idbl2 == 132 then
      strbl = "加攻击次数"
    elseif idbl2 == 134 then
      strbl = "加攻击带毒"
    elseif idbl2 == 136 then
      strbl = "仅修炼人物"
    elseif idbl2 == 138 then
      strbl = "需内力性质"
    elseif idbl2 == 140 then
      strbl = "需内力"
    elseif idbl2 == 142 then
      strbl = "需攻击力"
    elseif idbl2 == 144 then
      strbl = "需轻功"
    elseif idbl2 == 146 then
      strbl = "需用毒能力"
    elseif idbl2 == 148 then
      strbl = "需医疗能力"
    elseif idbl2 == 150 then
      strbl = "需解毒能力"
    elseif idbl2 == 152 then
      strbl = "需拳掌功夫"
    elseif idbl2 == 154 then
      strbl = "需御剑能力"
    elseif idbl2 == 156 then
      strbl = "需耍刀技巧"
    elseif idbl2 == 158 then
      strbl = "需特殊兵器"
    elseif idbl2 == 160 then
      strbl = "需暗器技巧"
    elseif idbl2 == 162 then
      strbl = "需资质"
    elseif idbl2 == 164 then
      strbl = "需经验"
    elseif idbl2 == 166 then
      strbl = "练出物品需经验"
    elseif idbl2 == 168 then
      strbl = "需材料"
    elseif idbl2 == 170 then
      strbl = "练出物品1"
    elseif idbl2 == 172 then
      strbl = "练出物品2"
    elseif idbl2 == 174 then
      strbl = "练出物品3"
    elseif idbl2 == 176 then
      strbl = "练出物品4"
    elseif idbl2 == 178 then
      strbl = "练出物品5"
    elseif idbl2 == 180 then
      strbl = "需要物品数量1"
    elseif idbl2 == 182 then
      strbl = "需要物品数量2"
    elseif idbl2 == 184 then
      strbl = "需要物品数量3"
    elseif idbl2 == 186 then
      strbl = "需要物品数量4"
    elseif idbl2 == 188 then
      strbl = "需要物品数量5"
    end
  elseif id3 == 2 then
    if idbl2 == 0 then
      strbl = "代号"
    elseif idbl2 == 2 then
      strbl = "名称"
    elseif idbl2 == 12 then
      strbl = "出门音乐"
    elseif idbl2 == 14 then
      strbl = "进门音乐"
    elseif idbl2 == 16 then
      strbl = "跳转场景"
    elseif idbl2 == 18 then
      strbl = "进入条件"
    elseif idbl2 == 20 then
      strbl = "外景入口X1"
    elseif idbl2 == 22 then
      strbl = "外景入口Y1"
    elseif idbl2 == 24 then
      strbl = "外景入口X2"
    elseif idbl2 == 26 then
      strbl = "外景入口Y2"
    elseif idbl2 == 28 then
      strbl = "入口X"
    elseif idbl2 == 30 then
      strbl = "入口Y"
    elseif idbl2 == 32 then
      strbl = "出口X1"
    elseif idbl2 == 34 then
      strbl = "出口X2"
    elseif idbl2 == 36 then
      strbl = "出口X3"
    elseif idbl2 == 38 then
      strbl = "出口Y1"
    elseif idbl2 == 40 then
      strbl = "出口Y2"
    elseif idbl2 == 42 then
      strbl = "出口Y3"
    elseif idbl2 == 44 then
      strbl = "跳转口X1"
    elseif idbl2 == 46 then
      strbl = "跳转口Y1"
    elseif idbl2 == 48 then
      strbl = "跳转口X2"
    elseif idbl2 == 50 then
      strbl = "跳转口Y2"
    end
  elseif id3 == 3 then
    if idbl2 == 0 then
      strbl = "代号"
    elseif idbl2 == 2 then
      strbl = "名称"
    elseif idbl2 == 12 then
      strbl = "未知1"
    elseif idbl2 == 14 then
      strbl = "未知2"
    elseif idbl2 == 16 then
      strbl = "未知3"
    elseif idbl2 == 18 then
      strbl = "未知4"
    elseif idbl2 == 20 then
      strbl = "未知5"
    elseif idbl2 == 22 then
      strbl = "出招音效"
    elseif idbl2 == 24 then
      strbl = "武功类型"
    elseif idbl2 == 26 then
      strbl = "武功动画&音效"
    elseif idbl2 == 28 then
      strbl = "伤害类型"
    elseif idbl2 == 30 then
      strbl = "攻击范围"
    elseif idbl2 == 32 then
      strbl = "消耗内力点数"
    elseif idbl2 == 34 then
      strbl = "敌人中毒点数"
    elseif idbl2 == 36 then
      strbl = "攻击力1"
    elseif idbl2 == 38 then
      strbl = "攻击力2"
    elseif idbl2 == 40 then
      strbl = "攻击力3"
    elseif idbl2 == 42 then
      strbl = "攻击力4"
    elseif idbl2 == 44 then
      strbl = "攻击力5"
    elseif idbl2 == 46 then
      strbl = "攻击力6"
    elseif idbl2 == 48 then
      strbl = "攻击力7"
    elseif idbl2 == 50 then
      strbl = "攻击力8"
    elseif idbl2 == 52 then
      strbl = "攻击力9"
    elseif idbl2 == 54 then
      strbl = "攻击力10"
    elseif idbl2 == 56 then
      strbl = "移动范围1"
    elseif idbl2 == 58 then
      strbl = "移动范围2"
    elseif idbl2 == 60 then
      strbl = "移动范围3"
    elseif idbl2 == 62 then
      strbl = "移动范围4"
    elseif idbl2 == 64 then
      strbl = "移动范围5"
    elseif idbl2 == 66 then
      strbl = "移动范围6"
    elseif idbl2 == 68 then
      strbl = "移动范围7"
    elseif idbl2 == 70 then
      strbl = "移动范围8"
    elseif idbl2 == 72 then
      strbl = "移动范围9"
    elseif idbl2 == 74 then
      strbl = "移动范围10"
    elseif idbl2 == 76 then
      strbl = "杀伤范围1"
    elseif idbl2 == 78 then
      strbl = "杀伤范围2"
    elseif idbl2 == 80 then
      strbl = "杀伤范围3"
    elseif idbl2 == 82 then
      strbl = "杀伤范围4"
    elseif idbl2 == 84 then
      strbl = "杀伤范围5"
    elseif idbl2 == 86 then
      strbl = "杀伤范围6"
    elseif idbl2 == 88 then
      strbl = "杀伤范围7"
    elseif idbl2 == 90 then
      strbl = "杀伤范围8"
    elseif idbl2 == 92 then
      strbl = "杀伤范围9"
    elseif idbl2 == 94 then
      strbl = "杀伤范围10"
    elseif idbl2 == 96 then
      strbl = "加内力1"
    elseif idbl2 == 98 then
      strbl = "加内力2"
    elseif idbl2 == 100 then
      strbl = "加内力3"
    elseif idbl2 == 102 then
      strbl = "加内力4"
    elseif idbl2 == 104 then
      strbl = "加内力5"
    elseif idbl2 == 106 then
      strbl = "加内力6"
    elseif idbl2 == 108 then
      strbl = "加内力7"
    elseif idbl2 == 110 then
      strbl = "加内力8"
    elseif idbl2 == 112 then
      strbl = "加内力9"
    elseif idbl2 == 114 then
      strbl = "加内力10"
    elseif idbl2 == 116 then
      strbl = "杀内力1"
    elseif idbl2 == 118 then
      strbl = "杀内力2"
    elseif idbl2 == 120 then
      strbl = "杀内力3"
    elseif idbl2 == 122 then
      strbl = "杀内力4"
    elseif idbl2 == 124 then
      strbl = "杀内力5"
    elseif idbl2 == 126 then
      strbl = "杀内力6"
    elseif idbl2 == 128 then
      strbl = "杀内力7"
    elseif idbl2 == 130 then
      strbl = "杀内力8"
    elseif idbl2 == 132 then
      strbl = "杀内力9"
    elseif idbl2 == 134 then
      strbl = "杀内力10"
    end
  end
  if id3 == 0 then
    X50[id6] = JY.Person[idbl1][strbl]
  elseif id3 == 1 then
    X50[id6] = JY.Thing[idbl1][strbl]
  elseif id3 == 2 then
    X50[id6] = JY.Scene[idbl1][strbl]
  elseif id3 == 3 then
    X50[id6] = JY.Wugong[idbl1][strbl]
  end
end
function walkto(xx, yy, x, y, flag)
  local x, y
  AutoMoveTab = {
    [0] = 0
  }
  if JY.Status == GAME_SMAP then
    x = x or JY.Base["人X1"]
    y = y or JY.Base["人Y1"]
  elseif JY.Status == GAME_MMAP then
    x = x or JY.Base["人X"]
    y = y or JY.Base["人Y"]
  end
  xx, yy = xx + x, yy + y
  if JY.Status == GAME_SMAP and SceneCanPass(xx, yy) == false then
    if 0 < GetS(JY.SubScene, xx, yy, 3) and 0 < GetD(JY.SubScene, GetS(JY.SubScene, xx, yy, 3), 2) then
      CC.AutoMoveEvent[1] = xx
      CC.AutoMoveEvent[2] = yy
      if SceneCanPass(xx + 1, yy) then
        xx = xx + 1
      elseif SceneCanPass(xx, yy + 1) then
        yy = yy + 1
      elseif SceneCanPass(xx, yy - 1) then
        yy = yy - 1
      elseif SceneCanPass(xx - 1, yy) then
        xx = xx - 1
      else
        return
      end
      CC.AutoMoveEvent[0] = 1
    else
      return
    end
  end
  if JY.Status == GAME_MMAP and (lib.GetMMap(xx, yy, 3) == 0 and lib.GetMMap(xx, yy, 4) == 0 or CanEnterScene(xx, yy) ~= -1) == false then
    return
  end
  local steparray = {}
  local stepmax
  local xy = {}
  if JY.Status == GAME_SMAP then
    for i = 0, CC.SWidth - 1 do
      xy[i] = {}
    end
  elseif JY.Status == GAME_MMAP then
    for i = 0, 479 do
      xy[i] = {}
    end
  end
  if flag ~= nil then
    stepmax = 640
  else
    stepmax = 240
  end
  for i = 0, stepmax do
    steparray[i] = {}
    steparray[i].x = {}
    steparray[i].y = {}
  end
  local canpass = function(nx, ny)
    if JY.Status == GAME_SMAP and (nx > CC.SWidth - 1 or ny > CC.SWidth - 1 or nx < 0 or ny < 0) then
      return false
    end
    if JY.Status == GAME_MMAP and (479 < nx or 479 < ny or nx < 1 or ny < 1) then
      return false
    end
    if xy[nx][ny] == nil then
      if JY.Status == GAME_SMAP then
        if SceneCanPass(nx, ny) then
          return true
        end
      elseif JY.Status == GAME_MMAP and (lib.GetMMap(nx, ny, 3) == 0 and lib.GetMMap(nx, ny, 4) == 0 or CanEnterScene(nx, ny) ~= -1) then
        return true
      end
    end
    return false
  end
  local function FindNextStep(step)
    if step == stepmax then
      return
    end
    local step1 = step + 1
    local num = 0
    for i = 1, steparray[step].num do
      if steparray[step].x[i] == xx and steparray[step].y[i] == yy then
        return
      end
      if canpass(steparray[step].x[i] + 1, steparray[step].y[i]) then
        num = num + 1
        steparray[step1].x[num] = steparray[step].x[i] + 1
        steparray[step1].y[num] = steparray[step].y[i]
        xy[steparray[step1].x[num]][steparray[step1].y[num]] = step1
      end
      if canpass(steparray[step].x[i] - 1, steparray[step].y[i]) then
        num = num + 1
        steparray[step1].x[num] = steparray[step].x[i] - 1
        steparray[step1].y[num] = steparray[step].y[i]
        xy[steparray[step1].x[num]][steparray[step1].y[num]] = step1
      end
      if canpass(steparray[step].x[i], steparray[step].y[i] + 1) then
        num = num + 1
        steparray[step1].x[num] = steparray[step].x[i]
        steparray[step1].y[num] = steparray[step].y[i] + 1
        xy[steparray[step1].x[num]][steparray[step1].y[num]] = step1
      end
      if canpass(steparray[step].x[i], steparray[step].y[i] - 1) then
        num = num + 1
        steparray[step1].x[num] = steparray[step].x[i]
        steparray[step1].y[num] = steparray[step].y[i] - 1
        xy[steparray[step1].x[num]][steparray[step1].y[num]] = step1
      end
    end
    if 0 < num then
      steparray[step1].num = num
      FindNextStep(step1)
    end
  end
  steparray[0].num = 1
  steparray[0].x[1] = x
  steparray[0].y[1] = y
  xy[x][y] = 0
  FindNextStep(0)
  local movenum = xy[xx][yy]
  if movenum == nil then
    return
  end
  AutoMoveTab[0] = movenum
  for i = movenum, 1, -1 do
    if xy[xx - 1][yy] == i - 1 then
      xx = xx - 1
      AutoMoveTab[1 + movenum - i] = 1
    elseif xy[xx + 1][yy] == i - 1 then
      xx = xx + 1
      AutoMoveTab[1 + movenum - i] = 2
    elseif xy[xx][yy - 1] == i - 1 then
      yy = yy - 1
      AutoMoveTab[1 + movenum - i] = 3
    elseif xy[xx][yy + 1] == i - 1 then
      yy = yy + 1
      AutoMoveTab[1 + movenum - i] = 0
    end
  end
end
function saveglts(id)
  local filelen, bin, ts
  ts = CONFIG.DataPath .. string.format("save/t%d.grp", id)
  if existFile(ts) == false then
    bin = Byte.create(3000)
    Byte.savefile(bin, ts, 0, 3000)
  end
  filelen = filelength(ts)
  if filelen ~= 3000 then
    os.remove(ts)
    bin = Byte.create(3000)
    Byte.savefile(bin, ts, 0, 3000)
    filelen = filelength(ts)
  end
  JY.GLTS[14][0] = tonumber(os.date("%Y", os.time()))
  JY.GLTS[14][1] = tonumber(os.date("%m", os.time()))
  JY.GLTS[14][2] = tonumber(os.date("%d", os.time()))
  JY.GLTS[14][3] = tonumber(os.date("%H", os.time()))
  JY.GLTS[14][4] = tonumber(os.date("%M", os.time()))
  JY.GLTS[14][5] = tonumber(os.date("%S", os.time()))
  JY.GLTS[14][6] = JY.Book
  JY.GLTS[14][7] = JY.YXNDXZ - 1
  JY.GLTS[14][8] = math.modf(CC.YXND[JY.YXNDXZ][1] * 100)
  JY.GLTS[14][9] = math.modf(CC.YXND[JY.YXNDXZ][2] * 100)
  JY.GLTS[14][10] = math.modf(CC.YXND[JY.YXNDXZ][3] * 100)
  JY.GLTS[14][11] = math.modf(CC.YXND[JY.YXNDXZ][4] * 100)
  JY.GLTS[14][12] = CC.YXMS
  JY.GLTS[14][13] = CC.YXNDA
  os.remove(ts)
  Byte.savefile(JY.Data_GLTS, ts, 0, 3000)
end
function loadglts(id)
  local filelen, bin, ts
  ts = CONFIG.DataPath .. string.format("save/t%d.grp", id)
  if id == 0 then
    os.remove(ts)
  end
  if existFile(ts) == false or id == 0 then
    bin = Byte.create(3000)
    Byte.savefile(bin, ts, 0, 3000)
  end
  filelen = 3000
  if filelen ~= 3000 then
    os.remove(ts)
    bin = Byte.create(3000)
    Byte.savefile(bin, ts, 0, 3000)
    filelen = filelength(ts)
  end
  if 0 < filelen then
    JY.Data_GLTS = Byte.create(filelen)
    Byte.loadfile(JY.Data_GLTS, ts, 0, filelen)
    for i = 0, 14 do
      JY.GLTS[i] = {}
      local meta_t = {
        __index = function(t, k)
          return GetDataFromStruct(JY.Data_GLTS, 200 * i, CC.GLTS_S, k)
        end,
        __newindex = function(t, k, v)
          SetDataFromStruct(JY.Data_GLTS, 200 * i, CC.GLTS_S, k, v)
        end
      }
      setmetatable(JY.GLTS[i], meta_t)
    end
    for i = 0, 13 do
      for j = 0, 99 do
        if 0 < JY.GLTS[i][j] then
          JY.GLTS[i][j] = 1
        else
          JY.GLTS[i][j] = 0
        end
      end
    end
    JY.YXNDXZ = JY.GLTS[14][7] + 1
    if JY.NEWGAME == 0 then
      if JY.GLTS[14][8] == 0 then
        JY.GLTS[14][8] = 100
      end
      if JY.GLTS[14][9] == 0 then
        JY.GLTS[14][9] = 100
      end
      if JY.GLTS[14][10] == 0 then
        JY.GLTS[14][10] = 100
      end
      if JY.GLTS[14][11] == 0 then
        JY.GLTS[14][11] = 100
      end
      CC.YXND[JY.YXNDXZ][1] = JY.GLTS[14][8] / 100
      CC.YXND[JY.YXNDXZ][2] = JY.GLTS[14][9] / 100
      CC.YXND[JY.YXNDXZ][3] = JY.GLTS[14][10] / 100
      CC.YXND[JY.YXNDXZ][4] = JY.GLTS[14][11] / 100
      CC.YXMS = JY.GLTS[14][12]
      CC.YXNDA = JY.GLTS[14][13]
    end
  end
end
function SaveList(ins)
  local idxData = Byte.create(24)
  Byte.loadfile(idxData, CC.R_IDXFilename[0], 0, 24)
  local idx = {}
  idx[0] = 0
  for i = 1, 6 do
    idx[i] = Byte.get32(idxData, 4 * (i - 1))
  end
  local table_struct = {}
  table_struct["姓名"] = {
    idx[1] + 8,
    2,
    10
  }
  table_struct["等级"] = {
    idx[1] + 30,
    0,
    2
  }
  table_struct["无用"] = {
    idx[0] + 2,
    0,
    2
  }
  table_struct["场景名称"] = {
    idx[3] + 2,
    2,
    10
  }
  table_struct["队伍1"] = {
    idx[0] + 24,
    0,
    2
  }
  local len = filelength(CC.R_GRPFilename[0])
  local data = Byte.create(len)
  local slen = filelength(CC.S_Filename[0])
  local sdata = Byte.create(slen)
  local tslen = 3000
  local tsdata = Byte.create(tslen)
  local menu = {}
  for i = 1, 11 do
    local name = ""
    local lv = ""
    local sname = ""
    local nd = ""
    local time = ""
    if existFile(string.format(CC.R_GRPFilename[i])) then
      Byte.loadfile(data, string.format(CC.R_GRPFilename[i]), 0, len)
      local pid = GetDataFromStruct(data, 0, table_struct, "队伍1")
      name = GetDataFromStruct(data, pid * CC.PersonSize, table_struct, "姓名")
      lv = GetDataFromStruct(data, pid * CC.PersonSize, table_struct, "等级") .. "级"
      local wy = GetDataFromStruct(data, 0, table_struct, "无用")
      if wy == -1 then
        sname = "大地图"
      else
        sname = GetDataFromStruct(data, wy * CC.SceneSize, table_struct, "场景名称") .. ""
      end
    end
    local str0 = ""
    local str1 = ""
    local str2 = ""
    local str3 = ""
    local str4 = ""
    local str5 = ""
    local str6 = ""
    if existFile(CONFIG.DataPath .. string.format("save/t%d.grp", i)) then
      str0 = "0000"
      str1 = "00"
      str2 = "00"
      str3 = "00"
      str4 = "00"
      str5 = "00"
      str6 = " 0"
      if filelength(CONFIG.DataPath .. string.format("save/t%d.grp", i)) == 3000 then
        Byte.loadfile(tsdata, CONFIG.DataPath .. string.format("save/t%d.grp", i), 0, tslen)
        local date0 = GetDataFromStruct(tsdata, 2800, CC.GLTS_S, 0)
        local date1 = GetDataFromStruct(tsdata, 2800, CC.GLTS_S, 1)
        local date2 = GetDataFromStruct(tsdata, 2800, CC.GLTS_S, 2)
        local date3 = GetDataFromStruct(tsdata, 2800, CC.GLTS_S, 3)
        local date4 = GetDataFromStruct(tsdata, 2800, CC.GLTS_S, 4)
        local date5 = GetDataFromStruct(tsdata, 2800, CC.GLTS_S, 5)
        local mybook = GetDataFromStruct(tsdata, 2800, CC.GLTS_S, 6)
        if date0 == 0 then
          str0 = "000" .. tostring(date0)
        else
          str0 = tostring(date0)
        end
        if date1 < 10 then
          str1 = "0" .. tostring(date1)
        else
          str1 = tostring(date1)
        end
        if date2 < 10 then
          str2 = "0" .. tostring(date2)
        else
          str2 = tostring(date2)
        end
        if date3 < 10 then
          str3 = "0" .. tostring(date3)
        else
          str3 = tostring(date3)
        end
        if date4 < 10 then
          str4 = "0" .. tostring(date4)
        else
          str4 = tostring(date4)
        end
        if date5 < 10 then
          str5 = "0" .. tostring(date5)
        else
          str5 = tostring(date5)
        end
        menu[i] = {
          string.format("%2d: %-8s  %4s  %-8s  %2d书  %4s/%2s/%2s %2s:%2s:%2s", i, name, lv, sname, mybook, str0, str1, str2, str3, str4, str5),
          nil,
          1
        }
      else
        menu[i] = {
          string.format("%2d: %-8s  %4s  %-8s  %2s书  %4s/%2s/%2s %2s:%2s:%2s", i, name, lv, sname, str6, str0, str1, str2, str3, str4, str5),
          nil,
          1
        }
      end
    else
      menu[i] = {
        string.format("%2d: %-8s  %4s  %-8s  %2s书  %4s/%2s/%2s %2s:%2s:%2s", i, name, lv, sname, str6, str0, str1, str2, str3, str4, str5),
        nil,
        1
      }
    end
  end
  local menux = (CC.ScreenW - 28 * CC.DefaultFont - 2 * CC.MenuBorderPixel) / 2
  local menuy = (CC.ScreenH - 11 * (CC.DefaultFont + CC.RowPixel)) / 2
  if ins == nil then
    ins = 0
  end
  if ins == 15 then
    menu[12] = {
      "                   回家睡觉去",
      nil,
      1
    }
  end
  if ins == 1 then
    menu[11][3] = 0
  end
  local r = ShowMenu(menu, #menu, #menu, menux, menuy, 0, 0, 1, 1, CC.DefaultFont, C_ORANGE, C_WHITE)
  CleanMemory()
  return r
end
function RWPD(did)
  if did <= 0 then
    return false
  end
  for i = 0, 13 do
    for j = 1, 99 do
      if CC.GLTS[i][j] == did then
        return true
      elseif CC.GLTS[i][j] == 0 then
        break
      end
    end
  end
  return false
end
function XueTiao(x, y, xadd, yadd, minnum, maxnum, lmmax, color1, color2, yad)
  if color1 == nil then
    color1 = C_WHITE
  end
  if color2 == nil then
    color2 = RGB(200, 0, 0)
  end
  if yad == nil then
    yad = 0
  end
  local x0 = 0
  local y0 = 0
  if JY.Status == GAME_SMAP then
    x0 = JY.Base["人X1"]
    y0 = JY.Base["人Y1"]
    if x0 <= 7 then
      x0 = 8
    end
    if 52 <= x0 then
      x0 = 51
    end
    if y0 <= 7 then
      y0 = 8
    end
    if 52 <= y0 then
      y0 = 51
    end
  elseif JY.Status == GAME_WMAP then
    x0 = WAR.Person[WAR.CurID]["坐标X"]
    y0 = WAR.Person[WAR.CurID]["坐标Y"]
  elseif JY.Status == GAME_MMAP then
    x0 = JY.Base["人X"]
    y0 = JY.Base["人Y"]
  end
  local xyz = x - x0
  local yyz = y - y0
  local mvx1 = 0
  local mvy1 = 0
  if yyz < 0 then
    mvx1 = mvx1 + 1 * math.abs(yyz)
    mvy1 = mvy1 - 1 * math.abs(yyz)
  end
  if 0 < yyz then
    mvx1 = mvx1 - 1 * math.abs(yyz)
    mvy1 = mvy1 + 1 * math.abs(yyz)
  end
  if xyz < 0 then
    mvx1 = mvx1 - 1 * math.abs(xyz)
    mvy1 = mvy1 - 1 * math.abs(xyz)
  end
  if 0 < xyz then
    mvx1 = mvx1 + 1 * math.abs(xyz)
    mvy1 = mvy1 + 1 * math.abs(xyz)
  end
  local x1 = CC.ScreenW / 2 + CC.XScale * mvx1 - xadd * (maxnum / lmmax) / 2
  local y1 = CC.ScreenH / 2 + CC.YScale * mvy1 - CC.YScale * 8 + yad
  local x2 = x1 + math.modf(xadd * (maxnum / lmmax))
  local y2 = y1 + yadd
  if y2 - y1 < 3 then
    y2 = y1 + 3
  end
  if x2 - x1 < 3 then
    x2 = x1 + 3
  end
  lib.DrawRect(x1, y1, x2, y1, color1)
  lib.DrawRect(x1, y2, x2, y2, color1)
  lib.DrawRect(x1, y1, x1, y2, color1)
  lib.DrawRect(x2, y1, x2, y2, color1)
  local rr, gg, bb = GetRGB(color2)
  local bx2 = x1 + math.modf((x2 - x1) * (minnum / maxnum))
  local k = 0
  if rr > k then
    k = rr
  end
  if gg > k then
    k = gg
  end
  if bb > k then
    k = bb
  end
  local a1 = 0
  local a2 = 0
  local a3 = 0
  local bf = (k - k / 5) / (bx2 - x1 - 1)
  if k == rr then
    a1 = bf
  elseif k == gg then
    a2 = bf
  elseif k == bb then
    a3 = bf
  end
  for i = 1, bx2 - x1 - 1 do
    local r, g, b
    if 0 < a1 then
      r = (math.modf(rr / 5) + math.modf(i * a1)) % 256
    else
      r = rr
    end
    if 0 < a2 then
      g = (math.modf(gg / 5) + math.modf(i * a2)) % 256
    else
      g = gg
    end
    if 0 < a3 then
      b = (math.modf(bb / 5) + math.modf(i * a3)) % 256
    else
      b = bb
    end
    lib.DrawRect(x1 + i, y1 + 1, x1 + i, y2 - 1, RGB(rr, gg, bb))
  end
  if bx2 < x2 - 1 then
    lib.Background(bx2, y1 + 1, x2 - 1, y2 - 1, 128)
  end
end
function ShowXT()
  for i = 0, WAR.PersonNum - 1 do
    if WAR.Person[i]["死亡"] == false then
      local pid = WAR.Person[i]["人物编号"]
      local size = CC.DefaultFont * 0.8 * CONFIG.Zoom / 100 / 2
      local rwsm = JY.Person[pid]["生命"]
      local rwsm1 = "/" .. JY.Person[pid]["生命最大值"]
      local xx = WAR.Person[i]["坐标X"]
      local yy = WAR.Person[i]["坐标Y"]
      local xad = math.modf(size * 2.2)
      local yad = math.modf(size * 0.25)
      local yoff = math.modf(size * 0.8)
      if 0 < rwsm then
        if WAR.Person[i]["我方"] == false then
          XueTiao(xx, yy, xad, yad, JY.Person[pid]["生命"], JY.Person[pid]["生命最大值"], JY.XTMAX, nil, nil, yoff)
        else
          XueTiao(xx, yy, xad, yad, JY.Person[pid]["生命"], JY.Person[pid]["生命最大值"], JY.XTMAX, C_WHITE, RGB(0, 0, 200), yoff)
        end
      end
    end
  end
end
function ShowZhi(x, y)
  local pid = WAR.Person[GetWarMap(x, y, 2)]["人物编号"]
  local size = CC.DefaultFont * CONFIG.Zoom / 100 / 2
  local zhisize = math.modf(size * 0.6)
  local rwsm = JY.Person[pid]["生命"]
  local rwsm1 = "/" .. JY.Person[pid]["生命最大值"]
  local yoff = -math.modf(size * 0.6)
  YYZhi(x, y, nil, 0, 0, 180)
  if rwsm < JY.Person[pid]["生命最大值"] then
    if rwsm > JY.Person[pid]["生命最大值"] / 3 * 2 then
      YYZhi(x, y, string.format("%3d" .. rwsm1, rwsm), nil, nil, nil, C_GOLD, zhisize, 0, yoff)
    elseif rwsm > JY.Person[pid]["生命最大值"] / 3 then
      YYZhi(x, y, string.format("%3d" .. rwsm1, rwsm), nil, nil, nil, C_SHOUSHANG2, zhisize, 0, yoff)
    else
      YYZhi(x, y, string.format("%3d" .. rwsm1, rwsm), nil, nil, nil, C_RED, zhisize, 0, yoff)
    end
  else
    YYZhi(x, y, string.format("%3d" .. rwsm1, rwsm), nil, nil, nil, C_GOLD, zhisize, 0, yoff)
  end
end
function ReadBin()
  local filelen, bin, leave_with_event, leave, effect, match, levelup, v,v1,neigong_match
  leave_with_event = CONFIG.DataPath .. "list/leave_with_event.bin"
  leave = CONFIG.DataPath .. "list/leave.bin"
  effect = CONFIG.DataPath .. "list/effect.bin"
  match = CONFIG.DataPath .. "list/match.bin"
  neigong_match = CONFIG.DataPath .. "list/neigong_match.bin"
  levelup = CONFIG.DataPath .. "list/levelup.bin"

  if file_exist(leave_with_event) == true then
    lib.Debug("read leave_with_event.bin")
    filelen = filelength(leave_with_event)
    if 0 < filelen then
      bin = Byte.create(filelen)
      Byte.loadfile(bin, leave_with_event, 0, filelen)
      CC.PersonExit = {}
      for i = 1, filelen / 4 do
        v = Byte.get16(bin, i * 2 - 2)
        v1 = Byte.get16(bin, filelen / 2 + i * 2 - 2)
        CC.PersonExit[i] = {
          v,
          v1
        }
      end
    end
  else
    lib.Debug("read leave.bin")
    filelen = filelength(leave)
    if 0 < filelen then
      bin = Byte.create(filelen)
      Byte.loadfile(bin, leave, 0, filelen)
      CC.PersonExit = {}
      for i = 1, filelen / 2 do
        v = Byte.get16(bin, i * 2 - 2)
        CC.PersonExit[i] = {
          v,
          CC.Leave + i * 2 - 2
        }
      end
    end
  end

  filelen = filelength(effect)
  if 0 < filelen then
    bin = Byte.create(filelen)
    Byte.loadfile(bin, effect, 0, filelen)
    CC.Effect = {}
    for i = 0, filelen / 2 - 1 do
      v = Byte.get16(bin, i * 2)
      CC.Effect[i] = v
    end
  end
  CC.Effect[0] = CC.Effect[0] - 1
  filelen = filelength(match)
  if 0 < filelen then
    bin = Byte.create(filelen)
    Byte.loadfile(bin, match, 0, filelen)
    CC.ExtraOffense = {}
    for i = 0, filelen / 6 - 1 do
      CC.ExtraOffense[i + 1] = {
        Byte.get16(bin, i * 6),
        Byte.get16(bin, i * 6 + 2),
        Byte.get16(bin, i * 6 + 4)
      }
    end
  end

  -- neigong
  if file_exist(neigong_match) == true then
    filelen = filelength(neigong_match)
    bin = Byte.create(filelen)
    Byte.loadfile(bin, neigong_match, 0, filelen)
    CC.WUGONGNEIGONG = {}
    for i = 0, filelen / 6 - 1 do
      CC.WUGONGNEIGONG[i + 1] = {
        Byte.get16(bin, i * 6),
        Byte.get16(bin, i * 6 + 2),
        Byte.get16(bin, i * 6 + 4)
      }
      lib.Debug(string.format("%d %d", i,CC.WUGONGNEIGONG[i + 1][1]))
    end
  end
  --[[ filelen = filelength(levelup)
  if 0 < filelen then
    bin = Byte.create(filelen)
    Byte.loadfile(bin, levelup, 0, filelen)
    CC.Exp = {}
    for i = 1, filelen / 2 do
      v = Byte.get16(bin, i * 2 - 2)
      CC.Exp[i] = v
    end
  end --]]

  -- level up
  for i = 1, 15 do
    CC.Exp[i] = 30 * i;
  end

  for i = 16, 200 do
    CC.Exp[i] = 3000 + CC.Exp[i - 10] * 2;
    if CC.Exp[i] > 30000 then
      CC.Exp[i] = 30000
    end
  end

end
function Hanhua(SubScene, x, y, str1, str2)
  if JY.SubScene == SubScene then
    local zhisize = CC.DefaultFont * 0.8
    if JY.DHBZ == 0 then
      YYZhi(x + 1, y + 1, str1, nil, nil, nil, M_YellowGreen, zhisize, 0, -zhisize, 1)
    else
      YYZhi(x + 1, y + 1, str2, nil, nil, nil, M_YellowGreen, zhisize, 0, -zhisize, 1)
    end
  end
end
function ZYMS()
  local xmenu1 = {}
  local id
  local rwid = {}
  for i = 1, CC.TeamNum do
    xmenu1[i] = {
      "",
      nil,
      0
    }
    local id = JY.Base["队伍" .. i]
    rwid[i] = id
    if 0 <= id then
      xmenu1[i] = {
        JY.Person[id]["姓名"],
        nil,
        1
      }
    end
  end
  local size = CC.StartMenuFontSize
  local menux = CC.ScreenW / 2 - CC.StartMenuFontSize * 3
  local xr1 = ShowMenu(xmenu1, #xmenu1, 0, menux, CC.ScreenH / 2 - CC.StartMenuFontSize * 6, 0, 0, 1, 1, CC.StartMenuFontSize, C_GOLD, C_WHITE)
  if xr1 == 0 then
    return
  end
  if 0 > JY.Person[rwid[xr1]]["修炼物品"] then
    TalkEx("我身上空空无物。。", rwid[xr1], 0)
    return
  end
  local xlwp = JY.Person[rwid[xr1]]["修炼物品"]
  local xlwg = JY.Thing[xlwp]["练出武功"]
  if xlwg < 0 then
    TalkEx("能给本有用的吗？？", rwid[xr1], 0)
    return
  end
  if JY.Thing[xlwp]["仅修炼人物"] ~= -1 then
    TalkEx("想作弊吗？？建议修改器！", rwid[xr1], 0)
    return
  end
  local xmenu2 = {}
  local wgnum = 0
  local xwgid = {}
  for i = 1, 10 do
    xmenu2[i] = {
      "",
      nil,
      0
    }
    if 0 <= rwid[xr1] then
      local wgid = JY.Person[rwid[xr1]]["武功" .. i]
      local jwgwl = JY.Person[rwid[xr1]]["武功等级" .. i]
      xwgid[i] = {
        wgid,
        i,
        jwgwl
      }
      if 0 < wgid then
        xmenu2[i] = {
          JY.Wugong[wgid]["名称"],
          nil,
          1
        }
        wgnum = wgnum + 1
      end
    end
  end
  local xr2 = ShowMenu(xmenu2, #xmenu2, 0, menux, CC.ScreenH / 2 - CC.StartMenuFontSize * 4, 0, 0, 1, 1, CC.StartMenuFontSize, C_GOLD, C_WHITE)
  if xr2 == 0 then
    return
  end
  local ndnd = JY.NDPER / 100
  if ndnd < 1 then
    ndnd = 1
  end
  for i = 0, math.huge do
    if JY.Thing[i] ~= nil then
      if JY.Thing[i]["练出武功"] == xwgid[xr2][1] then
        if xwgid[xr2][3] < 900 then
          TalkEx("武功满级才能进阶！", rwid[xr1], 0)
          return
        end
        if JY.Wugong[xlwg]["攻击力10"] == 0 and JY.Wugong[xlwg]["移动范围10"] == 0 and JY.Wugong[xwgid[xr2][1]]["攻击力10"] == 0 and JY.Wugong[xwgid[xr2][1]]["移动范围10"] == 0 or JY.Wugong[xlwg]["攻击力10"] ~= 0 and JY.Wugong[xlwg]["移动范围10"] ~= 0 and JY.Wugong[xwgid[xr2][1]]["攻击力10"] ~= 0 and JY.Wugong[xwgid[xr2][1]]["移动范围10"] ~= 0 and JY.Wugong[xlwg]["武功类型"] == JY.Wugong[xwgid[xr2][1]]["武功类型"] then
          if JY.Wugong[xlwg]["攻击力10"] ~= 0 then
            if JY.Wugong[xlwg]["武功类型"] == 1 and JY.Thing[i]["需拳掌功夫"] < JY.Thing[xlwp]["需拳掌功夫"] then
              if JY.Person[rwid[xr1]]["拳掌功夫"] - JY.Thing[i]["加拳掌功夫"] * 10 < JY.Thing[xlwp]["需拳掌功夫"] then
                TalkEx("拳掌功夫太低！", rwid[xr1], 0)
                return
              end
            elseif JY.Wugong[xlwg]["武功类型"] == 2 and JY.Thing[i]["需御剑能力"] < JY.Thing[xlwp]["需御剑能力"] then
              if JY.Person[rwid[xr1]]["御剑能力"] - JY.Thing[i]["加御剑能力"] * 10 < JY.Thing[xlwp]["需御剑能力"] then
                TalkEx("御剑能力太低！", rwid[xr1], 0)
                return
              end
            elseif JY.Wugong[xlwg]["武功类型"] == 3 and JY.Thing[i]["需耍刀技巧"] < JY.Thing[xlwp]["需耍刀技巧"] then
              if JY.Person[rwid[xr1]]["耍刀技巧"] - JY.Thing[i]["加耍刀技巧"] * 10 < JY.Thing[xlwp]["需耍刀技巧"] then
                TalkEx("耍刀技巧太低！", rwid[xr1], 0)
                return
              end
            elseif JY.Wugong[xlwg]["武功类型"] == 4 and JY.Thing[i]["需特殊兵器"] < JY.Thing[xlwp]["需特殊兵器"] then
              if JY.Person[rwid[xr1]]["特殊兵器"] - JY.Thing[i]["加特殊兵器"] * 10 < JY.Thing[xlwp]["需特殊兵器"] then
                TalkEx("特殊兵器太低！", rwid[xr1], 0)
                return
              end
            else
              TalkEx("需要更好的秘籍！", rwid[xr1], 0)
              return
            end
          elseif JY.Thing[i]["需内力"] == JY.Thing[xlwp]["需内力"] and JY.Thing[i]["需内力"] == 0 then
            if JY.Thing[i]["需暗器技巧"] < JY.Thing[xlwp]["需暗器技巧"] then
              if JY.Person[rwid[xr1]]["暗器技巧"] - JY.Thing[i]["加暗器技巧"] * 10 < JY.Thing[xlwp]["需暗器技巧"] then
                TalkEx("暗器技巧太低！", rwid[xr1], 0)
                return
              end
            elseif JY.Thing[i]["需轻功"] < JY.Thing[xlwp]["需轻功"] then
              if JY.Person[rwid[xr1]]["轻功"] - JY.Thing[i]["加轻功"] * 10 < JY.Thing[xlwp]["需轻功"] then
                TalkEx("轻功太低！", rwid[xr1], 0)
                return
              end
            else
              TalkEx("需要更好的秘籍！", rwid[xr1], 0)
              return
            end
          elseif JY.Thing[i]["需内力"] < JY.Thing[xlwp]["需内力"] and JY.Thing[i]["需暗器技巧"] == JY.Thing[xlwp]["需暗器技巧"] and JY.Thing[i]["需轻功"] == JY.Thing[xlwp]["需轻功"] then
            if JY.Person[rwid[xr1]]["内力"] - JY.Thing[i]["加内力"] * 10 < JY.Thing[xlwp]["需内力"] then
              TalkEx("内力太低！", rwid[xr1], 0)
              return
            end
          else
            TalkEx("需要更好的秘籍！", rwid[xr1], 0)
            return
          end
        else
          TalkEx("这不合适！", rwid[xr1], 0)
          return
        end
        for kk = 1, 10 do
          if JY.Person[rwid[xr1]]["武功" .. kk] == xlwg then
            TalkEx("这不好玩！", rwid[xr1], 0)
            return
          end
        end
        local wgl = xwgid[xr2][2]
        local level = math.modf((JY.Person[rwid[xr1]]["武功等级" .. wgl] + 100) / 100)
        local size = CC.DefaultFont
        local x1 = CC.ScreenW / 2 - size * 7
        local ysize = size * 1.1
        local y1 = size * 4
        local x2 = CC.ScreenW / 2 + size * 7
        local y2 = CC.ScreenH - y1
        TalkEx("此时周围突然狂风大作，只见天空一道金光下来伴随一声巨响，击中" .. JY.Person[rwid[xr1]]["姓名"] .. "，只见其两眼一黑，便即晕死了过去。。", 999, 0)
        instruct_14()
        instruct_13()
        TalkEx("几个时辰后。。" .. JY.Person[rwid[xr1]]["姓名"] .. "徐徐醒来，发现身上的某种力量开始流失，而新的力量开始涌动！", 999, 0)
        Cls()
        DrawBox(x1, y1, x2, y2, C_WHITE)
        DrawString(x1 + size, y1 + ysize * 0, string.format("%s 忘记了 %s", JY.Person[rwid[xr1]]["姓名"], JY.Wugong[xwgid[xr2][1]]["名称"]), C_GOLD, size)
        local xinum = 1
        local xxsx = function(str1, str2)
          local sx1 = JY.Thing[i][str1]
          local xxs1
          if 0 < sx1 then
            if str1 == "加攻击力" or str1 == "加防御力" or str1 == "加轻功" or str1 == "加攻击带毒" then
              xxs1 = math.modf(sx1 * level) * 1
              JY.Person[rwid[xr1]][str2] = JY.Person[rwid[xr1]][str2] - xxs1
            else
              xxs1 = math.modf(sx1 * level) * 1
              JY.Person[rwid[xr1]][str2] = JY.Person[rwid[xr1]][str2] - xxs1
            end
          elseif sx1 < 0 then
            if str1 == "加攻击力" or str1 == "加防御力" or str1 == "加轻功" or str1 == "加攻击带毒" then
              xxs1 = math.modf(sx1 * level) * 1
              JY.Person[rwid[xr1]][str2] = JY.Person[rwid[xr1]][str2] - xxs1
            else
              xxs1 = math.modf(sx1 * level) * 1
              JY.Person[rwid[xr1]][str2] = JY.Person[rwid[xr1]][str2] - xxs1
            end
          end
          if sx1 ~= 0 then
            xinum = xinum + 1
            if 0 <= xxs1 then
              DrawString(x1 + size, y1 + ysize * xinum, string.format("%s -%d", str2, xxs1), C_WHITE, size)
            else
              DrawString(x1 + size, y1 + ysize * xinum, string.format("%s +%d", str2, xxs1), C_WHITE, size)
            end
          end
        end
        xxsx("加生命", "生命")
        xxsx("加生命最大值", "生命最大值")
        xxsx("加内力", "内力")
        xxsx("加内力最大值", "内力最大值")
        xxsx("加攻击力", "攻击力")
        xxsx("加轻功", "轻功")
        xxsx("加防御力", "防御力")
        xxsx("加医疗能力", "医疗能力")
        xxsx("加用毒能力", "用毒能力")
        xxsx("加解毒能力", "解毒能力")
        xxsx("加抗毒能力", "抗毒能力")
        xxsx("加拳掌功夫", "拳掌功夫")
        xxsx("加御剑能力", "御剑能力")
        xxsx("加耍刀技巧", "耍刀技巧")
        xxsx("加特殊兵器", "特殊兵器")
        xxsx("加暗器技巧", "暗器技巧")
        xxsx("加武学常识", "武学常识")
        xxsx("加攻击带毒", "攻击带毒")
        if 0 < JY.Thing[i]["加攻击次数"] then
          xxsx("加攻击次数", "左右互搏")
          JY.Person[rwid[xr1]]["左右互搏"] = 0
        end
        ShowScreen()
        WaitKey(0)
        JY.Person[rwid[xr1]]["武功" .. wgl] = xlwg
        JY.Person[rwid[xr1]]["武功等级" .. wgl] = 0
        JY.Person[rwid[xr1]]["生命"] = JY.Person[rwid[xr1]]["生命"] + JY.Thing[xlwp]["加生命"]
        JY.Person[rwid[xr1]]["生命最大值"] = JY.Person[rwid[xr1]]["生命最大值"] +  JY.Thing[xlwp]["加生命最大值"]
        JY.Person[rwid[xr1]]["内力"] = JY.Person[rwid[xr1]]["内力"] + JY.Thing[xlwp]["加内力"]
        JY.Person[rwid[xr1]]["内力最大值"] = JY.Person[rwid[xr1]]["内力最大值"] + JY.Thing[xlwp]["加内力最大值"]
        JY.Person[rwid[xr1]]["攻击力"] = JY.Person[rwid[xr1]]["攻击力"] + JY.Thing[xlwp]["加攻击力"]
        JY.Person[rwid[xr1]]["轻功"] = JY.Person[rwid[xr1]]["轻功"] + JY.Thing[xlwp]["加轻功"]
        JY.Person[rwid[xr1]]["防御力"] = JY.Person[rwid[xr1]]["防御力"] + JY.Thing[xlwp]["加防御力"]
        JY.Person[rwid[xr1]]["医疗能力"] = JY.Person[rwid[xr1]]["医疗能力"] + JY.Thing[xlwp]["加医疗能力"]
        JY.Person[rwid[xr1]]["用毒能力"] = JY.Person[rwid[xr1]]["用毒能力"] + JY.Thing[xlwp]["加用毒能力"]
        JY.Person[rwid[xr1]]["解毒能力"] = JY.Person[rwid[xr1]]["解毒能力"] + JY.Thing[xlwp]["加解毒能力"]
        JY.Person[rwid[xr1]]["抗毒能力"] = JY.Person[rwid[xr1]]["抗毒能力"] + JY.Thing[xlwp]["加抗毒能力"]
        JY.Person[rwid[xr1]]["拳掌功夫"] = JY.Person[rwid[xr1]]["拳掌功夫"] + JY.Thing[xlwp]["加拳掌功夫"]
        JY.Person[rwid[xr1]]["御剑能力"] = JY.Person[rwid[xr1]]["御剑能力"] + JY.Thing[xlwp]["加御剑能力"]
        JY.Person[rwid[xr1]]["耍刀技巧"] = JY.Person[rwid[xr1]]["耍刀技巧"] + JY.Thing[xlwp]["加耍刀技巧"]
        JY.Person[rwid[xr1]]["特殊兵器"] = JY.Person[rwid[xr1]]["特殊兵器"] + JY.Thing[xlwp]["加特殊兵器"]
        JY.Person[rwid[xr1]]["暗器技巧"] = JY.Person[rwid[xr1]]["暗器技巧"] + JY.Thing[xlwp]["加暗器技巧"]
        JY.Person[rwid[xr1]]["武学常识"] = JY.Person[rwid[xr1]]["武学常识"] + JY.Thing[xlwp]["加武学常识"]
        JY.Person[rwid[xr1]]["攻击带毒"] = JY.Person[rwid[xr1]]["攻击带毒"] + JY.Thing[xlwp]["加攻击带毒"]
        if 0 < JY.Thing[xlwp]["加攻击次数"] then
          JY.Person[rwid[xr1]]["左右互搏"] = 1
        end
        Cls()
        DrawStrBoxWaitKey(JY.Person[rwid[xr1]]["姓名"] .. "的 " .. JY.Wugong[xwgid[xr2][1]]["名称"] .. " 进阶成为 " .. JY.Wugong[xlwg]["名称"], C_GOLD, CC.DefaultFont)
        break
      end
    else
      TalkEx("此乃天生技能！！", 999, 0)
      break
    end
  end
end
function CCFZB()
  CC.ZCOPEN = 0
  CC.JS = 0
  if CC.ExpCS > 2 or CC.ExpCS < 1 then
    CC.ExpCS = 1
  end
  CC.NUMBER = #CC.RUNSTR
  for i = 0, 14 do
    for j = 0, 99 do
      if CC.GLTS[i][j] == nil then
        CC.GLTS[i][j] = 0
      end
    end
  end
  if CC.PersonAttribMax["经验"] > 30000 then
    CC.PersonAttribMax["经验"] = 30000
  end
  if 30000 < CC.PersonAttribMax["物品修炼点数"] then
    CC.PersonAttribMax["物品修炼点数"] = 30000
  end
  if 30000 < CC.PersonAttribMax["修炼点数"] then
    CC.PersonAttribMax["修炼点数"] = 30000
  end
  if CC.PersonAttribMax["生命最大值"] > 10000 then
    CC.PersonAttribMax["生命最大值"] = 10000
  end
  if CC.PersonAttribMax["受伤程度"] > 100 then
    CC.PersonAttribMax["受伤程度"] = 100
  end
  if 100 < CC.PersonAttribMax["中毒程度"] then
    CC.PersonAttribMax["中毒程度"] = 100
  end
  if 10000 < CC.PersonAttribMax["内力最大值"] then
    CC.PersonAttribMax["内力最大值"] = 10000
  end
  if 100 < CC.PersonAttribMax["体力"] then
    CC.PersonAttribMax["体力"] = 100
  end
  if CC.PersonAttribMax["攻击力"] > 5000 then
    CC.PersonAttribMax["攻击力"] = 5000
  end
  if 5000 < CC.PersonAttribMax["防御力"] then
    CC.PersonAttribMax["防御力"] = 5000
  end
  if CC.PersonAttribMax["轻功"] > 1000 then
    CC.PersonAttribMax["轻功"] = 1000
  end
  if 1000 < CC.PersonAttribMax["医疗能力"] then
    CC.PersonAttribMax["医疗能力"] = 1000
  end
  if 1000 < CC.PersonAttribMax["用毒能力"] then
    CC.PersonAttribMax["用毒能力"] = 1000
  end
  if 1000 < CC.PersonAttribMax["解毒能力"] then
    CC.PersonAttribMax["解毒能力"] = 1000
  end
  if 1000 < CC.PersonAttribMax["抗毒能力"] then
    CC.PersonAttribMax["抗毒能力"] = 1000
  end
  if CC.PersonAttribMax["拳掌功夫"] > 5000 then
    CC.PersonAttribMax["拳掌功夫"] = 5000
  end
  if 5000 < CC.PersonAttribMax["御剑能力"] then
    CC.PersonAttribMax["御剑能力"] = 5000
  end
  if 5000 < CC.PersonAttribMax["耍刀技巧"] then
    CC.PersonAttribMax["耍刀技巧"] = 5000
  end
  if 5000 < CC.PersonAttribMax["特殊兵器"] then
    CC.PersonAttribMax["特殊兵器"] = 5000
  end
  if 3000 < CC.PersonAttribMax["暗器技巧"] then
    CC.PersonAttribMax["暗器技巧"] = 3000
  end
    if 800 < CC.PersonAttribMax["武学常识"] then
    CC.PersonAttribMax["武学常识"] = 800
	end
  if 100 < CC.PersonAttribMax["品德"] then
    CC.PersonAttribMax["品德"] = 100
  end
  if 100 < CC.PersonAttribMax["资质"] then
    CC.PersonAttribMax["资质"] = 100
  end
  if 100 < CC.PersonAttribMax["攻击带毒"] then
    CC.PersonAttribMax["攻击带毒"] = 100
  end
  CC.MAXSX[1] = CC.PersonAttribMax["生命最大值"]
  CC.MAXSX[2] = CC.PersonAttribMax["内力最大值"]
  CC.MAXSX[3] = CC.PersonAttribMax["攻击力"]
  CC.MAXSX[4] = CC.PersonAttribMax["防御力"]
  CC.MAXSX[5] = CC.PersonAttribMax["拳掌功夫"]
  CC.MAXSX[6] = CC.PersonAttribMax["御剑能力"]
  CC.MAXSX[7] = CC.PersonAttribMax["耍刀技巧"]
  CC.MAXSX[8] = CC.PersonAttribMax["特殊兵器"]
  if CONFIG.Operation == 1 then
    VK_SPACE = VK_RETURN
  end
  CC.FK = 1
  CC.FKUP = 1
  CC.RB = 1
  for i = 1, #CC.YXND do
    for k = 1, 4 do
      if CC.YXND[i][k] < 0.5 then
        CC.YXND[i][k] = 0.5
      elseif 2 < CC.YXND[i][k] then
        CC.YXND[i][k] = 2
      end
    end
  end
  if CC.TeamWarNum > 12 then
    CC.TeamWarNum = 12
  elseif 6 > CC.TeamWarNum then
    CC.TeamWarNum = 6
  end
  for i = 1, 7 do
    if CC.ZZADD[i] > 10 then
      CC.ZZADD[i] = 10
    end
    if 10 < CC.QGADD[i] then
      CC.QGADD[i] = 10
    end
    if 10 < CC.TSZZADD[i] then
      CC.TSZZADD[i] = 10
    end
    if 10 < CC.TSQGADD[i] then
      CC.TSQGADD[i] = 10
    end
    if 2 < CC.UPADD[i] then
      CC.UPADD[i] = 2
    end
    if 2 < CC.TSUPADD[i] then
      CC.TSUPADD[i] = 2
    end
  end
  if CC.YXNDA == 0 then
  elseif CC.YXNDA == 1 then
  elseif CC.YXNDA == 2 then
  end
  if 10 > CC.SXYQ then
    CC.SXYQ = 10
  end
  if 10 > CC.YXBQZ then
    CC.YXBQZ = 10
  end
  if 10 < CC.DUDX then
    CC.DUDX = 10
  end
  CC.MSSX = 100
end
function tiaosx()
  for i = 0, 1000 do
    if JY.Person[i] == nil then
      break
    end
    JY.Person[i]["轻功"] = math.modf(JY.Person[i]["轻功"] * 1.5)
    if JY.Person[i]["轻功"] > 320 then
      JY.Person[i]["轻功"] = 320
    end
    JY.Person[i]["拳掌功夫"] = math.modf(JY.Person[i]["拳掌功夫"] * 1.6)
    JY.Person[i]["御剑能力"] = math.modf(JY.Person[i]["御剑能力"] * 1.6)
    JY.Person[i]["耍刀技巧"] = math.modf(JY.Person[i]["耍刀技巧"] * 1.6)
    JY.Person[i]["特殊兵器"] = math.modf(JY.Person[i]["特殊兵器"] * 1.6)
  end
end
function KGZS(scene, id)
  if GetD(scene, id, 2) > 0 then
    JY.SubScene = scene
    Cls()
    DrawStrBox(-1, CC.ScreenH / 2 - CC.DefaultFont * 3, "开局助手带你从" .. JY.Scene[scene]["名称"] .. "偷到..", C_WHITE, CC.DefaultFont)
    ShowScreen()
    WaitKey()
    EventExecute(id, 1)
  end
end
function menu_kgzs()
  if CC.TSJZS == 1 then
    KGZS(0, 2)
    KGZS(0, 3)
    KGZS(0, 5)
    KGZS(9, 5)
    KGZS(9, 6)
    KGZS(9, 7)
    KGZS(9, 8)
    KGZS(20, 15)
    KGZS(20, 16)
    KGZS(21, 12)
    KGZS(21, 13)
    KGZS(23, 2)
    KGZS(23, 3)
    KGZS(23, 4)
    KGZS(23, 5)
    KGZS(23, 9)
    KGZS(24, 10)
    KGZS(24, 13)
    KGZS(28, 84)
    KGZS(30, 1)
    KGZS(30, 2)
    KGZS(30, 3)
    KGZS(30, 4)
    KGZS(30, 5)
    KGZS(33, 28)
    KGZS(35, 11)
    KGZS(37, 9)
    KGZS(37, 11)
    KGZS(38, 8)
    KGZS(40, 32)
    KGZS(121, 9)
    JY.SubScene = CC.NewGameSceneID
  end
end
function wdtest()
  JY.Person[0]["内力最大值"] = CC.PersonAttribMax["内力最大值"]
  JY.Person[0]["生命最大值"] = CC.PersonAttribMax["生命最大值"]
  JY.Person[0]["生命"] = JY.Person[0]["生命最大值"]
  JY.Person[0]["内力"] = JY.Person[0]["内力最大值"]
  JY.Person[0]["攻击力"] = CC.PersonAttribMax["攻击力"]
  JY.Person[0]["防御力"] = CC.PersonAttribMax["防御力"]
  JY.Person[0]["轻功"] = CC.PersonAttribMax["轻功"]
  JY.Person[0]["医疗能力"] = CC.PersonAttribMax["医疗能力"]
  JY.Person[0]["用毒能力"] = CC.PersonAttribMax["用毒能力"]
  JY.Person[0]["解毒能力"] = CC.PersonAttribMax["解毒能力"]
  JY.Person[0]["抗毒能力"] = CC.PersonAttribMax["抗毒能力"]
  JY.Person[0]["拳掌功夫"] = CC.PersonAttribMax["拳掌功夫"]
  JY.Person[0]["御剑能力"] = CC.PersonAttribMax["御剑能力"]
  JY.Person[0]["耍刀技巧"] = CC.PersonAttribMax["耍刀技巧"]
  JY.Person[0]["特殊兵器"] = CC.PersonAttribMax["特殊兵器"]
  JY.Person[0]["暗器技巧"] = CC.PersonAttribMax["暗器技巧"]
  JY.Person[0]["武学常识"] = CC.PersonAttribMax["武学常识"]
  JY.Person[0]["生命增长"] = CC.PersonAttribMax["生命增长"]
  JY.Person[0]["外号"] = "超神"
  JY.Person[0]["内力性质"] = 2
  JY.Person[0]["受伤程度"] = 0
  JY.Person[0]["中毒程度"] = 0
  JY.Person[0]["左右互搏"] = 1
  local gjmax = 0
  local maxid = 1
  for i = 1, 1000 do
    if JY.Wugong[i] ~= nil then
      if JY.Wugong[i]["攻击范围"] == 3 and gjmax < JY.Wugong[i]["攻击力10"] then
        gjmax = JY.Wugong[i]["攻击力10"]
        maxid = i
      end
    else
      break
    end
  end
  local add = 0
  for i = 1, 10 do
    if JY.Person[0]["武功" .. i] == 0 then
      JY.Person[0]["武功" .. i] = maxid
      JY.Person[0]["武功等级" .. i] = 900
      add = 1
      break
    end
  end
  if add == 0 then
    JY.Person[0]["武功10"] = maxid
    JY.Person[0]["武功等级10"] = 900
  end
  for i = 1, CC.MyThingNum do
    if JY.Thing[i] == nil then
      break
    end
    JY.Base["物品" .. i] = i
    JY.Base["物品数量" .. i] = 1
  end
end
