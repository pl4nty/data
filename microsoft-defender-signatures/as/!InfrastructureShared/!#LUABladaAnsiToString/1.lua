-- Threat: !InfrastructureShared
-- Name: !#LUA:BladaAnsiToString
-- Type: 13
-- MpAttributes: SCPT:VBS/BladaAnsiToString

local l_0_0 = mp.getfilesize()
if 2097152 < l_0_0 then
  return mp.CLEAN
end
mp.readprotection(false)
local l_0_1 = mp.readfile(0, l_0_0)
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = tostring(l_0_1)
local l_0_3, l_0_4, l_0_5, l_0_6, l_0_7 = string.find(l_0_2, "\"(.-)\".-\"(.-)\".+[Ss][Pp][Ll][Ii][Tt]%(.-%- ?[0-9].-%- ?(%d-)%)")
if l_0_5 == nil then
  return mp.CLEAN
end
local l_0_8, l_0_9 = string.gsub(l_0_6, "([%.%$%%%^%+%-%*%?%(%)%{%}%[%]])", "%%%1")
if l_0_5:match("^%d-" .. l_0_8 .. "%d-" .. l_0_8 .. "%d-" .. l_0_8 .. "%d-" .. l_0_8 .. "%d-" .. l_0_8 .. "%d-" .. l_0_8 .. "%d-" .. l_0_8 .. "%d-" .. l_0_8 .. "%d-" .. l_0_8 .. "%d-" .. l_0_8 .. "%d-" .. l_0_8 .. "%d-" .. l_0_8 .. "%d-" .. l_0_8 .. "%d-" .. l_0_8 .. "%d-" .. l_0_8 .. "%d-" .. l_0_8 .. "%d-" .. l_0_8 .. "%d-" .. l_0_8 .. "%d-" .. l_0_8) == nil then
  return mp.CLEAN
end
local l_0_10 = string.format

local function l_0_11(l_1_0)
  return l_0_10("%c", tonumber(l_1_0, 10) - l_0_7)
end

local l_0_12, l_0_13 = string.gsub(l_0_5, "(%d-)" .. l_0_8, l_0_11, 8000)
mp.vfo_add_buffer(l_0_12:sub(1, l_0_13), "[BladaToStr]", mp.ADD_VFO_TAKE_ACTION_ON_DAD)
return mp.CLEAN
