-- Threat: !InfrastructureShared
-- Name: 35b30d543430
-- Type: 21

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 ~= nil and l_0_0.integrity_level ~= nil and l_0_0.integrity_level <= MpCommon.SECURITY_MANDATORY_HIGH_RID then
  return mp.INFECTED
end
return mp.CLEAN
