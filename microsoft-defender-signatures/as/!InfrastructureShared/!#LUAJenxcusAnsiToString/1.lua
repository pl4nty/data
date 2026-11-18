-- Threat: !InfrastructureShared
-- Name: !#LUA:JenxcusAnsiToString
-- Type: 13
-- Includes: ConversionToBinary_fastDec2Bin

local l_0_0
if mp.get_mpattribute("LUA:VBS/JenxcusAnsiToString1") then
  l_0_0 = 1
elseif mp.get_mpattribute("LUA:VBS/JenxcusAnsiToString2") then
  l_0_0 = 2
elseif mp.get_mpattribute("LUA:VBS/JenxcusAnsiToString3") then
  l_0_0 = 3
elseif mp.get_mpattribute("LUA:VBS/JenxcusAnsiToString4") then
  l_0_0 = 4
else
  return mp.CLEAN
end
local l_0_1 = mp.getfilesize()
mp.readprotection(false)
local l_0_2 = mp.readfile(0, l_0_1)
if l_0_2 == nil then
  return mp.CLEAN
end
local l_0_3, l_0_4, l_0_5
if l_0_0 == 1 then
  l_0_3, l_0_3, l_0_4, l_0_5 = string.find(l_0_2, "= ?%(?%(?\"(.-)\".-= ?%(?%(?\"(.-)\".+[Ss][Pp][Ll][Ii][Tt]%(")
elseif l_0_0 == 2 then
  l_0_3, l_0_3, l_0_4, l_0_5 = string.find(l_0_2, "= ?%(?%(?\"(.-)\".-[Ss][Pp][Ll][Ii][Tt].?%(.-\"(.-)\"")
elseif l_0_0 == 3 then
  l_0_3, l_0_3, l_0_5, l_0_4 = string.find(l_0_2, "= ?%(?%(?\"(.-)\".-[Ss][Pp][Ll][Ii][Tt]%(\"(.-)\"")
elseif l_0_0 == 4 then
  l_0_3, l_0_3, l_0_4 = string.find(l_0_2, "= ?%(?%(?(%(?[cC][hH][rR].+%)).-[eE][xX][eE][cC][uU][tT][eE]")
else
  return mp.CLEAN
end
if #l_0_4 < 3000 then
  return mp.CLEAN
end
local l_0_6, l_0_7
if l_0_0 == 4 then
  l_0_6, l_0_7 = fastDec2Bin(l_0_4, "%(?%(?[cC][hH][rR]%)?%)?%((%d-)%) ?&? ?")
else
  local l_0_8, l_0_9 = string.gsub(l_0_5, "([%.%$%%%^%+%-%*%?%(%)%{%}%[%]])", "%%%1")
  if l_0_4:match("^%d-" .. l_0_8 .. "%d-" .. l_0_8 .. "%d-" .. l_0_8 .. "%d-" .. l_0_8 .. "%d-" .. l_0_8 .. "%d-") == nil then
    return mp.CLEAN
  end
  l_0_6, l_0_7 = fastDec2Bin(l_0_4, "(%d-)" .. l_0_8)
end
mp.vfo_add_buffer(l_0_6:sub(1, l_0_7), "[JenxcusToStr]", mp.ADD_VFO_TAKE_ACTION_ON_DAD)
return mp.CLEAN
