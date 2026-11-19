-- Threat: !InfrastructureShared
-- Name: 59bf1e7a499e
-- Type: 21

if mp.get_mpattribute("AGGR:CombinedJavaClass") then
  return mp.CLEAN
end
return mp.INFECTED
