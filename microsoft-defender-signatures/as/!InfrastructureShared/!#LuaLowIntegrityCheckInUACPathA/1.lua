-- Threat: !InfrastructureShared
-- Name: !#Lua:LowIntegrityCheckInUACPath.A
-- Type: 10

local l_0_0 = mp.GetUACMetadata()
if l_0_0 ~= nil then
  local l_0_1 = MpCommon.GetProcessElevationAndIntegrityLevel(string.format("pid:%u", l_0_0.RequestorPid))
  if l_0_1.IntegrityLevel == MpCommon.SECURITY_MANDATORY_LOW_RID then
    return mp.SYNCLOWFI
  end
end
return mp.CLEAN
