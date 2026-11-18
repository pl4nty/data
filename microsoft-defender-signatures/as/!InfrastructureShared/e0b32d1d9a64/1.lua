-- Threat: !InfrastructureShared
-- Name: e0b32d1d9a64
-- Type: 21

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 and l_0_0.integrity_level > MpCommon.SECURITY_MANDATORY_MEDIUM_RID then
  return mp.CLEAN
end
return mp.INFECTED
