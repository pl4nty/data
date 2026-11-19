-- Threat: !InfrastructureShared
-- Name: 11db3b26ef869
-- Type: 21

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 and l_0_0.integrity_level >= MpCommon.SECURITY_MANDATORY_SYSTEM_RID then
  return mp.CLEAN
end
return mp.INFECTED
