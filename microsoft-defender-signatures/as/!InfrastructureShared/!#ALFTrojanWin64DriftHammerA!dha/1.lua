-- Threat: !InfrastructureShared
-- Name: !#ALF:Trojan:Win64/DriftHammer.A!dha
-- Type: 13
-- MpAttributes: RPF:TopLevelFile

if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) == mp.SCANREASON_ONOPEN and mp.get_contextdata(mp.CONTEXT_DATA_HAS_MOTW_ADS) then
  local l_0_0 = mp.GetMOTWHostUrl()
  if l_0_0 ~= nil and string.len(l_0_0) > 20 and l_0_0:find("/secsec/res/", 1, true) then
    mp.set_mpattribute("//Lua:DriftHammerDownload")
    return mp.INFECTED
  end
end
return mp.CLEAN
