-- Threat: !InfrastructureShared
-- Name: 90d71ee9347d
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
l_0_2 = string.lower(l_0_2)
if string.find(l_0_2, "rundll32.exe", 1, true) then
  return mp.CLEAN
end
local l_0_3 = mp.GetParentProcInfo()
if l_0_3 ~= nil then
  local l_0_4 = string.lower(l_0_3.image_path)
  if l_0_4 ~= nil and string.find(l_0_4, "powershell.exe", 1, true) then
    return mp.INFECTED
  end
end
return mp.CLEAN
