-- Threat: !InfrastructureShared
-- Name: 29d7ccd8aa5c
-- Type: 21

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = MpCommon.GetImagePathFromPid(l_0_0)
if l_0_1 == nil then
  return mp.CLEAN
end
if not MpCommon.QueryPersistContextNoPath("isRebootDangerous", "GrubTampering.A") then
  return mp.CLEAN
end
if string.find(l_0_1, "/lib/systemd/systemd", 1, true) or string.find(l_0_1, "/usr/bin/sudo", 1, true) then
  return mp.LOWFI
end
return mp.CLEAN
