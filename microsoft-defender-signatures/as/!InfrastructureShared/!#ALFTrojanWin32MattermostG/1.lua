-- Threat: !InfrastructureShared
-- Name: !#ALF:Trojan:Win32/Mattermost.G
-- Type: 13
-- MpAttributes: RPF:TopLevelFile

if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) == mp.SCANREASON_ONOPEN and mp.get_contextdata(mp.CONTEXT_DATA_HAS_MOTW_ADS) then
  local l_0_0 = mp.GetMOTWHostUrl()
  if l_0_0 ~= nil and l_0_0:find("wk2ac7nd6zrigfnz2f2ecvmeone5wioap5xtgdkioz7htvavzlwos7qd.onion/", 1, true) then
    return mp.INFECTED
  end
end
return mp.CLEAN
