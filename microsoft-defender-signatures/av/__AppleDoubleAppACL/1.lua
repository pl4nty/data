-- Threat: \xd0\xe1AppleDoubleAppACL
-- Type: 13
-- Includes: LuaFuncHelper
-- MpAttributes: SCPT:MacOs/ACLBlocksExtAttr & BM_APP_APPLEDOUBLE_FILE

local l_0_0 = mp.getfilename(mp.FILEPATH_QUERY_FULL)
local l_0_2 = string.find(l_0_0, "->", 1, true) ~= nil
if not l_0_2 then
  return mp.CLEAN
end
local l_0_4 = string.find(l_0_0, "^/Users/.-/Downloads/", 1, false) ~= nil
if not l_0_4 then
  return mp.CLEAN
end
local l_0_5 = string.gsub(l_0_0, "->", "|")
local l_0_6 = split(l_0_5, "|")
local l_0_8 = #l_0_6 == 2
if not l_0_8 then
  return mp.CLEAN
end
local l_0_9 = l_0_6[2]
local l_0_11 = string.find(l_0_9, "/", 1, true) == nil
if not l_0_11 then
  return mp.CLEAN
end
return mp.INFECTED
