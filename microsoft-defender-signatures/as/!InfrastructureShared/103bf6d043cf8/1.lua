-- Threat: !InfrastructureShared
-- Name: 103bf6d043cf8
-- Type: 21

if mp.get_mpattribute("AGGR:CombinedJavaClass") then
  return mp.CLEAN
end
return mp.INFECTED
