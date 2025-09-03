-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LUASuspiciousScriptFileNameGT1MB\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilename)(mp.FILEPATH_QUERY_LOWERCASE)
if l_0_0 == nil or (string.len)(l_0_0) <= 5 then
  return mp.CLEAN
end
if (mp.getfilesize)() < 1048576 or (mp.getfilesize)() > 7340032 then
  return mp.CLEAN
end
if (string.find)(l_0_0, "img-202508-wa0008.js", 1, true) ~= nil or (string.find)(l_0_0, "wmieventlogs.js", 1, true) ~= nil or (string.find)(l_0_0, "discord virus.js", 1, true) ~= nil or (string.find)(l_0_0, "copilotdrivers.js", 1, true) ~= nil then
  return mp.INFECTED
end
return mp.CLEAN

