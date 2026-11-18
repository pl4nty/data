-- Threat: !InfrastructureShared
-- Name: !#JenxcusCryptDeobfuscatorV3
-- Type: 13
-- Includes: ConversionToBinary_fastDec2BinWithKey
-- MpAttributes: SCPT:JenxcusCryptObfV3

local l_0_0 = mp.getfilesize()
if l_0_0 < mp.FOOTERPAGE_SZ * 3 then
  return mp.CLEAN
end
if 2097152 < l_0_0 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_1 = mp.readfile(0, l_0_0)
local l_0_2, l_0_3, l_0_4 = string.find(l_0_1, "= ?\"(.-)\"")
while string.len(l_0_4) < 800 do
  l_0_2, l_0_3, l_0_4 = string.find(l_0_1, "= ?\"(.-)\"", l_0_3 + 2)
end
if #l_0_4 < mp.FOOTERPAGE_SZ then
  return mp.CLEAN
end
local l_0_5, l_0_6, l_0_7 = string.find(l_0_1, "= ?%(?\"(.-)\"", l_0_3)
if #l_0_7 < 1 or #l_0_7 >= #l_0_4 then
  return mp.CLEAN
end
local l_0_8, l_0_9 = string.gsub(l_0_7, "([%.%$%%%^%+%-%*%?%(%)%{%}%[%]])", "%%%1")
if l_0_4:match(l_0_8) == nil then
  return mp.CLEAN
end
local l_0_10, l_0_11, l_0_12 = string.find(l_0_1, "= ?%(?\"(.-)\"", l_0_6)
if #l_0_12 < 1 or #l_0_12 >= #l_0_4 then
  return mp.CLEAN
end

local function l_0_13(l_1_0, l_1_1)
  local l_1_2 = {}
  local l_1_3 = {}
  local l_1_4 = {}
  local l_1_5 = 0
  local l_1_6 = l_1_1:rep(256 / #l_1_1 + 1):sub(1, 256)
  for l_1_7 in string.gmatch(l_1_6, ".") do
    l_1_2[l_1_5] = l_1_5
    l_1_3[l_1_5] = l_1_7:byte()
    l_1_5 = l_1_5 + 1
  end
  local l_1_8 = 0
  for l_1_9 = 0, 255 do
    l_1_8 = (l_1_8 + l_1_2[l_1_9] + l_1_3[l_1_9]) % 255
    l_1_2[l_1_9], l_1_2[l_1_8] = l_1_2[l_1_8], l_1_2[l_1_9]
  end
  local l_1_10 = 0
  local l_1_11 = 0
  for l_1_12 = 1, 3072 do
    l_1_10 = (l_1_10 + 1) % 255
    l_1_11 = (l_1_11 + l_1_2[l_1_10]) % 255
    l_1_2[l_1_10], l_1_2[l_1_11] = l_1_2[l_1_11], l_1_2[l_1_10]
  end
  local l_1_13 = string.char
  for l_1_14 = 1, #l_1_0 do
    l_1_10 = (l_1_10 + 1) % 255
    l_1_11 = (l_1_11 + l_1_2[l_1_10]) % 255
    l_1_2[l_1_10], l_1_2[l_1_11] = l_1_2[l_1_11], l_1_2[l_1_10]
    l_1_4[#l_1_4 + 1] = l_1_13(mp.bitxor(l_1_2[(l_1_2[l_1_10] + l_1_2[l_1_11]) % 255], l_1_0:sub(l_1_14, l_1_14):byte()))
  end
  return table.concat(l_1_4, "")
end

local l_0_14 = mp.bitxor(l_0_13("0", l_0_12):byte(), 48)
mp.vfo_add_buffer(fastDec2BinWithKey(l_0_4, "(%d-)" .. l_0_8, l_0_14, mp.bitxor), "[JXSC3]", mp.ADD_VFO_TAKE_ACTION_ON_DAD)
return mp.CLEAN
