-- Threat: !InfrastructureShared
-- Name: !#Worm:VBS/Jenxcus.DE
-- Type: 13
-- Includes: ConversionToBinary_fastDec2Bin
-- MpAttributes: SCPT:VBS/JenxcusAnsiToString5

local l_0_0 = mp.getfilesize()
mp.readprotection(false)
local l_0_1 = mp.readfile(0, l_0_0)
if l_0_1 == nil then
  return mp.CLEAN
end
if #l_0_1 < 5000 then
  return mp.CLEAN
end
local l_0_2, l_0_3 = mp.UfsGetMetadataStringA("dkey", true)
local l_0_4, l_0_5 = l_0_1:sub(1, #l_0_1 - 44)

local function l_0_6(l_1_0, l_1_1)
  local l_1_2 = table.insert
  local l_1_3 = table.concat
  local l_1_4 = {}
  for l_1_5 in l_1_1:gmatch("(.)") do
    l_1_2(l_1_4, l_1_5:byte())
  end
  l_1_4[#l_1_4 + 1] = 0
  local l_1_6 = {}
  for l_1_7 in string.gmatch(l_1_0, "(.)") do
    l_1_2(l_1_6, l_1_7:byte())
    if 3900 < #l_1_6 then
      break
    end
  end
  local l_1_8 = 2
  local l_1_9, l_1_10, l_1_11
  l_1_11 = {}
  for l_1_12 = 1, 1500 do
    l_1_10 = l_1_6[l_1_12] - l_1_4[l_1_8]
    if l_1_10 < 0 then
      l_1_10 = l_1_10 + 256
    end
    l_1_2(l_1_11, l_1_10)
    l_1_8 = l_1_8 + 1
    if l_1_8 > #l_1_4 then
      l_1_8 = 1
    end
  end
  l_1_0, l_0_5 = fastDec2Bin(l_1_3(l_1_11, ",") .. ",", "(%d-),"):sub(1, l_1_9)
  return l_1_0
end

local l_0_7 = l_0_6(l_0_4, l_0_3)
if mp.crc32(-1, l_0_7, 1, 1500) == 3787559893 then
  return mp.INFECTED
end
mp.vfo_add_buffer(l_0_7, "[JenxcusToStrV3]", mp.ADD_VFO_TAKE_ACTION_ON_DAD)
return mp.CLEAN
