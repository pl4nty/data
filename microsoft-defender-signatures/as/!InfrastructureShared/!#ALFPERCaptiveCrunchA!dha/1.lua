-- Threat: !InfrastructureShared
-- Name: !#ALFPER:CaptiveCrunch.A!dha
-- Type: 13
-- MpAttributes: RPF:TopLevelFile & Lua:HasMotw

if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) == mp.SCANREASON_ONOPEN and mp.get_contextdata(mp.CONTEXT_DATA_HAS_MOTW_ADS) then
  local l_0_0 = mp.GetMOTWReferrerUrl()
  local l_0_1 = mp.GetMOTWHostUrl()
  if l_0_0 ~= nil and l_0_1 ~= nil and 4 <= #l_0_1 and l_0_0:find("www.msftconnecttest.com", 1, true) and (l_0_1:sub(-4) == ".exe" or l_0_1:sub(-4) == ".zip") then
    return mp.INFECTED
  end
end
return mp.CLEAN
