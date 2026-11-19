-- Threat: !InfrastructureShared
-- Name: 8eb3043810a6
-- Type: 21

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0.integrity_level > MpCommon.SECURITY_MANDATORY_LOW_RID then
  return mp.CLEAN
end
return mp.INFECTED
