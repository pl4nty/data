-- Threat: !InfrastructureShared
-- Name: !#ALF:Trojan:Win32/DarkBuzzSvc.C
-- Type: 13
-- MpAttributes: RPF:TopLevelFile

if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) == mp.SCANREASON_ONOPEN and mp.get_contextdata(mp.CONTEXT_DATA_HAS_MOTW_ADS) then
  local l_0_0 = mp.GetMOTWHostUrl()
  if l_0_0 ~= nil and l_0_0:find("hiveapi5qsnctp7rkmgrd3nrk64o5u6vdbc2ua4aevl2r6yc3j7kd4yd.onion/", 1, true) then
    return mp.INFECTED
  end
end
return mp.CLEAN
