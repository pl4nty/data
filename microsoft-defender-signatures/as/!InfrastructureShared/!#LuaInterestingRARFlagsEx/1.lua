-- Threat: !InfrastructureShared
-- Name: !#Lua:InterestingRARFlagsEx
-- Type: 13

local l_0_0, l_0_1

local function l_0_2(l_1_0, l_1_1)
  if l_1_1 < l_1_0 + 7 then
    return 0
  end
  local l_1_2 = mp.readfile(l_1_0, 7)
  local l_1_3 = string.byte(l_1_2, 3)
  local l_1_4 = mp.readu_u16(l_1_2, 6)
  local l_1_5 = 0
  if l_1_3 == 122 and l_1_1 > l_1_0 + 48 then
    l_1_2 = mp.readfile(l_1_0, 48)
    l_1_5 = mp.readu_u32(l_1_2, 8)
    if string.byte(l_1_2, 27) == 3 and string.sub(l_1_2, 33, 35) == "CMT" then
      mp.set_mpattribute("Lua:RarHasCommentBlock")
    end
  elseif l_1_3 == 116 and l_1_1 > l_1_0 + 48 then
    l_0_0 = l_0_0 + 1
    l_1_2 = mp.readfile(l_1_0, 48)
    l_1_5 = mp.readu_u32(l_1_2, 8)
    if string.byte(l_1_2, 26) == 48 then
      mp.set_mpattribute("Lua:RarHasStoredFile")
    end
    local l_1_6 = mp.readu_u16(l_1_2, 4)
    if mp.bitand(l_1_6, 4) == 4 then
      mp.set_mpattribute("Lua:RarHasEncryptedFile")
    end
    local l_1_7 = mp.readu_u16(l_1_2, 27)
    if 4 < l_1_7 and l_1_7 < 288 then
      local l_1_8 = 32
      if mp.bitand(l_1_6, 256) == 256 then
        l_1_8 = l_1_8 + 8
      end
      if l_1_1 > l_1_0 + l_1_8 + l_1_7 then
        local l_1_9 = mp.readfile(l_1_0 + l_1_8, l_1_7)
        if 8 < l_1_7 and l_1_7 < 64 and l_1_9:find("[Pp][Aa][Ss][Ss][Ww][Oo][Rr][Dd]") or 8 < l_1_7 and l_1_7 < 64 and l_1_9:find("[Tt][Oo] [Oo][Pp][Ee][Nn]") then
          mp.set_mpattribute("Lua:RarHasFileNameWithPassword")
        end
        if l_1_9 == "to open enter 1234" and l_1_5 == 1 or l_1_9 == "1 2 3 4" and l_1_5 == 1 then
          mp.set_mpattribute("Lua:RarHasMizenotaPWFile")
        end
        local l_1_10 = {
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
          [".js"] = ""
        }
        local l_1_11 = string.sub(l_1_9, -4)
        if l_1_10[l_1_11] or l_1_10[string.sub(l_1_9, -3)] then
          mp.set_mpattribute("Lua:RarHasFileWithExeExtension")
          l_0_1 = l_0_1 + 1
          if mp.bitand(l_1_6, 4) == 4 then
            mp.set_mpattribute("Lua:RarHasEncryptedFileWithExeExtension")
          end
          if string.byte(l_1_2, 26) == 48 then
            mp.set_mpattribute("Lua:RarHasStoredFileWithExeExtension")
          end
        end
      end
    end
  elseif l_1_3 ~= 115 then
    return 0
  end
  return l_1_0 + l_1_4 + l_1_5
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
local l_0_3 = mp.getfilesize()
if (mp.get_mpattribute("Lua:RarHasFileNameWithPassword") or mp.get_mpattribute("Lua:RarHasEncryptedFile") or mp.get_mpattribute("Lua:RarHasStoredFileWithExeExtension")) and l_0_3 < 8388608 and 4096 < l_0_3 and mp.get_mpattribute("RPF:AnyFileHasIOAVURL") and mp.get_mpattribute("RPF:TopLevelFile") or mp.get_mpattribute("Lua:RarHasFileWithExeExtension") and l_0_3 < 100000 and 512 < l_0_3 and mp.get_mpattribute("RPF:TopLevelFile") then
  mp.readprotection(false)
  local l_0_4 = 7
  local l_0_5 = 0
  l_0_0 = 0
  l_0_1 = 0
  while l_0_5 < 10 and l_0_4 ~= 0 do
    l_0_4 = l_0_2(l_0_4, l_0_3)
    l_0_5 = l_0_5 + 1
  end
  if l_0_0 == 1 and l_0_1 == 1 then
    if mp.get_mpattribute("RPF:AnyFileHasIOAVURL") then
      if mp.get_mpattribute("Lua:RarHasStoredFileWithExeExtension") then
        mp.set_mpattribute("Lua:RarHasSingleStoredFileWithExeExtension")
        mp.set_mpattribute("//Lua:GIOAVTopLevelRarHasSingleStoredFileWithExeExtension")
      else
        mp.set_mpattribute("//Lua:GIOAVTopLevelRarHasSingleFileWithExeExtension")
      end
    end
    mp.set_mpattribute("Lua:RarHasSingleFileWithExeExtension")
  end
  if l_0_0 == 1 then
    mp.set_mpattribute("Lua:SingleFileInRar")
    mp.UfsSetMetadataBool("Lua:SingleFileInRar", true)
  end
end
return mp.CLEAN
