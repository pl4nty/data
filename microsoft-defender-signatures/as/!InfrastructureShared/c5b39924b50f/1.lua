-- Threat: !InfrastructureShared
-- Name: c5b39924b50f
-- Type: 21

if not this_sigattrlog[4].ppid then
  return mp.CLEAN
end
local l_0_0 = MpCommon.GetProcessElevationAndIntegrityLevel(this_sigattrlog[4].ppid)
if l_0_0 and l_0_0.IntegrityLevel >= MpCommon.SECURITY_MANDATORY_SYSTEM_RID then
  return mp.INFECTED
end
return mp.CLEAN
