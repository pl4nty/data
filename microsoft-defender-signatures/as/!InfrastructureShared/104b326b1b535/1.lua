-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\104b326b1b535\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = l_0_0.command_line
local l_0_2 = (bm.get_imagepath)()
if IsExcludedByCmdlineMacOS(l_0_1) or IsExcludedByImagePathMacOS(l_0_2) then
  return mp.CLEAN
end
local l_0_3 = nil
if (this_sigattrlog[5]).matched and (this_sigattrlog[5]).utf8p2 ~= nil and (this_sigattrlog[5]).utf8p2 ~= "" then
  l_0_3 = (this_sigattrlog[5]).utf8p2
else
  return mp.CLEAN
end
local l_0_4 = (string.lower)(l_0_3)
if (string.find)(l_0_4, " -wa ", 1, true) or (string.find)(l_0_4, " -ga ", 1, true) or (string.find)(l_0_4, " -gwa ", 1, true) or (string.find)(l_0_4, " -wga ", 1, true) or (string.find)(l_0_4, " -a ", 1, true) or (string.find)(l_0_4, " -g ", 1, true) or (string.find)(l_0_4, " -s ", 1, true) then
  TrackPidAndTechniqueBM("BM", "T1016", "Discovery_NetworkConfDiscovery_SecurityFindPass")
  return mp.INFECTED
end
return mp.CLEAN

