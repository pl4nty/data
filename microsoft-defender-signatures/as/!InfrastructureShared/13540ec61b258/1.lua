-- Threat: !InfrastructureShared
-- Name: 13540ec61b258
-- Type: 21

if mp.get_mpattribute("AGGR:CombinedJavaClass") then
  return mp.CLEAN
end
return mp.INFECTED
