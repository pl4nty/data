-- Threat: !InfrastructureShared
-- Name: aeb320b13d20
-- Type: 21

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0.integrity_level > MpCommon.SECURITY_MANDATORY_MEDIUM_RID then
  return mp.CLEAN
end
return mp.INFECTED
