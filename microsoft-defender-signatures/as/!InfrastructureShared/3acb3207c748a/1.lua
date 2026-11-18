-- Threat: !InfrastructureShared
-- Name: 3acb3207c748a
-- Type: 21

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 ~= nil and l_0_0.integrity_level ~= nil and l_0_0.integrity_level == MpCommon.SECURITY_MANDATORY_SYSTEM_RID then
  return mp.INFECTED
end
return mp.CLEAN
