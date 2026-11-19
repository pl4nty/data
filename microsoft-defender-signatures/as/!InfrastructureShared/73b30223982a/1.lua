-- Threat: !InfrastructureShared
-- Name: 73b30223982a
-- Type: 21

local l_0_0 = bm.get_current_process_startup_info()
if l_0_0 and l_0_0.integrity_level < MpCommon.SECURITY_MANDATORY_SYSTEM_RID then
  local l_0_1 = this_sigattrlog[3]
  if l_0_1.matched then
    local l_0_2 = MpCommon.GetProcessElevationAndIntegrityLevel(l_0_1.ppid)
    if l_0_2 and l_0_2.IntegrityLevel == MpCommon.SECURITY_MANDATORY_SYSTEM_RID then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
