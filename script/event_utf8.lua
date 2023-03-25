if szlzw.MOD ~= 1 then
  return
end
function oldCallEvent(eventnum)
  ReadKDEF(eventnum)
  if eventnum == CC.NewGameEvent then
    for i = 0, 255 do
      ReadCol(i)
    end
  end
  for i = 1, 13 do
    for j = 1, 99 do
      if not (0 >= CC.GLTS[i][j]) then
        if CC.GLTS[i][j] == eventnum then
          JY.GLTS[i][j] = 1
        end
      end
    end
  end
end
--[[ function ReadBin()
  local filelen, bin, leave, effect, match, levelup, v
  leave = CONFIG.DataPath .. "list/leave.bin"
  effect = CONFIG.DataPath .. "list/effect.bin"
  match = CONFIG.DataPath .. "list/match.bin"
  levelup = CONFIG.DataPath .. "list/levelup.bin"
  filelen = filelength(leave)
  if filelen > 0 then
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
  filelen = filelength(effect)
  if filelen > 0 then
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
  if filelen > 0 then
    bin = Byte.create(filelen)
    Byte.loadfile(bin, match, 0, filelen)
    CC.ExtraOffense = {}
    for i = 0, filelen / 3 - 1 do
      CC.ExtraOffense[i + 1] = {
        Byte.get16(bin, i * 6),
        Byte.get16(bin, i * 6 + 2),
        Byte.get16(bin, i * 6 + 4)
      }
    end
  end
  filelen = filelength(levelup)
  if filelen > 0 then
    bin = Byte.create(filelen)
    Byte.loadfile(bin, levelup, 0, filelen)
    CC.Exp = {}
    for i = 1, filelen / 2 do
      v = Byte.get16(bin, i * 2 - 2)
      CC.Exp[i] = v
    end
  end
end --]]
function ReadCol(id)
  local r, g, b, col
  col = Byte.create(4)
  Byte.loadfile(col, CONFIG.DataPath .. "mmap.col", id * 3, 3)
  b, g, r = GetRGB(Byte.get32(col, 0))
  return RGB(r * 4, g * 4, b * 4)
end
x50 = {}
function ReadKDEF(id)
  local kidx, tmp_x, tmp_y, tmp_x1, tmp_y1, idx1, idx2
  if id < 1 then
    return
  else
    kidx = Byte.create(8)
    Byte.loadfile(kidx, CC.KDX, id * 4 - 4, 8)
    idx1 = Byte.get32(kidx, 0)
    idx2 = Byte.get32(kidx, 4)
  end
  local len = idx2 - idx1
  local kdef = Byte.create(len)
  Byte.loadfile(kdef, CC.KRP, idx1, len)
  local E = {}
  len = len / 2
  for i = 0, len - 1 do
    E[i] = Byte.get16(kdef, 2 * i)
  end
  local idx = 0
  local getb = function(b, num)
    num = math.modf(num / 2 ^ b)
    num = math.fmod(num, 2)
    return num
  end
  local getvaule = function(b, t, ee)
    if getb(b, t) == 1 then
      local rv = x50[ee] or 0
      if type(rv) == "string" then
        local l = string.byte(rv, 1) or 0
        local h = string.byte(rv, 2) or 0
        rv = l + h * 256
      end
      return rv
    else
      return ee
    end
  end
  local getchar = function(char)
    local l, h
    if char < 0 then
      char = 65536 + char
    end
    l = char % 256
    h = math.modf(char / 256)
    l = string.char(l)
    if h == 0 then
      return l
    else
      h = string.char(h)
      return l .. h
    end
  end
  local newinstruct_50_sub = {
    [0] = function(e1, e2, e3, e4, e5, e6)
      x50[e1] = e2
    end,
    [1] = function(e1, e2, e3, e4, e5, e6)
      e4 = getvaule(0, e1, e4)
      e5 = getvaule(1, e1, e5)
      if e2 == 0 then
        x50[e3 + e4] = e5
      elseif e2 == 1 then
        x50[e3 + e4] = e5 % 256
      end
    end,
    [2] = function(e1, e2, e3, e4, e5, e6)
      e4 = getvaule(0, e1, e4)
      local num = getvaule(0, 1, e3 + e4)
      if e2 == 1 then
        num = num % 256
      end
      x50[e5] = num
    end,
    [3] = function(e1, e2, e3, e4, e5, e6)
      if e2 == 5 then
        e4 = getvaule(0, 1, e4)
        if e4 < 0 then
          e4 = 65536 + e4
        end
        e2 = 3
      else
        e4 = getvaule(0, 1, e4)
      end
      e5 = getvaule(0, e1, e5)
      if e2 == 0 then
        x50[e3] = e4 + e5
      elseif e2 == 1 then
        x50[e3] = e4 - e5
      elseif e2 == 2 then
        x50[e3] = e4 * e5
      elseif e2 == 3 then
        x50[e3] = math.modf(e4 / e5)
      elseif e2 == 4 then
        x50[e3] = e4 % e5
      end
    end,
    [4] = function(e1, e2, e3, e4, e5, e6)
      x50[28672] = 1
      e3 = getvaule(0, 1, e3)
      e4 = getvaule(0, e1, e4)
      if e2 == 0 and e3 < e4 then
        x50[28672] = 0
      elseif e2 == 1 and e3 <= e4 then
        x50[28672] = 0
      elseif e2 == 2 and e3 == e4 then
        x50[28672] = 0
      elseif e2 == 3 and e3 ~= e4 then
        x50[28672] = 0
      elseif e2 == 4 and e3 >= e4 then
        x50[28672] = 0
      elseif e2 == 5 and e3 > e4 then
        x50[28672] = 0
      elseif e2 == 6 then
        x50[28672] = 0
      end
    end,
    [5] = function(e1, e2, e3, e4, e5, e6)
      for i = 0, 32767 do
        x50[i] = 0
      end
    end,
    [6] = function(e1, e2, e3, e4, e5, e6)
      x50[e2] = 0
    end,
    [8] = function(e1, e2, e3, e4, e5, e6)
      e2 = getvaule(0, e1, e2)
      local str = ReadTALK(e2, 1)
      str = string.gsub(str, "\r", "")
      local len = math.modf(0.5 + string.len(str) / 2)
      for i = 0, len - 1 do
        x50[e3 + i] = string.sub(str, i * 2 + 1, i * 2 + 2)
      end
      x50[e3 + len] = 0
      CC.TalkString = "1"
    end,
    [9] = function(e1, e2, e3, e4, e5, e6)
      e4 = getvaule(0, e1, e4)
      local str = ""
      for i = 0, 1000 do
        local char = x50[e3 + i] or 0
        if type(char) == "string" then
          str = str .. char
        elseif char ~= 0 then
          str = str .. getchar(char)
        else
          break
        end
      end
      str = string.format(str, e4)
      str = string.gsub(str, "\r", "")
      local len = math.modf(0.5 + string.len(str) / 2)
      for i = 0, len - 1 do
        x50[e2 + i] = string.sub(str, i * 2 + 1, i * 2 + 2)
      end
      x50[e2 + len] = 0
    end,
    [10] = function(e1, e2, e3, e4, e5, e6)
      for i = 0, 1000 do
        local char = x50[e1 + i] or 0
        if type(char) == "string" then
        elseif char ~= 0 then
        else
          x50[e2] = i * 2
          break
        end
      end
    end,
    [11] = function(e1, e2, e3, e4, e5, e6)
      local stra, strb, strx = "", "", nil
      for i = 0, 1000 do
        local char = x50[e2 + i] or 0
        if type(char) == "string" then
          stra = stra .. char
        elseif char ~= 0 then
          stra = stra .. getchar(char)
        else
          break
        end
      end
      for i = 0, 1000 do
        local char = x50[e3 + i] or 0
        if type(char) == "string" then
          strb = strb .. char
        elseif char ~= 0 then
          strb = strb .. getchar(char)
        else
          break
        end
      end
      strx = stra .. strb
      strx = string.gsub(strx, "\r", "")
      local len = math.modf(0.5 + string.len(strx) / 2)
      for i = 0, len - 1 do
        x50[e1 + i] = string.sub(strx, i * 2 + 1, i * 2 + 2)
      end
      x50[e1 + len] = 0
      strx = lib.CharSet(strx, 0)
      stra = lib.CharSet(stra, 0)
      strb = lib.CharSet(strb, 0)
      CC.TalkString = "1"
    end,
    [12] = function(e1, e2, e3, e4, e5, e6)
      e3 = getvaule(0, e1, e3)
      local len = math.modf(0.5 + e3 / 2)
      for i = 0, len - 1 do
        x50[e2 + i] = "  "
      end
      x50[e2 + len] = 0
    end,
    [16] = function(e1, e2, e3, e4, e5, e6)
      e3 = getvaule(0, e1, e3)
      e4 = getvaule(1, e1, e4)
      e5 = getvaule(2, e1, e5)
      local v
      if e2 == 0 then
        Byte.set16(JY.Data_Person, CC.PersonSize * e3 + e4, e5)
      elseif e2 == 1 then
        Byte.set16(JY.Data_Thing, CC.ThingSize * e3 + e4, e5)
      elseif e2 == 2 then
        Byte.set16(JY.Data_Scene, CC.SceneSize * e3 + e4, e5)
      elseif e2 == 3 then
        Byte.set16(JY.Data_Wugong, CC.WugongSize * e3 + e4, e5)
      elseif e2 == 4 then
        Byte.set16(JY.Data_Shop, CC.ShopSize * e3 + e4, e5)
      end
    end,
    [17] = function(e1, e2, e3, e4, e5, e6)
      e3 = getvaule(0, e1, e3)
      e4 = getvaule(1, e1, e4)
      local v
      if e2 == 0 then
        v = Byte.get16(JY.Data_Person, CC.PersonSize * e3 + e4)
      elseif e2 == 1 then
        v = Byte.get16(JY.Data_Thing, CC.ThingSize * e3 + e4)
      elseif e2 == 2 then
        v = Byte.get16(JY.Data_Scene, CC.SceneSize * e3 + e4)
      elseif e2 == 3 then
        v = Byte.get16(JY.Data_Wugong, CC.WugongSize * e3 + e4)
      elseif e2 == 4 then
        v = Byte.get16(JY.Data_Shop, CC.ShopSize * e3 + e4)
      end
      x50[e5] = v
    end,
    [18] = function(e1, e2, e3, e4, e5, e6)
      e2 = getvaule(0, e1, e2) + 1
      e3 = getvaule(1, e1, e3)
      JY.Base["队伍" .. e2] = e3
    end,
    [19] = function(e1, e2, e3, e4, e5, e6)
      e2 = getvaule(0, e1, e2) + 1
      x50[e3] = JY.Base["队伍" .. e2]
    end,
    [20] = function(e1, e2, e3, e4, e5, e6)
      e2 = getvaule(0, e1, e2)
      for i = 1, CC.MyThingNum do
        if JY.Base["物品" .. i] == e2 then
          x50[e3] = JY.Base["物品数量" .. i]
          break
        end
      end
    end,
    [21] = function(e1, e2, e3, e4, e5, e6)
      e2 = getvaule(0, e1, e2)
      e3 = getvaule(1, e1, e3)
      e4 = getvaule(2, e1, e4)
      e5 = getvaule(3, e1, e5)
      lib.SetD(e2, e3, e4, e5)
    end,
    [22] = function(e1, e2, e3, e4, e5, e6)
      e2 = getvaule(0, e1, e2)
      e3 = getvaule(1, e1, e3)
      e4 = getvaule(2, e1, e4)
      x50[e5] = lib.GetD(e2, e3, e4)
    end,
    [23] = function(e1, e2, e3, e4, e5, e6)
      e2 = getvaule(0, e1, e2)
      e3 = getvaule(1, e1, e3)
      e4 = getvaule(2, e1, e4)
      e5 = getvaule(3, e1, e5)
      e6 = getvaule(4, e1, e6)
      lib.SetS(e2, e4, e5, e3, e6)
    end,
    [24] = function(e1, e2, e3, e4, e5, e6)
      e2 = getvaule(0, e1, e2)
      e3 = getvaule(1, e1, e3)
      e4 = getvaule(2, e1, e4)
      e5 = getvaule(3, e1, e5)
      x50[e6] = lib.GetS(e2, e4, e5, e3)
    end,
    [27] = function(e1, e2, e3, e4, e5, e6)
      e3 = getvaule(0, e1, e3)
      local str
      if e2 == 0 then
        str = JY.Person[e3]["姓名"]
      elseif e2 == 1 then
        str = JY.Thing[e3]["名称"]
      elseif e2 == 2 then
        str = JY.Scene[e3]["名称"]
      elseif e2 == 3 then
        str = JY.Wugong[e3]["名称"]
      end
      local len = math.modf(0.5 + string.len(str) / 2)
      for i = 0, len - 1 do
        x50[e4 + i] = string.sub(str, i * 2 + 1, i * 2 + 2)
      end
      x50[e4 + len] = 0
      CC.TalkString = "1"
    end,
    [32] = function(e1, e2, e3, e4, e5, e6)
      e3 = getvaule(0, e1, e3)
      E[idx + 8 + e3] = x50[e2] or 0
    end,
    [33] = function(e1, e2, e3, e4, e5, e6)
      e3 = getvaule(0, e1, e3)
      e4 = getvaule(1, e1, e4)
      e5 = getvaule(2, e1, e5)
      if e5 < 0 then
        e5 = 65536 + e5
      end
      local str = ""
      local col = ReadCol(e5 % 256)
      for i = 0, 1000 do
        local char = x50[e2 + i] or 0
        if type(char) == "string" then
          str = str .. char
        elseif char ~= 0 then
          str = str .. getchar(char)
        else
          break
        end
      end
      local fontsize
      if CONFIG.Type == 1 then
        fontsize = 16 * CC.Zoom
      else
        fontsize = CC.DefaultFont
      end
      CC.TalkString = "1"
      str = string.gsub(str, "\r", "")
      str = GenTalkString(str, 17)
      local tmpstr = {}
      local jj = {}
      local kk = {}
      jj[0] = 0
      for i = 1, 10 do
        jj[i], kk[i] = string.find(str, "*", i)
        if kk[i] == kk[i - 1] then
          tmpstr[i] = string.sub(str, 1 + jj[i - 1], string.len(str))
          DrawString(e3 * CC.Zoom, e4 * CC.Zoom + fontsize * (i - 1), tmpstr[i], col, fontsize)
          break
        end
        tmpstr[i] = string.sub(str, 1 + jj[i - 1], kk[i] - 1)
        DrawString(e3 * CC.Zoom, e4 * CC.Zoom + fontsize * (i - 1), tmpstr[i], col, fontsize)
      end
      ShowScreen()
    end,
    [34] = function(e1, e2, e3, e4, e5, e6)
      if E[idx + 8] == 50 and (E[idx + 9] == 39 or E[idx + 9] == 40) then
      else
        e2 = getvaule(0, e1, e2)
        e3 = getvaule(1, e1, e3)
        e4 = getvaule(2, e1, e4)
        e5 = getvaule(3, e1, e5)
        DrawBox(e2 * CC.Zoom, e3 * CC.Zoom, e2 * CC.Zoom + e4 * CC.Zoom, e3 * CC.Zoom + e5 * CC.Zoom, C_WHITE)
        tmp_x, tmp_y, tmp_x1, tmp_y1 = e2 - 4, e3 - 4, e2 + e4 + 4, e3 + e5 + 4
      end
    end,
    [35] = function(e1, e2, e3, e4, e5, e6)
      local key = WaitKey()
      if key == VK_UP then
        key = 158
      elseif key == VK_DOWN then
        key = 152
      elseif key == VK_LEFT then
        key = 154
      elseif key == VK_RIGHT then
        key = 156
      end
      x50[e1] = key
    end,
    [36] = function(e1, e2, e3, e4, e5, e6)
      e3 = getvaule(0, e1, e3)
      e4 = getvaule(1, e1, e4)
      e5 = getvaule(2, e1, e5)
      local str = ""
      for i = 0, 1000 do
        local char = x50[e2 + i] or 0
        if type(char) == "string" then
          str = str .. char
        elseif char ~= 0 then
          str = str .. getchar(char)
        else
          break
        end
      end
      if string.find(str, "Ｙ／Ｎ") ~= nil then
        if DrawStrBoxYesNo(-1, -1, string.gsub(str, "\r", ""), C_WHITE, CC.DefaultFont) then
          x50[28672] = 0
        else
          x50[28672] = 1
        end
      else
        DrawStrBoxWaitKey(string.gsub(str, "\r", ""), C_WHITE, CC.DefaultFont)
      end
    end,
    [37] = function(e1, e2, e3, e4, e5, e6)
      e2 = getvaule(0, e1, e2)
      lib.Delay(e2)
    end,
    [38] = function(e1, e2, e3, e4, e5, e6)
      e2 = getvaule(0, e1, e2)
      x50[e3] = Rnd(e2)
    end,
    [39] = function(e1, e2, e3, e4, e5, e6)
      e2 = getvaule(0, e1, e2)
      e5 = getvaule(1, e1, e5)
      e6 = getvaule(2, e1, e6)
      local mymenu = {}
      for i = 1, e2 do
        local str = ""
        local start = x50[e3 + i - 1] or 0
        for i = 0, 1000 do
          local char = x50[start + i] or 0
          if type(char) == "string" then
            str = str .. char
          elseif char ~= 0 then
            str = str .. getchar(char)
          else
            break
          end
        end
        if CC.TalkString == "0" then
          str = lib.CharSet(str, 0)
        end
        mymenu[i] = {
          string.gsub(str, "\r", ""),
          nil,
          1
        }
      end
      if CC.TalkString == "1" then
        CC.TalkString = "0"
      end
      local select
      select = ShowMenu(mymenu, e2, e2, e5 * CC.Zoom - 5, e6 * CC.Zoom - 5, 0, 0, 1, 1, CC.DefaultFont, C_ORANGE, C_WHITE)
      x50[e4] = select
    end,
    [40] = function(e1, e2, e3, e4, e5, e6)
      e2 = getvaule(0, e1, e2)
      e5 = getvaule(1, e1, e5)
      e6 = getvaule(2, e1, e6)
      local shownum
      if e1 < 0 then
        e1 = 65536 + e1
      end
      shownum = math.modf(e1 / 256)
      local mymenu = {}
      for i = 1, e2 do
        local str = ""
        local start = x50[e3 + i - 1] or 0
        for i = 0, 1000 do
          local char = x50[start + i] or 0
          if type(char) == "string" then
            str = str .. char
          elseif char ~= 0 then
            str = str .. getchar(char)
          else
            break
          end
        end
        if CC.TalkString == "0" then
          str = lib.CharSet(str, 0)
        end
        if CC.TalkString == "1" then
          CC.TalkString = "0"
        end
        mymenu[i] = {
          string.gsub(str, "\r", ""),
          nil,
          1
        }
      end
      local select, select
      select = ShowMenu(mymenu, e2, shownum, e5 * CC.Zoom - 5, e6 * CC.Zoom - 5, 0, 0, 1, 1, CC.DefaultFont, C_ORANGE, C_WHITE)
      x50[e4] = select
    end,
    [41] = function(e1, e2, e3, e4, e5, e6)
      e3 = getvaule(0, e1, e3)
      e4 = getvaule(1, e1, e4)
      e5 = getvaule(2, e1, e5)
      local id
      if e2 == 0 then
        id = 0
      elseif e2 == 1 then
        id = 1
        e5 = e5 * 2
      end
      lib.PicLoadCache(id, e5, e3, e4)
      ShowScreen()
    end,
    [42] = function(e1, e2, e3, e4, e5, e6)
      e2 = getvaule(0, e1, e2)
      e3 = getvaule(1, e1, e3)
      JY.Base["人X"] = e2
      JY.Base["人Y"] = e3
    end,
    [43] = function(e1, e2, e3, e4, e5, e6)
      e2 = getvaule(0, e1, e2)
      e3 = getvaule(1, e1, e3)
      e4 = getvaule(2, e1, e4)
      e5 = getvaule(3, e1, e5)
      e6 = getvaule(4, e1, e6)
      x50[28928] = e3
      x50[28929] = e4
      x50[28930] = e5
      x50[28931] = e6
      if e2 == 202 then
        if e5 == 0 then
          instruct_2(e3, e4)
        end
      elseif e2 == 542 then
        lib.PicInit(CONFIG.DataPath .. "mmap.col")
        lib.PicLoadFile(CC.SMAPPicFile[1], CC.SMAPPicFile[2], 0)
        lib.PicLoadFile(CC.HeadPicFile[1], CC.HeadPicFile[2], 1)
      elseif e2 == 543 then
        lib.PicInit(CONFIG.DataPath .. "dream.col")
        lib.PicLoadFile(CC.SMAPPicFile[1], CC.SMAPPicFile[2], 0)
        lib.PicLoadFile(CC.HeadPicFile[1], CC.HeadPicFile[2], 1)
      elseif e3 == 544 then
        lib.PicInit(CONFIG.DataPath .. "night.col")
        lib.PicLoadFile(CC.SMAPPicFile[1], CC.SMAPPicFile[2], 0)
        lib.PicLoadFile(CC.HeadPicFile[1], CC.HeadPicFile[2], 1)
      else
        ReadKDEF(e2)
      end
    end
  }
  local NewInstruct_50 = function(code, e1, e2, e3, e4, e5, e6)
    if code ~= 49 then
      newinstruct_50_sub[code](e1, e2, e3, e4, e5, e6)
    end
  end
  while len > idx do
    if E[idx] == 0 then
      Cls()
      idx = idx + 1
    elseif E[idx] == 1 then
      TalkEx(ReadTALK(E[idx + 1]), E[idx + 2], E[idx + 3])
      idx = idx + 4
    elseif E[idx] == 2 then
      instruct_2(E[idx + 1], E[idx + 2])
      idx = idx + 3
    elseif E[idx] == 3 then
      instruct_3(E[idx + 1], E[idx + 2], E[idx + 3], E[idx + 4], E[idx + 5], E[idx + 6], E[idx + 7], E[idx + 8], E[idx + 9], E[idx + 10], E[idx + 11], E[idx + 12], E[idx + 13])
      idx = idx + 14
    elseif E[idx] == 4 then
      if instruct_4(E[idx + 1]) then
        idx = idx + E[idx + 2]
      else
        idx = idx + E[idx + 3]
      end
      idx = idx + 4
    elseif E[idx] == 5 then
      if instruct_5() then
        idx = idx + E[idx + 1]
      else
        idx = idx + E[idx + 2]
      end
      idx = idx + 3
    elseif E[idx] == 6 then
      if WarMain(E[idx + 1], E[idx + 4]) then
        idx = idx + E[idx + 2]
      else
        idx = idx + E[idx + 3]
      end
      idx = idx + 5
    elseif E[idx] == 7 then
      idx = idx + 1
      break
    elseif E[idx] == 8 then
      instruct_8(E[idx + 1])
      idx = idx + 2
    elseif E[idx] == 9 then
      if instruct_9() then
        idx = idx + E[idx + 1]
      else
        idx = idx + E[idx + 2]
      end
      idx = idx + 3
    elseif E[idx] == 10 then
      instruct_10(E[idx + 1])
      idx = idx + 2
    elseif E[idx] == 11 then
      if instruct_11() then
        idx = idx + E[idx + 1]
      else
        idx = idx + E[idx + 2]
      end
      idx = idx + 3
    elseif E[idx] == 12 then
      instruct_12()
      idx = idx + 1
    elseif E[idx] == 13 then
      instruct_13()
      idx = idx + 1
    elseif E[idx] == 14 then
      instruct_14()
      idx = idx + 1
    elseif E[idx] == 15 then
      instruct_15()
      idx = idx + 2
    elseif E[idx] == 16 then
      if instruct_16(E[idx + 1]) then
        idx = idx + E[idx + 2]
      else
        idx = idx + E[idx + 3]
      end
      idx = idx + 4
    elseif E[idx] == 17 then
      instruct_17(E[idx + 1], E[idx + 2], E[idx + 3], E[idx + 4], E[idx + 5])
      idx = idx + 6
    elseif E[idx] == 18 then
      if instruct_18(E[idx + 1]) then
        idx = idx + E[idx + 2]
      else
        idx = idx + E[idx + 3]
      end
      idx = idx + 4
    elseif E[idx] == 19 then
      instruct_19(E[idx + 1], E[idx + 2])
      idx = idx + 3
    elseif E[idx] == 20 then
      if instruct_20() then
        idx = idx + E[idx + 1]
      else
        idx = idx + E[idx + 2]
      end
      idx = idx + 3
    elseif E[idx] == 21 then
      instruct_21(E[idx + 1])
      idx = idx + 2
    elseif E[idx] == 22 then
      instruct_22()
      idx = idx + 1
    elseif E[idx] == 23 then
      instruct_23(E[idx + 1], E[idx + 2])
      idx = idx + 3
    elseif E[idx] == 24 then
      instruct_24()
      idx = idx + 1
    elseif E[idx] == 25 then
      instruct_25(E[idx + 1], E[idx + 2], E[idx + 3], E[idx + 4])
      idx = idx + 5
    elseif E[idx] == 26 then
      instruct_26(E[idx + 1], E[idx + 2], E[idx + 3], E[idx + 4], E[idx + 5])
      idx = idx + 6
    elseif E[idx] == 27 then
      instruct_27(E[idx + 1], E[idx + 2], E[idx + 3])
      idx = idx + 4
    elseif E[idx] == 28 then
      if instruct_28(E[idx + 1], E[idx + 2], E[idx + 3]) then
        idx = idx + E[idx + 4]
      else
        idx = idx + E[idx + 5]
      end
      idx = idx + 6
    elseif E[idx] == 29 then
      if instruct_29(E[idx + 1], E[idx + 2], E[idx + 3]) then
        idx = idx + E[idx + 4]
      else
        idx = idx + E[idx + 5]
      end
      idx = idx + 6
    elseif E[idx] == 30 then
      instruct_30(E[idx + 1], E[idx + 2], E[idx + 3], E[idx + 4])
      idx = idx + 5
    elseif E[idx] == 31 then
      if instruct_31(E[idx + 1]) then
        idx = idx + E[idx + 2]
      else
        idx = idx + E[idx + 3]
      end
      idx = idx + 4
    elseif E[idx] == 32 then
      instruct_32(E[idx + 1], E[idx + 2])
      idx = idx + 3
    elseif E[idx] == 33 then
      instruct_33(E[idx + 1], E[idx + 2], E[idx + 3])
      idx = idx + 4
    elseif E[idx] == 34 then
      instruct_34(E[idx + 1], E[idx + 2])
      idx = idx + 3
    elseif E[idx] == 35 then
      instruct_35(E[idx + 1], E[idx + 2], E[idx + 3], E[idx + 4])
      idx = idx + 5
    elseif E[idx] == 36 then
      if E[idx + 1] < 256 then
        if instruct_36(E[idx + 1]) then
          idx = idx + E[idx + 2]
        else
          idx = idx + E[idx + 3]
        end
      else
        local tzflag = x50[28672] or 0
        if tzflag == 0 then
          idx = idx + E[idx + 2]
        elseif tzflag == 1 then
          idx = idx + E[idx + 3]
        end
      end
      idx = idx + 4
    elseif E[idx] == 37 then
      instruct_37(E[idx + 1])
      idx = idx + 2
    elseif E[idx] == 38 then
      instruct_38(E[idx + 1], E[idx + 2], E[idx + 3], E[idx + 4])
      idx = idx + 5
    elseif E[idx] == 39 then
      instruct_39(E[idx + 1])
      idx = idx + 2
    elseif E[idx] == 40 then
      instruct_40(E[idx + 1])
      idx = idx + 2
    elseif E[idx] == 41 then
      instruct_41(E[idx + 1], E[idx + 2], E[idx + 3])
      idx = idx + 4
    elseif E[idx] == 42 then
      if instruct_42() then
        idx = idx + E[idx + 1]
      else
        idx = idx + E[idx + 2]
      end
      idx = idx + 3
    elseif E[idx] == 43 then
      if instruct_43(E[idx + 1]) then
        idx = idx + E[idx + 2]
      else
        idx = idx + E[idx + 3]
      end
      idx = idx + 4
    elseif E[idx] == 44 then
      instruct_44(E[idx + 1], E[idx + 2], E[idx + 3], E[idx + 4], E[idx + 5], E[idx + 6])
      idx = idx + 7
    elseif E[idx] == 45 then
      instruct_45(E[idx + 1], E[idx + 2])
      idx = idx + 3
    elseif E[idx] == 46 then
      instruct_46(E[idx + 1], E[idx + 2])
      idx = idx + 3
    elseif E[idx] == 47 then
      instruct_47(E[idx + 1], E[idx + 2])
      idx = idx + 3
    elseif E[idx] == 48 then
      instruct_48(E[idx + 1], E[idx + 2])
      idx = idx + 3
    elseif E[idx] == 49 then
      instruct_49(E[idx + 1], E[idx + 2])
      idx = idx + 3
    elseif E[idx] == 50 then
      if E[idx + 1] > 128 then
        if instruct_50(E[idx + 1], E[idx + 2], E[idx + 3], E[idx + 4], E[idx + 5]) then
          idx = idx + E[idx + 6]
        else
          idx = idx + E[idx + 7]
        end
      else
        NewInstruct_50(E[idx + 1], E[idx + 2], E[idx + 3], E[idx + 4], E[idx + 5], E[idx + 6], E[idx + 7])
      end
      idx = idx + 8
    elseif E[idx] == 51 then
      instruct_51()
      idx = idx + 1
    elseif E[idx] == 52 then
      instruct_52()
      idx = idx + 1
    elseif E[idx] == 53 then
      instruct_53()
      idx = idx + 1
    elseif E[idx] == 54 then
      instruct_54()
      idx = idx + 1
    elseif E[idx] == 55 then
      if instruct_55(E[idx + 1], E[idx + 2]) then
        idx = idx + E[idx + 3]
      else
        idx = idx + E[idx + 4]
      end
      idx = idx + 5
    elseif E[idx] == 56 then
      instruct_56(E[idx + 1])
      idx = idx + 2
    elseif E[idx] == 57 then
      instruct_57()
      idx = idx + 1
    elseif E[idx] == 58 then
      instruct_58()
      idx = idx + 1
    elseif E[idx] == 59 then
      instruct_59()
      idx = idx + 1
    elseif E[idx] == 60 then
      if instruct_60(E[idx + 1], E[idx + 2], E[idx + 3]) then
        idx = idx + E[idx + 4]
      else
        idx = idx + E[idx + 5]
      end
      idx = idx + 6
    elseif E[idx] == 61 then
      if instruct_61() then
        idx = idx + E[idx + 1]
      else
        idx = idx + E[idx + 2]
      end
      idx = idx + 3
    elseif E[idx] == 62 then
      instruct_62(E[idx + 1], E[idx + 2], E[idx + 3], E[idx + 4], E[idx + 5], E[idx + 6])
      idx = idx + 7
    elseif E[idx] == 63 then
      instruct_63(E[idx + 1], E[idx + 2])
      idx = idx + 3
    elseif E[idx] == 64 then
      instruct_64()
      idx = idx + 1
    elseif E[idx] == 65 then
      instruct_65()
      idx = idx + 1
    elseif E[idx] == 66 then
      instruct_66(E[idx + 1])
      idx = idx + 2
    elseif E[idx] == 67 then
      instruct_67(E[idx + 1])
      idx = idx + 2
    else
      break
    end
  end
end
function ReadTALK(id, flag)
  local str = ""
  str = ReadTalk(id)
  if CC.TalkString == "0" then
    str = GenTalkString(str, 24)
  else
    CC.TalkString = "0"
  end
  return str
end
function Crack(E, len)
  local C = {
    [0] = 15,
    19,
    3,
    67,
    12,
    28,
    55,
    37,
    47,
    36,
    61,
    49,
    32,
    2,
    45,
    51,
    21,
    11,
    46,
    64,
    9,
    25,
    26,
    14,
    43,
    1,
    59,
    54,
    34,
    62,
    27,
    18,
    53,
    44,
    42,
    58,
    10,
    7,
    6,
    16,
    8,
    63,
    39,
    13,
    31,
    20,
    52,
    22,
    30,
    33,
    48,
    56,
    50,
    24,
    65,
    29,
    41,
    38,
    4,
    5,
    35,
    0,
    57,
    60,
    66,
    23,
    17,
    40
  }
  for i = 0, len - 1 do
    local v = E[i]
    if C[v] then
      E[i] = C[v]
    end
  end
end
