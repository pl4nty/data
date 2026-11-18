-- Threat: !InfrastructureShared
-- Name: !#Lua:Worm:VBS/Jenxcus!Crypt34
-- Type: 13

if not mp.get_mpattribute("SCPT:Worm:VBS/Jenxcus!Crypt34") then
  return mp.CLEAN
end
local l_0_0 = mp.getfilesize()
if l_0_0 < 10000 or 100000 < l_0_0 then
  return mp.CLEAN
end
local l_0_1 = tostring(footerpage)
l_0_1 = string.lower(l_0_1)
local l_0_2 = l_0_1:match("=replace%(%l-,\"(.-)\",vbcr%)")
if l_0_2 == nil then
  return mp.CLEAN
end
local l_0_3 = tostring(headerpage)
local l_0_4 = l_0_3:match("%l=\"(%a%a%a%a%a%a%a%a%a%a%a%a%a%a%a%a%a%a%a%a%a%a%a%a%a%a%a%a%a%a%a%a%a%a%a%a%a%a%a%a%a%a%a%a%a%a%a%a%a%a%a%a)\"")
if l_0_4 == nil then
  return mp.CLEAN
end
local l_0_5 = {}
l_0_4:gsub(".", function(l_1_0)
  table.insert(l_0_5, l_1_0)
end)
mp.readprotection(false)
local l_0_6 = mp.readfile(0, l_0_0)
local l_0_7 = l_0_6:match("=\"\"\"\"\r\n%l-=\"(.-)\"\r\n")
if l_0_7 == nil then
  return mp.CLEAN
end
l_0_7 = l_0_7:gsub(l_0_2, "\r")
local l_0_8 = l_0_7:match("(\".-\")")
l_0_7 = l_0_7:gsub(l_0_8, "\"")

function fastAlphaTransform(l_2_0, l_2_1, l_2_2)
  local l_2_3 = {
    "a",
    "b",
    "c",
    "d",
    "e",
    "f",
    "g",
    "h",
    "i",
    "j",
    "k",
    "l",
    "m",
    "n",
    "o",
    "p",
    "q",
    "r",
    "s",
    "t",
    "u",
    "v",
    "w",
    "x",
    "y",
    "z",
    "A",
    "B",
    "C",
    "D",
    "E",
    "F",
    "G",
    "H",
    "I",
    "J",
    "K",
    "L",
    "M",
    "N",
    "O",
    "P",
    "Q",
    "R",
    "S",
    "T",
    "U",
    "V",
    "W",
    "X",
    "Y",
    "Z"
  }
  local l_2_4 = {}
  for l_2_5 = 1, 52 do
    l_2_4[l_2_2[l_2_5]] = l_2_3[l_2_5]
  end
  return l_2_0:gsub(l_2_1, l_2_4)
end

mp.vfo_add_buffer(fastAlphaTransform(l_0_7, ".", l_0_5), "[Crypt34]", mp.ADD_VFO_TAKE_ACTION_ON_DAD)
return mp.CLEAN
