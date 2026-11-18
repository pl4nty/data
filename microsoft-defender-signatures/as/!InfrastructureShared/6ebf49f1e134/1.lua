-- Threat: !InfrastructureShared
-- Name: 6ebf49f1e134
-- Type: 21

if mp.get_mpattribute("AGGR:CombinedJavaClass") then
  return mp.CLEAN
end
return mp.INFECTED
