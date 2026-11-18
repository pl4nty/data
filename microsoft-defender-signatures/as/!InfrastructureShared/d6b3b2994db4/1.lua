-- Threat: !InfrastructureShared
-- Name: d6b3b2994db4
-- Type: 21

local l_0_0
if this_sigattrlog[2].matched then
  l_0_0 = MpCommon.GetProcessElevationAndIntegrityLevel(this_sigattrlog[2].ppid)
elseif this_sigattrlog[3].matched then
  l_0_0 = MpCommon.GetProcessElevationAndIntegrityLevel(this_sigattrlog[3].ppid)
elseif this_sigattrlog[4].matched then
  l_0_0 = MpCommon.GetProcessElevationAndIntegrityLevel(this_sigattrlog[4].ppid)
elseif this_sigattrlog[5].matched then
  l_0_0 = MpCommon.GetProcessElevationAndIntegrityLevel(this_sigattrlog[5].ppid)
end
if l_0_0 ~= nil and l_0_0.IntegrityLevel >= MpCommon.SECURITY_MANDATORY_SYSTEM_RID then
  return mp.INFECTED
end
return mp.CLEAN
