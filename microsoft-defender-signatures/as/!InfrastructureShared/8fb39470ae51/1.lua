-- Threat: !InfrastructureShared
-- Name: 8fb39470ae51
-- Type: 21

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 and l_0_0.integrity_level < MpCommon.SECURITY_MANDATORY_HIGH_RID then
  return mp.INFECTED
end
return mp.CLEAN
