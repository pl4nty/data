-- Threat: !InfrastructureShared
-- Name: 60b3fa822e40
-- Type: 21

if not this_sigattrlog[2].ppid then
  return mp.CLEAN
end
local l_0_0 = MpCommon.GetProcessElevationAndIntegrityLevel(this_sigattrlog[2].ppid)
if l_0_0 and l_0_0.IntegrityLevel >= MpCommon.SECURITY_MANDATORY_SYSTEM_RID then
  return mp.INFECTED
end
return mp.CLEAN
