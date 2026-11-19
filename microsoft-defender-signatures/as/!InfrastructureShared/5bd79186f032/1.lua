-- Threat: !InfrastructureShared
-- Name: 5bd79186f032
-- Type: 21

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = MpCommon.GetImagePathFromPid(l_0_0)
if l_0_1 == nil then
  return mp.CLEAN
end
MpCommon.SetPersistContextNoPath("MiKatzExe", l_0_1, 100)
return mp.INFECTED
