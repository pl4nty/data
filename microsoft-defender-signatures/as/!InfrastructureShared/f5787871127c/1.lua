-- Threat: !InfrastructureShared
-- Name: f5787871127c
-- Type: 21

if peattributes.ismsil == false then
  return mp.CLEAN
end
local l_0_0 = hstrlog[9]
local l_0_1 = pe.get_netmetadata()

local function l_0_2(l_1_0)
  return tonumber(l_1_0:reverse():gsub(".", function(l_2_0)
    return string.format("%02x", string.byte(l_2_0))
  end), 16)
end

local function l_0_3(l_3_0)
  local l_3_1 = mp.bitand(l_3_0, 255)
  if l_3_1 < 128 then
    return l_3_1, 1
  end
  if l_3_1 < 192 then
    local l_3_2 = mp.bitand(mp.shr32(l_3_0, 8), 255)
    local l_3_3 = mp.bitor(mp.shl32(mp.bitand(l_3_1, 63), 8), l_3_2)
    return l_3_3, 2
  end
  if l_3_1 < 224 then
    local l_3_4 = mp.bitand(mp.shr32(l_3_0, 8), 255)
    local l_3_5 = mp.bitand(mp.shr32(l_3_0, 16), 255)
    local l_3_6 = mp.bitand(mp.shr32(l_3_0, 24), 255)
    local l_3_7 = mp.bitor(mp.bitor(mp.bitor(mp.shl32(mp.bitand(l_3_1, 31), 24), mp.shl32(l_3_4, 16)), mp.shl32(l_3_5, 8)), l_3_6)
    return l_3_7, 4
  end
  return 0, 0
end

local function l_0_4(l_4_0)
  if l_4_0 == nil or l_4_0 == "" or l_4_0 == "\000" then
    return ""
  else
    return mp.utf16to8(l_4_0)
  end
end

local function l_0_5(l_5_0)
  local l_5_1 = mp.readu_u32(l_5_0, 1)
  local l_5_2 = l_0_1.usheap_RVA + mp.bitand(l_5_1, 16777215)
  local l_5_3 = pe.mmap_rva(l_5_2, 4)
  l_5_3 = mp.readu_u32(l_5_3, 1)
  local l_5_4, l_5_5 = l_0_3(l_5_3)
  if l_5_5 ~= 1 and l_5_5 ~= 2 and l_5_5 ~= 4 or 65536 < l_5_4 then
    return ""
  end
  local l_5_6 = l_5_2 + l_5_5
  local l_5_7 = pe.mmap_rva(l_5_6, l_5_4)
  l_5_7 = l_5_7 .. "\000"
  return l_0_4(l_5_7)
end

if l_0_0.match_offsets_count == 0 then
  return mp.CLEAN
end
local l_0_6 = l_0_0.VA + l_0_0.match_offsets[1]
local l_0_7 = pe.mmap_va(l_0_6, 4) or 0
if l_0_7 == 0 then
  return mp.CLEAN
end
l_0_7 = l_0_2(l_0_7)
local l_0_8 = l_0_1.strheap_RVA + pe.metadata_decode(l_0_7, 2)
local l_0_9 = {
  "Exit",
  "",
  ""
}
local l_0_10 = pe.mmap_rva(l_0_8, #l_0_9[1])
if string.find(l_0_10, l_0_9[1]) == nil then
  return mp.CLEAN
end
local l_0_11 = "\000\000\n(\144\001\003\nr\144\001\003p(\144\001\003\no\144\001\003\nr\144\001\003p\144\000"
local l_0_12 = pe.foffset_va(l_0_6) - 100
if l_0_12 == 4294967195 then
  return mp.CLEAN
end
local l_0_13 = mp.BMSearchFile(l_0_12, 100, l_0_11)
if l_0_13 == nil then
  return mp.CLEAN
end
l_0_13 = l_0_12 + l_0_13
local l_0_14 = l_0_13 + 9
local l_0_15 = l_0_13 + 24
local l_0_16 = pe.moffset_va(l_0_14)
local l_0_17 = pe.moffset_va(l_0_15)
local l_0_18 = pe.mmap_va(l_0_16, 4) or 0
if l_0_18 == 0 then
  return mp.CLEAN
end
local l_0_19 = pe.mmap_va(l_0_17, 4) or 0
if l_0_19 == 0 then
  return mp.CLEAN
end
local l_0_20 = l_0_5(l_0_18)
l_0_20 = MpCommon.Base64Decode(l_0_20)
l_0_20 = string.gsub(l_0_20, l_0_5(l_0_19), "")
l_0_20 = MpCommon.Base64Decode(l_0_20)
if l_0_20 == "f134f2a14df14c449b36ed67d6d73ff8" then
  return mp.INFECTED
end
return mp.LOWFI
