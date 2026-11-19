-- Threat: !InfrastructureShared
-- Name: !#ALF:Trojan:Win64/PieMaven.B!dha
-- Type: 13
-- MpAttributes: RPF:TopLevelFile

if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) == mp.SCANREASON_ONOPEN and mp.get_contextdata(mp.CONTEXT_DATA_HAS_MOTW_ADS) then
  local l_0_0 = mp.GetMOTWHostUrl()
  if l_0_0 ~= nil and string.len(l_0_0) > 150 and l_0_0:find("/1144283896", 1, true) then
    mp.set_mpattribute("//Lua:PieMavenDownload")
    return mp.INFECTED
  end
end
return mp.CLEAN
