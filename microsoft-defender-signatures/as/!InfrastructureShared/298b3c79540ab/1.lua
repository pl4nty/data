-- Threat: !InfrastructureShared
-- Name: 298b3c79540ab
-- Type: 21

local l_0_0 = this_sigattrlog[13]
if l_0_0 and l_0_0.matched then
  local l_0_1 = MpCommon.GetProcessElevationAndIntegrityLevel(l_0_0.ppid)
  if l_0_1 and l_0_1.IntegrityLevel >= MpCommon.SECURITY_MANDATORY_SYSTEM_RID then
    return mp.INFECTED
  end
end
return mp.CLEAN
