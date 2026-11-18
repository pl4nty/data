-- Threat: !InfrastructureShared
-- Name: 19d72e63dcd5
-- Type: 21

local l_0_0 = mp.GetScannedPPID()
if not l_0_0 then
  return mp.CLEAN
end
local l_0_1 = MpCommon.GetImagePathFromPid(l_0_0)
if not l_0_1 then
  return mp.CLEAN
end
local l_0_2 = MpCommon.PathToWin32Path(l_0_1)
if not l_0_2 then
  return mp.CLEAN
end
if string.find(string.lower(l_0_2), "\\windows\\temp", 1, true) then
  local l_0_3 = mp.GetParentProcInfo()
  if l_0_3 and string.find(string.lower(l_0_3.image_path), "python", 1, true) then
    return mp.INFECTED
  end
end
return mp.CLEAN
