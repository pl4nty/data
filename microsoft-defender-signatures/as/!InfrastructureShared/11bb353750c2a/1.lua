-- Threat: !InfrastructureShared
-- Name: 11bb353750c2a
-- Type: 21

local l_0_0
if this_sigattrlog[2].ppid then
  l_0_0 = MpCommon.GetProcessElevationAndIntegrityLevel(this_sigattrlog[2].ppid)
elseif this_sigattrlog[3].ppid then
  l_0_0 = MpCommon.GetProcessElevationAndIntegrityLevel(this_sigattrlog[3].ppid)
elseif this_sigattrlog[4].ppid then
  l_0_0 = MpCommon.GetProcessElevationAndIntegrityLevel(this_sigattrlog[4].ppid)
elseif this_sigattrlog[5].ppid then
  l_0_0 = MpCommon.GetProcessElevationAndIntegrityLevel(this_sigattrlog[5].ppid)
else
  return mp.CLEAN
end
if l_0_0 and l_0_0.IntegrityLevel >= MpCommon.SECURITY_MANDATORY_SYSTEM_RID then
  return mp.INFECTED
end
return mp.CLEAN
