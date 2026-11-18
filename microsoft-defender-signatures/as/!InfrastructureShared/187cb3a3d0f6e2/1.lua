-- Threat: !InfrastructureShared
-- Name: 187cb3a3d0f6e2
-- Type: 21
-- Includes: TechniqueTracker, BMLuaLib, LuaFuncHelper

local l_0_0 = bm.get_current_process_startup_info()
if isnull(l_0_0) or isnull(l_0_0.ppid) then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0.ppid)
if l_0_1 == nil then
  return mp.CLEAN
end
if isCommonScheduledTaskCommand(l_0_1) == true then
  return mp.CLEAN
end
local l_0_2 = mp.GetParentProcInfo()
if isnull(l_0_2) or isnull(l_0_2.image_path) then
  return mp.CLEAN
end
local l_0_3 = string.lower(l_0_2.image_path)
if not StringEndsWith(l_0_3, "\\windows\\system32\\svchost.exe") then
  return mp.CLEAN
end
TrackPidAndTechniqueBM(l_0_0.ppid, "T1053.005", "schtask_target")
TrackPidAndTechniqueBM(l_0_0.ppid, "T1053.005", "BM:ScheduledTaskProcessExecution.A")
return mp.INFECTED
