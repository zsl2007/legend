CONFIG = {}
CONFIG.Debug = 1
CONFIG.Type = 1
CONFIG.Width = 800
CONFIG.Height = 600
CONFIG.bpp = 32
CONFIG.FullScreen = 0
CONFIG.EnableSound = 1
CONFIG.MusicVolume = 20
CONFIG.SoundVolume = 10
CONFIG.KeyRepeat = 0
CONFIG.KeyRepeatDelay = 120
CONFIG.KeyRePeatInterval = 30
CONFIG.XScale = 18
CONFIG.YScale = 9
CONFIG.CharSet = 0
CONFIG.LargeMemory = 1
CONFIG.Operation = 0
CONFIG.KeyScale = 2400
CONFIG.D1X = -1
CONFIG.D1Y = -1
CONFIG.D2X = -1
CONFIG.D2Y = -1
CONFIG.D3X = -1
CONFIG.D3Y = -1
CONFIG.D4X = -1
CONFIG.D4Y = -1
CONFIG.C1X = -1
CONFIG.C1Y = -1
CONFIG.C2X = -1
CONFIG.C2Y = -1
CONFIG.AX = -1
CONFIG.AY = -1
CONFIG.BX = -1
CONFIG.BY = -1
CONFIG.NGHT = 0
CONFIG.PlayName = "徐小侠"
CONFIG.MOD = 0
CONFIG.CurrentPath = config.GetPath()
dofile(CONFIG.CurrentPath .. "set.ini")
if CONFIG.Operation == 1 then
  CONFIG.Width = lib.GetScreenW()
  CONFIG.Height = lib.GetScreenH()
elseif CONFIG.Operation == 0 and (CONFIG.Width == 0 or CONFIG.Height == 0) then
  CONFIG.Width = 800
  CONFIG.Height = 600
end
CONFIG.DataPath = CONFIG.CurrentPath .. "data/"
CONFIG.PicturePath = CONFIG.DataPath .. "pic/"
CONFIG.SoundPath = CONFIG.DataPath .. "sound/"
CONFIG.ScriptPath = CONFIG.CurrentPath .. "script/"
CONFIG.CEventPath = CONFIG.ScriptPath .. "CEvent/"
CONFIG.WuGongPath = CONFIG.ScriptPath .. "WuGong/"
CONFIG.HelpPath = CONFIG.DataPath .. "Help/"
CONFIG.NewEventPath = CONFIG.ScriptPath .. "newevent/"
CONFIG.HeadPath = CONFIG.DataPath .. "head/"
CONFIG.ScriptLuaPath = string.format("?.lua;%sscript/?.lua;%sdata/?.lua", CONFIG.CurrentPath, CONFIG.CurrentPath, CONFIG.CurrentPath)
CONFIG.JYMain_Lua = CONFIG.ScriptPath .. "jymain.lua"
CONFIG.FontName = CONFIG.CurrentPath .. "font/font.ttc"
if CONFIG.MP3 == 0 then
  CONFIG.MidSF2 = CONFIG.DataPath .. "sound/mid.sf2"
else
  CONFIG.MidSF2 = ""
end
CONFIG.MMapAddX = 2
CONFIG.MMapAddY = 2
CONFIG.SMapAddX = 2
CONFIG.SMapAddY = 16
CONFIG.WMapAddX = 2
CONFIG.WMapAddY = 16
if CONFIG.LargeMemory == 1 then
  CONFIG.MAXCacheNum = 1000
  CONFIG.CleanMemory = 0
  CONFIG.LoadFullS = 1
else
  CONFIG.MAXCacheNum = 500
  CONFIG.CleanMemory = 1
  CONFIG.LoadFullS = 0
end
if CONFIG.Zoom == 0 then
  CONFIG.Zoom = math.modf(CONFIG.Height / 360 * 10) * 10
elseif CONFIG.Zoom < 100 and 500 < CONFIG.Zoom then
  CONFIG.Zoom = 100
end
if CONFIG.Zoom < 100 then
  CONFIG.Zoom = 100
end
if CONFIG.Zoom >= 100 then
  CONFIG.YScale = CONFIG.YScale * CONFIG.Zoom / 100
  CONFIG.XScale = CONFIG.YScale * 2
end
if CONFIG.ANWZ == 1 then
  CONFIG.D1X = CONFIG.Width / 5
  CONFIG.D1Y = CONFIG.Height * 2 / 5
  CONFIG.D2X = CONFIG.Width / 5 + CONFIG.Height / 5
  CONFIG.D2Y = CONFIG.Height * 3 / 5
  CONFIG.D3X = CONFIG.Width / 5
  CONFIG.D3Y = CONFIG.Height * 4 / 5
  CONFIG.D4X = CONFIG.Width / 5 - CONFIG.Height / 5
  CONFIG.D4Y = CONFIG.Height * 3 / 5
  CONFIG.C1X = CONFIG.Width * 7 / 10 + CONFIG.Width / 6
  CONFIG.C1Y = CONFIG.Height * 2 / 5
  CONFIG.C2X = CONFIG.Width * 7 / 10
  CONFIG.C2Y = CONFIG.Height * 2 / 5
  CONFIG.AX = CONFIG.Width * 7 / 10
  CONFIG.AY = CONFIG.Height * 7 / 10
  CONFIG.BX = CONFIG.Width * 7 / 10 + CONFIG.Width / 6
  CONFIG.BY = CONFIG.Height * 7 / 10
end
