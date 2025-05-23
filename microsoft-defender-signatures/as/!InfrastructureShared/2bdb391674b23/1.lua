-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\2bdb391674b23\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
local l_0_1 = l_0_0.command_line
local l_0_2 = (bm.get_imagepath)()
if IsExcludedByCmdlineMacOS(l_0_1) or IsExcludedByImagePathMacOS(l_0_2) then
  return mp.CLEAN
end
local l_0_3 = nil
if (this_sigattrlog[21]).matched and (this_sigattrlog[21]).utf8p1 ~= nil and (this_sigattrlog[21]).utf8p1 ~= "" then
  l_0_3 = (this_sigattrlog[21]).utf8p1
end
if l_0_3 ~= nil and (sysio.IsFileExists)(l_0_3) and SuspMacPathsToMonitor((string.lower)(l_0_3), true) then
  TrackPidAndTechniqueBM("BM", "T1074.001", "Collection_LocalDataStaging")
  TrackPidAndTechniqueBM("BM", "T1048", "Exfiltration_Archive")
  return mp.INFECTED
end
return mp.CLEAN

