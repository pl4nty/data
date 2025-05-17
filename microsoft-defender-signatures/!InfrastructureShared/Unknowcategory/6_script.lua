-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\6_luac 

-- params : ...
-- function num : 0
if (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON) ~= mp.SCANREASON_ONOPEN then
  return mp.CLEAN
end
local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_FILENAME)
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
local l_0_1 = (string.lower)((string.sub)(l_0_0, -3))
local l_0_2 = (string.lower)((string.sub)(l_0_0, -4))
if l_0_1 ~= ".js" and l_0_2 ~= ".vbs" and l_0_2 ~= ".wsf" then
  return mp.CLEAN
end
local l_0_3 = (mp.get_contextdata)(mp.CONTEXT_DATA_PROCESSNAME)
if l_0_3 == nil or l_0_3 == "" then
  return mp.CLEAN
end
l_0_3 = (string.lower)(l_0_3)
if l_0_3 ~= "wscript.exe" and l_0_3 ~= "cscript.exe" then
  return mp.CLEAN
end
local l_0_4 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_4 == nil or l_0_4 == "" then
  return mp.CLEAN
end
if (string.find)(l_0_4, "\\appdata\\", 1, true) == nil then
  return mp.CLEAN
end
local l_0_5, l_0_6 = (string.match)(l_0_4, "\\([^\\]+)\\([^\\]+%.js)$")
if l_0_5 == nil or l_0_5 == "" or l_0_6 == nil or l_0_6 == "" then
  return mp.CLEAN
end
if (string.find)(l_0_5, ".zip", 1, true) and ((string.find)(l_0_5, "update", 1, true) or (string.find)(l_0_5, "install", 1, true) or (string.find)(l_0_5, "version", 1, true) or (string.find)(l_0_5, "order", 1, true)) and ((string.find)(l_0_6, "update", 1, true) or (string.find)(l_0_6, "install", 1, true) or (string.find)(l_0_6, "version", 1, true) or (string.find)(l_0_6, "order", 1, true)) then
  return mp.INFECTED
end
return mp.CLEAN

