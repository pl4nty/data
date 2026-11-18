-- Threat: !InfrastructureShared
-- Name: !#Kira
-- Type: 13
-- Includes: ConversionToBinary_fastBinaryTransform, ConversionToBinary_fastDec2Bin, ConversionToBinary_fastDec2BinWithKey
-- MpAttributes: SCPT:KiraAsciiObfuscator | SCPT:KiraDecryptKira | SCPT:KiraDecryptXor

local l_0_0
if mp.get_mpattribute("SCPT:KiraAsciiObfuscator") then
  l_0_0 = 1
elseif mp.get_mpattribute("SCPT:KiraDecryptKira") then
  l_0_0 = 2
elseif mp.get_mpattribute("SCPT:KiraDecryptXor") then
  l_0_0 = 3
else
  return mp.CLEAN
end
local l_0_1 = mp.getfilesize()
if l_0_1 < 1024 then
  return mp.CLEAN
end
if 2097152 < l_0_1 then
  return mp.CLEAN
end
local l_0_2 = ""
local l_0_3 = ""

local function l_0_4(l_1_0)
  return l_1_0
end

if mp.get_mpattribute("SCPT:KiraStrReverse") then
  l_0_2 = "[a-zA-Z_][0-9a-zA-Z_]-%("
  l_0_3 = "%)"
  l_0_4 = string.reverse
end
local l_0_5, l_0_6
if l_0_0 == 1 then
  l_0_5, _ = string.find(tostring(headerpage), "= ?Chr%(%d-%) ?& ?[cC][hH][rR]%(%d-%)")
  l_0_5 = l_0_5 + 1
elseif l_0_0 == 2 then
  l_0_5, _, l_0_6 = string.find(tostring(headerpage), "= ?[a-zA-Z_][0-9a-zA-Z_]-%(" .. l_0_2 .. "\".....%d-\"" .. l_0_3 .. ",(%d-)%) ?&")
  l_0_5 = l_0_5 + 1
elseif l_0_0 == 3 then
  _, l_0_5 = string.find(tostring(headerpage), "= ?[a-zA-Z_][0-9a-zA-Z_]-%(" .. l_0_2 .. "\"")
else
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_7 = mp.readfile(l_0_5, l_0_1 - l_0_5)
local l_0_8, l_0_9
if l_0_0 == 1 then
  l_0_8, _ = string.find(l_0_7, [=[

[eE][xX][eE][cC][uU][tT][eE]]=])
  l_0_9, _ = fastDec2Bin(l_0_7:sub(1, l_0_8), "&? ?[cC][hH][rR]%((%d-)%) ?")
elseif l_0_0 == 2 then
  l_0_8, _ = string.find(l_0_7, [=[

[eE][xX][eE][cC][uU][tT][eE]]=])
  l_0_9, _ = fastDec2BinWithKey(l_0_7:sub(1, l_0_8), "&? ?[a-zA-Z_][0-9a-zA-Z_]-%(" .. l_0_2 .. "\".....(%d-)\"" .. l_0_3 .. ",%d-%) ?", l_0_6, function(l_2_0, l_2_1)
    return l_0_4(l_2_0 + l_2_1)
  end)
elseif l_0_0 == 3 then
  l_0_8, _, l_0_6 = string.find(l_0_7, "\",(%d-)%)" .. l_0_3 .. "%s-[eE][xX][eE][cC][uU][tT][eE]")
  l_0_8 = l_0_8 - 1
  l_0_9, _ = fastBinaryTransform(l_0_4(l_0_7:sub(1, l_0_8)), "(.)", l_0_6, mp.bitxor)
else
  return mp.CLEAN
end
mp.vfo_add_buffer(l_0_9, "[JXSK" .. l_0_0 .. "]", mp.ADD_VFO_TAKE_ACTION_ON_DAD)
return mp.CLEAN
