-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\151b373a3cddf\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_imagepath)()
local l_0_1 = (bm.get_current_process_startup_info)()
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = l_0_1.command_line
if l_0_2 == nil or l_0_2 == "" then
  return mp.CLEAN
end
if IsExcludedByCmdlineMacOS(l_0_2) or IsExcludedByImagePathMacOS(l_0_0) then
  return mp.CLEAN
end
if l_0_2:find("/usr/local/bin/moof", 1, true) or l_0_2:find("moof-", 1, true) or l_0_2:find("ycron <running 0> ipcheck", 1, true) then
  return mp.CLEAN
end
if (string.find)(l_0_2, (string.rep)("\n", 11), 1, false) or (string.find)(l_0_2, (string.rep)("%s", 51), 1, false) then
  return mp.INFECTED
end
return mp.CLEAN

