-- Threat: !InfrastructureShared
-- Name: !#ALF:Trojan:Win32/DarkThrone.I
-- Type: 13
-- MpAttributes: RPF:TopLevelFile

if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) == mp.SCANREASON_ONOPEN and mp.get_contextdata(mp.CONTEXT_DATA_HAS_MOTW_ADS) then
  local l_0_0 = mp.GetMOTWHostUrl()
  if l_0_0 ~= nil and l_0_0:find("royal7kk2nawd2zyeytztoz4spyr2wbmbv3746abstl4fnmh4cthbmad.onion/", 1, true) then
    return mp.INFECTED
  end
end
return mp.CLEAN
