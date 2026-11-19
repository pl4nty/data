-- Threat: !InfrastructureShared
-- Name: !#Lua:InterestingRAR5Flags
-- Type: 12
-- MpAttributes: RPF:TopLevelFile & BM_RAR_FILE

local function l_0_0(l_1_0)
  local l_1_1 = 0
  
  local l_1_2 = l_1_0.val[1]
  local l_1_3 = 0
  while 127 < l_1_2 do
    l_1_1 = l_1_1 + mp.shl32(mp.bitand(l_1_2, 127), l_1_3 * 7)
    l_1_3 = l_1_3 + 1
    l_1_2 = l_1_0.val[l_1_3 + 1]
  end
  l_1_1 = l_1_1 + mp.shl32(mp.bitand(l_1_2, 127), l_1_3 * 7)
  return l_1_1
end

local function l_0_1(l_2_0)
  local l_2_1 = headerpage[l_2_0 + 4]
  local l_2_2 = headerpage[l_2_0 + 5]
  local l_2_3 = headerpage[l_2_0 + 6]
  local l_2_4 = 0
  local l_2_5 = 0
  local l_2_6 = 0
  local l_2_7 = 0
  local l_2_8 = 0
  local l_2_9 = 0
  if l_2_2 == 3 and l_2_3 == 2 then
    mp.set_mpattribute("Lua:Rar5HasCommentBlock")
    l_2_4 = 7
    local l_2_10 = headerpage[l_2_0 + l_2_4]
    local l_2_11 = headerpage[l_2_0 + l_2_4 + 1]
    local l_2_12 = headerpage[l_2_0 + l_2_4 + 2]
    local l_2_13 = headerpage[l_2_0 + l_2_4 + 3]
    local l_2_14 = 0
    if l_2_12 == 4 and l_2_13 ~= 4 then
      l_2_14 = 2
      local l_2_15 = {
        val = {l_2_10, l_2_11}
      }
      l_2_9 = l_0_0(l_2_15)
      if l_2_9 > mp.HEADERPAGE_SZ then
        mp.set_mpattribute("Lua:Rar5HasCommentBlockTooBig")
        return mp.CLEAN
      end
    else
      mp.set_mpattribute("Lua:Rar5PotentiallyCorruptCommentBlock")
      return mp.CLEAN
    end
    l_2_4 = l_2_4 + l_2_14 + 1 + l_2_14
    local l_2_16 = headerpage[l_2_0 + l_2_4]
    if l_2_16 ~= 0 then
      return mp.CLEAN
    end
    l_2_4 = l_2_4 + 1 + 4 + 2 + 1 + 1
    local l_2_17 = headerpage[l_2_0 + l_2_4]
    if l_2_17 ~= 67 then
      return mp.CLEAN
    end
    l_2_4 = l_2_4 + 3 + l_2_9
    l_2_6 = headerpage[l_2_0 + l_2_4 + 4]
    l_2_1 = l_2_6
    l_2_7 = headerpage[l_2_0 + l_2_4 + 4 + 1]
    l_2_8 = headerpage[l_2_0 + l_2_4 + 4 + 1 + 1]
  end
  if l_2_2 == 1 and l_2_3 == 2 or l_2_7 == 1 and l_2_8 == 2 then
    l_2_5 = 2
    l_2_4 = l_2_4 + 4 + l_2_5 + 1 + 1 + 1
  elseif l_2_2 == 2 or l_2_7 == 2 then
    l_2_5 = 1
    l_2_4 = l_2_4 + 4 + l_2_5 + 1 + 1 + 1
  elseif l_2_2 == 5 and l_2_3 == 4 then
    mp.set_mpattribute("Lua:Rar5HasNoFileInside")
    return mp.CLEAN
  end
  if (l_2_3 == 2 or l_2_8 == 2 or l_2_2 == 2 or l_2_7 == 2) and l_2_0 + l_2_1 < mp.HEADERPAGE_SZ then
    local l_2_18 = headerpage[l_2_0 + l_2_4 + 1]
    local l_2_19 = 0
    local l_2_20 = 0
    local l_2_21 = 0
    local l_2_22 = 0
    local l_2_23 = 0
    local l_2_24 = 1
    local l_2_25 = 1
    if l_2_18 == 0 then
      l_2_24 = 2
      l_2_25 = l_2_24
    elseif 0 < l_2_18 and l_2_18 < 256 then
      l_2_19 = headerpage[l_2_0 + l_2_4 + 2]
      if l_2_19 == 4 then
        l_2_23 = headerpage[l_2_0 + l_2_4 + 3]
        if l_2_23 == 4 then
          l_2_24 = 3
        else
          l_2_24 = 2
        end
      elseif l_2_19 == 0 then
        l_2_24 = 3
      elseif 0 < l_2_19 and l_2_19 < 256 then
        l_2_20 = headerpage[l_2_0 + l_2_4 + 3]
        if l_2_20 == 4 then
          l_2_23 = headerpage[l_2_0 + l_2_4 + 4]
          if l_2_23 == 4 then
            l_2_24 = 4
          else
            l_2_24 = 3
          end
        elseif l_2_20 == 0 then
          l_2_24 = 4
        elseif 0 < l_2_20 and l_2_20 < 256 then
          l_2_21 = headerpage[l_2_0 + l_2_4 + 4]
          if l_2_21 == 4 then
            l_2_23 = headerpage[l_2_0 + l_2_4 + 5]
            if l_2_23 == 4 then
              l_2_24 = 5
            else
              l_2_24 = 4
            end
          elseif l_2_21 == 0 then
            l_2_24 = 5
          elseif 0 < l_2_21 and l_2_21 < 256 then
            l_2_22 = headerpage[l_2_0 + l_2_4 + 5]
            if l_2_22 == 4 then
              l_2_23 = headerpage[l_2_0 + l_2_4 + 6]
              if l_2_23 == 4 then
                l_2_24 = 6
              else
                l_2_24 = 5
              end
            elseif l_2_22 == 0 then
              l_2_24 = 6
            elseif 0 < l_2_22 and l_2_22 < 256 then
              return mp.CLEAN
            end
          end
        end
      end
    end
    l_2_25 = l_2_24
    local l_2_26 = l_2_4 + l_2_24 + 1 + l_2_25
    local l_2_27 = headerpage[l_2_0 + l_2_26]
    if l_2_27 ~= 32 then
      return mp.CLEAN
    end
    local l_2_28 = l_2_4 + l_2_24 + 1 + l_2_25 + 1 + 4
    local l_2_29 = headerpage[l_2_0 + l_2_28 + 1]
    l_2_4 = l_2_28 + 2 + 1
    local l_2_30 = headerpage[l_2_0 + l_2_4]
    if l_2_30 == 0 then
      return mp.CLEAN
    end
    local l_2_31 = l_2_4 + 1
    local l_2_32 = 0
    local l_2_33 = ""
    local l_2_34 = ""
    local l_2_35 = "%."
    for l_2_36 = 0, l_2_30 - 1 do
      l_2_32 = headerpage[l_2_0 + l_2_31 + l_2_36]
      l_2_33 = string.char(l_2_32)
      l_2_34 = l_2_34 .. l_2_33
    end
    if l_2_34:match("password") then
      mp.set_mpattribute("Lua:Rar5HasFileNameWithKeyWord")
    end
    if l_2_34:match("/") then
      mp.set_mpattribute("Lua:Rar5HasFolder")
    end
    if not l_2_34:find(l_2_35) then
      mp.set_mpattribute("Lua:Rar5FirstFileHasNoExtension")
    end
    if 4 < l_2_30 then
      local l_2_37 = {
        [".bat"] = "",
        [".cmd"] = "",
        [".com"] = "",
        [".cpl"] = "",
        [".exe"] = "",
        [".pif"] = "",
        [".scr"] = "",
        [".vbs"] = "",
        [".lnk"] = "",
        [".wsf"] = "",
        [".vbe"] = "",
        [".jse"] = "",
        [".hta"] = "",
        [".js"] = "",
        [".dll"] = "",
        [".ocx"] = "",
        [".ps1"] = "",
        [".jar"] = "",
        [".wsc"] = "",
        [".wsh"] = "",
        [".msi"] = "",
        [".url"] = ""
      }
      local l_2_38 = {
        [".html"] = ""
      }
      local l_2_39 = {
        [".zip"] = "",
        [".tar"] = "",
        [".gz"] = "",
        [".tgz"] = "",
        [".7z"] = "",
        [".iso"] = "",
        [".vhd"] = "",
        [".img"] = "",
        [".dmg"] = ""
      }
      local l_2_40 = {
        [".txt"] = "",
        [".pdf"] = "",
        [".xls"] = "",
        [".xlsx"] = "",
        [".xlsm"] = "",
        [".xlsb"] = "",
        [".xla"] = "",
        [".xltm"] = "",
        [".xlam"] = "",
        [".csv"] = "",
        [".xml"] = "",
        [".jpg"] = "",
        [".gif"] = "",
        [".png"] = "",
        [".jpeg"] = "",
        [".pic"] = "",
        [".mp3"] = "",
        [".doc"] = "",
        [".docx"] = "",
        [".mkv"] = ""
      }
      local l_2_41 = string.sub(l_2_34, -4)
      local l_2_42 = string.sub(l_2_34, -5)
      local l_2_43 = string.sub(l_2_34, -3)
      if l_2_37[l_2_41] or l_2_40[l_2_41] then
        l_2_41 = string.sub(l_2_41, 2)
        if l_2_29 ~= 0 then
          mp.set_mpattribute("Lua:Rar5HasFileWith!" .. l_2_41)
        else
          mp.set_mpattribute("Lua:Rar5HasStoredFileWith!" .. l_2_41)
        end
      end
      if l_2_37[l_2_43] then
        l_2_43 = string.sub(l_2_43, 2)
        if l_2_29 ~= 0 then
          mp.set_mpattribute("Lua:Rar5HasFileWith!" .. l_2_43)
        else
          mp.set_mpattribute("Lua:Rar5HasStoredFileWith!" .. l_2_43)
        end
      end
      if l_2_39[l_2_41] then
        l_2_41 = string.sub(l_2_41, 2)
        if l_2_29 ~= 0 then
          mp.set_mpattribute("Lua:Rar5HasArchiveWith!" .. l_2_41)
        else
          mp.set_mpattribute("Lua:Rar5HasStoredArchiveWith!" .. l_2_41)
        end
      end
      if l_2_39[l_2_43] then
        l_2_43 = string.sub(l_2_43, 2)
        if l_2_29 ~= 0 then
          mp.set_mpattribute("Lua:Rar5HasArchiveWith!" .. l_2_43)
        else
          mp.set_mpattribute("Lua:Rar5HasStoredArchiveWith!" .. l_2_43)
        end
      end
      if l_2_42 ~= nil and (l_2_38[l_2_42] or l_2_40[l_2_42]) then
        l_2_42 = string.sub(l_2_42, 2)
        if l_2_29 ~= 0 then
          mp.set_mpattribute("Lua:Rar5HasFileWith!" .. l_2_42)
        else
          mp.set_mpattribute("Lua:Rar5HasStoredFileWith!" .. l_2_42)
        end
      end
    end
  else
    mp.set_mpattribute("Lua:Rar5HasNoFileOrCommentBlock")
    return mp.CLEAN
  end
  return mp.CLEAN
end

if mp.HEADERPAGE_SZ < 1024 then
  return mp.CLEAN
end
if mp.readu_u32(headerpage, 1) ~= 561144146 then
  return mp.CLEAN
end
if mp.readu_u16(headerpage, 5) ~= 1818 then
  return mp.CLEAN
end
if headerpage[7] == 1 then
  local l_0_2 = mp.bitand(mp.readu_u16(headerpage, 13), 255)
  local l_0_3 = l_0_2 + 13 + 1
  local l_0_4 = 1
  while l_0_4 < 2 and l_0_3 + 4 < mp.HEADERPAGE_SZ do
    l_0_3 = l_0_1(l_0_3)
    l_0_4 = l_0_4 + 1
  end
end
return mp.CLEAN
