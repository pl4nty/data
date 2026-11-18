-- Threat: !InfrastructureShared
-- Name: 47d708596047
-- Type: 21

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = MpCommon.GetImagePathFromPid(l_0_0)
if l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = MpCommon.PathToWin32Path(l_0_1)
if l_0_2 == nil then
  return mp.CLEAN
end
local l_0_3 = MpCommon.GetOriginalFileName(l_0_2)
if l_0_3 == nil then
  return mp.CLEAN
end
if l_0_3 == "powershell.exe" and not string.find(string.lower(l_0_2), "powershell.exe", 1, true) then
  return mp.INFECTED
end
return mp.CLEAN
