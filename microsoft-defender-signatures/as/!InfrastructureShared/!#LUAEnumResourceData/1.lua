-- Threat: !InfrastructureShared
-- Name: !#LUA:EnumResourceData
-- Type: 9
-- MpAttributes: RPF:TopLevelFile & pea_isexe & !pea_is_process & !pea_no_resources & !pea_resource_only_dll & !pea_isvbpcode & !pea_isvbnative & !pea_ismsil

if mp.getfilesize() > 33554432 then
  return mp.CLEAN
end
local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_PATH, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0:sub(2, 9) ~= ":\\users\\" and mp.get_mpattribute("Lua:TriggerLUAEnumResourceData") ~= true then
  return mp.CLEAN
end

function EnumResourceCRC32s(l_1_0, l_1_1, l_1_2, l_1_3)
  local l_1_4 = 524288
  local l_1_5 = 30
  if l_1_5 < #l_1_3 then
    return l_1_3
  end
  if 0 < l_1_2 then
    l_1_1 = l_1_0 + l_1_1
  else
    l_1_1 = l_1_0
  end
  local l_1_6 = {
    [1] = "LUA:HasResType_RT_CURSOR",
    [2] = "LUA:HasResType_RT_BITMAP",
    [3] = "LUA:HasResType_RT_ICON",
    [4] = "LUA:HasResType_RT_MENU",
    [5] = "LUA:HasResType_RT_DIALOG",
    [6] = "LUA:HasResType_RT_STRING",
    [7] = "LUA:HasResType_RT_FONTDIR",
    [8] = "LUA:HasResType_RT_FONT",
    [9] = "LUA:HasResType_RT_ACCELERATOR",
    [10] = "LUA:HasResType_RT_RCDATA",
    [11] = "LUA:HasResType_RT_MESSAGETABLE",
    [12] = "LUA:HasResType_RT_GROUP_CURSOR",
    [14] = "LUA:HasResType_RT_GROUP_ICON",
    [16] = "LUA:HasResType_RT_VERSION",
    [17] = "LUA:HasResType_RT_DLGINCLUDE",
    [19] = "LUA:HasResType_RT_PLUGPLAY",
    [20] = "LUA:HasResType_RT_VXD",
    [21] = "LUA:HasResType_RT_ANICURSOR",
    [22] = "LUA:HasResType_RT_ANIICON",
    [23] = "LUA:HasResType_RT_HTML",
    [24] = "LUA:HasResType_RT_MANIFEST"
  }
  local l_1_7 = pe.mmap_rva(l_1_1, 16)
  local l_1_8 = mp.readu_u16(l_1_7, 13)
  local l_1_9 = mp.readu_u16(l_1_7, 15)
  local l_1_10 = l_1_9 + l_1_8
  if l_1_10 == 0 then
    return l_1_3
  end
  for l_1_11 = 0, l_1_10 - 1 do
    local l_1_12 = l_1_11 * 8 + 16 + l_1_1
    local l_1_13 = pe.mmap_rva(l_1_12, 8)
    local l_1_14 = mp.readu_u32(l_1_13, 5)
    local l_1_15 = mp.readu_u32(l_1_13, 1)
    if l_1_11 >= l_1_8 and l_1_2 == 0 and l_1_6[l_1_15] then
      mp.set_mpattribute(l_1_6[l_1_15])
    end
    local l_1_16 = mp.bitand(l_1_14, 268435455)
    if mp.bitand(l_1_14, 2147483648) ~= 0 then
      if l_1_2 < 3 then
        EnumResourceCRC32s(l_1_0, l_1_16, l_1_2 + 1, l_1_3)
      end
    else
      local l_1_17 = pe.mmap_rva(l_1_0 + l_1_16, 16)
      local l_1_18 = mp.readu_u32(l_1_17, 1)
      local l_1_19 = mp.readu_u32(l_1_17, 5)
      if l_1_4 <= l_1_19 then
        mp.set_mpattribute("Lua:InterestingResourceDataSizeGTE0x80000!CrcSkipped")
        return l_1_3
      end
      local l_1_20 = pe.mmap_rva(l_1_18, l_1_19)
      local l_1_21 = mp.crc32(-1, l_1_20, 1, 0)
      local l_1_22 = "Lua:InterestingResourceData"
      if string.sub(l_1_20, 1, 8) == "\137PNG\r\n\026\n" then
        mp.set_mpattribute(string.format("%sFormat:PNG!crc0x%08x", l_1_22, l_1_21))
      elseif string.sub(l_1_20, 1, 3) == "(\000\000" and 8192 <= l_1_19 then
        mp.set_mpattribute(string.format("%sFormat:ICO!crc0x%08x", l_1_22, l_1_21))
      elseif string.sub(l_1_20, 1, 2) == "BM" and 12288 <= l_1_19 then
        mp.set_mpattribute(string.format("%sFormat:BMP!crc0x%08x", l_1_22, l_1_21))
      elseif 131072 <= l_1_19 then
        mp.set_mpattribute(string.format("%sSizeGTE0x20000!crc0x%08x", l_1_22, l_1_21))
      elseif 73728 <= l_1_19 then
        mp.set_mpattribute(string.format("%sSizeGTE0x12000!crc0x%08x", l_1_22, l_1_21))
      elseif 32768 <= l_1_19 then
        mp.set_mpattribute(string.format("%sSizeGTE0x8000!crc0x%08x", l_1_22, l_1_21))
      end
      l_1_3[#l_1_3 + 1] = l_1_21
    end
  end
  return l_1_3
end

function GetResourceCRC32s()
  local l_2_0 = {}
  if peattributes.isdll or peattributes.isexe then
    local l_2_1 = pehdr.DataDirectory[pe.IMAGE_DIRECTORY_ENTRY_RESOURCE].RVA
    local l_2_2 = pehdr.DataDirectory[pe.IMAGE_DIRECTORY_ENTRY_RESOURCE].Size
    if 0 < l_2_1 and 0 < l_2_2 then
      mp.readprotection(false)
      EnumResourceCRC32s(l_2_1, 0, 0, l_2_0)
      mp.readprotection(true)
    end
  end
  return l_2_0
end

local l_0_1 = {
  [3404687433] = "LUA:ConstructorIconFile1"
}
local l_0_2 = GetResourceCRC32s()
if #l_0_2 < 5 then
  mp.set_mpattribute("LUA:ResourceDataEntryLT5")
end
if 5 <= #l_0_2 then
  mp.set_mpattribute("LUA:ResourceDataEntryGE5")
end
if 10 <= #l_0_2 then
  mp.set_mpattribute("LUA:ResourceDataEntryGE10")
end
if 15 <= #l_0_2 then
  mp.set_mpattribute("LUA:ResourceDataEntryGE15")
end
if 20 <= #l_0_2 then
  mp.set_mpattribute("LUA:ResourceDataEntryGE20")
end
for l_0_3 = 1, #l_0_2 do
  if l_0_1[l_0_2[l_0_3]] ~= nil then
    mp.set_mpattribute(l_0_1[l_0_2[l_0_3]])
  end
end
return mp.CLEAN
