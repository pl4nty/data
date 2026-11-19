-- Threat: !InfrastructureShared
-- Name: 6cb3c5d62702
-- Type: 21

if not this_sigattrlog[1].ppid then
  return mp.CLEAN
end
local l_0_0 = MpCommon.GetProcessElevationAndIntegrityLevel(this_sigattrlog[1].ppid)
if l_0_0.IntegrityLevel >= MpCommon.SECURITY_MANDATORY_SYSTEM_RID then
  bm.trigger_sig("EOP", "SYSTEM")
end
return mp.CLEAN
