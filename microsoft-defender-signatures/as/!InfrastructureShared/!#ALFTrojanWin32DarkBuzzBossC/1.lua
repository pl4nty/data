-- Threat: !InfrastructureShared
-- Name: !#ALF:Trojan:Win32/DarkBuzzBoss.C
-- Type: 13
-- MpAttributes: RPF:TopLevelFile

if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) == mp.SCANREASON_ONOPEN and mp.get_contextdata(mp.CONTEXT_DATA_HAS_MOTW_ADS) then
  local l_0_0 = mp.GetMOTWHostUrl()
  if l_0_0 ~= nil and l_0_0:find("hiveadm7mnsyfv2kjok4rnmo4326lsj6squiqxusye27y5vwdw7bmmyd.onion/", 1, true) then
    return mp.INFECTED
  end
end
return mp.CLEAN
