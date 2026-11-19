-- Threat: !InfrastructureShared
-- Name: a5b34df1d627
-- Type: 21

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0.integrity_level > MpCommon.SECURITY_MANDATORY_MEDIUM_RID then
  return mp.CLEAN
end
local l_0_1 = MpCommon.GetProcessElevationAndIntegrityLevel(l_0_0.ppid)
if l_0_1.IntegrityLevel > MpCommon.SECURITY_MANDATORY_MEDIUM_RID then
  return mp.CLEAN
end
return mp.INFECTED
