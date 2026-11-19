-- Threat: !InfrastructureShared
-- Name: !#GateKeeper.A
-- Type: 11
-- MpAttributes: RPF:TopLevelFile

local l_0_0 = false
if versioning.IsBeta() and not versioning.IsServer() then
  if versioning.GetOsVersion() > 393219 then
    local l_0_1 = versioning.GetOsBuildNumber()
    if 18900 < l_0_1 and l_0_1 < 19100 and versioning.IsSampled(50000, false, true, false) then
      l_0_0 = true
    end
  elseif versioning.IsEnterprise() or versioning.IsSampled(50000, false, true, false) then
    l_0_0 = true
  end
  if l_0_0 and mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) == mp.SCANREASON_ONOPEN and mp.get_contextdata(mp.CONTEXT_DATA_OPEN_CREATEPROCESS_HINT) then
    return mp.INFECTED
  end
end
return mp.CLEAN
