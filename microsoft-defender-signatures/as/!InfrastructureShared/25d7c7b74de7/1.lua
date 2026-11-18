-- Threat: !InfrastructureShared
-- Name: 25d7c7b74de7
-- Type: 21

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if l_0_1 == nil then
  return mp.CLEAN
end
if l_0_1 ~= "explorer.exe " then
  return mp.CLEAN
end
local l_0_2 = mp.GetParentProcInfo()
if l_0_2 == nil then
  return mp.CLEAN
end
local l_0_3 = string.lower(l_0_2.image_path)
if l_0_3:match("([^\\]+)$") ~= "explorer.exe" then
  return mp.CLEAN
end
MpCommon.RequestSmsOnProcess(l_0_0, MpCommon.SMS_SCAN_MED)
MpCommon.RequestSmsOnProcess(l_0_2.ppid, MpCommon.SMS_SCAN_MED)
return mp.INFECTED
