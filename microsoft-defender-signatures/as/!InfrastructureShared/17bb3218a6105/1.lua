-- Threat: !InfrastructureShared
-- Name: 17bb3218a6105
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0.integrity_level > MpCommon.SECURITY_MANDATORY_MEDIUM_RID then
  return mp.CLEAN
end
local l_0_1 = MpCommon.GetProcessElevationAndIntegrityLevel(l_0_0.ppid)
if l_0_1.IntegrityLevel > MpCommon.SECURITY_MANDATORY_MEDIUM_RID then
  return mp.CLEAN
end
TrackPidAndTechniqueBM("BM", "T1562.001", "mptamper_amsi_ofc")
return mp.INFECTED
