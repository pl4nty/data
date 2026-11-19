-- Threat: !InfrastructureShared
-- Name: !#ALF:Trojan:Win32/DarkThrone.C
-- Type: 13
-- MpAttributes: RPF:TopLevelFile

if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) == mp.SCANREASON_ONOPEN and mp.get_contextdata(mp.CONTEXT_DATA_HAS_MOTW_ADS) then
  local l_0_0 = mp.GetMOTWHostUrl()
  if l_0_0 ~= nil and l_0_0:find("k6s24pz55gtvtzzpg4riv7zb74vts425bl42zrpmice5ud3a65itj6ad.onion/", 1, true) then
    return mp.INFECTED
  end
end
return mp.CLEAN
