-- Threat: !InfrastructureShared
-- Name: 442904d10eee
-- Type: 21

if mp.get_mpattribute("MpIsPowerShellAMSIScan") then
  local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_AMSI_OPERATION_PPID)
  if l_0_0 then
    local l_0_1 = MpCommon.GetProcessElevationAndIntegrityLevel(l_0_0)
    if l_0_1 and l_0_1.IntegrityLevel < MpCommon.SECURITY_MANDATORY_HIGH_RID then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
