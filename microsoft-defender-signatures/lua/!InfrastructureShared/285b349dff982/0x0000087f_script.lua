-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\285b349dff982\0x0000087f_luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
local l_0_1 = l_0_0.command_line
local l_0_2 = (bm.get_imagepath)()
if IsExcludedByCmdlineMacOS(l_0_1) or IsExcludedByImagePathMacOS(l_0_2) then
  return mp.CLEAN
end
do
  if (this_sigattrlog[19]).matched and (this_sigattrlog[19]).utf8p1 ~= nil and (this_sigattrlog[19]).utf8p1 ~= "" then
    local l_0_3 = (this_sigattrlog[19]).utf8p1
    if (sysio.IsFileExists)(l_0_3) and SuspMacPathsToMonitor((string.lower)(l_0_3), true) then
      TrackPidAndTechniqueBM("BM", "T1560.001", "Collection_ArchiveCollectedData_mt2024")
      return mp.INFECTED
    end
  end
  return mp.CLEAN
end

