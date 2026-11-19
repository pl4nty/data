-- Threat: !InfrastructureShared
-- Name: 35b38e656641
-- Type: 21

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0.integrity_level <= MpCommon.SECURITY_MANDATORY_MEDIUM_RID then
  return mp.INFECTED
end
return mp.CLEAN
