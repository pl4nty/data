-- Threat: !InfrastructureShared
-- Name: 25b3b19b94e6
-- Type: 21

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0.integrity_level <= MpCommon.SECURITY_MANDATORY_LOW_RID then
  return mp.INFECTED
end
return mp.CLEAN
