-- Threat: !InfrastructureShared
-- Name: !#999980_Last_HighRiskReferrer
-- Type: 16

local l_0_0, l_0_1 = pcall(mp.get_contextdata, mp.CONTEXT_DATA_SCANREASON)
if l_0_0 and l_0_1 ~= mp.SCANREASON_VALIDATION_PRESCAN then
  local l_0_2, l_0_3 = pcall(mp.get_contextdata, mp.CONTEXT_DATA_REFERRERURL)
  if l_0_2 and (string.match(l_0_3, "dojki%.ru") or string.match(l_0_3, "youporn%.com") or string.match(l_0_3, "pizta%.ru")) then
    mp.aggregate_mpattribute("Context:HighRiskReferrerUrl")
    mp.aggregate_mpattribute("//MpIsIEVScan")
    return mp.TRUE
  end
end
return mp.FALSE
