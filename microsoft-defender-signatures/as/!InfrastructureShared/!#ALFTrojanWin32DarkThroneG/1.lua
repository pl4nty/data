-- Threat: !InfrastructureShared
-- Name: !#ALF:Trojan:Win32/DarkThrone.G
-- Type: 13
-- MpAttributes: RPF:TopLevelFile

if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) == mp.SCANREASON_ONOPEN and mp.get_contextdata(mp.CONTEXT_DATA_HAS_MOTW_ADS) then
  local l_0_0 = mp.GetMOTWHostUrl()
  if l_0_0 ~= nil and l_0_0:find("5qup7t6ajr4nffql2buua23mfhvehawlz4yeoh5n72d2esaaurb7hzqd.onion/", 1, true) then
    return mp.INFECTED
  end
end
return mp.CLEAN
