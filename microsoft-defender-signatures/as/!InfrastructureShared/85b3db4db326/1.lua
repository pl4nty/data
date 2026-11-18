-- Threat: !InfrastructureShared
-- Name: 85b3db4db326
-- Type: 21

local l_0_0
if this_sigattrlog[2].matched then
  l_0_0 = this_sigattrlog[2]
elseif this_sigattrlog[3].matched then
  l_0_0 = this_sigattrlog[3]
end
if l_0_0 then
  local l_0_1 = MpCommon.GetProcessElevationAndIntegrityLevel(l_0_0.ppid)
  if l_0_1 and l_0_1.IntegrityLevel >= MpCommon.SECURITY_MANDATORY_SYSTEM_RID then
    return mp.INFECTED
  end
end
return mp.CLEAN
