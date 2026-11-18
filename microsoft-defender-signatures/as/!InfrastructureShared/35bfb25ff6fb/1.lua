-- Threat: !InfrastructureShared
-- Name: 35bfb25ff6fb
-- Type: 21

if mp.get_mpattribute("AGGR:CombinedJavaClass") then
  return mp.CLEAN
end
return mp.INFECTED
