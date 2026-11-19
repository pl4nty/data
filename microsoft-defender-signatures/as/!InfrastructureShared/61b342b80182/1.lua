-- Threat: !InfrastructureShared
-- Name: 61b342b80182
-- Type: 21

if this_sigattrlog[2].matched and this_sigattrlog[2].ppid then
  local l_0_0 = MpCommon.GetProcessElevationAndIntegrityLevel(this_sigattrlog[2].ppid)
  if l_0_0 and l_0_0.IntegrityLevel >= MpCommon.SECURITY_MANDATORY_SYSTEM_RID then
    return mp.INFECTED
  end
end
return mp.CLEAN
