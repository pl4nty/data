-- Threat: !InfrastructureShared
-- Name: !#ALF:Trojan:Win32/DarkThrone.K
-- Type: 13
-- MpAttributes: RPF:TopLevelFile

if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) == mp.SCANREASON_ONOPEN and mp.get_contextdata(mp.CONTEXT_DATA_HAS_MOTW_ADS) then
  local l_0_0 = mp.GetMOTWHostUrl()
  if l_0_0 ~= nil and l_0_0:find("g56vhscdhiqzhmh3zbkpqiyhc7lqkybv6z6me7cnx7zwy2oespybyjid.onion/", 1, true) then
    return mp.INFECTED
  end
end
return mp.CLEAN
