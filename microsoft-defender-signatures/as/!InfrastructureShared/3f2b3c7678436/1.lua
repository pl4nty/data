-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\3f2b3c7678436\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (bm.get_current_process_startup_info)()
if isnull(l_0_0) or isnull(l_0_0.ppid) then
  return mp.CLEAN
end
local l_0_1 = (mp.GetProcessCommandLine)(l_0_0.ppid)
if l_0_1 == nil then
  return mp.CLEAN
end
if isCommonScheduledTaskCommand(l_0_1) == true then
  return mp.CLEAN
end
local l_0_2 = (mp.GetParentProcInfo)()
if isnull(l_0_2) or isnull(l_0_2.image_path) then
  return mp.CLEAN
end
local l_0_3 = (string.lower)(l_0_2.image_path)
if not StringEndsWith(l_0_3, "\\windows\\system32\\svchost.exe") then
  return mp.CLEAN
end
if IsCommandLineTrackedForTechnique(l_0_1, "LuaTriggerTaskResourceScanB") == true then
  TrackPidAndTechniqueBM(l_0_0.ppid, "T1053.005", "schtask_target")
  TrackPidAndTechniqueBM(l_0_0.ppid, "T1053.005", "BM:ScheduledTaskProcessExecution.B")
  return mp.INFECTED
end
return mp.CLEAN

