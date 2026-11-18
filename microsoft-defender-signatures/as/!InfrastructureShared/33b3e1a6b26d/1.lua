-- Threat: !InfrastructureShared
-- Name: 33b3e1a6b26d
-- Type: 21

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0.integrity_level > MpCommon.SECURITY_MANDATORY_MEDIUM_RID then
  return mp.INFECTED
end
return mp.CLEAN
