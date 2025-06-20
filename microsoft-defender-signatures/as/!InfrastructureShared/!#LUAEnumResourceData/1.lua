-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LUAEnumResourceData\1.luac 

-- params : ...
-- function num : 0
if (mp.getfilesize)() > 33554432 then
  return mp.CLEAN
end
local l_0_0 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_PATH, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0:sub(2, 9) ~= ":\\users\\" and (mp.get_mpattribute)("Lua:TriggerLUAEnumResourceData") ~= true then
  return mp.CLEAN
end
EnumResourceCRC32s = function(l_1_0, l_1_1, l_1_2, l_1_3)
  -- function num : 0_0
  local l_1_4 = 524288
  local l_1_5 = 30
  if l_1_5 < #l_1_3 then
    return l_1_3
  end
  if l_1_2 > 0 then
    l_1_1 = l_1_0 + l_1_1
  else
    l_1_1 = l_1_0
  end
  local l_1_6 = {}
  l_1_6[1] = "LUA:HasResType_RT_CURSOR"
  l_1_6[2] = "LUA:HasResType_RT_BITMAP"
  l_1_6[3] = "LUA:HasResType_RT_ICON"
  l_1_6[4] = "LUA:HasResType_RT_MENU"
  l_1_6[5] = "LUA:HasResType_RT_DIALOG"
  l_1_6[6] = "LUA:HasResType_RT_STRING"
  l_1_6[7] = "LUA:HasResType_RT_FONTDIR"
  l_1_6[8] = "LUA:HasResType_RT_FONT"
  l_1_6[9] = "LUA:HasResType_RT_ACCELERATOR"
  l_1_6[10] = "LUA:HasResType_RT_RCDATA"
  l_1_6[11] = "LUA:HasResType_RT_MESSAGETABLE"
  l_1_6[12] = "LUA:HasResType_RT_GROUP_CURSOR"
  l_1_6[14] = "LUA:HasResType_RT_GROUP_ICON"
  l_1_6[16] = "LUA:HasResType_RT_VERSION"
  l_1_6[17] = "LUA:HasResType_RT_DLGINCLUDE"
  l_1_6[19] = "LUA:HasResType_RT_PLUGPLAY"
  l_1_6[20] = "LUA:HasResType_RT_VXD"
  l_1_6[21] = "LUA:HasResType_RT_ANICURSOR"
  l_1_6[22] = "LUA:HasResType_RT_ANIICON"
  l_1_6[23] = "LUA:HasResType_RT_HTML"
  l_1_6[24] = "LUA:HasResType_RT_MANIFEST"
  local l_1_7 = (pe.mmap_rva)(l_1_1, 16)
  local l_1_8 = (mp.readu_u16)(l_1_7, 13)
  local l_1_9 = (mp.readu_u16)(l_1_7, 15)
  local l_1_10 = l_1_9 + l_1_8
  if l_1_10 == 0 then
    return l_1_3
  end
  for l_1_14 = 0, l_1_10 - 1 do
    local l_1_15 = l_1_14 * 8 + 16 + l_1_1
    local l_1_16 = (pe.mmap_rva)(l_1_15, 8)
    local l_1_17 = (mp.readu_u32)(l_1_16, 5)
    local l_1_18 = (mp.readu_u32)(l_1_16, 1)
    if l_1_8 <= l_1_14 and l_1_2 == 0 and l_1_6[l_1_18] then
      (mp.set_mpattribute)(l_1_6[l_1_18])
    end
    local l_1_19 = (mp.bitand)(l_1_17, 268435455)
    -- DECOMPILER ERROR at PC104: Unhandled construct in 'MakeBoolean' P1

    if (mp.bitand)(l_1_17, 2147483648) ~= 0 and l_1_2 < 3 then
      EnumResourceCRC32s(l_1_0, l_1_19, l_1_2 + 1, l_1_3)
    end
    local l_1_20 = (pe.mmap_rva)(l_1_0 + l_1_19, 16)
    local l_1_21 = (mp.readu_u32)(l_1_20, 1)
    local l_1_22 = (mp.readu_u32)(l_1_20, 5)
    if l_1_4 <= l_1_22 then
      (mp.set_mpattribute)("Lua:InterestingResourceDataSizeGTE0x80000!CrcSkipped")
      return l_1_3
    end
    local l_1_23 = (pe.mmap_rva)(l_1_21, l_1_22)
    local l_1_24 = (mp.crc32)(-1, l_1_23, 1, 0)
    local l_1_25 = "Lua:InterestingResourceData"
    if (string.sub)(l_1_23, 1, 8) == "�PNG\r\n\026\n" then
      (mp.set_mpattribute)((string.format)("%sFormat:PNG!crc0x%08x", l_1_25, l_1_24))
    else
      if (string.sub)(l_1_23, 1, 3) == "(\000\000" and l_1_22 >= 8192 then
        (mp.set_mpattribute)((string.format)("%sFormat:ICO!crc0x%08x", l_1_25, l_1_24))
      else
        if (string.sub)(l_1_23, 1, 2) == "BM" and l_1_22 >= 12288 then
          (mp.set_mpattribute)((string.format)("%sFormat:BMP!crc0x%08x", l_1_25, l_1_24))
        else
          if l_1_22 >= 131072 then
            (mp.set_mpattribute)((string.format)("%sSizeGTE0x20000!crc0x%08x", l_1_25, l_1_24))
          else
            if l_1_22 >= 73728 then
              (mp.set_mpattribute)((string.format)("%sSizeGTE0x12000!crc0x%08x", l_1_25, l_1_24))
            else
              if l_1_22 >= 32768 then
                (mp.set_mpattribute)((string.format)("%sSizeGTE0x8000!crc0x%08x", l_1_25, l_1_24))
              end
            end
          end
        end
      end
    end
    l_1_3[#l_1_3 + 1] = l_1_24
  end
  return l_1_3
end

GetResourceCRC32s = function()
  -- function num : 0_1
  local l_2_0 = {}
  if peattributes.isdll or peattributes.isexe then
    local l_2_1 = ((pehdr.DataDirectory)[pe.IMAGE_DIRECTORY_ENTRY_RESOURCE]).RVA
    local l_2_2 = ((pehdr.DataDirectory)[pe.IMAGE_DIRECTORY_ENTRY_RESOURCE]).Size
    if l_2_1 > 0 and l_2_2 > 0 then
      (mp.readprotection)(false)
      EnumResourceCRC32s(l_2_1, 0, 0, l_2_0)
      ;
      (mp.readprotection)(true)
    end
  end
  do
    return l_2_0
  end
end

local l_0_1 = {}
l_0_1[3404687433] = "LUA:ConstructorIconFile1"
local l_0_2 = GetResourceCRC32s()
if #l_0_2 < 5 then
  (mp.set_mpattribute)("LUA:ResourceDataEntryLT5")
end
if #l_0_2 >= 5 then
  (mp.set_mpattribute)("LUA:ResourceDataEntryGE5")
end
if #l_0_2 >= 10 then
  (mp.set_mpattribute)("LUA:ResourceDataEntryGE10")
end
if #l_0_2 >= 15 then
  (mp.set_mpattribute)("LUA:ResourceDataEntryGE15")
end
if #l_0_2 >= 20 then
  (mp.set_mpattribute)("LUA:ResourceDataEntryGE20")
end
for l_0_6 = 1, #l_0_2 do
  if l_0_1[l_0_2[l_0_6]] ~= nil then
    (mp.set_mpattribute)(l_0_1[l_0_2[l_0_6]])
  end
end
return mp.CLEAN

