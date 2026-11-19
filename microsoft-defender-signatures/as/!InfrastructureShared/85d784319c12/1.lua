-- Threat: !InfrastructureShared
-- Name: 85d784319c12
-- Type: 21

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = MpCommon.GetImagePathFromPid(l_0_0)
if l_0_1 == nil or #l_0_1 <= 7 then
  return mp.CLEAN
end
if not MpCommon.QueryPersistContext(l_0_1, "SysintToolsCopyFileA") then
  return mp.CLEAN
end
return mp.INFECTED
