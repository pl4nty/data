-- Threat: !InfrastructureShared
-- Name: 15b37af8e579
-- Type: 21

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 == nil or l_0_0.integrity_level == nil then
  return mp.CLEAN
end
if l_0_0.integrity_level >= MpCommon.SECURITY_MANDATORY_MEDIUM_RID then
  return mp.CLEAN
end
return mp.INFECTED
