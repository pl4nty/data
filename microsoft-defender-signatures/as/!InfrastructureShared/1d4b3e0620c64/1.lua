-- Threat: !InfrastructureShared
-- Name: 1d4b3e0620c64
-- Type: 21

if not this_sigattrlog[10].ppid then
  return mp.CLEAN
end
local l_0_0 = ""
if this_sigattrlog[9].matched and this_sigattrlog[9].utf8p1 ~= nil then
  l_0_0 = MpCommon.PathToWin32Path(string.lower(this_sigattrlog[9].utf8p1))
end
if mp.IsKnownFriendlyFile(l_0_0, true, false) then
  return mp.CLEAN
end
local l_0_1 = MpCommon.GetProcessElevationAndIntegrityLevel(this_sigattrlog[10].ppid)
if l_0_1.IntegrityLevel >= MpCommon.SECURITY_MANDATORY_SYSTEM_RID then
  return mp.INFECTED
end
return mp.CLEAN
