-- Threat: !InfrastructureShared
-- Name: c9b3ea629e64
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0.integrity_level >= MpCommon.SECURITY_MANDATORY_HIGH_RID then
  return mp.CLEAN
end
TrackPidAndTechniqueBM("BM", "T1548.002", "uac_bypass_src")
return mp.INFECTED
