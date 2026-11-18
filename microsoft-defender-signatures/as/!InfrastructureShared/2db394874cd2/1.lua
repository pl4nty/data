-- Threat: !InfrastructureShared
-- Name: 2db394874cd2
-- Type: 21

if not this_sigattrlog[1].ppid then
  return mp.CLEAN
end
local l_0_0 = MpCommon.GetProcessElevationAndIntegrityLevel(this_sigattrlog[1].ppid)
if l_0_0.IntegrityLevel >= MpCommon.SECURITY_MANDATORY_SYSTEM_RID then
  return mp.INFECTED
end
return mp.CLEAN
