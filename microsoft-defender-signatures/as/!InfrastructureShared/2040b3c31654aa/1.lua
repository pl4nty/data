-- Threat: !InfrastructureShared
-- Name: 2040b3c31654aa
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
local l_0_4 = bm.get_imagepath()
if l_0_4 == nil then
  return mp.CLEAN
end
l_0_4 = MpCommon.PathToWin32Path(l_0_4)
if l_0_4 == nil then
  return mp.CLEAN
end
if isCommonScheduledTaskFile(l_0_4) == true then
  return mp.CLEAN
end
local l_0_5 = string.lower(l_0_4)
if StringEndsWith(l_0_5, "powershell.exe") ~= true and StringEndsWith(l_0_5, "cmd.exe") ~= true and StringEndsWith(l_0_5, "wscript.exe") ~= true and StringEndsWith(l_0_5, "cscript.exe") ~= true and StringEndsWith(l_0_5, "rundll32.exe") ~= true then
  local l_0_6 = mp.IsKnownFriendlyFile(l_0_4, true, false)
  if l_0_6 == true then
    return mp.CLEAN
  end
end
TrackPidAndTechniqueBM(l_0_0.ppid, "T1053.005", "schtask_target")
TrackPidAndTechniqueBM(l_0_0.ppid, "T1053.005", "BM:ScheduledTaskProcessExecution.A")
return mp.INFECTED
