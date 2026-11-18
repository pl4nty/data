-- Threat: !InfrastructureShared
-- Name: !#ALF:ContextualMOTWRestrictedZone
-- Type: 13
-- MpAttributes: RPF:TopLevelFile

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == mp.SCANREASON_ONOPEN and mp.get_contextdata(mp.CONTEXT_DATA_HAS_MOTW_ADS) == true and mp.GetMOTWZone() == 4 then
  return mp.INFECTED
end
return mp.CLEAN
